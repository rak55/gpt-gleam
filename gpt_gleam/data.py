
from collections import defaultdict
import dataclasses
import html
import os
import re
from typing import Iterator, Optional
import unicodedata
import base64

import emoji
import ujson as json
import unidecode
from enum import Enum

def read_jsonl(path):
    with open(path, "r") as f:
        for line in f:
            line = line.strip()
            if line:
                ex = json.loads(line)
                yield ex


def write_jsonl(path, data):
    with open(path, "w") as f:
        for ex in data:
            f.write(json.dumps(ex) + "\n")


# Function to encode the image
def encode_image(image_path):
    with open(image_path, "rb") as image_file:
        return base64.b64encode(image_file.read()).decode("utf-8")


def encode_image_url(image_path):
    if image_path.endswith(".png"):
        image_type = "png"
    elif image_path.endswith(".jpg"):
        image_type = "jpeg"
    else:
        raise ValueError(f"Image type not supported: {image_path}")

    base64_image = encode_image(image_path)
    return f"data:image/{image_type};base64,{base64_image}"

@dataclasses.dataclass
class Demo:
    filename: str
    image_url: str
    frames: Optional[str]
    rationale: Optional[str]
    problems: Optional[str]

@dataclasses.dataclass
class Post:
    filename: str
    image_url: str

def iterate_data(data_path: str, image_path: str):
    for ex in read_jsonl(data_path):
        ex_id=ex["file_name"]
        ex_img=os.path.join(image_path, ex_id)
        ex_img_url=encode_image_url(ex_img)
        result={'filename':ex_id, 'image_url':ex_img_url}
        result=Post(**result)
        yield result

    
    
