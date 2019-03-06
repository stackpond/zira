-- get all tables having dAudit as its field
-- get all valid columns from such tables (no varbinary/image/xml)
SELECT OBJECT_NAME(c.object_id) AS TableName, c.name AS ColumnName, st.name AS ColumnType FROM sys.columns AS c INNER JOIN sys.types AS st ON st.user_type_id = c.user_type_id WHERE (c.name NOT LIKE '%-%') AND (st.name NOT IN ('binary', 'datetime2', 'datetimeoffset', 'geography', 'geometry', 'hierarchyid', 'image', 'sql_variant', 'timestamp', 'varbinary', 'xml')) AND (object_name(c.object_id) in (SELECT name FROM sys.tables WHERE (object_id IN (SELECT object_id FROM sys.columns WHERE (name = 'dAudit'))))) ORDER BY TableName