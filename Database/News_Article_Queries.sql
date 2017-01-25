/* Table resolved_news_type */
mysql> create table resolved_news_type(id SMALLINT NOT NULL AUTO_INCREMENT,resolved_news_type_name varchar(250) NOT NULL  UNIQUE,PRIMARY KEY(id));

/* Table unresolved_news_type */
mysql> create table unresolved_news_type(id SMALLINT NOT NULL AUTO_INCREMENT,unresolved_news_type_name varchar(250),PRIMARY KEY(id));

/* Table map_unresolved_resolved_news_type_map */
mysql> create table map_unresolved_resolved_news_type_map(id SMALLINT NOT NULL AUTO_INCREMENT,resolved_news_type_id SMALLINT NOT NULL,INDEX(resolved_news_type_id),unresolved_news_type_id SMALLINT NOT NULL UNIQUE,PRIMARY KEY(id),CONSTRAINT foreignkey_resolved_news_type_id FOREIGN KEY fk_resolved_news_type_id(resolved_news_type_id)REFERENCES resolved_news_type(id),CONSTRAINT foreignkey_unresolved_news_type_id FOREIGN KEY fk_unresolved_news_type_id(unresolved_news_type_id)REFERENCES unresolved_news_type(id));

/* Table resolved_location */
mysql> create table resolved_location(id SMALLINT NOT NULL AUTO_INCREMENT,resolved_location_name varchar(250) UNIQUE,PRIMARY KEY(id));

/* Table unresolved_location */
mysql> create table unresolved_location(id SMALLINT NOT NULL AUTO_INCREMENT,unresolved_location_name varchar(250),PRIMARY KEY(id));

/* Table map_unresolved_resolved_location */
mysql> create table map_unresolved_resolved_location(id SMALLINT NOT NULL AUTO_INCREMENT,resolved_location_id SMALLINT NOT NULL,INDEX(resolved_location_id),unresolved_location_id SMALLINT NOT NULL UNIQUE,PRIMARY KEY(id),CONSTRAINT foreignkey_resolved_location_id FOREIGN KEY fk_resolved_location_id(resolved_location_id)REFERENCES resolved_location(id),CONSTRAINT foreignkey_unresolved_location_id FOREIGN KEY fk_unresolved_location_id(unresolved_location_id)REFERENCES unresolved_location(id));

/* Table source */
mysql> create table source(id SMALLINT NOT NULL AUTO_INCREMENT,source_name varchar(250) NOT NULL UNIQUE,source_url varchar(250) NOT NULL,PRIMARY KEY(id));

/* Table author */
mysql> create table author(id SMALLINT NOT NULL AUTO_INCREMENT,author_name varchar(250) UNIQUE,source_id SMALLINT NOT NULL,INDEX(source_id),constraint foreignkey_source_id FOREIGN KEY fk_source_id(source_id) REFERENCES source(id),PRIMARY KEY(id));

/* Table article_download */
mysql> create table article_download(id INT NOT NULL AUTO_INCREMENT,local_file_path varchar(250),article_download_created_date DATETIME NOT NULL,article_download_last_updated DATETIME NOT NULL,is_parsed TINYINT,PRIMARY KEY(id)); 

/* Table article_parsed */
mysql> create table article_parsed(id INT NOT NULL AUTO_INCREMENT,PRIMARY KEY(id),article_title varchar(250) NOT NULL,unresolved_news_type_id SMALLINT NOT NULL,CONSTRAINT foreignkey_parseTB_unresolved_news_type_id FOREIGN KEY fk_parseTB_unresolved_news_type_id(unresolved_news_type_id) REFERENCES unresolved_news_type(id),url varchar(250) NOT NULL,published_date DATETIME NOT NULL,created_date DATETIME NOT NULL,last_updated_date DATETIME NOT NULL,unresolved_location_id SMALLINT NOT NULL,CONSTRAINT foreignkey_parseTB_unresolved_location_id FOREIGN KEY fk_parseTB_unresolved_location_id(unresolved_location_id) REFERENCES unresolved_location(id),author_id SMALLINT NOT NULL,CONSTRAINT foreignkey_parseTB_author_id FOREIGN KEY fk_parseTB_author_id(author_id) REFERENCES author(id),source_id SMALLINT NOT NULL,CONSTRAINT foreignkey_parseTB_source_id FOREIGN KEY fk_parseTB_source_id(source_id) REFERENCES source(id),article_download_id INT NOT NULL,CONSTRAINT foreignkey_parseTB_article_download_id FOREIGN KEY fk_parseTB_article_download_id(article_download_id) REFERENCES article_download(id),unique_id INT NOT NULL UNIQUE);

/* Table article_content */
mysql> create table article_content(id INT NOT NULL AUTO_INCREMENT,PRIMARY KEY(id),article_parsed_id INT NOT NULL,CONSTRAINT foreignkey_artilce_parsed_id FOREIGN KEY fk_article_parsed_id(article_parsed_id) REFERENCES article_parsed(id),content TEXT);


