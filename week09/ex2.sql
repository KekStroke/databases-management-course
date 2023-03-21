CREATE OR REPLACE FUNCTION retrieveCustomers(start_index integer, end_index integer)
RETURNS TABLE (
    customer_id integer,
	store_id int2,
    first_name varchar(45),
    last_name varchar(45),
    email varchar(50),
    address_id int2,
    activebool bool
) AS $$
BEGIN
    IF start_index < 0 OR end_index > 600 THEN
        RAISE EXCEPTION 'Invalid start or end parameter';
    END IF;
    RETURN QUERY SELECT customer.customer_id, customer.store_id, customer.first_name, customer.last_name, customer.email, customer.address_id, customer.activebool FROM customer
        ORDER BY address_id
        LIMIT end_index - start_index + 1
        OFFSET start_index - 1;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM retrieveCustomers(10, 40);