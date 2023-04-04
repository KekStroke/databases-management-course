from pymongo import MongoClient
from datetime import datetime

def main():
    # client = MongoClient("mongodb://hostname:port")
    client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

    db = client['test']
    
    collection = db['restaurants']
    
    filter_criteria = {'address.street':"Prospect Park West"}
    address_cursor = collection.find(filter_criteria)
     
    for document in address_cursor: 
        count_a = 0
        for grade in document['grades']:
            if grade['grade'] =='A':
                count_a+=1 
        if count_a > 1:
            result = collection.delete_one({'_id':document['_id']})
            print(result.deleted_count)
        else:
            grades = document['grades']
            grades.append({'date':datetime.now(), 'grade':'A'})
            update_operation = {'$set': {'age': 30}}
            result = collection.update_one({'_id':document['_id']}, update_operation)
            
            print(result.modified_count)


if __name__ == '__main__':
    main()