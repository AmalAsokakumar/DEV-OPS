import json 

def lambda_handler(event, context):
    if event['place'] in ['home','office','shop center']:
        if event['place'] == 'home':
            result = 'family'
        elif event['place'] == 'office':
            result = 'team'
        elif event['place'] == 'coffee':
            result = 'client'
        elif event['place'] == 'shop center':
            result = 'error'
        event['people'] = result
        return event
  
  
        
            
            