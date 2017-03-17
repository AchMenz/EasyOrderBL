from flask import render_template
from flask.ext.appbuilder.models.sqla.interface import SQLAInterface
from flask.ext.appbuilder import ModelView
from app import appbuilder, db
from .models import table_supplier, table_orders, table_orderline, table_category, table_product, table_price

class PriceAdmin(ModelView):
    #base table
    datamodel = SQLAInterface(table_price)
    #columns shown in listview
    list_columns = ['id', 'product.name', 'date', 'price']
    #how the list is ordered
    order_columns = ['id', 'product.name', 'date', 'price']
    #columns in the addform
    add_columns = ['product', 'price', 'date']
    #columns in the editform
    edit_columns = ['product', 'price', 'date']
    #columns in the showform
    show_columns = ['id', 'product', 'date']
    #title of showform
    show_title = 'Price Details'
    #title of addform
    add_title = 'Price Add'
    #title of editform
    edit_title = 'Price Edit'
    #title of the list
    list_title = "PriceAdmin"
    #how many entries are shown on one page
    page_size = 10
    #base order in the beginning
#    base_order = ('id', 'product.name', 'date', 'price')

class ProductAdmin(ModelView):
    #base table
    datamodel = SQLAInterface(table_product)
    #the related view (subtable that is in relation)
    related_views = [PriceAdmin]
    #columns shown in listview
    list_columns = ['id', 'category.name', 'name']
    #how the list is ordered
    order_columns = ['id', 'category.name', 'name']
    #columns in the addform
    add_columns = ['category', 'name']
    #columns in the editform
    edit_columns = ['category', 'name']
    #columns in the showform
    show_columns = ['id', 'category', 'name']
    #title of showform
    show_title = 'Product Details'
    #title of addform
    add_title = 'Product Add'
    #title of editform
    edit_title = 'Product Edit'

class CategoryAdmin(ModelView):
    #base table
    datamodel = SQLAInterface(table_category)
    #the related view (subtable that is in relation)
    related_views = [ProductAdmin]
    #columns shown in listview
    list_columns = ['id', 'name']
    #how the list is ordered
    order_columns = ['id', 'name']
    #columns in the addform
    add_columns = ['name']
    #columns in the editform
    edit_columns = ['name']
    #columns in the showform
    show_columns = ['id', 'name']
    #title of showform
    show_title = 'Category Details'
    #title of addform
    add_title = 'Category Add'
    #title of editform
    edit_title = 'Category Edit'
    
class OrderlineAdmin(ModelView):
    #base table
    datamodel = SQLAInterface(table_orderline)
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
    show_title = 'Orderline Details'
    #title of addform
    add_title = 'Orderline Add'
    #title of editform
    edit_title = 'Orderline Edit'
   
class OrdersAdmin(ModelView):
    #base table
    datamodel = SQLAInterface(table_orders)
    #the related view (subtable that is in relation)
    related_views = [OrderlineAdmin]
    #columns shown in listview
    list_columns = ['id', 'supplier.client', 'target_date', 'total_number', 'total_price']
    #how the list is ordered
    order_columns = ['supplier.client', 'target_date', 'target_time', 'id', 'total_number', 'total_price']
    #columns in the addform
    add_columns = ['supplier', 'target_date', 'target_time', 'comment']
    #columns in the editform
    edit_columns = ['supplier', 'target_date', 'target_time', 'comment']
    #columns in the showform
    show_columns = ['id', 'supplier.client', 'target_date', 'target_time', 'total_number', 'total_price', 'comment']
    #title of showform
    show_title = 'Orders Details'
    #title of addform
    add_title = 'Orders Add'
    #title of editform
    edit_title = 'Orders Edit'
    #title of the list
    list_title = "OrdersAdmin"
    #how many entries are shown on one page
    page_size = 10
    #base order in the beginning
#    base_order = ('supplier.client', 'target_date')

class SupplierAdmin(ModelView):
    #base table
    datamodel = SQLAInterface(table_supplier)
    #the related view (subtable that is in relation)
    related_views = [OrdersAdmin]
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
    show_title = 'Supplier Details'
    #title of addform
    add_title = 'Supplier Add'
    #title of editform
    edit_title = 'Supplier Edit'

db.create_all()

#register the views here
appbuilder.add_view(SupplierAdmin, "SupplierAdmin", category = "Orders")
appbuilder.add_view(OrdersAdmin, "OrdersAdmin", category = "Orders")
appbuilder.add_view(OrderlineAdmin, "OrderlineAdmin", category = "Orders")
appbuilder.add_view(CategoryAdmin, "CategoryAdmin", category = "Products")
appbuilder.add_view(ProductAdmin, "ProductAdmin", category = "Products")
appbuilder.add_view(PriceAdmin, "PriceAdmin", category = "Products")

@appbuilder.app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html', base_template=appbuilder.base_template, appbuilder=appbuilder), 404
