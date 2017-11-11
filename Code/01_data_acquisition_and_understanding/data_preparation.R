

# source the config_env file 
# install the data in the local storage system, or connect to a cloud storage system, or connect to a local database system
library(packrat)
library(readr)
library(dplyr)
library(Amelia)

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



## EDA 

### Univariate analysis 


