from flask.ext.appbuilder.actions import action
from flask import render_template, Flask
from flask.ext.appbuilder.models.sqla.interface import SQLAInterface
from flask.ext.appbuilder import BaseView, expose
from flask_appbuilder.fields import AJAXSelectField
from flask_appbuilder.fieldwidgets import Select2AJAXWidget, Select2SlaveAJAXWidget
from app import appbuilder, db, app
from .models import table_supplier, table_orders, table_orderline, table_category, table_product, table_price
from flask_mail import Message, Mail
from flask.ext.babel import lazy_gettext as _
from .modifiedClasses.views_modified import ModelViewModified



class PriceAdmin(ModelViewModified):
    #base table
    datamodel = SQLAInterface(table_price)
    #columns for label
    label_columns = {'product.name':_('Product'),'product':_('Product'),'date':_('Date'), 'price':_('Price')}
    #columns shown in listview
    list_columns = ['product.name', 'date', 'price']
    #how the list is ordered
    order_columns = ['product.name', 'date', 'price']
    #columns in the addform
    add_columns = ['product', 'price', 'date']
    #columns in the editform
    edit_columns = ['product', 'price', 'date']
    #columns in the showform
    show_columns = ['id', 'product', 'date']
    #title of showform
    show_title = _('Price Details')
    #title of addform
    add_title = _('Price Add')
    #title of editform
    edit_title = _('Price Edit')
    #title of the list
    list_title = _('PriceAdmin')
    #how many entries are shown on one page
    page_size = 10
    #base order in the beginning
    #base_order = ('id', 'product.name', 'date', 'price')

    @expose('/sendmail')
    def sendmail(self):

        mail = Mail(app)

        msg = Message("Hello World",
                      sender="cs14.test@web.de",
                      recipients=["richi.lightshadow@gmail.com"])
        mail.send(msg)
        return 'Hello World!'




# class PriceNoAdmin(PriceAdmin):
#     #columns not editable
#     base_permissions = ['can_list']


class ProductAdmin(ModelViewModified):
    #base table
    datamodel = SQLAInterface(table_product)
    # columns for label
    label_columns = {'category.name':_('Category'),'category':_('Category'),'name':_('Product Name')}
    #the related view (subtable that is in relation)
    related_views = [PriceAdmin]
    #columns shown in listview
    list_columns = ['category.name', 'name']
    #how the list is ordered
    order_columns = ['category.name', 'name']
    #columns in the addform
    add_columns = ['category', 'name']
    #columns in the editform
    edit_columns = ['category', 'name']
    #columns in the showform
    show_columns = ['id', 'category', 'name']
    #title of showform
    show_title = _('Product Details')
    #title of addform
    add_title = _('Product Add')
    #title of editform
    edit_title = _('Product Edit')

# class ProductNoAdmin(ProductAdmin):
#     #columns not editable
#     base_permissions = ['can_list']


class CategoryAdmin(ModelViewModified):
    #base table
    datamodel = SQLAInterface(table_category)
    # columns for label
    label_columns = {'name':_('Category')}
    #the related view (subtable that is in relation)
    related_views = [ProductAdmin]
    #columns shown in listview
    list_columns = ['name']
    #how the list is ordered
    order_columns = ['name']
    #columns in the addform
    add_columns = ['name']
    #columns in the editform
    edit_columns = ['name']
    #columns in the showform
    show_columns = ['id', 'name']
    #title of showform
    show_title = _('Category Details')
    #title of addform
    add_title = _('Category Add')
    #title of editform
    edit_title = _('Category Edit')

# class CategoryNoAdmin(CategoryAdmin):
#     #columns not editable
#     base_permissions = ['can_list']
    
class OrderlineAdmin(ModelViewModified):
    #base table
    datamodel = SQLAInterface(table_orderline)
    # columns for label
    label_columns = {'category.name': _('Category'),'product.name':_('Product'), 'pricePerUnit.price':_('Price per Unit'),'number':_('Number'),'price':_('Price'),'comment':_('Comment'),'category':_('Category'),'order':_('Order')}
    #special AJAX-fields
    add_form_extra_fields = {
                    'category': AJAXSelectField('Category',
                    datamodel=datamodel,
                    col_name='category',
                    widget=Select2AJAXWidget(endpoint='/orderlineadmin/api/column/add/category')),

                    'product': AJAXSelectField('product',
                    datamodel=datamodel,
                    col_name='product',
                    widget=Select2SlaveAJAXWidget(master_id='category',
                    endpoint='/orderlineadmin/api/column/add/product?_flt_0_categoryId={{ID}}'))
                    }
    #same AJAX-fields for edit as for add
    edit_form_extra_fields = add_form_extra_fields
    #columns shown in listview
    list_columns = ['category.name', 'product.name', 'pricePerUnit.price', 'number', 'price', 'comment']
    #how the list is ordered
    order_columns = ['category.name', 'product.name', 'pricePerUnit.price', 'number', 'price', 'comment']
    #columns in the addform
    add_columns = ['order', 'category', 'product', 'number', 'comment']
    #columns in the editform
    edit_columns = ['order', 'category', 'product', 'number', 'comment']
    #columns in the showform
    show_columns = ['id', 'order', 'category', 'product', 'pricePerUnit', 'number', 'price', 'comment']
    #title of showform
    show_title = _('Orderline Details')
    #title of addform
    add_title = _('Orderline Add')
    #title of editform
    edit_title = _('Orderline Edit')

    @action("export_pdf","Export data to PDF","Do you really want to","fa-rocket")
    def export_pdf(self, item):
        #self.datamodel.
        return redirect(self.get_redirect())

