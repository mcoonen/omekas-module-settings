# Omeka S module settings repository

This repository aims to provide a centralized location for Omeka S module settings, that can be used to automate Omeka S installations and configurations.


## Usage
1. Edit the `<module_name>/<version>/settings.json` file and set your desired values for the settings.
2. Generate the SQL commands with jq. Example for the Mirador module:
```bash
jq '.tables.setting[] | 
"INSERT INTO setting (id,value) VALUES (\"\(.id)\",\"\(.value)\");"' Mirador/3.4.10/settings.json
```
3. Copy-paste the generated SQL commands into your database management tool (e.g., phpMyAdmin, MySQL command line) to execute them and apply the settings to your Omeka S installation.