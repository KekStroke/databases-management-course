-- ex2, first requirement
CREATE INDEX category_id_pk ON category (category_id);
CREATE INDEX category_id_fk ON film_category (category_id);
CREATE INDEX film_id_pk ON film (film_id);
CREATE INDEX film_id_fk ON inventory (film_id);

select * from film 
where
rating in ('R', 'PG-13')
and film_id in 
	(select film_id from film_category
	 join category ON category.category_id = film_category.category_id
	 where category.name in ('Horror', 'Sci-fi'))
and film_id in 
	(SELECT film.film_id FROM film
	 join inventory on inventory.film_id = film.film_id
	 join rental on rental.inventory_id = inventory.inventory_id
	 where rental.return_date < CURRENT_DATE);
-- bottleneck in ANALYZE results before creating indexes 
-- Nested Loop Semi Join  (cost=21.97..400.93 rows=50 width=384) (actual time=0.414..1.067 rows=26 loops=1)
-- bottleneck in ANALYZE results after creating indexes
-- Nested Loop Semi Join  (cost=22.24..110.49 rows=50 width=384) (actual time=0.219..0.657 rows=26 loops=1)
-- We can see a significant improvement

-- ex2, second requirement
CREATE INDEX staff_id_pk ON staff (staff_id);
CREATE INDEX staff_id_fk ON payment (staff_id);
CREATE INDEX store_id_pk ON store (store_id);
CREATE INDEX store_id_fk ON staff (store_id);
CREATE INDEX address_id_fk ON address (address_id);
CREATE INDEX address_id_pk ON staff (address_id);

CREATE TEMPORARY TABLE temp_table AS 
select city_id, store.store_id, sum(amount) as amount
from payment
join staff on staff.staff_id = payment.staff_id
join store on store.store_id = staff.store_id
join address on address.address_id = store.address_id
-- if you want to check data for the previous month, uncomment the line below
-- where payment_date between CURRENT_DATE - INTERVAL '1 month' AND CURRENT_DATE
group by city_id, store.store_id;
-- ->  Hash Join  (cost=18.47..473.12 rows=14596 width=12) (actual time=0.202..3.764 rows=14596 loops=1)
-- ->  Seq Scan on payment  (cost=0.00..253.96 rows=14596 width=8) (actual time=0.010..0.742 rows=14596 loops=1)
-- Indexes do not give any improvement on this select

select t1.city_id, t1.store_id, t1.amount from temp_table as t1
INNER JOIN (
	SELECT city_id, max(amount) as max_amount
	from temp_table
	GROUP BY city_id
) as t2 on t1.city_id=t2.city_id and t1.amount = t2.max_amount;
-- no performance issues

DROP TABLE temp_table;