CREATE TYPE my_address_type AS (
  address_id INTEGER,
  address_string varchar(50)
);

CREATE FUNCTION get_addresses()
RETURNS SETOF my_address_type
AS $$
BEGIN
	RETURN QUERY SELECT address_id, address FROM address WHERE address LIKE '%11%' AND city_id BETWEEN 400 and 600;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_addresses();