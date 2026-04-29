.tables | to_entries[] | .key as $table | .value[] | . as $row |
if $table == "setting" then
  "INSERT INTO \($table) (id, value) VALUES ('\($row.id)', '\($row.value | tojson)') ON DUPLICATE KEY UPDATE value = '\($row.value | tojson)';"
elif $table == "site_setting" then
  "INSERT INTO \($table) (site_id, id, value) VALUES (\($row.site_id), '\($row.id)', '\($row.value | tojson)') ON DUPLICATE KEY UPDATE value = '\($row.value | tojson)';"
elif $table == "user_setting" then
  "INSERT INTO \($table) (user_id, id, value) VALUES (\($row.user_id), '\($row.id)', '\($row.value | tojson)') ON DUPLICATE KEY UPDATE value = '\($row.value | tojson)';"
else
  empty
end
