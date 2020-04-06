##########################################################################################
########################## INTRODUCTION TO ggplot2 #######################################
##########################################################################################

### Your name: Paige Richards


# Load ggplot2 library
library(ggplot2)
# If you will be loading other optional libraries, do so on the next line(s). No other libraries are required for this lab/assignment.
library(tidyverse) #already installed
library(ggthemes) #Had to install this FIRST! and don't forget when installing to use 'quotes'


############################################
############## Exercise Set 1 ##############
############################################


################
# Question 1.1 #
################
ggplot(iris, aes(x=Petal.Length)) + 
  geom_histogram(color= "firebrick1",fill = "ivory", binwidth= 0.2) +
  labs( x= "Petal Length",
        y= "Count") +
  theme_solarized_2(light=FALSE) +
  ggtitle("Iris Petal Stuff")
#For some reason, it would not show up on the plot box on the right hand corner with the title unless I separated these two so the assignment is saved down below
ggplot(iris, aes(x=Petal.Length)) + 
  geom_histogram(color= "firebrick1",fill = "ivory", binwidth= 0.2) +
  labs( x= "Petal Length",
        y= "Count") +
  theme_solarized_2(light=FALSE) +
  ggtitle("Iris Petal Stuff") -> p ##assignment!
ggsave ("iris_petal_length_histogram.png", p)
#I made a histogram (do not say geom_histogram more than once because you will make multiple histograms)

############################################
############## Exercise Set 2 ##############
############################################


################
# Question 2.1 #
################
ggplot(iris, aes(x = Sepal.Length)) +
  geom_density(aes(fill = Species), alpha = 0.6)+
  labs( x= "Sepal Length",
        y= 'Density')
#Problem for problem 1 was that there was no aesthetic in front of fill so R thought we were trying to call species a color
#Also, when I figured this out when I tried to put quotes around species and it said that there was an unknown colour name of species

################
# Question 2.2 #
################
ggplot(iris, aes(x=Sepal.Length)) +
  geom_density(aes(fill=Species), alpha = 0.6) +
  labs(x= "Sepal Length",
       y= "Density")
#need to close parenthesis to prevent alpha being counted as a variable
################
# Question 2.3 #
################
ggplot(iris, aes(x=Petal.Length)) +
  geom_density(aes(fill=Species), alpha = 0.6) +
  theme_solarized(light=FALSE)+ 
  scale_fill_solarized('blue') +
  labs(x= "Petal Length",
       y = "Density") + 
  theme(legend.position = "left")

################
# Question 2.4 #
################
ggplot(iris, aes(x=Petal.Length)) +
  geom_density(aes(fill=Species), alpha = 0.6) +
  theme_solarized(light=FALSE)+ 
  scale_fill_solarized('blue') +
  labs(x= "Petal Length",
       y = "Density") -> my_plot

my_plot  + theme(legend.position = "bottom")

my_plot  +  theme(legend.position = "top")


################
# Question 2.5 #
################
my_plot + theme(legend.position = "top") +
  labs(fill= "Iris Species") #we called fill=species earlier so you can use labs to change fill to another name which changes the legend title


################
# Question 2.6 #
################

ggplot(iris, aes(x = Sepal.Length)) + 
  geom_density(aes(fill = Species), alpha = 0.6) +
  scale_fill_manual(values = c("blue", "pink", "yellow")) +
  labs(x="Sepal Length",
       y="Density")
#The problem with problem number 6 was that species is a fill and not a color.
#I tried another option by changing fill in the aes to color and leaving it as scale_fill_manual but that only changed the outline of the density plot which is not what you asked for.




############################################
############## Exercise Set 3 ##############
############################################




