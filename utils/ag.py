#!/usr/bin/env python3

import os
import time
import signal
import readline
from openai import OpenAI

# ---config---
messages = [{"role": "system", "content": "You are an assistant."}]
mode = "gpt-4o"
# mode = "gpt-4-0125-preview"
# mode = "gpt-3.5-turbo"
# ------------

home = os.getenv("HOME")
now = time.strftime("%Y-%m-%d-%H:%M:%S", time.localtime())
path = home + "/.ag_history/"
file = path + now + ".md"
user = os.getenv("USER")
display_user = "\033[0;34m" + user + "\033[0m"
flag = True
display_model = "\033[0;32m" + mode + "\033[0m"
# encoding = tiktoken.encoding_for_model(mode)
# ask_tokens = 0
# chat_tokens = 0

client = OpenAI(
    # api_key="sk-87PwpjJLwI0NPbQ8Rc5a3iNMfhtJXqiPVTLGmof54y40L9AC",  # gpt-3.5-turbo
    api_key="sk-ZRFk4ZTodEPmDuuc5ZOQAck8sNivoQwJ8W74jJI1LlIE78oZ",  # gpt-4
    # api_key="sk-87PwpjJLwI0NPbQ8Rc5a3iNMfhtJXqiPVTLGmof54y40L9AC",
    base_url="https://api.chatanywhere.tech",
)

def signal_handler(signal, frame):
    print("")
    # print("\033[0;31mCost ", chat_tokens + ask_tokens, " tokens, exit.\033[0m", sep='')
    print("\033[0;31mexit\033[0m")
    os._exit(0)

def talk_gpt(messages):
    response = client.chat.completions.create(
        model=mode,
        messages=messages,
        stream=True,
        presence_penalty=1,
        frequency_penalty=1,
        temperature=1.0,
        n=1
    )
    gpt_content = ""
    print(display_model + " > ", end="")
    for chunk in response:
        if chunk.choices[0].delta.content is not None:
            gpt_content += chunk.choices[0].delta.content
            print(chunk.choices[0].delta.content, end="", flush=True)
    messages.append({"role": "assistant", "content": gpt_content})
    print("")
    with open(file, "a+") as f:
        f.write(mode + " > " + gpt_content + "\n\n")
    return gpt_content

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    if not os.path.exists(path):
        os.makedirs(path)

    while True:
        user_content = input(display_user + " > ")
        if user_content == "q":
            # print("\033[0;31mCost ", chat_tokens + ask_tokens, " tokens, exit.\033[0m", sep='')
            print("\033[0;31mexit\033[0m")
            break
        print("")
        if flag == True:
            flag = False
            os.system(r"touch {}".format(file))
        with open(file, "a+") as f:
            f.write(user + " > " + user_content + "\n\n")
        messages.append({"role": "user", "content": user_content})
        # ask_tokens += ask_tokens + chat_tokens + len(encoding.encode(user_content))
        gpt_content = talk_gpt(messages)
        # chat_tokens += len(encoding.encode(gpt_content))
        print("")
