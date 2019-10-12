-- Generally speaking, the best way to analyze any database is visually (if it's sufficiently complex) or to simply investigate the relations
-- and if the schema is simple, you can just select information from the information schema (DB metadata)
SELECT * FROM information_schema.columns WHERE TABLE_SCHEMA = 'ecommercedb';
SELECT * FROM information_schema.routines WHERE ROUTINE_SCHEMA = 'ecommercedb';
SELECT * FROM information_schema.table_constraints WHERE CONSTRAINT_SCHEMA = 'ecommercedb';