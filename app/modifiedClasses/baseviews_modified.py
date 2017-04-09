from flask.ext.appbuilder.baseviews import *

print("baseviews.py")

class BaseCRUDViewModified(BaseCRUDView):
    showlist_template = 'appbuilder/general/model/showlist.html'
    """ Your own add jinja2 template for showlist """