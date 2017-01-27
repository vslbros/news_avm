from __future__ import unicode_literals

from django.db import models
from datetime import datetime

# Create your models here.

class resolved_news_type(models.Model):
	resolved_news_type_name =models.CharField(max_length=250,unique=True)


class unresolved_news_type(models.Model):
	unresolved_news_type_name =models.CharField(max_length=250)

class map_unresolved_resolved_news_type_map(models.Model):
	resolved_news_type_id =models.ForeignKey(resolved_news_type,on_delete=models.CASCADE)
	unresolved_news_type_id =models.ForeignKey(unresolved_news_type,on_delete=models.CASCADE,unique=True)


class resolved_location(models.Model):
	resolved_location_name =models.CharField(max_length=250,unique=True)

class unresolved_location(models.Model):
	unresolved_location_name =models.CharField(max_length=250)

class map_unresolved_resolved_location(models.Model):
	resolved_location_id =models.ForeignKey(resolved_location,on_delete=models.CASCADE)
	unresolved_location_id =models.ForeignKey(unresolved_location,on_delete=models.CASCADE,unique=True)

class source(models.Model):
	source_name =models.CharField(max_length=250,unique=True)
	source_url=models.CharField(max_length=250)

class article_download(models.Model):
	local_file_path =models.CharField(max_length=250)
	article_download_created_date=models.DateTimeField(default=datetime.now, blank=True)
	article_download_last_updated=models.DateTimeField(default=datetime.now, blank=True)
	is_parsed=models.IntegerField(default=0)

class article_parsed(models.Model):
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

class article_content(models.Model):
	article_parsed_id =models.ForeignKey(article_parsed,on_delete=models.CASCADE)
	content =models.TextField(null=True)

class author(models.Model):
	author_name =models.CharField(max_length=250)
	article_parsed_id =models.ForeignKey(article_parsed,on_delete=models.CASCADE)















	
