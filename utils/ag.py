#!/usr/bin/python3

import os
import time
from openai import OpenAI


now = time.strftime('%Y-%m-%d-%H:%M:%S', time.localtime())
home = os.getenv('HOME')
path = home + "/.ag_history/"
file = path + now
flag = True

client = OpenAI(
    api_key="sk-87PwpjJLwI0NPbQ8Rc5a3iNMfhtJXqiPVTLGmof54y40L9AC",
    base_url="https://api.chatanywhere.tech/v1",
)

def demo_dev(messages):
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=messages,
    )
    gpt_content=response.choices[0].message.content
    with open(file, "a+") as f:
        f.write(gpt_content + "\n")
    print(gpt_content)
    return gpt_content

def chat(sys_content):
    global now
    global home
    global path
    global file
    global flag
    message = [
        {"role": "system", "content": sys_content},
    ]
    while True:
        user_content = input(">>> ")
        if user_content == "q":
            break
        if flag == True:
            flag = False
            os.system(r"touch {}".format(file))
        with open(file, "a+") as f:
            f.write(">>> " + user_content + "\n")
        message.append({"role": "user", "content": user_content})
        gpt_content = demo_dev(message)

        ask = "用户刚才对你说了" + user_content + ",你回复了" + gpt_content
        message.append(
            {
                "role": "system",
                "content": ask
            }
        )


if __name__ == "__main__":
    if not os.path.exists(path):
        os.makedirs(path)
    chat("请你进行回复")
