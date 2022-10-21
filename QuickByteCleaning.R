#
#Quick Byte 1 -- Energy 
#
#Dataset from Ember on monthly electricity demand, generation, imports, etc. on a country basis
#
#Evelyn Martin
#10/11/2022
#

library(tidyverse)

#Load data and verify
energy<-read.csv(file.choose())
head(energy)

#filter data for demand 
demand<-energy%>%
  filter(Subcategory == "Demand")%>%
  filter(Ember.region != "")

#filter data for imports between Oct 2021 and Sept 2022
imports<-energy%>%
  filter(Date >= "2021-10-01")%>%
  filter(Subcategory == "Electricity imports")%>%
  filter(Ember.region != "")

#filter data just for regional data
regional<-energy%>%
  filter(Area.type == "Region")%>%
  filter(Subcategory == "Demand")%>%
  filter(Date == "2022-01-01")

#summary stats demand by month
by(regional$Value, regional$Date, summary)
by(regional$Value, regional$Date, sd)


#boxplot of demand on continent
ggplot(demand) + geom_boxplot(mapping = aes(y=Value, x = Ember.region, color=Ember.region))

#summary stats demand 
summary(demand$Value)
sd(demand$Value)

#histogram demand value 
ggplot(demand, aes(x=Value)) + geom_histogram(binwidth = 20)

#summary stats demand by region
by(demand$Value, demand$Ember.region, summary)
by(demand$Value, demand$Ember.region, sd)

#summary stats demand by country
by(demand$Value, demand$Country.code, summary)
by(demand$Value, demand$Country.code, sd)

#barchart snapshot electricity demand on 2022-01-01
ggplot(regional, aes(x=Area, y=Value))+ 
  geom_bar(stat="identity", width=.5) + 
  labs(title="Electricity Demand 2022-01-01", 
       subtitle="Regions vs Electricity Demand", 
       caption="source: Ember Electricity Data") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

#barchart by month 
ggplot(regional, aes(x = Date, y = Value, group = Area))+
  geom_bar(stat = "identity",aes(color=Area))+
  geom_point(aes(color=Area))







