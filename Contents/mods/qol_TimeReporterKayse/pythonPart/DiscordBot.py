# -*- coding: utf-8 -*-
"""
Created on Sat Apr 30 08:37:57 2022

@author: Kayse
"""

# bot.py
import discord
from discord.ext import commands

#Nest_Asyncio was required for my IDE to prevent a "RuntimeError: Cannot close a running event loop" error.
#import nest_asyncio
#nest_asyncio.apply()

from urllib.request import urlopen
import json
import asyncio
import os

timeReportFile = r'/home/pzserver/Zomboid/Lua/timeReport.txt'
weatherReportFile = r"/home/pzserver/Zomboid/Lua/weatherReport.txt"
playersReportFile = r"/home/pzserver/Zomboid/Lua/playersReport.txt"
deathReportFile = r"/home/pzserver/Zomboid/Lua/deathReport.txt"

TOKEN = 'redacted'

bot = commands.Bot(command_prefix='!')
isConnected = False
lastTimestamp = None
lastLenLines = 0
deathChannelName = "test-bed"#Change this string to the channel you want deaths reported to.
deathChannel = None
bellChannelName = "test-bed"#Change this string to the channel you want somber
bellChannel = None

async def checkForDeaths():
    print("Inside of checkForDeaths. IsConnected: " + str(isConnected))
    while isConnected:
        #print("Inside of checkForDeaths loops")
        global lastTimestamp
        global lastLenLines
        timestamp = os.stat(deathReportFile).st_mtime
        #print("Timestamp: " + str(timestamp))
        if lastTimestamp is not None and lastTimestamp != timestamp:
            print("Change detected in deathReport")
            try:
                pzLog = open(deathReportFile, "r")
                lines = pzLog.readlines()
                pzLog.close()
                if lastLenLines == 0:
                    lastLenLines = len(lines)
                if deathChannel is not None and len(lines) > lastLenLines:
                    responses = lines[lastLenLines:]
                    for response in responses:
                        print(response)
                        await deathChannel.send(response)
                        if bellChannel is not None:
                            await bellChannel.send("A somber bell tolls.")
                    lastLenLines = len(lines)
            except:
                print("Error trying to check deathReport")
        if lastLenLines == 0:
            try:
                pzLog = open(deathReportFile, "r")
                lines = pzLog.readlines()
                pzLog.close()
                lastLenLines = len(lines)
            except:
                print("Error trying to check deathReport")
        lastTimestamp = timestamp
        await asyncio.sleep(1)

@bot.event
async def on_ready():
    print(f'{bot.user} has connected to Discord!')
    guild = bot.guilds[0]
    print(bot.guilds)
    global deathChannel, bellChannel
    deathChannel= discord.utils.get(guild.channels, name=deathChannelName)
    bellChannel = discord.utils.get(guild.channels, name=bellChannelName)
    print(
        f'{bot.user} is connected to the following guild:\n'
        f'{guild.name}(id: {guild.id})\n'
        f'Death Channel is: {deathChannel}\n'
        f'Bell Channel is: {bellChannel}'
    )
    global isConnected
    isConnected = True
    asyncio.create_task( checkForDeaths() )

@bot.event
async def on_disconnect():
    print(f'{bot.user} has disconnected from Discord!')
    global isConnected
    isConnected = False
    
@bot.command(name='time')
async def pz_time(ctx):
    response = ""
    try:
        pzLog = open(timeReportFile, "r")
        response = pzLog.read()
        pzLog.close()
    except:
        response = "I'm unable to check the time, sorry."
    await ctx.send(response)

@bot.command(name='weather')
async def pz_weather(ctx):
    response = ""
    try:
        pzLog = open(weatherReportFile, "r")
        response = pzLog.read()
        pzLog.close()
    except:
        response = "I'm unable to check the weather, sorry."
    await ctx.send(response)

@bot.command(name='players')
async def pz_players(ctx):
    response = ""
    try:
        url = "https://api.battlemetrics.com/servers/14814238"
        reply = urlopen(url)
        data_json = json.loads(reply.read())
        print(data_json)
        response = "There are " + str(data_json["data"]["attributes"]["players"]) + " players currently."
    except:
        response = "I am unable to access that at this time, sorry."
    await ctx.send(response)

@bot.command(name='toll-the-bell')
async def pz_bell(ctx):
    try:
        if bellChannel is not None:
            await bellChannel.send("A somber bell tolls.")
    except:
        response = "I am unable to 'toll the bell' at this time, sorry."
        print(response)
        await ctx.send(response)

print("Before run")
bot.run(TOKEN)
print("After run")