# class OrderlineNoAdmin(OrderlineAdmin):
#     #columns not editable
#     base_permissions = ['can_list']

class OrdersAdmin(ModelViewModified):
    #base table
    datamodel = SQLAInterface(table_orders)
    #the related view (subtable that is in relation)
    related_views = [OrderlineAdmin]
    # columns for label
    label_columns = {'supplier.client':_('Supplier'), 'target_date':_('Target date'), 'total_number':_('Total number'), 'total_price':_('Total price'),'supplier':_('Supplier')}
    #columns shown in listview
    list_columns = ['supplier.client', 'target_date', 'total_number', 'total_price']
    #how the list is ordered
    order_columns = ['supplier.client', 'target_date', 'target_time', 'total_number', 'total_price']
    #columns in the addform
    add_columns = ['supplier', 'target_date', 'target_time', 'comment']
    #columns in the editform
    edit_columns = ['supplier', 'target_date', 'target_time', 'comment']
    #columns in the showform
    show_columns = ['id', 'supplier.client', 'target_date', 'target_time', 'total_number', 'total_price', 'comment']
    #title of showform
    show_title = _('Orders Details')
    #title of addform
    add_title = _('Orders Add')
    #title of editform
    edit_title = _('Orders Edit')
    #title of the list
    list_title = _('OrdersAdmin')
    #how many entries are shown on one page
    page_size = 10
    #base order in the beginning
    #base_order = ('supplier.client', 'target_date')

# class OrdersNoAdmin(OrdersAdmin):
#     #columns not editable
#     base_permissions = ['can_list']

class SupplierAdmin(ModelViewModified):
    #base table
    datamodel = SQLAInterface(table_supplier)
    #the related view (subtable that is in relation)
    related_views = [OrdersAdmin]
    # columns for label
    label_columns = {'client':_('Client'),'email':_('Email'),'address':_('Adress'),'telephone':_('Telephone'),'email':_('Email adress'),'emailText':_('Email Text')}
    #columns shown in listview
    list_columns = ['client', 'email']
    #how the list is ordered
    order_columns = ['client', 'email', 'id']
    #columns in the addform
    add_columns = ['client', 'address', 'telephone', 'email', 'emailText', 'comment']
    #columns in the editform
    edit_columns = ['client', 'address', 'telephone', 'email', 'emailText', 'comment']
    #columns in the showform
    show_columns = ['id', 'client', 'address', 'telephone', 'email', 'emailText', 'comment']
    #title of showform
    show_title = _('Supplier Details')
    #title of addform
    add_title = _('Supplier Add')
    #title of editform
    edit_title = _('Supplier Edit')

# class SupplierNoAdmin(SupplierAdmin):
#     #columns not editable
#     base_permissions = ['can_list']


db.create_all()

#register the views here
appbuilder.add_view(SupplierAdmin, 'SupplierAdmin', category = 'Orders', label = _('Supplier'))
appbuilder.add_view_no_menu(OrdersAdmin)
appbuilder.add_view_no_menu(OrderlineAdmin)
#appbuilder.add_view(OrdersAdmin, 'OrdersAdmin', category = 'Orders', label = _('Orders'))
#appbuilder.add_view(OrderlineAdmin, 'OrderlineAdmin', category = 'Orders', label = _('Orderline'))
appbuilder.add_view(CategoryAdmin, 'CategoryAdmin', category = 'Products', label = _('Category'))
appbuilder.add_view(ProductAdmin, 'ProductAdmin', category = 'Products', label = _('Product'))
appbuilder.add_view_no_menu(PriceAdmin)
#appbuilder.add_view(PriceAdmin, 'PriceAdmin', category = 'Products', label = _('Price'))

# appbuilder.add_view(SupplierNoAdmin, "SupplierNoAdmin", category = "Orders")
# appbuilder.add_view(OrdersNoAdmin, "OrdersNoAdmin", category = "Orders")
# appbuilder.add_view(OrderlineNoAdmin, "OrderlineNoAdmin", category = "Orders")
# appbuilder.add_view(CategoryNoAdmin, "CategoryNoAdmin", category = "Products")
# appbuilder.add_view(ProductNoAdmin, "ProductNoAdmin", category = "Products")
# appbuilder.add_view(PriceNoAdmin, "PriceNoAdmin", category = "Products")

@appbuilder.app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html', base_template=appbuilder.base_template, appbuilder=appbuilder), 404
