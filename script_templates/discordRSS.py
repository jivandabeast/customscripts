import feedparser
import requests
import random
import json
import re
from datetime import datetime

def getShow(title):
    try:
        title = re.search(r'(.* )(\d*x\d* )(".*")', title).group(1)
    except Exception as e:
        print('Error determining episode title of: ', title, '; ', e)
    return title

def genColor():
    color = random.randint(0, 16777215)
    return color

def dataConstruct(releases):
    data = {}
    data['content'] = 'New this week: '
    data['username'] = 'Trakt.tv'
    data['embeds'] = []
    for entry in releases:
        embed = {}
        embed['title'] = entry.title
        embed['description'] = entry.summary
        embed['color'] = genColor()
        embed['thumbnail'] = {}
        embed['thumbnail']['url'] = entry.media_content[0]['url']
        embed['timestamp'] = str(datetime.strptime(entry.published, "%Y-%m-%dT%H:%M:%SZ"))
        data['embeds'].append(embed)
    return data

def pushWebhook(data, url):
    result = requests.post(url, data=json.dumps(data), headers={'Content-Type': 'application/json'})
    try:
        result.raise_for_status()
    except requests.exceptions.HTTPError as err:
        print(err)
    else:
        print("Payload delivered successfully, code {}.".format(result.status_code))
    return None

def main():
    traktRSS = feedparser.parse('[YOUR TRAKT.TV RSS FEED HERE]')
    webhookURL = '[YOUR DISCORD WEBHOOK HERE]'
    itemList = []
    now = datetime.now()

    print('---')
    print(now.date())

    prevTitle = ''
    for entry in traktRSS.entries:
        entryDate = datetime.strptime(entry.published, "%Y-%m-%dT%H:%M:%SZ")
        title = getShow(entry.title)

        if entryDate.strftime('%U') == now.strftime('%U'):
            if title != prevTitle:
                itemList.append(entry)
            elif title == prevTitle:
                i = len(itemList) - 1
                itemList[i].title = title + ' - Multiple Episodes'
        
        prevTitle = title
    
    if len(itemList) != 0:
        pushWebhook(dataConstruct(itemList), webhookURL)
    else:
        print('Nothing being released this week.')

if __name__ == '__main__':
    main()