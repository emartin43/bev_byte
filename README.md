# Bev's Byte
## Bev's Byte 1 -- Electricity Demand from Ember

### My goal for this project:
The goal of this project is to do some exploratory data analysis (EDA) on monthly electricity demand (TWh) data from Ember. Demand is calculated as the sum of power production and net imports. Ember provides data for 215 countries from 2000 to 2020, and where possible have gathered 2021 and 2022 data using national sources. Currently, energy prices have been the focus of global news, especially in Europe. Since I’m currently based out of Spain, I thought I would look at electricity demand, which is a component of energy prices. I initally found the data set on Data is Plural, a weekly newsletter that provides unique data sets from around the Internet. 

### What I learned from this project:
Because I had never worked with maps in ggplot or RStudio before, it was an entirely new experience to create the above gif of electricity demand. Loops are notoriously difficult for me to think through, but after referring back to my Intro to Computer Science notes and some online resources, the loop for the spatiotemporal map is some of my proudest looping work. 

### If I had more time I would change:
In the future, I would do some searching for a similar dataset with energy prices instead of electricity demand. To me, although energy demand is a component of prices, it would be a more nuanced exploration of the dataset to see how the different prices for the same amount of energy compare globally. I also would have made a more easily acessible paged table for electricity demand by country so that all of the data observations would have been easily accessible.

### Available Files: 
### [Bev's Byte 1 Blog Post/Write up](https://medium.com/@evelyn.martin/bevs-byte-1-monthly-electricity-demand-daf96eef4dad)
### [Bev's Byte 1 R Script -- Cleaning](https://github.com/emartin43/bev_byte/blob/3e95b43db9777e95d7611b576648fa34d388f450/bev_byte_1/QuickByteCleaning.R)
### [Bev's Byte 1 R Script -- Spatiotemporal Map](https://github.com/emartin43/bev_byte/blob/3e95b43db9777e95d7611b576648fa34d388f450/bev_byte_1/QuickByteSpatial.R)
### [Ember Electricity Data](https://ember-climate.org/data-catalogue/monthly-electricity-data/)
### [Ember Electricity Methodology](https://github.com/emartin43/bev_byte/blob/3e95b43db9777e95d7611b576648fa34d388f450/bev_byte_1/Ember-Electricity-Data-Methodology.pdf)

------------------------------------------------


## Bev's Byte 2 -- Sentiment Analysis of *Into the Wild*

### My goal for this project:
My motivation for this project was two-fold. Firstly, I am a big fan of Jon Krakauer, and one of my favorite books of his is *Into the Wild*. Secondly, I wanted to try something creating something with R that I had never done before. This project, therefore, is the marriage of my personal and professional interests. I had read an article touting how cool it can be to run a sentiment analysis on different types of media, and because sentiment analysis is something that I was new to before this project, I decided to give it a go in this rendition of Bev's Byte. I initially thought to analyze the script of the *Into the Wild* movie, but I thought that the book would have more dialogue and vocabulary to work with than the movie. I found a pdf of the book on the Internet and converted it to a text file. 


### What I learned from this project:
In terms of the insights I garnered from this project in particular, it was interesting to me that there are a few different sentiment analysis "libraries" that are commonly used. In the end, this makes sense because language is inherently subjective and so comparing and contrasting against different libraries is helpful in developing more robust take-aways from opinion mining. Additionally, it was quite interesting to me that *Into the Wild* was almost equally positive as it was negative; it was only slightly more negative. For a book where the main protagonist dies of hunger alone in the wild, it could be surmised that the book was written in a way that highlighted the positive experiences Chris McCandless had throughout the course of his adventure. While initially the premise of the book can be seen as a tragedy, according to the sentiment analysis in this project, Jon Krakauer does not seem to wallow excessively in its negativity, and instead delivers something that explores all facets of Chris McCandless' very human and complex odessey. 


I learned that sentiment analysis is a powerful tool that can be used to determine whether language data is positive, negative, or neutral. Analyzing media such as books and movie scripts are great ways to practice this important facet of natural language processing. Of course, the benefits of sentiment analysis goes beyond these traditional medias and can delve into social media and product reviews, as well. However, sentiment analysis systems trained on review data are often much less accurate when applied to data from other domains such as news or social media because of the differences in how people express themselves in these domains. Because the vast majority of data is unstructed, having a command of sentiment analysis will allow a good understanding of the data at play. 

### If I had more time I would change:
I would have compared the sentiment analysis of the *Into the Wild* movie with the book in order to see how Jon Krakauer and Sean Penn approached the same story of Chris McCandless differently. Though I have not seen the movie, a hypothesis of mine would be that the movie would be written in a slightly more positive light than the book, perhaps to enthrall mainstream audiences. However, that is just a hypothesis based on my own biases of movies, in general. 


### Available Files: 
### [Bev's Byte 2 Blog Post/Write up]()
### [Bev's Byte 2 R Script -- Sentiment Analysis](https://github.com/emartin43/bev_byte/blob/170a7547454516053d2eaa61a3814b282a4101ae/bev_byte_2/sentiment_analysis.R)
