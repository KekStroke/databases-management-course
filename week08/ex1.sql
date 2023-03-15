select count(*) from customer where name='Susan Adams';
-- 8 rows

explain select * from customer where name='Susan Adams';
-- Gather  (cost=1000.00..36687.33 rows=10 width=211)ABORT

CREATE INDEX name_btree ON customer USING btree(name);
CREATE INDEX address_hash ON customer USING hash(address);

explain select * from customer where name='Susan Adams';
-- Bitmap Heap Scan on customer  (cost=4.50..44.08 rows=10 width=211)

-- It is significantly faster with index 