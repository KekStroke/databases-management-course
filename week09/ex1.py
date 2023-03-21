import psycopg2
from geopy.geocoders import Nominatim

# Connect to the PostgreSQL database
con = psycopg2.connect(database="dvdrental", user="user",
                       password="pwd", host="127.0.0.1", port="5433")

# Create a cursor object
cur = con.cursor()

query = "ALTER TABLE address ADD COLUMN latitude DOUBLE PRECISION, ADD COLUMN longitude DOUBLE PRECISION"
cur.execute(query)
con.commit()

# Call the get_address() function to retrieve addresses
cur.callproc('get_addresses')

# Process the result set
rows = cur.fetchall()

# Initialize the geolocator object
geolocator = Nominatim(user_agent="custom-user-agent")

# Loop through the addresses and get the corresponding coordinates
for row in rows:
    address_id = row[0]
    address = row[1]

    location = geolocator.geocode(address, timeout=None)

    if location is not None:
        print(address, "coordinates:", location.latitude, ",", location.longitude)
        cur.execute("UPDATE address SET latitude = %s, longitude = %s WHERE address_id = %s", (location.latitude, location.longitude, address_id))
    else:
        print(address, "not found")
        cur.execute("UPDATE address SET latitude = %s, longitude = %s WHERE address_id = %s", (0, 0, address_id))
    
    con.commit()


# Close the cursor and connection objects
cur.close()
con.close()
