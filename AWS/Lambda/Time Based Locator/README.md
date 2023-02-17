# Step Functions In Lambda

## This project has 3 lambda function which does the following

each these functions accept an input and produce an output follows default configuration.

```
Lambda -> Functions -> Create function
    - Function Name -> Planets 
    - Runtime -> python3.9
    - Architecture -> x86_64
    - permission -> create a new role with basic lambda permission

Create. 

```

1. Lambda function `Clock` (accept time as input variable and trigger the second lambda function) .
1. Lambda function `Place` (when second function is triggered it create another event).
1. Lambda function `People` (when the third function is triggered it will).

#### create 3 lambda functions and deploy them.

## Now Create a Step Function 
<br>

```
Step Functions -> State machines -> Create State Machine

Choose authoring method ->  Design your workflow visually
    - Type -> standard 
        now we can drag and drop the aws resources.

         Design workflow

            drag -> aws lambda invoke
                State Name -> clock
                Api Parameter ->  Function Name -> Clock:$LATEST
                Payload -> Enter Payload -> 
                                            {
                                                "time" : 11
                                            } 

        Follow default settings 
```
 <br> `attach the second lambda function`

```
         Design workflow

            drag -> aws lambda invoke
                State Name -> lambda invoke
                Api Parameter ->  Function Name -> Place:$LATEST
                Payload -> Use State Input As the Payload 
                                            {

        Follow default settings 
```
<br> `attach the third lambda function`
```
         Design workflow

            drag -> aws lambda invoke
                State Name -> people
                Api Parameter ->  Function Name -> People:$LATEST
                Payload -> Use State Input As the Payload 
                                            {

        Follow default settings 
```
```

` Click Next` -> it will generate code snippets.
` Click Next` -> Specify state machine settings ->
        Name -> State machine name -> TimePlacePeopleTask
        
        follow default

  create state machine 

Start Execution -> Name -> Initial
    Input -> Optional -> {
                            
                            }

```