install.packages(c("cowplot","googleway","ggrepel","ggspatial","libwgeom","sf", "rnaturalearth","rnaturalearthdata"))
install.packages("magick")

library(ggplot2)
theme_set(theme_bw())
library(sf)
library(tidyverse)
library(rnaturalearth)
library(rnaturalearthdata)
library(lubridate)
library(magick)
library(purrr)

#set date range for maps
months <- seq(from=as.Date('2009-01-01'), to=as.Date("2022-01-01"),by='year')
#set size of list
l <- vector("list",14)
#set j index
j<-1

#create map for electricity usage for each month, save, put into list as magick object
for (i in seq_along(months)){
  world <- ne_countries(scale = "medium", returnclass = "sf")
  world<-world%>%rename('Country.code' = 'brk_a3')
  x<-full_join(world, demand, by = 'Country.code')
  x<-x%>%
    drop_na(Date)
  as.Date(x$Date)
  x<-x%>%filter(Date == as.Date(months[i]))
  z<-ggplot(data = x) +
          geom_sf(aes(fill = Value))+
          coord_sf(xlim = c(-20, 45), ylim = c(30, 73), expand = FALSE) +
          ggtitle(paste0("", as.Date(months[i])))+
          scale_fill_viridis_c(option = "plasma", trans = "sqrt")+
          borders("world")
  print(z)
  y<-image_read(ggsave(paste0("", as.Date(months[i]), ".png")))
      l[[j]] <- y
      j <- j + 1
  }

#join all map images together
images <- image_join(l)

#create gif
my.animation<-image_animate(image_scale(images,"400x400"), fps = 1, dispose = "previous")
image_write(my.animation, "electricity_demand.gif")

