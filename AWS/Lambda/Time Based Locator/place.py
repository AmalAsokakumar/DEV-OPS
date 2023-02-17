import json

def lambda_handler(event, context):
    if event['stage'] in ['breakfast', 'start work', 'meeting with client', 'daily work', 'shopping', 'dinner', 'sleep']:
        if event['stage'] == 'breakfast':
            result = 'home'
        elif event['stage'] == 'start work':
            result = 'office'
        elif event['stage'] == 'meeting with a client':
            result = 'coffee'
        elif event['stage'] == 'daily work':
            result = 'office'
        elif event['stage'] == 'shopping':
            result = 'shop center'
        else:
            result = 'home'
    else:
        result = 'error'
        
    event['place'] = result
    
    return event
            
    