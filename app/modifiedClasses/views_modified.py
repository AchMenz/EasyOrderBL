from flask.ext.appbuilder.views import ModelView, RestCRUDView
from flask.ext.appbuilder.baseviews import expose, expose_api
from flask.ext.appbuilder.security.decorators import has_access
from .baseviews_modified import BaseCRUDViewModified

class RestCRUDViewModified(RestCRUDView, BaseCRUDViewModified):
    def _get_modelview_urls(self, modelview_urls=None):
        view_name = self.__class__.__name__
        modelview_urls = modelview_urls or {}
        modelview_urls['show'] = url_for(view_name + ".show", pk="")
        modelview_urls['showlist'] = url_for(view_name + ".showlist", pk="")
        modelview_urls['add'] = url_for(view_name + ".add")
        modelview_urls['edit'] = url_for(view_name + ".edit", pk="")
        return modelview_urls

class ModelViewModified(ModelView, RestCRUDViewModified):
    """
    --------------------------------
            SHOWLIST
    --------------------------------
    """

    @expose('/showlist/<pk>', methods=['GET'])
    @has_access
    def showlist(self, pk):
        widgets = self._show(pk)
        return self.render_template(self.showlist_template,
                                    pk=pk,
                                    title=self.show_title,
                                    widgets=widgets,
                                    related_views=self._related_views)
