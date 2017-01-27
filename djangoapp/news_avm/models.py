from __future__ import unicode_literals

from django.db import models
from datetime import datetime

# Create your models here.

class ResolvedNewsType(models.Model):
	resolved_news_type_name =models.CharField(max_length=250,unique=True)
	
	class Meta:
		db_table= 'resolved_news_type'
		managed=False	


class UnresolvedNewsType(models.Model):
	unresolved_news_type_name =models.CharField(max_length=250)
	
	class Meta:
		db_table= 'unresolved_news_type'
		managed=False

class MapUnresolvedResolvedNewsTypeMap(models.Model):
	resolved_news_type_id =models.ForeignKey(resolved_news_type,on_delete=models.CASCADE)
	unresolved_news_type_id =models.ForeignKey(unresolved_news_type,on_delete=models.CASCADE,unique=True)
	
	class Meta:
		db_table= 'map_unresolved_resolved_news_type_map'
		managed=False

class ResolvedLocation(models.Model):
	resolved_location_name =models.CharField(max_length=250,unique=True)
	
	class Meta:
		db_table= 'resolved_location'
		managed=False

class UnresolvedLocation(models.Model):
	unresolved_location_name =models.CharField(max_length=250)
	
	class Meta:
		db_table= 'unresolved_location'
		managed=False

class MapUnresolvedResolvedLocation(models.Model):
	resolved_location_id =models.ForeignKey(resolved_location,on_delete=models.CASCADE)
	unresolved_location_id =models.ForeignKey(unresolved_location,on_delete=models.CASCADE,unique=True)

	class Meta:
		db_table= 'map_unresolved_resolved_location'
		managed=False

class Source(models.Model):
	source_name =models.CharField(max_length=250,unique=True)
	source_url=models.CharField(max_length=250)

	class Meta:
		db_table= 'source'
		managed=False

class ArticleDownload(models.Model):
	local_file_path =models.CharField(max_length=250)
	article_download_created_date=models.DateTimeField(default=datetime.now, blank=True)
	article_download_last_updated=models.DateTimeField(default=datetime.now, blank=True)
	is_parsed=models.IntegerField(default=0)

	class Meta:
		db_table= 'article_download'
		managed=False

class ArticleParsed(models.Model):
	article_title =models.CharField(max_length=250)
	unresolved_news_type_id =models.ForeignKey(unresolved_news_type,on_delete=models.CASCADE)
	url=models.CharField(max_length=250)
	published_date=models.DateTimeField(blank=True)
	created_date=models.DateTimeField(default=datetime.now, blank=True)
	last_update_date=models.DateTimeField(default=datetime.now, blank=True)
	unresolved_location_id =models.ForeignKey(unresolved_location,on_delete=models.CASCADE)
	source_id =models.ForeignKey(source,on_delete=models.CASCADE)
	article_download_id =models.ForeignKey(article_download,on_delete=models.CASCADE)
	unique_id=models.IntegerField(unique=True)

	class Meta:
		db_table= 'article_parsed'
		managed=False

class ArticleContent(models.Model):
	article_parsed_id =models.ForeignKey(article_parsed,on_delete=models.CASCADE)
	content =models.TextField(null=True)

	class Meta:
		db_table= 'article_content'
		managed=False

class Author(models.Model):
	author_name =models.CharField(max_length=250)
	article_parsed_id =models.ForeignKey(article_parsed,on_delete=models.CASCADE)
	
	class Meta:
		db_table= 'author'
		managed=False














	
