##Class Notes!!
#Tidy data sets are not correct or incorrect. Tidy data is easier to work with
#Each column is a variable and they have meaning. Each observation is a row.
#NEED to code to get tidy data (do not point and click in excel)
#NEVER USE EXCEL
#Each cell is a specific value
##?select number of special functions that work inside select
#convenience functions: starts_with, or ends_with so that way you do not need
#to type everything that starts with the same thing. Example:
library(tidyverse)
iris
iris%>%
  select(starts_with('Sepal'))%>%
  head(2)
#this will only show up with the two variables in iris that have sepal and only the two rows
#Can change it this way:
iris%>%
  select(starts_with('S'))%>%
  head(2)
#this adds species because it starts with an S!

#?str_starts 
#detects the prescence or absence of a pattern at the beginning or end of a strong
#works with strings!
#case matters
my_string <- "hello"
str_starts(my_string, 'h') #USE THIS. USE IT ALONG WITH CASEWHEN
# \\w tells about numbers or letters
str_starts(my_string, 'H')
#case matters
str_ends(my_string, '\\w')
str_ends(my_string, '\\W') #look for anything without a capitol
str_ends(my_string, "h")

#pivot_wider, pivot_longer
#values from is always required, names_from is always required
#make comments about what it exactly is doing
#pivot_wider and pivot_longer are only a part of 1.0.0 so if you're looking for something, make sure it is in 1.0.0
fish_encounters
fish_encounters%>%
  pivot_wider()
#what are all the unique values in fish
fish_encounters%>%
  select(fish)%>%
  distinct() %>% #this only tells you what is distinct and removes duplicate rows.
  tally() %>%
  pull(n) #takes the column into its all array. tally makes the column n
fish_encounters%>%#if you make it distinct here, it is going to choose everything because each row has different values with station and seen and they are no longer duplicate. You need to be filtered
  distinct()
?pivot_wider 
pivot_wider() #need to use quotes for pivot_longer BUT NOT pivot_wider (quotes all around is better)
fish_encounters %>% #can't do replace NA because seen doesn't have NAs
  ###what column will turn into a bunch of column names?
  pivot_wider(names_from= 'station',
              ###what columns will populate those columns?
              values_from= 'seen',
              #this is how you changed NAs to 0
              values_fill= list(seen=0))
#DO NOT USE MELT or UNMELTING

fish_encounters %>% #can't do replace NA because seen doesn't have NAs
  ###what column will turn into a bunch of column names?
  pivot_wider(names_from= 'station',
              ###what columns will populate those columns?
              values_from= 'seen') -> fish_wide
head(fish_wide)
#can use colon to go from first to last in the ORDER that it is in in the dataset

fish_wide%>%
  #names to and values to
  pivot_longer(Release:MAW, names_to = 'station',
               values_to = 'seen') #it is longer because we didn't drop NA
?pivot_longer
fish_wide%>%
  pivot_longer(Release:MAW, names_to = 'station',
               values_to = 'seen',
               values_drop_na= TRUE) #this drops the NAs
iris %>%
  #only keep species and sepal length
  select(Species, Sepal.Length) %>%
  #make wider- species names now become columns
  #this doesn't make sense
  pivot_wider(names_from='Species',
              values_from= 'Sepal.Length') #not a unique identifier for every species.
#each column could be a species and the values could be a mean associated with them
#variables would be species and values would be means of sepal.lengths
iris %>%
  group_by(Species)%>%
  summarize(mean_sl= mean(Sepal.Length)) %>% #this works
  pivot_wider(names_from = 'Species', values_from= 'mean_sl')
cars <- read_csv('cars.csv')
cars
cars %>% pivot_longer(acura:ferrari, names_to = 'brand', values_to= 'country')
