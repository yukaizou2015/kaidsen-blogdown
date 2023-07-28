---
title: Power Automate using the new Twitter API
author: Yukai Zou
date: '2023-05-01'
slug: power-automate-using-the-new-twitter-api
categories: 
  - API
tags:
  - Microsoft
  - Twitter
---

Today I reactivated my Twitter API to the MRI Physics Group to retrieve ISMRM tweets, and I created a new Twitter accounts to retrieve dementia tweets to The Single Voxel Group at University.

I explained to Ella what Twitter API can do and its relevance to protecting data security.

The Basic subscription comes with a $100/month fee, so I ended up using the Free version. 

I need to link to two SharePoint list.
 - A list under the Conversation tab of MRI Physics Group, called "ISMRM from Twitter"
 - A list under The Single Voxel Group, called "Dementia from Tweets"

I created a Power Automate Flow under my University credential.

For Twitter hashtag, enter #dementia

Look at the screenshot for other entries in SharePoint

Enter the Twitter Developer credentials:
 - API Key for ""
 - API Key Secret for ""

## "Once At A Time" Rule

Twitter API Key and Secret are unique and can only be used once at a time. The Free plan only offers up to one App, so in order to use the API for more than one scenario, one would need to eithe upgrade to Basic plan or use a different Twitter developer account. 

## Setting Callback URL

There might be a trick that get the flow worked, which is setting the callback URL correctly (see [this post](https://learn.microsoft.com/en-us/connectors/twitter/#creating-an-oauth-client-application-in-twitter)):
 - Enter `https://global.consent.azure-apim.net/redirect` for the callback URLs

If these info no longer apply, get updated info from Twitter Developer platform at https://developer.twitter.com/

## See Also
 - [Capture Tweets in a SharePoint list](https://www.linkedin.com/learning/microsoft-power-automate-essential-training-2021/capture-tweets-in-a-sharepoint-list?u=35146660)