################
# Question 3.1 #
################
ggplot(iris, aes(y=Petal.Length, x=Species)) +  ## what's your x-axis variable? situation should fix itself when you tell R the variable, and then you don't need to specify with scale_x_discrete :)
  geom_boxplot(color= 'skyblue', aes(fill=Species)) +
  labs(x= "Iris Species",
       y= "Iris Petal Length (cm)") +
  scale_fill_manual(values=c('red', 'pink', 'orange')) +
  theme_classic()+
  ggtitle("Boxplot of iris species petal lengths")

################
# Question 3.2 #
################
ggplot(iris, aes(y=Petal.Length, x=Species)) +
  geom_violin(color= 'black',aes(fill=Species)) +
  labs(x= "Iris Species",
       y= "Iris Petal Length (cm)") +
  scale_fill_manual(values=c('orange', 'pink', 'red')) +
  theme_classic()+
  theme(legend.position='None')







############################################
############## Exercise Set 4 ##############
############################################




################
# Question 4.1 #
################
ggplot(iris, aes(x=Species, y= Petal.Length)) +
  geom_jitter(width= 0.2, color='deepskyblue', aes(fill=Species)) +
  labs(x= "Species",
       y= "Petal Length (cm)") +
  theme_classic()

################
# Question 4.2 #
################
ggplot(iris, aes(x=Species, y= Petal.Length)) +
  geom_jitter(width= 0.2, color='deepskyblue', aes(fill=Species), size=2) +
  labs(x= "Species",
       y= "Petal Length (cm)")+
  theme_classic()

ggplot(iris, aes(x=Species, y= Petal.Length)) +
  geom_jitter(width= 0.2, color='deepskyblue', aes(fill=Species), size=0.1) +
  labs(x= "Species",
       y= "Petal Length (cm)")+
  theme_classic()
#out of the two here, 0.1 is better but I honestly think they both are not good. I think that there should be a size in between like 0.5 to 1.

################
# Question 4.3 #
################
ggplot(iris, aes(x=Species, y= Petal.Length)) +
  geom_jitter(width= 0.2, aes(color=Species), size=0.6) +
  labs(x= "Species",
       y= "Petal Length (cm)")+
  theme_classic()

################
# Question 4.4 #
################
ggplot(iris, aes(x=Species, y= Petal.Length)) +
  geom_jitter(width= 0.2, aes(color=Species), size=0.6) +
  labs(x= "Species",
       y= "Petal Length (cm)")+
  theme_classic() +
  scale_color_manual(values=c('darkgreen','darkorchid2','mediumspringgreen'))

################
# Question 4.5 #
################
ggplot(iris, aes(x=Species, y= Petal.Length)) +
  geom_jitter(width= 0.2, aes(color=Species, shape=Species)) +
  labs(x= "Species",
       y= "Petal Length (cm)")+
  theme_classic() +
  scale_color_manual(values=c('darkgreen','darkorchid2','mediumspringgreen'))

################
# Bonus #
################
library(ggforce)
ggplot(iris, aes(x=Species, y=Petal.Width))+
  geom_sina(aes(color=Species), size=0.9) +
  theme_classic()+
  scale_color_manual(values=c('darkgreen','darkorchid2','blue'))+
  labs(x="Species",
       y="Petal Width")


############################################
############## Exercise Set 5 ##############
############################################


################
# Question 5.1 #
################
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))+
  geom_point(aes(color=Species)) +
  theme_classic() +
  labs(x="Sepal Width",
       y='Sepal Length')

################
# Question 5.2 #
################
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))+
  geom_point(aes(shape=Species)) +
  theme_classic() +
  labs(x="Sepal Width",
       y='Sepal Length')

################
# Question 5.3 #
################
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))+
  geom_point(aes(size=Species)) +
  theme_classic() +
  labs(x="Sepal Width",
       y='Sepal Length')
#I dont get an error message but a warning message from Rstudio: 
#"Warning message:
#Using size for a discrete variable is not advised."


## As a COMMENT below, answer: Which of the three scatterplots did you find most informative for viewing differences among species?
#I think the color was the best. The shape overlapped weird and the size was very hard to read! But I think a combination of color and shape is truly the best












