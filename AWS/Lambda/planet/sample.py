import json

def lambda_handler(event, context):
    print('This is my sample Lambda function')
    if event['planet'] == 'Earth':
        return 'Moon'
    elif event ['planet'] == 'Sun':
        return 'This is not a planet'
    else: 
        return 'We do not recognize your argument'
