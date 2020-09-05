import boto3
from boto3.dynamodb.conditions import Key
import heapq
from geopy.geocoders import Nominatim
import json


def lambda_handler(event, context):
    locator = Nominatim(user_agent="myGeocoder")
    start_location = event['queryStringParameters'].get('start')  
    longitude = event['queryStringParameters']['longitude']
    latitude = event['queryStringParameters']['latitude']
    #coordinates = "1.266276, 103.820753"
    coordinates = "{}, {}".format(latitude, longitude) 
    dest = event['queryStringParameters'].get('dest')
    
    location = locator.reverse(coordinates)
    id = str(location.raw['place_id'])
    
    #id = "115516946"
    responseObject = {}
    dynamodb = boto3.resource('dynamodb')
    
    try:
        table = dynamodb.Table('nearest_start_tile')
        info = table.query(KeyConditionExpression=Key('id').eq(id))['Items'][0]
    except IndexError as e:
        print(e)
        responseObject['statusCode'] = 404
        responseObject['headers'] = {}
        responseObject['headers']['Content-Type']= 'application/json'
        responseObject['body'] = json.dumps({'message': 'Location not found.'})
        return responseObject
        
    station = info['name']
    
    # get tiles
    table = dynamodb.Table('stations')
    data = table.query(KeyConditionExpression=Key('name').eq(station))['Items'][0]

    if start_location == 'request':
        responseObject['statusCode'] = 200
        responseObject['headers'] = {}
        responseObject['headers']['Content-Type']= 'application/json'
        origins = []
        # origins.append(info['description'])
        for key in data['tile_id']: # 'CCL_Lift', 'NEL_Lift'
            if key[:4] != "Exit" and key[-4:] == "Lift": # to update: toilet/atm/etc.
                origins.append(key)
        destinations = []
        for key in data['tile_id']: # 'Exit A', 'CCL_HBF'
            if key[-4:] != "Lift": # front end handle: key != info['description']
                destinations.append(key)  
        responseObject['body'] = json.dumps({"message": {"start": sorted(origins), "dest": sorted(destinations)}})
        return responseObject
            
    '''
    if start_location == 'request':
        responseObject['statusCode'] = 200
        responseObject['headers'] = {}
        responseObject['headers']['Content-Type']= 'application/json'
        origins = []
        for key in data['tile_id']: # 'CCL_Lift', 'NEL_Lift'
            if key[:4] != "Exit" and key[-4:] == "Lift":
                origins.append(key)
        responseObject['body'] = json.dumps({"message": sorted(origins)})
        return responseObject
    '''
    
    if dest == 'request':
        responseObject['statusCode'] = 200
        responseObject['headers'] = {}
        responseObject['headers']['Content-Type']= 'application/json'
        destinations = []
        for key in data['tile_id']: # 'Exit A', 'CCL_HBF'
            if start_location == None and key != info['description'] and key[-4:] != "Lift":
                destinations.append(key)
            elif start_location != None and key != start_location and key[-4:] != "Lift":
                destinations.append(key)        
        responseObject['body'] = json.dumps({"message": sorted(destinations)})
        return responseObject
    
    if (start_location == None):
        start_tile = data['tile_id'][info['description']]
    else:
        start_tile = data['tile_id'][start_location]
    
    dest_tile = data["tile_id"][dest]

    path = data['tiles']['1']
    prev = ucs(data['tiles'], start_tile, dest_tile)
    path = get_path(data['tiles'], start_tile, dest_tile, prev)
    
    if (start_location == None):
        path[0] += "_tactile"
    else: # start_location == "Lift"
        path[0] += "_lift"
    path.append('end');

    responseObject['statusCode'] = 200
    responseObject['headers'] = {}
    responseObject['headers']['Content-Type']= 'application/json'
    responseObject['body'] = json.dumps({'message': path})
    return responseObject
    
def ucs(tiles, startTile, goalTile): 
    pq = []
    visited = [0 for i in range (23)]
    visited[0] = 1
    prev = [0 for i in range(23)]
    prev[int(startTile)] = '0'
    heapq.heappush(pq, (0, startTile, (0, '0', None))) 
    while pq:
        curr = pq.pop(0) 
        visited[int(curr[1])] = 1
        if curr[1] == goalTile:
            while (curr[2][1] != '0'):  
                prev[int(curr[1])] = curr[2][1]
                curr = curr[2]
            return prev
        dist = tiles[curr[1]]['distance'] 
        for k in tiles[curr[1]]['direction'].get(curr[2][1]): 
            if visited[int(k)]!=1:
                heapq.heappush(pq, (dist[k] + curr[0], k, curr))

    
def get_path(tiles, startTile, goalTile, prev):
    reversed_instructions = []
    curr = goalTile
    pre = prev[int(curr)] #4
    while curr != startTile:
        reversed_instructions.append(tiles[pre]['direction'][prev[int(pre)]][curr])
        curr = pre
        pre = prev[int(curr)]
    reversed_instructions.append('start')
    return list(reversed(reversed_instructions))
 
    

