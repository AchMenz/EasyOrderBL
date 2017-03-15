# -*- coding: UTF-8 -*-

from flask.ext.appbuilder import Model
from flask.ext.appbuilder.models.mixins import AuditMixin, FileColumn, ImageColumn
from sqlalchemy import Column, Integer, String, ForeignKey, Unicode, Float, DateTime, Text
from sqlalchemy.orm import relationship
"""

You can use the extra Flask-AppBuilder fields and Mixin's

AuditMixin will add automatic timestamp of created and modified by who


"""
        
# Table of all Suppliers
class Supplier(Model, AuditMixin):
    __tablename__ = 'supplier'
    id = Column(Integer, primary_key=True)
    client = Column(String(255),nullable=False)
    address = Column(Text)
    telephone = Column(String(255))
    email =  Column(Unicode(255), nullable=False, server_default=u'', unique=True)
    comment = Column(Text)

# Table of all Orders
# reference to Supplier
class AllOrders(Model, AuditMixin):
    __tablename__='allOrders'
    id = Column(Integer, primary_key=True)
    supplierId = Column(Integer,ForeignKey('supplier.id'))
    supplier = relationship('Supplier')
    target_date = Column(DateTime)
    target_time = Column(DateTime)
    total_number = Column(Integer)
    total_price = Column(Float)
    comment = Column(Text)

# Table of one Order
# reference to all Orders
class OneOrder(Model, AuditMixin):
    __tablename__='oneOrder'
    id = Column(Integer, primary_key=True)
    orderId = Column(Integer,ForeignKey('allOrders.id')) 
    order = relationship('AllOrders')
    category = Column(String(255))
    product = Column(String(255))
    pricePerUnit = Column(Float)
    number = Column(Float)
    price = Column(Float) 
    comment = Column(Text)

# Table for the categories.
class Category(Model, AuditMixin):
    __tablename__='category'
    id = Column(Integer, primary_key=True)
    name = Column(String(255))

# Table for the products.
# Reference to Category. 
class Product(Model, AuditMixin):
    __tablename__= 'product'
    id = Column(Integer, primary_key=True)
    name = Column(String(255))
    categoryId = Column(Integer,ForeignKey('category.id')) 
    category = relationship('Category')

# Table for the prices.
# Reference to Product.
class Price(Model, AuditMixin):
    __tablename__='price'
    id = Column(Integer, primary_key=True)
    price = Column(Float)
    date = Column(DateTime)
    productId = Column(Integer,ForeignKey('product.id')) 
    product = relationship('Product')