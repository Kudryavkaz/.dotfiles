#!/usr/bin/env python3

import os
import time
import signal
import readline
import tiktoken
from openai import OpenAI

now = time.strftime("%Y-%m-%d-%H:%M:%S", time.localtime())
home = os.getenv("HOME")
user = os.getenv("USER")
display_user = "\033[0;34m" + user + "\033[0m"
path = home + "/.ag_history/"
file = path + now
flag = True
mode = "gpt-4-0125-preview"
display_model = "\033[0;32m" + mode + "\033[0m"
encoding = tiktoken.encoding_for_model(mode)
total_tokens = 0

client = OpenAI(
    api_key="sk-ZRFk4ZTodEPmDuuc5ZOQAck8sNivoQwJ8W74jJI1LlIE78oZ",  # gpt-4
    # api_key="sk-87PwpjJLwI0NPbQ8Rc5a3iNMfhtJXqiPVTLGmof54y40L9AC",  # gpt-3.5-turbo
    base_url="https://api.chatanywhere.tech/v1",
)

def signal_handler(signal, frame):
    print("")
    print("\033[0;31mCost ", total_tokens, " tokens, exit.\033[0m", sep='')
    os._exit(0)

def talk_gpt(messages):
    response = client.chat.completions.create(
        model=mode, messages=messages, stream=True
    )
    gpt_content = ""
    print(display_model + " > ", end="")
    for chunk in response:
        if chunk.choices[0].delta.content is not None:
            gpt_content += chunk.choices[0].delta.content
            print(chunk.choices[0].delta.content, end="", flush=True)
    print("")
    with open(file, "a+") as f:
        f.write(mode + " > " + gpt_content + "\n")
    return gpt_content

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    if not os.path.exists(path):
        os.makedirs(path)

    message = [
        {"role": "system", "content": "You are an assistant."},
    ]
    while True:
        user_content = input(display_user + " > ")
        if user_content == "q":
            print("\033[0;31mCost ", total_tokens, " tokens, exit.\033[0m", sep='')
            break
        print("")
        if flag == True:
            flag = False
            os.system(r"touch {}".format(file))
        with open(file, "a+") as f:
            f.write(user + " > " + user_content + "\n")
        message.append({"role": "user", "content": user_content})
        gpt_content = talk_gpt(message)
        total_tokens += len(encoding.encode(gpt_content))
        print("")
