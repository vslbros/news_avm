from django.contrib import admin

# Register your models here.
from .models import resolved_news_type
from .models import unresolved_news_type
from .models import map_unresolved_resolved_news_type_map
from .models import resolved_location
from .models import unresolved_location
from .models import map_unresolved_resolved_location
from .models import source
from .models import author
from .models import article_download
from .models import article_parsed
from .models import article_content

admin.site.register(resolved_news_type)
admin.site.register(unresolved_news_type)
admin.site.register(map_unresolved_resolved_news_type_map)
admin.site.register(resolved_location)
admin.site.register(unresolved_location)
admin.site.register(map_unresolved_resolved_location)
admin.site.register(source)
admin.site.register(author)
admin.site.register(article_download)
admin.site.register(article_parsed)
admin.site.register(article_content)
