from flask import render_template
from flask.ext.appbuilder.models.sqla.interface import SQLAInterface
from flask.ext.appbuilder import ModelView
from app import appbuilder, db
from .models import table_supplier, table_orders

class OrdersAdmin(ModelView):
    #base table
    datamodel = SQLAInterface(table_orders)
    #columns shown in listview
    list_columns = ['id', 'supplier.client', 'target_date', 'total_number', 'total_price']
    #how the list is ordered
    order_columns = ['supplier.client', 'target_date', 'target_time', 'id']
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

@appbuilder.app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html', base_template=appbuilder.base_template, appbuilder=appbuilder), 404
