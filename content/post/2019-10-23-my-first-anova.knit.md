---
title: My First ANOVA!!
author: chfal
date: '2019-10-23'
slug: my-first-anova
categories: []
tags:
  - R
  - statistics
---

# ANOVAs are kinda cool!
Today in ecology lab, I learned how to run an Analysis of Variance (ANOVA)! The specific type of ANOVA I learned how to use is the [Kruskal-Wallis test](http://www.sthda.com/english/wiki/kruskal-wallis-test-in-r). It is nonparametric and doesn't depend on a normal distribution, so we used it. I later learned it is used to compare medians. [The Kruskal-Wallis test is ranked](http://www.biostathandbook.com/kruskalwallis.html), which means that for each factor, a numerical integer is assigned based on how high or low it is relative to the others in the data set, and then you calculate the sum of ranks for each group to get an H-statistic, which is pretty similar to a chi-square value.

# The Experiment
To run our ANOVA we had data about plants: Last week, we had gone out in the field and collected goldenrod plants. The goldenrod plant is a very unassuming plant. We collected them from places around UMass and we tried to note what environmental factors they were exposed to.

Usually the Teaching Assistant helps us aggregate the data but she wasn't there because she was trying to get a fellowship :) ! So, that meant that I had to aggregate the data. It was stressful being that responsible, but it also wasn't too bad - just a lot of copying and pasting. We also had drop-down menus for factors so people didn't just write their own, which is what happened last time. (The problem was solved by a nightmare script that's 100 lines long and exports several .CSV files because I couldn't figure out how to use _full_join()_ in dplyr. Whoops!). The good thing about being responsible for aggregating the data was that I got to name the variables what I liked and use snake instead of having to rewrite the headings later. Haha!

Anyway, here's the data for what we worked on in the lab. 












