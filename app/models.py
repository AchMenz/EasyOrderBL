# -*- coding: UTF-8 -*-

from flask.ext.appbuilder import Model
from flask.ext.appbuilder.models.mixins import AuditMixin, FileColumn, ImageColumn
from sqlalchemy import Column, Integer, String, ForeignKey, Unicode, Float, Date, Time, Text
from sqlalchemy.orm import relationship
from flask import Markup, url_for
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

#    def click_row(self):
#        return Markup('<a href="' + url_for('OrdersAdmin.show',pk=str(self.id)) + '">self.client</a>')

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

    def getName(self):
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

    def getName(self):
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
        return str(self.price) + ', date: ' + str(self.date)

    def getPrice(self):
        return self.price

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

    #calculates the total price of the product
    def total_price (self):
        if (self.pricePerUnit is None) or (self.number is None):
            return "None"
        else:
            return round(self.pricePerUnit.price * self.number, 2)

    def getid(self):
        return self.id
    def getProductId(self):
        return self.productId
    def getCategory(self):
        return self.category.getName()
    def getProduct(self):
        return self.product.getName()
    def getPricePerUnit(self):
        return self.pricePerUnit.getPrice()
    def getNumber(self):
        return self.number
    def getTotalPrice(self):
        return self.total_price()
    def getComment(self):
        return self.comment
    def createOrderDict(self):

        # [0][0] = Category, [0][1] = Product, [0][2] = PricePerUnit, [0][3] = Number, [0][4] = TotalPrice,
        # [0][5] = Comment
        # Füllt Liste mit den zugehörigen Werten, Reihenfolge siehe oben. Es wird geprüft ob ein Wert existiert
        # und ob er den richtigen VariablenTyp besitzt, wenn nicht wird die Stelle mit 'None gefüllt'

        dictProd = {}
        dictProd["id"] = self.getid()
        dictProd["productId"] = self.productId
        try:
            if type(self.getCategory()) is str:
                dictProd["category"] = self.getCategory()
            else:
                dictProd["category"] = None
        except:
            dictProd["category"] = None
        try:
            if type(self.getProduct()) is str:
                dictProd["product"] = self.getProduct()
            else:
                dictProd["product"] = None
        except:
            dictProd["product"] = None
        try:
            if type(self.getPricePerUnit()) is float:
                dictProd["pricePerUnit"] = self.getPricePerUnit()
            else:
                dictProd["pricePerUnit"] = None
        except:
            dictProd["pricePerUnit"] = None
        try:
            if type(self.getNumber()) is float:
                dictProd["number"] = self.getNumber()
            else:
                dictProd["number"] = None
        except:
            dictProd["number"] = None
        try:
            if type(self.getTotalPrice()) is float:
                dictProd["totalPrice"] = self.getTotalPrice()
            else:
                dictProd["totalPrice"] = None
        except:
            dictProd["totalPrice"] = None
        try:
            if type(self.getComment()) is str:
                dictProd["comment"] = self.getComment()
            else:
                dictProd["comment"] = None
        except:
            dictProd["comment"] = None
        return dictProd