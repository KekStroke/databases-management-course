from pymongo import MongoClient

def main():
    # client = MongoClient("mongodb://hostname:port")
    client = MongoClient("mongodb://localhost") # will connect to localhost and default port 27017

    db = client['test']
    
    collection = db['restaurants']
        
    result = collection.delete_one({'borough':'Brooklyn'})
    print(result.deleted_count)
    result = collection.delete_many({'cuisine': 'Thai'})
    print(result.deleted_count)
    


if __name__ == '__main__':
    main()