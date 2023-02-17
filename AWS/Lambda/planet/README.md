# Creating a lambda function

## 1. Create a lambda function <br>
```
Lambda -> Functions -> Create function
    - Function Name -> Planets 
    - Runtime -> python3.9
    - Architecture -> x86_64
    - permission -> create a new role with basic lambda permission

Create.  
```
## 2. Code source Editing. <br>
```
import json

def lambda_handler(event, context):
    print('This is my sample Lambda function')
    if event['planet'] == 'Earth':
        return 'Moon'
    elif event ['planet'] == 'Sun':
        return 'This is not a planet'
    else: 
        return 'We do not recognize your argument'
```
 Now `Deploy` the code. <br>
 then `Test`. <br>
 ```
 Configure test event
    - Test event action -> Create Event Action
    - Event Name -> PlanetTesting
    - Event Sharing Settings -> Private
    - Template -> hello-world
 ```
 <br> <br> `configure the EVENT JSON.`
 ```
{
"planet": "Earth"
}
 ```
 `save` <br><br> Run `TEST`