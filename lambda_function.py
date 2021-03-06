from __future__ import print_function

import json
import urllib
import boto3
import PIL
from PIL import Image
from io import BytesIO
from os import path

print('Loading function')

s3 = boto3.client('s3')


def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))

    # Get the object from the event and show its content type
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = urllib.unquote_plus(event['Records'][0]['s3']['object']['key'].encode('utf8'))
    width_size = 600
    #extension = path.splitext(key)[1].lower()
    try:
        print("Starting s3 get object")
        response = s3.get_object(Bucket=bucket, Key=key)
        print("Starting s3 get object2")
        #obj_body = response.get()['Body'].read()
        obj_body = response['Body'].read()
        print("read s3 get object complete")


        #if extension in ['.jpeg', '.jpg']:
        format = 'JPEG'
        #if extension in ['.png']:
        #   format = 'PNG'

        img = Image.open(BytesIO(obj_body))
        wpercent = (width_size / float(img.size[0]))
        hsize = int((float(img.size[1]) * float(wpercent)))
        img = img.resize((width_size, hsize), PIL.Image.ANTIALIAS)
        buffer = BytesIO()
        img.save(buffer, format)
        buffer.seek(0)
        print("upload starting")
        # Uploading the image
        new_key = key + '_600'
        s3.put_object(Body=buffer, Bucket=bucket, Key=new_key)
        print("Done")
    except Exception as e:
        print(e)
        print('Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.'.format(key, bucket))
        raise e
