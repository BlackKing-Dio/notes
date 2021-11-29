#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import asyncio
import websockets
import time


# 向服务器端发送消息
async def send_msg(websocket):
    while True:
        # _text = input("please enter your context: ")
        # if _text == "exit":
        #     print('you have enter "exit", goodbye')
        #     await websocket.close(reason="user exit")
        #     return False
        text='''{"content": "device_state", "type": "car_order", "id": 0}'''
        await websocket.send(text)
        recv_text = await websocket.recv()
        print(recv_text)
        time.sleep(2)


# 客户端主逻辑
async def main_logic():
    async with websockets.connect('ws://127.0.0.1/index_socket') as websocket:
        # await auth_system(websocket)

        await send_msg(websocket)

#asyncio.get_event_loop().run_until_complete(main_logic())

