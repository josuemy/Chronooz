# Chronooz
When you read a news article about a topic you are not familiar with, it is hard
to understand what's going on. Chronooz is a web app that tries to help its users know more
about the context of trending news by displaying related events in chronological order. 

My friend Ricky and I worked on this Ruby on Rails project during one day of SBHacks 2017. 

[Check out the app!](https://chronooz.herokuapp.com/)

##What was used to create the app?
* Rails 4.2.5
* Ruby 2.3
* Cloud9.io
* [NY Times API](https://developer.nytimes.com/)
* [News API](https://newsapi.org/)

##Known Bugs & Issues
The web-app displays trending news articles and their related events but there are some bugs that need to be fixed. These bugs are:

* If a news article ends in a period, or special character, the page crashes
* Sometimes, the related events page shows unrelated events --> need to define better algorithm to find keywords
* The NYTimes API sometime fetches Q&A posts instead of articles
* Better names for the views and routes need to be defined

##How to use Chroonoz
1. Click on the a news article image to read that news article
2. Click on the news article header to see a list of chronological related events
