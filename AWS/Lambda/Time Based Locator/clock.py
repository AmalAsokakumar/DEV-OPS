import json

def lambda_handler(event, context):
    if event['time'] > 0 and event['time'] <= 24:
        if event['time'] > 8 and event['time'] <= 10:
            result = 'breakfast'
        elif event['time'] > 10 and event['time'] <= 11:
            result = 'start work'
        elif event['time'] > 11 and event['time'] <= 12:
            result = 'meeting with client'
        elif event['time'] > 12 and event['time'] <= 17:
            result = 'daily work'
        elif event['time'] > 17  and event['time'] <= 19:
            result = 'shopping'
        elif event['time'] > 19  and event['time'] <= 21:
            result = 'dinner'
        else: 
            result = 'sleep'
    else: 
        result = 'error'
        
    event['stage'] = result
    return event
