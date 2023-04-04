from pymongo import MongoClient

def main():
    # client = MongoClient("mongodb://hostname:port")
    client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

    db = client['test']
    
    collection = db['restaurants']
    
    irish_cursor = collection.find({"cuisine":"Irish"})
    irish_russian_cursor = collection.find({"cuisine":{"$in":["Irish","Russian"]}})

    filter_criteria = {'address.building': "351", 'address.zipcode':"11215", 'address.street':"Prospect Park West"}
    address_cursor = collection.find(filter_criteria)
    
    for document in irish_cursor: 
        print(document) 
    for document in irish_russian_cursor: 
        print(document) 
    for document in address_cursor: 
        print(document)    


if __name__ == '__main__':
    main()