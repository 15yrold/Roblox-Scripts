import os
import discord
import logging
from github import Github
from colorama import Fore
from discord.ext import commands
from discord_slash import SlashCommand

def cls():
    os.system('cls')

cls()
logging.basicConfig(
    level = logging.INFO,
    format = f"{Fore.LIGHTBLUE_EX}[{Fore.RESET}%(asctime)s{Fore.LIGHTBLUE_EX}] %(message)s{Fore.RESET}",
    datefmt = '%H:%M:%S'
)
log = logging.info
token = '' # bot token
intents = discord.Intents.all()
intents.members = True
intents = discord.Intents(messages = True, guilds = True, members = True)
client = commands.Bot(self_bot = False, command_prefix = '>', case_insensitive = True, guild_subscriptions = True,  intents = intents)
slash = SlashCommand(client, sync_commands = True)
g = Github('') # 
repo = g.get_repo('') # github repo

@client.event
async def on_ready():
    cls()
    print(client.user)

 # thanks marci ^__^ ( Might redo/remake )
@client.command()
async def blacklist(ctx, username: str):
    contents = repo.get_contents('blacklist.txt')
    with open('blacklist.txt', 'a', encoding = 'UTF-8') as f:
        f.write(username + '\n')
    with open('blacklist.txt', 'r', encoding = 'UTF-8') as f:
        fixed = f.read()[:-1]
    with open('blacklist.txt', 'w', encoding = 'UTF-8') as f:
        f.write(fixed)
    with open('blacklist.txt', 'r') as file:
        datas = file.read()
        log(datas)
    repo.update_file('blacklist.txt', 'blacklisted: ' + username, f'{datas}', contents.sha)
    await ctx.send('Blacklisted: ' + username)
@slash.slash(name = 'blacklist', description = 'Blacklists user', guild_ids = [])
async def blacklist(ctx, username: str):
    contents = repo.get_contents('blacklist.txt')
    with open('blacklist.txt', 'a', encoding = 'UTF-8') as f:
        f.write(username + '\n')
    with open('blacklist.txt', 'r', encoding = 'UTF-8') as f:
        fixed = f.read()[:-1]
    with open('blacklist.txt', 'w', encoding = 'UTF-8') as f:
        f.write(fixed)
    with open('blacklist.txt', 'r') as file:
        datas = file.read()
        log(datas)
    repo.update_file('blacklist.txt', 'blacklisted: ' + username, f'{datas}', contents.sha)
    await ctx.send('Blacklisted: ' + username)

@client.command()
async def whitelist(ctx, username: str):
    contents = repo.get_contents('whitelist.txt')
    with open('whitelist.txt', 'a', encoding = 'UTF-8') as f:
        f.write(username + '\n')
    with open('whitelist.txt', 'r', encoding = 'UTF-8') as f:
        fixed = f.read()[:-1]
    with open('whitelist.txt', 'w', encoding = 'UTF-8') as f:
        f.write(fixed)
    with open('whitelist.txt', 'r') as file:
        datas = file.read()
        log(datas)
    repo.update_file('whitelist.txt', 'whitelisted: ' + username, f'{datas}', contents.sha)
    await ctx.send('Whitelist: ' + username)
@slash.slash(name = 'whitelist', description = 'whitelists user', guild_ids = [])
async def whitelist(ctx, username: str):
    contents = repo.get_contents('whitelist.txt')
    with open('whitelist.txt', 'a', encoding = 'UTF-8') as f:
        f.write(username + '\n')
    with open('whitelist.txt', 'r', encoding = 'UTF-8') as f:
        fixed = f.read()[:-1]
    with open('whitelist.txt', 'w', encoding = 'UTF-8') as f:
        f.write(fixed)
    with open('whitelist.txt', 'r') as file:
        datas = file.read()
        log(datas)
    repo.update_file('whitelist.txt', 'whitelisted: ' + username, f'{datas}', contents.sha)
    await ctx.send('Whitelist: ' + username)

if __name__ == '__main__':
    client.run(token)
