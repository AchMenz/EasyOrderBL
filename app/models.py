# -*- coding: UTF-8 -*-

from flask.ext.appbuilder import Model
from flask.ext.appbuilder.models.mixins import AuditMixin, FileColumn, ImageColumn
from sqlalchemy import Column, Integer, String, ForeignKey, Unicode, Float, Date, Time, Text
from sqlalchemy.orm import relationship
"""

You can use the extra Flask-AppBuilder fields and Mixin's

AuditMixin will add automatic timestamp of created and modified by who


"""
        
# Table of all Suppliers
class table_supplier(Model, AuditMixin):
    id = Column(Integer, primary_key=True)
    client = Column(String(255),nullable=False)
    address = Column(Text)
    telephone = Column(String(255))
    email =  Column(Unicode(255), nullable=False, server_default=u'', unique=True)
    emailText = Column(Text, nullable=False)
    comment = Column(Text)

    #gibt eine Bezeichnung aus, unter der der Datensatz angezeigt wird
    def __repr__(self):
        return self.client

# Table of all Orders
# reference to Supplier
class table_orders(Model, AuditMixin):
    id = Column(Integer, primary_key=True)
    supplierId = Column(Integer,ForeignKey('table_supplier.id'))
    supplier = relationship('table_supplier')
    target_date = Column(Date, nullable=False)
    target_time = Column(String(255))
    total_number = Column(Integer)
    total_price = Column(Float)
    comment = Column(Text)

    #gibt eine Bezeichnung aus, unter der der Datensatz angezeigt wird
    def __repr__(self):
        return str(self.id) + ", " + str(self.target_date)

# Table for the categories.
class table_category(Model, AuditMixin):
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

    #gibt eine Bezeichnung aus, unter der der Datensatz angezeigt wird
    def __repr__(self):
        return self.name

# Table for the products.
# Reference to Category. 
class table_product(Model, AuditMixin):
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    categoryId = Column(Integer,ForeignKey('table_category.id')) 
    category = relationship('table_category')

    #gibt eine Bezeichnung aus, unter der der Datensatz angezeigt wird
    def __repr__(self):
        return self.name

# Table for the prices.
# Reference to Product.
class table_price(Model, AuditMixin):
    id = Column(Integer, primary_key=True)
    price = Column(Float, nullable=False)
    date = Column(Date, nullable=False)
    productId = Column(Integer,ForeignKey('table_product.id')) 
    product = relationship('table_product')

    #gibt eine Bezeichnung aus, unter der der Datensatz angezeigt wird
    def __repr__(self):
        return str(self.price)

# Table of one Order
# reference to all Orders
class table_orderline(Model, AuditMixin):
    id = Column(Integer, primary_key=True)
    orderId = Column(Integer,ForeignKey('table_orders.id')) 
    order = relationship('table_orders')
    categoryId = Column(Integer,ForeignKey('table_category.id'))
    category = relationship('table_category')
    productId = Column(Integer,ForeignKey('table_product.id'))
    product = relationship('table_product')
    priceId = Column(Integer,ForeignKey('table_price.id'))
    pricePerUnit = relationship('table_price')
    number = Column(Float, nullable=False)
    price = Column(Float) 
    comment = Column(Text)