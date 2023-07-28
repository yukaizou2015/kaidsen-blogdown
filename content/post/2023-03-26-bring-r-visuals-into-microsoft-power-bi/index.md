---
title: Bring R visuals into Microsoft Power BI
author: Yukai Zou
date: '2023-03-26'
slug: bring-r-visuals-into-microsoft-power-bi
categories:
  - Microsoft
  - R
tags:
  - Power BI
---

Power BI has been widely used within UHS. Power BI reports can be added onto SharePoint and Teams. I need to learn how to create and use R visuals in Power BI.

Today I downloaded Power BI Desktop onto my UHS laptop, it worked as expected. I then followed the instructions at
https://learn.microsoft.com/en-us/power-bi/create-reports/desktop-r-visuals
and got R installed onto Windows (although an R sits within my WSL2, I still needed to install in Windows). I could load in data, make simple base plot and ggplot2 diagram, but I couldn't get leaflet interactive map plotted. A few posts suggested why interactive plot won't work:

https://learn.microsoft.com/en-us/power-bi/visuals/service-r-visuals
https://community.powerbi.com/t5/Desktop/Can-I-build-a-map-using-Leaflet-for-R-and-add-it-to-a-Power-BI/td-p/1464300

https://learn.microsoft.com/en-us/power-bi/create-reports/desktop-r-visuals#known-limitations

The error message I got was "The R code didn't result in creation of any visuals. Make sure your R script results in a plot to the R default device."
I then found a similar question posted in the Microsoft Power BI Community. It reported the issue of graphics libraries not working:
https://community.powerbi.com/t5/Desktop/R-graphics-libraries-does-not-work-in-PBI/m-p/259473

From reading the solution to that question, I found a blog post from Radacad, about interactive charts using R and Power BI (Part 1):
https://radacad.com/interactive-map-using-r-and-power-bi-create-custom-visual-part-1

And the post suggested that Custom visuals, rather than R visuals, are what's needed. I followed the post to install node.js (it was successful this time, to my surprise). 
I haven't fully gone through Part 1 yet. It was about plotly, so not sure if it will work for leaflet as well.