##############
#Linear Regression Fisheries Data
#Evelyn Martin
#9/30/23
##############

library(tidyverse)

fd <- read_csv('/Users/evelynmartin/Bev Byte/bev_byte_3/fisheries_data.csv')
head(fd)


class(fd)

str(fd)

######EDA########################################

##categorical variables of interest exploration (month)

#convert month to categorical 

fd$month <- factor(fd$month)

as.character(fd$month)


summary(fd)


#histogram month
ggplot(data = fd) +
  geom_bar(mapping = aes(x = month))


#histogram name ("common")



##numerical variables of interest exploration (weight, length)

hist(fd$LNGTH)

hist(fd$WGT)


#exploring categorical + numerical 

#month~length boxplot
ggplot(data = fd, mapping = aes(x = month, y = LNGTH)) +
  geom_boxplot()

#month~width boxplot
ggplot(data = fd, mapping = aes(x = month, y = WGT)) +
  geom_boxplot()

#exploring numerical data together

##scatterplot 
plot(fd$LNGTH~fd$WGT)

##transformed scatterplot
plot(log(fd$LNGTH)~log(fd$WGT))

#correlation for length, width 
cor(fd$LNGTH,fd$WGT, use = "complete.obs")

#linear regression
x<-lm(LNGTH~WGT, data = fd)

summary(x)
###For every one unit increase in weight, length increases by 74.2 units 

###73.6% of the variation in length can be explained by the relationship between length and weight, on average.


#log~log linear regression --> most linear relationship in scatterplot 
lm_log_x<-lm(log(LNGTH)~log(WGT), data = fd)

summary(lm_log_x)


###For every 1% increase in weight, length increases by about 0.34%.


###90.8% of the variation in log(length) can be explained by the relationship between log(length) and log(weight), on average.

#plot lm 
plot(log(LNGTH) ~ log(WGT), data = fd)
abline(lm_log_x)


##normality
qqnorm(residuals(lm_log_x))
qqline(residuals(lm_log_x))

#plot residuals with abline at 0
plot(lm_log_x$residuals, pch = 16, col = "red")
abline(h=0)


##plotting lm using ggplot 
ggplot(fd, aes(x = log(LNGTH), y = log(WGT))) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red")




















