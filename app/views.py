from flask import render_template
from flask.ext.appbuilder.models.sqla.interface import SQLAInterface
from flask.ext.appbuilder import ModelView
from app import appbuilder, db
from .models import Supplier


"""
    Create your Views::


    class MyModelView(ModelView):
        datamodel = SQLAInterface(MyModel)


    Next, register your Views::


    appbuilder.add_view(MyModelView, "My View", icon="fa-folder-open-o", category="My Category", category_icon='fa-envelope')
"""

"""
    Application wide 404 error handler
"""

class SupplierAdmin(ModelView):
    datamodel = SQLAInterface(Supplier)
    list_columns = ['id', 'client', 'address', 'telephone', 'email', 'comment','created_on','created_by_fk','changed_on','changed_by_fk']
    order_columns = ['id', 'client', 'address', 'telephone', 'email', 'comment','created_on','created_by_fk','changed_on','changed_by_fk']
    add_columns = ['client', 'address', 'telephone', 'email', 'comment']
    edit_columns = ['client', 'address', 'telephone', 'email', 'comment']
    show_columns = ['id', 'client', 'address', 'telephone', 'email', 'comment']
    show_title = 'Supplier Details'
    add_title = 'Supplier Add'
    edit_title = 'Supplier Edit'

class Supplier(SupplierAdmin):
    list_columns = ['id', 'client', 'address', 'telephone', 'email', 'comment']



db.create_all()
appbuilder.add_view(SupplierAdmin, "SupplierAdmin", category = "Orders")
appbuilder.add_view(Supplier, "Supplier", category = "Orders")

@appbuilder.app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html', base_template=appbuilder.base_template, appbuilder=appbuilder), 404
