-- ex2, first requirement
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
	 
-- ex2, second requirement
select * from store
where store_id in 
	(select store_id
	 from payment
	 join customer on customer.customer_id = payment.customer_id
	 group by store_id
	 order by sum(amount) desc
	 limit 1);