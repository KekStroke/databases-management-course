from pymongo import MongoClient
from datetime import datetime

def main():
    # client = MongoClient("mongodb://hostname:port")
    client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

    db = client['test']
    
    collection = db['restaurants']
    
    address_to_insert = {'building':'126', 'coord':[-73.9557413, 40.7720266], 'street': 'Sportivnaya', 'zipcode':420500}
    grade_to_insert = {'date':datetime(2023, 4, 4), "grade":"A", "score":11}
    
    collection.insert_one({"address":address_to_insert,"borough":"Innopolis", "cuisine":"Serbian","name":"The Best Restaurant", "restaurant_id":"41712354", "grades":[grade_to_insert]})
    
    inno_cursor = collection.find({'borough':"Innopolis"})
    
    for document in inno_cursor: 
        print(document) 

if __name__ == '__main__':
    main()