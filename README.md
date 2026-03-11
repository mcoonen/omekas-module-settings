# Omeka S module settings repository

This repository aims to provide a centralized location for Omeka S module settings, that can be used to automate Omeka S installations and configurations.


## Usage
1. Edit the `<module_name>/<version>/settings.json` file and set your desired values for the settings.
2. Generate the SQL commands with jq. Example for the Mirador module:
```bash
jq -r -f generate_sql.jq Mirador/3.4.10/settings.json
```

Example output:
```sql
INSERT INTO setting (id, value) VALUES ('mirador_version', '3') ON DUPLICATE KEY UPDATE value = '3';
INSERT INTO setting (id, value) VALUES ('mirador_annotation_endpoint', 'http://localhost:8080/iiif/annotation/foobar') ON DUPLICATE KEY UPDATE value = 'http://localhost:8080/iiif/annotation/foobar';
INSERT INTO site_setting (site_id, id, value) VALUES (1, 'mirador_plugins', '["annotations","dl","image-tools","ocr-helper","share"]') ON DUPLICATE KEY UPDATE value = '["annotations","dl","image-tools","ocr-helper","share"]';
```
3. Copy-paste the generated SQL commands into your database management tool (e.g., phpMyAdmin, MySQL command line, etc.) to execute them and apply the settings to your Omeka S installation.


## TODO
- [] Think about an elegant, scalable, less-hardcoded method for jq-SQL-generation for modules with custom tables, such as BulkExport (table `bulk_exporter`), AdvancedSearch (tables `search_config`, `search_engine`, `search_suggester`), SearchSolr (tables `solr_core`, `solr_map`) etc.