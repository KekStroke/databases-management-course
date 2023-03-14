select count(*) from customer;
-- 1000000 rows

explain select * from customer;
-- Seq Scan on customer  (cost=0.00..40313.98 rows=999998 width=211) 

CREATE INDEX name_btree ON customer USING btree(name);
CREATE INDEX address_hash ON customer USING hash(address);

explain select * from customer;
-- Seq Scan on customer  (cost=0.00..40314.00 rows=1000000 width=211)

-- Without 