import json
import boto3
import os

dynamodb = boto3.resource("dynamodb")

table_name = os.environ["TABLE_NAME"]
table = dynamodb.Table(table_name)

def lambda_handler(event, context):

    response = table.update_item(
        Key={
            "id": "1"
        },
        UpdateExpression="ADD #v :inc",
        ExpressionAttributeNames={
            "#v": "views"
        },
        ExpressionAttributeValues={
            ":inc": 1
        },
        ReturnValues="UPDATED_NEW"
    )

    views = int(response["Attributes"]["views"])

    return {
        "statusCode": 200,
        "body": json.dumps({
            "views": views
        })
    }