#
#Evelyn Martin -- Bev's Byte 2 
#12/10/22
#
library(tidyverse)
library(tidytext)
library(reshape2)
library(wordcloud)
library(sentimentr)
library(syuzhet)

#read file
text <- readLines(file.choose())

# remove any dollar signs (special characters in R)
fileText <- gsub("\\$", "", text) 


# tokenize
tokens <- tibble(text = fileText) %>% unnest_tokens(word, text)

tokens %>%
  inner_join(get_sentiments("bing")) %>% # pull out only sentiment words
  count(sentiment) %>% # count the # of positive & negative words
  spread(sentiment, n, fill = 0) %>% # made data wide rather than narrow
  mutate(sentiment = positive - negative) # # of positive words - # of negative words


#get sentiment with nrc dictionary 
s <- get_nrc_sentiment(fileText)
head(s)

#barplot of sentiment scores 
barplot(colSums(s),
        las = 2,
        col = 'indianred',
        ylab = 'Count',
        main = 'Sentiment Scores of "Into the Wild"')


#get positive sentiments with bing dictionary 
positive_senti <- get_sentiments("bing") %>%
  filter(sentiment == "positive")

x<-tokens%>%
  semi_join(positive_senti) %>%
  count(word, sort = TRUE)

counting_words <- tokens %>%
  inner_join(bing) %>%
  count(word, sentiment, sort = TRUE)
head(counting_words)


#word cloud
tokens %>%
  inner_join(bing) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("indianred", "darkolivegreen"),
                   max.words = 100)


#sentiment score bar graph neg/pos 
counting_words %>%
  filter(n > 20) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment))+
  geom_col() +
  coord_flip() +
  labs(y = "Sentiment Score")


#get sentences
get_sentences(fileText)

makeDensityPlot <- function(txt) 
{
  txt %>%
    get_sentences() %>%
    sentiment() %>%
    filter(sentiment!=0) -> senti
  
  densitySentiments <- density(senti$sentiment) 
  
  plot(densitySentiments,main='Density of sentiments') 
  polygon(densitySentiments,col='indianred')        
  
  return(densitySentiments) 
}

makeDensityPlot(fileText)


#for word clouds 
#set pos to FALSE if negative sentiment words are to be displayed 
makeWordCloud <- function(txt,pos=TRUE) 
{
  terms = extract_sentiment_terms(get_sentences(txt)) 
  #get words with positive or negative polarity depending upon the argument
  if (pos)
    attributes(terms)$counts %>% filter(polarity>0) -> wordSummary
  else
  {  attributes(terms)$counts %>% filter(polarity<0) -> wordSummary 
    #reverse the polarity for wordcloud
    wordSummary$polarity = wordSummary$polarity*-1
  }
  wordcloud(words=wordSummary$words,freq=wordSummary$polarity*100, 
            max.words=250,colors = brewer.pal(8, "Dark2"), scale = c(1, 0.1)) 
}

makeWordCloud(fileText)
makeWordCloud(fileText, pos = FALSE)


#plot the emotion_by object 
plotEmotionBy <- function(txt) 
{
  e<-emotion_by(get_sentences(txt),drop.unused.emotions=TRUE)
  plot(e) 
}

plotEmotionBy(fileText)

#make a barplot of different emotions 
plotEmotions <- function(rawTxt) 
{
  rawTxt %>%
    get_sentences() %>%
    emotion_by(drop.unused.emotions=TRUE) %>%
    group_by(emotion_type)  %>%
    summarise(ave_emotion=mean(ave_emotion)) -> txtSummary
  
  par(mar=c(11,4,4,4))
  barplot(txtSummary$ave_emotion,
          names.arg = txtSummary$emotion_type, las=2, col='indianred')
  return(txtSummary) 
}

plotEmotions(fileText)
 
