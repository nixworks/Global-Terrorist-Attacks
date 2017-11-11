

# source the config_env file 
# install the data in the local storage system, or connect to a cloud storage system, or connect to a local database system
library(packrat)
library(readr)
library(dplyr)
library(Amelia)
library(ggplot2)
library(DT)

## Parse and read data in memory 

attacks <- read_csv(file = "~/Documents/my_projects/Global-Terrorist-Attacks/Data/globalterrorismdb_0617dist.csv",col_names = T)


## Inspect the data

### check data structure 
glimpse(attacks)
colnames(attacks)
attacks[1,]
tail(attacks,n = 1)

#### we have 170,350 cases within the period from 1970 - 2016 
#### we will try to focus on the last decade only 
attacks_subset <- attacks[between(attacks$iyear, 2005,2016),]

### check data quality 
anyNA(attacks_subset)
### Visualize missing values 


## Prepare the data 

### Deal with missing values 
### Eliminate some columns 


## EDA 

### Univariate analysis 

#### 1. Which year had the highest number of attacks over the past decade ?

## Draw bar plot of attacks frequency by year
attacks_subset %>% 
  ggplot(aes(x = iyear, fill=..count..)) + 
  geom_bar() + scale_y_continuous(expand = c(0,0)) + 
  scale_x_continuous("Year", breaks = seq(2005,2016,1), expand = c(0,0)) + 
  scale_fill_gradient(low="darkred",high="red") + ggtitle("Number of attacks worldwide over the past decade") + 
  theme(panel.background = element_blank(), plot.title = element_text(hjust = 0.5))

### Interpretation: We see that number of attacks have exponentially increased over the past decade and peaked on the year of 2014 !! I wonder why that is the case. For now ... Lets go down 
### to the countries level

#### 2. What are the top 10 countries with highest number of attacks ?

## Table of attacks frequncy by country 
datatable(attacks_subset %>% 
            select(countries = country_txt) %>% 
            group_by(countries) %>% 
            summarise(attacks = n()) %>% 
            mutate(rank = dense_rank(desc(attacks))) %>% 
            arrange(desc(attacks)))

### Interpretation: Most of the attacks we see are taking place in **Irag**, **Pakistan** and **Afghanistan**. 
### These countries has the highest number of attacks compared to the rest of the world. 


#### 3. Which Terrorist organisations are respobsible for these attacks ?


Lets have a look into the top '10' terrirost organisations who are resposible for these attacks. 


datatable(attacks_subset %>% 
            group_by(gname) %>% 
            summarise(total_attempts = n()) %>%
            rename(organisation = gname) %>% 
            arrange(desc(total_attempts)) %>%
            head(10) %>%
            filter(organisation != "Unknown"))


* We can see that Taliban had the highest number of attempts '5498'






