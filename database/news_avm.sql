/* Table resolved_news_type */

create database IF NOT EXISTS `news_avm`;

use `news_avm`;

create table IF NOT EXISTS `resolved_news_type`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`resolved_news_type_name` varchar(250) NOT NULL  UNIQUE,
	PRIMARY KEY(`id`));

/* Table unresolved_news_type */
create table IF NOT EXISTS `unresolved_news_type`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`unresolved_news_type_name` varchar(250),
	PRIMARY KEY(`id`));

/* Table map_unresolved_resolved_news_type_map */
create table IF NOT EXISTS `map_unresolved_resolved_news_type_map`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`resolved_news_type_id` SMALLINT NOT NULL,
	INDEX(`resolved_news_type_id`),
	`unresolved_news_type_id` SMALLINT NOT NULL UNIQUE,
	PRIMARY KEY(`id`),
	CONSTRAINT foreignkey_resolved_news_type_id FOREIGN KEY fk_resolved_news_type_id(`resolved_news_type_id`) REFERENCES resolved_news_type(`id`) ON DELETE CASCADE,
	CONSTRAINT foreignkey_unresolved_news_type_id FOREIGN KEY fk_unresolved_news_type_id(`unresolved_news_type_id`) REFERENCES unresolved_news_type(`id`) ON DELETE CASCADE);

/* Table resolved_location */
create table IF NOT EXISTS `resolved_location`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`resolved_location_name` varchar(250) UNIQUE,
	PRIMARY KEY(`id`));

/* Table unresolved_location */
create table IF NOT EXISTS `unresolved_location`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`unresolved_location_name` varchar(250),
	PRIMARY KEY(`id`));

/* Table map_unresolved_resolved_location */
create table IF NOT EXISTS `map_unresolved_resolved_location`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`resolved_location_id` SMALLINT NOT NULL,
	INDEX(`resolved_location_id`),
	`unresolved_location_id` SMALLINT NOT NULL UNIQUE,
	PRIMARY KEY(`id`),
	CONSTRAINT foreignkey_resolved_location_id FOREIGN KEY fk_resolved_location_id(`resolved_location_id`) REFERENCES resolved_location(`id`) ON DELETE CASCADE,
	CONSTRAINT foreignkey_unresolved_location_id FOREIGN KEY fk_unresolved_location_id(`unresolved_location_id`) REFERENCES unresolved_location(`id`) ON DELETE CASCADE);

/* Table source */
create table IF NOT EXISTS `source`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`source_name` varchar(250) NOT NULL UNIQUE,
	`source_url` varchar(250) NOT NULL,
	PRIMARY KEY(`id`));



/* Table article_download */
create table IF NOT EXISTS `article_download`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`local_file_path` varchar(250),
	`article_download_created_date` DATETIME NOT NULL,
	`article_download_last_updated` DATETIME NOT NULL,
	`is_parsed` TINYINT,
	PRIMARY KEY(`id`)); 

/* Table article_parsed */
create table IF NOT EXISTS `article_parsed`(
	`id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(`id`),
	`article_title` varchar(250) NOT NULL,
	`unresolved_news_type_id` SMALLINT NOT NULL,
	CONSTRAINT foreignkey_parseTB_unresolved_news_type_id FOREIGN KEY fk_parseTB_unresolved_news_type_id(`unresolved_news_type_id`) REFERENCES unresolved_news_type(`id`) ON DELETE CASCADE,
	`url` varchar(250) NOT NULL,
	`published_date` DATETIME NOT NULL,
	`created_date` DATETIME NOT NULL,
	`last_updated_date` DATETIME NOT NULL,
	`unresolved_location_id` SMALLINT NOT NULL,
	CONSTRAINT foreignkey_parseTB_unresolved_location_id FOREIGN KEY fk_parseTB_unresolved_location_id(`unresolved_location_id`) REFERENCES unresolved_location(`id`) ON DELETE CASCADE,
	`source_id` SMALLINT NOT NULL,
	CONSTRAINT foreignkey_parseTB_source_id FOREIGN KEY fk_parseTB_source_id(`source_id`) REFERENCES source(`id`) ON DELETE CASCADE,
	`article_download_id` INT NOT NULL,
	CONSTRAINT foreignkey_parseTB_article_download_id FOREIGN KEY fk_parseTB_article_download_id(`article_download_id`) REFERENCES article_download(`id`) ON DELETE CASCADE,
	`unique_id` INT NOT NULL UNIQUE);

/* Table article_content */
create table IF NOT EXISTS `article_content`(
	`id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(`id`),
	`article_parsed_id` INT NOT NULL,
	CONSTRAINT foreignkey_artilce_parsed_id FOREIGN KEY fk_article_parsed_id(`article_parsed_id`) REFERENCES article_parsed(`id`) ON DELETE CASCADE,
	content TEXT);

/* Table author */
create table IF NOT EXISTS `author`(
	`id` SMALLINT NOT NULL AUTO_INCREMENT,
	`author_name` varchar(250) UNIQUE,
	`article_parsed_id` INT NOT NULL,
	constraint foreignkey_article_parsed_id FOREIGN KEY fk_article_parsed_id(`article_parsed_id`) REFERENCES article_parsed(`id`) ON DELETE CASCADE, PRIMARY KEY(`id`));

