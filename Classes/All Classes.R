# Session 1-3 May 14-11 -------------------------------

print("Hello Class")

4+5
2*6

# Press Alt + - for keyboard shortcut for '<-'
x <- 4
y <- 5

x+y
 x * y
 # Note that I need to click on Run to execute the code. This is a comment
# Types of data:
# Numeric, Character, Logical (True, False, and missing), Factor (Levels)
 
# Data Structure:
# Vector, Matrix, Data Frame,
#magick::image_read("C:/Users/Sam/OneDrive - Carleton University/Documents/R/My_First_Graph.png")

 b <- 5
 B <- 1000
 b
 B
 
 # R is case sensitive so b is not equal to B
 
 # removing a variable
 rm(B)
 
 # I create a vector of numbers from 1 to 20
 z <- c(1:20)
 print(z)
 z
# what is the mean or average of z?
 mean(z)
# what is the standard deviation of z
 sd(z)
 ?median
 median(z)
?rnorm
 
 # creating graphics
 library(titanic)
 titanic <- titanic_train
 View(titanic)
 
 # to plot. To get help click on the name and hit F1
 plot(titanic)

 plot(titanic$Survived) 
 
 # to get a high quality graphs we are going to use ggplot
 # (stands for grammar of graphics)
 library(ggplot2)
 
 ggplot(data = titanic)
 
 ggplot(data = titanic) + 
   geom_bar(mapping = aes(x = Survived))
 
 # Let's change the color of bars to blue
 ggplot(data = titanic) + 
   geom_bar(mapping = aes(x = Survived), fill = "blue")
 
 # Let's make the bars narrower
 ggplot(data = titanic) + 
   geom_bar(mapping = aes(x = Survived), fill = "blue",
            width = 0.1)
 
 ggplot(data = titanic) + 
   geom_bar(mapping = aes(x = Survived), 
            fill = "blue", 
            color = "red",
            width = 0.1)
 
# to convert from numeric to factor
titanic$Survived <- as.factor(titanic$Survived)
 
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = Survived), 
           fill = "blue", 
           color = "red",
           width = 0.1)
 
# create a bar chart for sex
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = Sex), 
           fill = "blue", 
           color = "red",
           width = 0.1)

# How about adding the numbers to the chart
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = Survived), 
           fill = "blue", 
           color = "red",
           width = 0.1) + 
  geom_text(stat = "count", aes(x = Survived, label = stat(count), vjust = -0.5))

?geom_text

# add angle = 45 inside the aes of geom_text
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = Survived), 
           fill = "blue", 
           color = "red",
           width = 0.1) +
  geom_text(stat = "count", aes(x = Survived, 
                                label = stat(count), 
                                vjust = -0.5,
                                angle = 45))

# to change the y axis limits
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = Survived), 
           fill = "blue", 
           color = "red",
           width = 0.1) +
  geom_text(stat = "count", 
            aes(x = Survived, 
                label = stat(count), 
                vjust = -0.5,
                angle = 45)) +
  ylim(0,600)

 # let's change the background
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = Survived), 
           fill = "blue", 
           color = "red",
           width = 0.1) +
  geom_text(stat = "count", 
            aes(x = Survived, 
                label = stat(count), 
                vjust = -0.5,
                angle = 45)) +
  ylim(0,600) +
  theme_minimal()


# Use the Titanic data and create a bar plot for Pclass
# and add number of Obs to the bars,
# instead of BLUE use RED. (fill). Also align the number 65 degree
# and make sure that numbers are above the bars

ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = as.factor(Pclass)), 
           fill = "red",
           width = 0.1) +
  geom_text(stat = "count", 
            aes(x = Pclass, 
                label = stat(count), 
                vjust = -0.5,
                hjust = -0.5,
                angle = 65)) +
  ylim(0,600) +
  theme_minimal()

# add a title to the graph
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = as.factor(Survived)), 
           fill = "blue", 
           color = "red",
           width = 0.1) +
  geom_text(stat = "count", 
            aes(x = Survived, 
                label = stat(count), 
                vjust = -0.5,
                angle = 0)) +
  ylim(0,600) +
  theme_minimal() + 
  ggtitle("Number of Survivors vs Deceased")

# another solution (Prof's Solution)
ggplot(data = titanic) + 
  geom_bar(mapping = aes(x = Survived), 
           fill = "blue", 
           color = "red",
           width = 0.1) +
  geom_text(stat = "count", aes(x = Survived, label = stat(count), 
                vjust = -0.5,
                angle = 0)) +
  ylim(0,600) + labs(title = "New title goes here",
                     caption = "We get the data from Titanic package") +
  xlab("Survived or Not: That is the question") + 
  ylab("Number of people")

# how to save the graph?
ggsave("My_First_Graph.png")

# where did it save?
# we have a working directory
getwd()

# changing the working directory to some place that I know :)
setwd("C:/Users/Sam/OneDrive - Carleton University/Documents/R")

# Session 4 May 16 -------------------------------

# let's read a file located in our computer (working directory)
insurance <- read.csv("~/R/Assignment 1/insurance.csv")

#   ./  means working directory
insurance <- read.csv("./Assignment 1/insurance.csv")

# Get back to Titanic data

# Gender Based Analysis: Any difference between Male and Female?

# instead of coloring everything Blue we fill everything based on gender by adding FILL = SEX

library(titanic)
titanic <- titanic_train
titanic$Survived <- as.factor(titanic$Survived)

ggplot(data = titanic) +
  geom_bar(aes(x = Survived, fill = Sex), width = 0.1) +
  geom_text(stat = "count",
            aes(x = Survived, label = stat(count)),
            vjust = -0.8) +
  theme_classic()

# Same code just change x and fill
ggplot(data = titanic) +
  geom_bar(aes(fill = Survived, x = Sex), width = 0.1) +
  geom_text(stat = "count",
            aes(x = Sex, label = stat(count)),
            vjust = -0.8) +
  theme_classic()

#Let's put bars next to each othger instead of stacking
ggplot(data = titanic) +
  geom_bar(aes(x = Survived, fill = Sex), 
           width = 0.8,
           position = position_dodge()) +
  geom_text(stat = "count",
            aes(x = Survived, label = stat(count)),
            vjust = -0.8) +
  theme_classic()

# we have 2 numbers in the above but we should have 4 numbers, one for each bar
ggplot(data = titanic, aes(x = Survived, fill = Sex)) +
  geom_bar(position = position_dodge()) +
  geom_text(
    stat = "count",
    aes(label = stat(count)),
    vjust = -0.8,
    position = position_dodge(width = 0.8)) + # adding this line forces R to add 4 numbers
  theme_classic()

# Survival by Passenger Class? We change x = Survived and fill = Pclass
titanic$Pclass <- as.factor(titanic$Pclass)
ggplot(data = titanic, aes(x = Survived, fill = Pclass)) +
  geom_bar(position = position_dodge()) +
  geom_text(
    stat = "count",
    aes(label = stat(count)),
    vjust = -0.8,
    position = position_dodge(width = 0.8)) +
  theme_classic()

# or
ggplot(data = titanic, aes(x = Survived, fill = Pclass)) +
  geom_bar() +
  geom_text(stat = "count",
            aes(label = stat(count)),
            vjust = -0.8,
            position = position_stack(vjust = 0.5)) +
  theme_classic()

# changing the orientetion of the plot
ggplot(data = titanic, aes(x = Survived, fill = Pclass)) +
  geom_bar() +
  geom_text(stat = "count",
            aes(label = stat(count)),
            vjust = -0.8,
            position = position_stack(vjust = 0.5)) +
  theme_classic() +
  coord_flip() # this changes the direction of plot

ggplot(data = titanic, aes(fill = Survived, x = Pclass)) +
  geom_bar() +
  geom_text(stat = "count",
            aes(label = stat(count)),
            vjust = -0.8,
            position = position_stack(vjust = 0.5)) +
  theme_classic() +
  coord_polar()

# survivor by age? Age is continuous
ggplot(data = titanic, aes(x = Age, fill = Survived)) +
  geom_histogram()

# Prof's solution.
ggplot(titanic, aes(x=Age)) + geom_density()

# add some color to the graph
ggplot(titanic, aes(x=Age, fill = 'gold')) + geom_density() # does not work because gold is not in the dataset
# we have to remove and put it outside the aes

ggplot(titanic, aes(x=Age)) + geom_density(fill = 'gold')

# Survived by age?
# because we have Survived in the dataset we add it inside the aes()
ggplot(data = titanic, aes(x = Age, fill = Survived)) + 
  geom_histogram()

# lets change it to density
ggplot(data = titanic, aes(x = Age, fill = Survived)) + 
  geom_density()

# we make that transparent, using the alpha = 0.8 (any number here)
ggplot(data = titanic, aes(x = Age, fill = Survived)) + 
  geom_density(alpha = 0.8)

# lets make it more transparent
ggplot(data = titanic, aes(x = Age, fill = Survived)) + 
  geom_density(alpha = 0.5) # it is called opacity in many packages

# let's create a BoxPlot
ggplot(data = titanic, aes(x = Survived, y = Age)) +
  geom_boxplot()

# color the boxes based on gender to see the differences. we add it inside the aes because Sex is in our dataset.
ggplot(data = titanic, aes(x = Survived, y = Age, fill = Sex)) +
  geom_boxplot()

# Let's create plots based on Sex and Passenger class
titanic$Sex <- as.factor(titanic$Sex)
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass)

# Survival by Age, Sex, Pclass (in the above example we did not have Age)
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass + Sex)

# we can make it simpler to read the graph
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  geom_density() +
  facet_grid(Pclass ~ Sex)

# session 5 May 18 --------
# (type four dashes to create a section)
# Economic 
library(ggplot2)
eco <- economics

plot(eco$date, eco$pce)

# Create a geom_line() with ggplot, change theme to theme_minimal(), any color

ggplot(eco, aes(date,pce)) +
  geom_line(color = 'blue') +
  theme_minimal()

#prof's answer
ggplot(eco, aes(x = date, y = pce)) +
  geom_line(size = 0.5, color = "#112446") +
  theme_minimal()

# let's use the mtcars that we used din the R Notebook examaple
# FYI type two colons after a library to see all it's functions in a dropdown
# E.g., ggplot2::

mtcars <- mtcars
mtcars$cyl <- as.factor(mtcars$cyl)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# let's add color based on cyl
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl))

# let's add shape based on cyl as well
mtcars$cyl <- as.factor(mtcars$cyl)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl, shape = cyl))

# let's add trendline
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = cyl, shape = cyl)) +
  geom_smooth(method = lm, aes(color = cyl), se = FALSE)

# adding labels to the points
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  geom_text(aes(label = rownames(mtcars)))

# to solve the overlap.
library(ggrepel)

ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_text_repel() +
  geom_point(color = 'red') +
  theme_classic(base_size = 16)

ggplot(mtcars, aes(wt,mpg))+
  geom_text_repel()+
  geom_point(color="red")+
  theme_classic(base_size = 16)


# let's read some data into R from Excel
# using code
library(readxl)
df <- read_excel("D:/R/jitter_example.xlsx")

ggplot(data = df, aes(x, y)) +
  geom_point(size = 3) +
  geom_jitter(size = 3)

# another example using Diamonds data.
ggplot(diamonds, aes(x = cut, y = color, color = cut)) + geom_point()

# jitter is used to show stacked data
ggplot(diamonds, aes(x = cut, y = color, color = cut)) + geom_point() +
  geom_jitter()

# let's see a very informative plot
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = cut, y = color))

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

# a new package for plots
library(plotly) # this created interactive graphs

fig1 <- plot_ly(
  data = iris,
  x = ~ Sepal.Length,
  y = ~ Petal.Length,
  color = ~ Species)

fig1 # select only one of the three species by clicking on it

fig2 <- plot_ly(
  mtcars,
  x = ~ wt,
  y = ~ hp,
  z = ~ qsec,
  color = ~ am,
  colors = c('#BF382A','#0C4B8E'))
fig2

# Google R Graph Gallery for cool plots



#  Data Wrangling ---------------------------------------------------------

# let's learn how to get the data, clean the data, do some calculations, ...
# then create graphs


data1 <- c(4, 2) # this is a vector
# c() combines numbers into a vector

data2 <- c("True", "False") # this is a vector. no difference between " and '

# I want to combine the above 2 vectors

data3 <- cbind(data1, data2)

# but I want to have data.frame

data4 <- data.frame(data1, data2)

data4

# data types
magick::image_read("D:/R/course/Data_Types.jpg")

# part2 ----
class(data4)

View(data4)


class(data3)

# to see the structure of the data
str(data4)

# What is an R package? see the list of packages
# some example of R packages.

# data frame -----
mydata <- ggplot2::diamonds

# we want to examine the data

head(mydata) # this will show 6 rows as default
head(mydata, 1) # this shows only the first row of data

# to see the last rows
tail(mydata)

# to see the dimension of the data
dim(mydata)

str(mydata)

summary(mydata)

# selecting specific row of data
# say the first row and second column?

mydata[1,2]

# [row, column]
# numbering starts at 1, unlike most programming languages


# I want to see the first row
mydata[1, ] # here the column is empty so it will show all columns

# see column 10
mydata[ ,10]

# Let's see from column 3 to 6 and row 5
mydata[5,3-6] # this is incorrect
# If we do this it means that we ask R to exclude column 3, because 3 - 6= -3

mydata[5,3:6] # the correct answer

# this is called indexing
# select column 7
mydata[ , 7]

# we also can use the names instead of the column numbers. let's choose price
mydata["price"]

# another approach using $
mydata$price
prices <- mydata$price

# let's see row 5 column 9
mydata[5, 9]

# filter data or subset data
# I am interested to see diamonds with a price higher than $1800

# ?subset or F1

?subset
subset(mydata, price > 1800)

# let's see all the diamonds with a price less than 350 and also the color E

subset(mydata, price < 350 & color == "E")

# why did we use == instead of = in above conditions?

2 = 2
#   <-   =  are the symbols of assignment

2 == 2

mydata$color == "E"

2 == 3

# mydata$color == "E" actually means TRUE or FALSE

# Google r + operators  !=  means not equal to

# diamonds with a color other than E
subset(mydata, color != "E")

# to see diamonds with a color either E or H
subset(mydata, color == "E" | color == "H")

# to create a new column based on existing data
# 13% tax will be added to the price. I want to create a column for tax

mydata$tax <- mydata$price * 0.13

# let's assume that I do not want to keep tax in the data

mydata$tax <- NULL

# Read data from other files ------
# Annual GDP growth rate of countries
library("readr")
GDP <- read_csv("C:/Users/Sam/OneDrive - Carleton University/Documents/R/GDP_World.csv")
# imports data as a tibble. (faster)

# read.csv() imports data as a dataframe. (slower)

# setting the working directory
setwd("C:/Users/Sam/OneDrive - Carleton University/Documents/R/")

GDP <- read.csv("./GDP_World.csv") # do not use read_csv() to keep the name of columns
# the same that prof has in the code

str(GDP)

# a new package to examine the data fast
library(skimr)
skimr::skim(GDP)
# because we loaded the package skimr we do not need to use skimr:: in the beginning
skim(GDP) # will work as well

# save the data as a csv
write_csv(GDP, "MY_New_Dataset.csv")

# it saved in the working directory. Where is my working directory?
getwd()

######  May 25 ------
# save the data as RDS, i.e. R Data Format
saveRDS(GDP, "My_first_RDS_data.rds")

#let's read the saved rds file and call it z
z <- readRDS("./My_first_RDS_data.rds")

# let's make sure that z and GDP are the same
all.equal(z, GDP)

# we have a data file called "TMP_suiicide.csv" located here D:/data
# but our working directory is D:/R so how do we go one level up?

# ../ to go one level up
suicide <- read.csv("../data/TSMP_suicide.csv")

# but if I do not use .. what will happen
suicide <- read.csv("~/data/TSMP_suicide.csv")

# let's go back to GDP and see only Canada manually in the view tab
# Subset using TidyVerse. What is Tidyverse?
library(tidyverse)

# for list of packages inside it see below

# https://cran.r-project.org/web/packages/tidyverse/

# let's go back to GDP and see only Canada using a function called filter()
filter(GDP, Country.Name == "Canada")

# Important!!! filter() is used to select some ROWs according to some conditions
magick::image_read("D:/R/Course/filter.jpg")
# Subset that we used before gives the same result
CAN2 <- subset (GDP, Country.Name == "Canada")

all.equal(CAN, CAN2)

# let's use %>% we call it pipe. Ctrl + Shift + M will add %>%
# write code the same way that you speak! Take GDP then Filter ,,,, then show

GDP %>% filter(Country.Name == "Canada") %>% view()

### an easier way to create Visualization
library(esquisse)

# use the mtcars data
mtcars <- mtcars
esquisser()

# Why do we use pipe
# let's use the data for flights from NY in 2013

flights <- nycflights13::flights
# l;et's explore the data types in this DF. It is tibble

# let's filter for destination AUS
# then calculate and add a new column for speed (use mutate)
# next only keep (year, month, day, dep_time, carrier, flight, speed)
# Finally sort or arrange them according to speed.

# approach 1

flights1 <- filter(flights, dest == "AUS")
# cartoon from hereto show mutate: https://allisonhorst.com/r-packages-functions
magick::image_read("D:/R/Course/mutate.jpg")

flights2 <- mutate(flights1, speed = (distance / air_time) * 60)
flights3 <- select(flights2, year, month, day, dep_time, carrier, flight, speed)
# to select all the columns between year and day we could also type year:day in above code
flights4 <- arrange(flights3, desc(speed))

# approach 2

New_flights <- arrange(select(
  mutate(filter(flights,
                dest == "AUS"),
         speed = distance / air_time * 60),
  year:day,
  dep_time,
  carrier,
  flight,
  speed
),
desc(speed))

# approach 3 using pipe which is the best approach

flights_piped <- flights %>% 
  filter(dest == "AUS") %>% 
  mutate(speed = (distance / air_time) * 60) %>% 
  select(year, month, day, dep_time, carrier, flight, speed) %>% 
  arrange(desc(speed))
  
all.equal(flights4, flights_piped) # the 2 datasets are exactly the same

# a graphic explanation of pipe
magick::image_read("D:/R/Course/pipe.jpg")

# let's go back to GDP data
# we want only north american countries with high income levels

High.Income.NorthAm <- GDP %>% filter(IncomeGroup == "High income" &
                                        Region == "North America")

# only South Asian and East Asia and PAcific countries

GDP.Asia <- GDP %>% filter(Region == "South Asia" &
                             Region == "East Asia & Pacific")

GDP.Asia <- GDP %>% filter(Region == "South Asia" |
                             Region == "East Asia & Pacific")

# if we had multiple values for Region this code would be very ugly
# so the following is better
GDP.Asia <- GDP %>% filter(Region == c("South Asia", "East Asia & Pacific")) # this is incorrect

# correct approach
GDP.Asia <- GDP %>% filter(Region %in% c("South Asia", "East Asia & Pacific")) # this is correct

# keep only rows for "Latin America & Caribbean" and NOT high income
Latin.NotHigh.Income <- GDP %>% 
  filter(Region == "Latin America & Caribbean" &
           IncomeGroup != "High income")

# Latin america and Caribbean countries with a growth rate equal or more than 5% in 2020
Latin.Min.GrowthRate <- GDP %>% 
  filter(Region == "Latin America & Caribbean" &
           2020 >= 5)

# What if we want to keep only more recent years of data?
# Try only year 2020
gdp2020 <- GDP %>% select(X2020)


######  May 30 ------
library(tidyverse)
GDP <- read.csv("./GDP_World.csv")

# again how to use pipe ?? 2 examples
# take GDP and filter x2020 greater than 5, using pipe and without using it.

GDP <- read.csv("./GDP_World.csv")

GDP %>% filter(X2020 > 5)
filter(GDP, X2020 > 5)

# the same for select()
GDP %>% select(X2020)
select(GDP, X2020)

# using ViewPipeSteps addins
library(ViewPipeSteps)

GDP %>% filter(Region == "Latin America & Caribbean") %>% 
  filter(IncomeGroup == "Upper middle income") %>% 
  filter(X2020 < -10)
# Note: pipe needs to be at the end of each line

# add more indicators

gdp.some.Vars <- GDP %>% select(Country.Code, Indicator.Name, Region, IncomeGroup, X2010:X2016)

# remember that SELECT() works for Columns unlike filter(), which was for rows
# 
# what if we want to change the order of variables in data, e.g. we want to have
# Region first and IncomeGroup the second columns

region.first <- gdp.some.Vars %>% select(c(Region, IncomeGroup, everything()))

region.first <- gdp.some.Vars %>% select(Region, IncomeGroup, everything()) # the same with or without c

# for example in GDP we do not want to have region
# Sometimes it is easier to NOT SELECT a few columns and keep the rest

No.Region.Code <- GDP %>% select(!c(Region, Country.Code))

# instead of ! we could use - as well
z1 <- GDP %>% select(-c(Region, Country.Code))

all.equal(z1, No.Region.Code)

# Bonus from Peter Jakobsen
not <- function(x) { !x }
z1 <- GDP %>% select(c(Region, Country.Code))

# naming the variables
# Camel cases, Snake case, kebab case

# what are the names of the columns?
names(gdp.some.Vars)

# Calculate the average growth rate from 2015 to 2016 and add it to the dataset

gdp.some.Vars <- gdp.some.Vars %>% mutate(average = (X2015 + X2016) / 2)
# we have to assign it to the same name if we want to keep it and include that in dataset
# or

gdp.some.Vars$Average1 <- ((gdp.some.Vars$X2015 + gdp.some.Vars$X2016) / 2)

# another point in using select

q <- GDP %>% select(starts_with("X"))

# another example
only.cols <- gdp.some.Vars %>% select(Country.Code, starts_with("X20"))

# using apply function just FYI
only.cols$tot <- 
  apply(only.cols %>% select(!c(Country.Code)), FUN = sum, MARGIN = 1)

# what was the average growth rate of world in 2020?
mean(GDP$X2020)

# what is the problem?
is.na(GDP$X2020)

# now that we know there are some NAs, we want to know how many are there?
sum(is.na(GDP$X2020))

mean(GDP$X2020, na.rm = TRUE)

# select(ends_with("xyz"))
# select(where(is.numeric))

# clean the
library(janitor)
GDP %>% janitor::clean_names()

GDP <- GDP %>% clean_names() # this will work because we have already loaded the janitor package

# Let's read some data from internet and create some graphs

data.from.internet <- 
  read.csv(
    "https://raw.githubusercontent.com/plotly/datasets/master/flightdata.csv",
    stringsAsFactors = FALSE
  )

# Plot the data using Plotly not GGPLOT
library(plotly)

# 2 different methods to create interactive plots
plot1 <- ggplot(data.from.internet, aes(y = carrier, x = dest, colour = dest)) +
  geom_count(alpha = 0.9) +
  labs(title = "Flights from New York to major domestic destinations",
       x = "Origin and destination",
       y = "Airline")
plot1

# to make it more interactive
ggplotly(plot1)

# the second approach is using plotly itself

plot_ly(data.from.internet,
        x = ~dest,
        y = ~carrier,
        color = ~dest) # creates a heatmap

plot_ly(data.from.internet,
        x = ~dest,
        y = ~carrier,
        color = ~dest,
        type = "scatter")

# another graph to see the relationships between pairs of variables
library(GGally)
pm <- GGally::ggpairs(iris, aes(color = Species))
pm

# or
ggplotly(pm)

# to put several plots next to eachother use gridExtra or Patchworks
# example

p1 <- ggplot(mtcars) +
  geom_point(aes(mpg, disp)) +
  ggtitle('First Plot')

p2 <- ggplot(mtcars) +
  geom_boxplot(aes(gear, disp, group = gear)) +
  ggtitle('Second Plot')

gridExtra::grid.arrange(p1, p2, ncol = 2)

gridExtra::grid.arrange(p1, p2, ncol = 1)

# google patchworks yourself
library(patchwork)

p1 + p2

p1 / p2

p1 | (p1 / p2)


##  June 1 ------

# group_by()
# let's see how we can group data and use Diamonds data that we have seen before

diamond <- ggplot2::diamonds
View(diamond)

# we have multiple obs for each CUT.
# what is the average price for diamonds based on their cut? Are they linearly linked?

diamond %>% group_by(cut) # prepares the data for next step so we do not see any change

diamond %>% group_by(cut) %>% summarise(average.price = mean(price))
# it seems that the link between cut and average price is not linear!

# how about average price based on color?
diamond %>% group_by(color) %>% summarise(average.price = mean(price))

# it seems that the average price increase based on color as we move from D to J
# how about the average price based on CUT and COLOR at the same time

diamond %>% group_by(cut, color) %>% summarise(av.price.cut.color = mean(price))

# if you want to see all 35 cases, you can use many options including the below
cut.colr.pric <- diamond %>% group_by(cut, color) %>% summarise(av.price.cut.color = mean(price))
View(cut.colr.pric)

diamond %>% group_by(cut, color) %>% summarise(av.price.cut.color = mean(price)) %>% View()

# plot the average price based on cut and color

ggplot(cut.colr.pric, aes(cut, color, size = av.price.cut.color)) +
  geom_point(shape = 18)

# we could use pipe

diamond %>% group_by(cut, color) %>% summarise(av.price.cut.color = mean(price)) %>% 
  ggplot(cut.colr.pric, aes(cut, color, size = av.price.cut.color)) +
  geom_point(shape = 18) # will fail because we already passed a dataframe through the pipe

diamond %>% group_by(cut, color) %>% summarise(av.price.cut.color = mean(price)) %>% 
  ggplot(aes(cut, color, size = av.price.cut.color)) +
  geom_point(shape = 18)

# group_by is similar to pivot tables in excel
diamond %>% group_by(cut) %>% 
  summarise(n = n()) #n() is the count function

library(clipr)

clipr::write_clip(diamond) # copy and paste, this line of code is exactly ctrl+c in computer
# copies the dataframe onto your clipboard so you can paste into excel

#
#
#
#
# He recommends that we google power query in excel
# 
# 
# 

# how to import Excel data files into R
wdi <- readxl::read_excel("D:/R/Data_Extract_From_WDI.xlsx") # incorrect sheet is importes

wdi <- readxl::read_excel("../data/Data_Extract_From_WDI.xlsx", sheet = "Data", skip = 3)

# names are not that good let's clean them
wdi <- janitor::clean_names(wdi)

# let's see data again. Names are ok but Missing values are shown as '' which is not useful
# (data are shown as character!)

# let's convert to numeric all the columns except the names.
wdi$x1960_yr <- as.numeric(wdi$x1960_yr1960)
wdi$x1961_yr <- as.numeric(wdi$x1961_yr1961)

# we need to repeat this for all years so 66 times in total :)
# let's google: tidyverse convert multiple columns to numeric
wdi <- wdi %>% mutate(across("x1960_yr1960":"x2021_yr2021", as.numeric))

# the below code willl only keep years and drops the names!
z <- wdi %>% select(starts_with("x")) %>% mutate_if(is.character,as.numeric)

# this solves the character problem but it drops all the names so not that usefu; :(

# the dataset now shows all the numbers in scientific format.
# scientific numbers are confusing !! so let's get rid of them

options(scipen = 999)

# this includes many indicators for each country. Let's examine GDP per capita (constant 2015 US$).
# what do we need to do?

Per.capita.gdp <- wdi %>% filter(series_name == "GDP per capita (constant 2015 US$)")
View(Per.capita.gdp)

# how many observations?use a function

dim(Per.capita.gdp)

library(psych)

# to get some info about the data fast and easy
perCapGDP.descr <- psych::describe(Per.capita.gdp)

perCapGDP.descr <- psych::describe(Per.capita.gdp) %>% as.data.frame()
# just to know that we can convert it to data.frame


View(perCapGDP.descr)

# psych::describeBy()

# Honestly I'm grateful you're showing us all the most useful R packages, 
# because there are so many I feel like a lot of them would get buried learning 
# on your own

##   June 6th ------------------

library(tidyverse)

# StatCanR to access data from Statistics Canada
library(statcanR)

statcan_search(c("GDP", "province"), "eng")

Data.from.StatCan <- statcan_download_data("3610040202", "eng")
# or can goolge for GDP province statcan and use teh table number from there

# explore the downloaded data. Next focus on CHAINED dollar values for ALL IDUSTRIES.

province.gdp <- 
  Data.from.StatCan %>% filter(
    Value == "Chained (2012) dollars" &
      `North American Industry Classification System (NAICS)` == "All industries [T001]"
  )

# how do I know what to type for each filter condition?

unique(Data.from.StatCan$Value)
unique(Data.from.StatCan$`North American Industry Classification System (NAICS)`)

# explore meaning of some variables such as dguid
# some columns are not needed.
province.gdp <- province.gdp %>% select(c(REF_DATE, GEO, VALUE))

# Do we need to keep month and day in REF_DATE?
province.gdp$Year <- substr(province.gdp$REF_DATE, 1, 4)

# let's drop ref_date  HOW????

province.gdp$REF_DATE <- NULL
rm() # this is not going to work

# I also could have used Select()
########################################
# but usually we want to see the Year as columns (known as a WIDE data)
magick::image_read("./long_wide.png.png")

# https://tavareshugo.github.io/r-intro-tidyverse-gapminder/09-reshaping/index.html

# let's reshape the data from long to wide format

province.gdp.wide <- province.gdp %>% 
  pivot_wider(names_from = Year, values_from = VALUE)

# R does not like a name that starts with a number!
province.gdp.wide <- province.gdp %>% 
  pivot_wider(names_from = Year, values_from = VALUE, names_prefix = "year_")

# OR province.gdp.wide %>% janitor::clean_names()

# Why do we want a long format for?
# Can we plot the data and color them differently for P/Ts?
# This is much easier to do using LONG data set
province.gdp %>% ggplot() + geom_point(aes(Year,
                                           VALUE,
                                           color = GEO),
                                       size = 5)

# let's see how many years of observation we have? What is the average GDP?
# and also what is the standard deviation of gdp at P/Ts?

stats.PT <- province.gdp %>% group_by(GEO) %>% 
  summarise(
    number.of.years = n(),
    average = mean(VALUE),
    SD = sd(VALUE)
  )

# if you have outlines in your data you should use median not the mean!

# maybe would have been better to change the name from VALUE to GDP. How?
province.gdp <- province.gdp %>% rename(PT.GDP = VALUE)

# there is another function called pivot_longer() that
# converts a wide dataset to a longer one
? pivot_longer()

province.gdp.Wide %>% pivot_longer(!GEO, names_to = "New_column",
                                   values_to = "GDP.Values"
                                   )
# another example of group_by using the flights data
# Does delay increase with distance? We have on origin and for each dest we have
# multiple flights so we need to summarize using group_by
flights <- nycflights13::flights


delay.df <- group_by(flights, dest) %>% summarise(
  count = n(),
  dist = mean(distance, na.rm = TRUE),
  delay = mean(arr_delay, na.rm = TRUE)
)

# some of the cases have very low number of occurrence so we drop them
delay.df <- delay.df %>% filter( count > 20)

# or  filter(delay.df,  count > 20)
ggplot(delay.df, aes(x = dist, y = delay))+
  geom_point() +
  geom_smooth()

# difficult to see where the relationship changes. make it interactive
plot1 <-  ggplot(delay.df, aes(x = dist, y = delay))+
  geom_point() +
  geom_smooth() 

library(plotly)
ggplotly(plot1)


# It looks like delays increase with distance up to ~650 miles
# and then decrease. Maybe as flights get longer there's more
# ability to make up delays in the air?

ggplot(data = delay.df, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1 / 3) +
  geom_smooth(se = FALSE)

# rewrite the above code using pipes
flights %>% group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = T), # T or TRUE are the same
    delay = mean(arr_delay, na.rm = T)
  ) %>%
  filter(count > 20) %>%
  ggplot(mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1 / 3) +
  geom_smooth(se = F)  # F and FALSE are the same

# sometimes it is better to break the code into several steps to prevent mistakes.
# For example, how many different airplanes (different tailnum) have been used by DL?

only.DL <-  flights %>% filter(carrier == "DL")
only.DL.Tail <-  only.DL %>% select(tailnum)
DL.number.Tail <- only.DL.Tail %>% unique() %>% length() # this is not working teh way that we want
DL.number.Tail <- only.DL.Tail %>% unique()
length(DL.number.Tail) # this is not useful in this format

nrow(DL.number.Tail)
count(DL.number.Tail)
length(DL.number.Tail$tailnum)
unique(DL.number.Tail$tailnum) # provides teh list of unique values

n_distinct(DL.number.Tail$tailnum) 

######
# creating new categorical variable called Long Haul
# using the same logic as Excel

flights$long.haul <- if_else(flights$distance > 4800, 
                             "long_haul", "Not_long_haul")

# case_when() also can be used for the same purpose. 

flights <- flights %>% filter(!is.na(distance)) %>% # removing canceled flights
  mutate(flihgt_group = case_when(
    distance <= 1500 ~ "Short" , 
    distance <=4800 ~ "Medium" ,
    distance > 4800 ~ "Long" ))

# to check
unique(flights$flihgt_group)

# how many flights were short? medium? long?

table(flights$flihgt_group)

# you also could use cut() for that purpose, google


##   June 8th ------------------
library(tidyverse)
# a few points to remember ----
# missing values

w <- c(1, 2, 3, NA, 5)

mean(w)

# na.rm = TRUE option can be used in most functions

# visually see missing data
titanic <- titanic::titanic_train

Amelia::missmap(titanic, col = c('yellow', 'black'))

# Can we do a calculations for all numeric variables at once? google that

flights <- nycflights13::flights

mean.median.flight1 <- flights %>% summarise_if(is.numeric,
                                                funs(n(),
                                                     mean (., na.rm = T),
                                                     median (., na.rm = T)))

# tidy data

# Merging 2 data sets -------
# read Excel files merge1 and merge2

magick::image_read("../data/merge.jpg")
magick::image_read("../data/merge2.jpg")

# graph for different types of join
# https://
# https://

file1 <- readxl::read_excel("~/R/data/merge1.xlsx")
file2 <- readxl::read_excel("~/R/data/merge2.xlsx")

# i want to merge or join file1 and file2 together
joined_left <- file1 %>% left_join(file2, by = "Country")

joined_left2 <- file2 %>% left_join(file1, by = "Country")

# IF DIFFERENT COLUMN NAMES
joined_left2 <- file2 %>% left_join(file1, by = c("Country" = "COUNTRY"))

# what if the common key between 2 data set have different names? google

# country in the first file and COUNTRY in the other file

# if you want to use BASE R you can use merge() instead of joins

# haven package is used to import different types of data such as SAS, Stata, etc

# new pipe |>

# table()

table(diamonds$cut, diamonds$color) # cross tabulation

psych::describeBy(diamonds, group = "cut")

# write your own functions :)

y <- x + 10

# 1 + 10
# 2 + 10
# 3 + 10 .....

my.first.function <- function(x) {
  y <- x + 10
  y
}

# how am I going to use that function?
my.first.function(1)

my.first.function(25)

# WDI-------------------------------------
library(WDI)

wdi <- WDI(
  country = c("US", "CAN"),
  indicator = "NY.GDP.PCAP.KD",
  start = 2016,
  end = 2020,
  language = "en"
)

# what type of data format is this?

#-----------------------------------------------------------------------

# another examples using WDI
# https://worldpoliticsdatalab.org/tutorials/data-wrangling-and-graphing-world-bank-data-in-r-with-the-wdi-package/
# http://svmiller.com/blog/2021/02/gank-world-bank-data-with-wdi-in-r/

# this is a long format and you might need to convert it to wide data

# an empirical example
# https://lab.rady.ucsd.edu/sawtooth/RAnalytics/visualization.html


# vtree package, prof had never heard of it but peter used it in his assignment 2

## Regression in R -------------
# June 8th

# Machine learning: Supervised and unsupervised

# https://

# https://devopedia.org/supervised-vs-unsupervised-learning

magick::image_read("")

# in more details
magick::image_read("")

# Linear regression
# Heiss Ch. 2

library(wooldridge)

# read data on CEO's salary (ceosa12) from wooldridge's package and name it CEO

ceo <- wooldridge::ceosal1

# names of columns?
names(ceo)

log(ceo$salary)

# explore the data
skimr::skim(ceo)

# Let's estimate the relationship between rate of return and the salary of CEOs

ceo %>% ggplot(aes(salary, roe)) +
  geom_point() # outliers in salary, let's limit that to 3000. HOW?

ceo <- ceo %>% filter(salary <= 3000)

ceo %>% ggplot(aes(salary, roe)) +
  geom_point()

# add a trend line to the plot
ceo %>% ggplot(aes(salary, roe)) +
  geom_point() +
  geom_smooth()

# it is not linear!
ceo %>% ggplot(aes(salary, roe)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) # this fits a linear model

# is it possible to have a better line? For example the red line or green one?
ceo %>% ggplot(aes(salary, roe)) +
  geom_point() +
  geom_smooth(method = "lm", se = F) +
  geom_abline(intercept = 5, slope = 0.005,  color = "red" , size = 1) +
  geom_abline(intercept = 0, slope = 0.01, color = "green", size = 2)

# which line to choose? Ordinary least squares (OLS)
magick::image_read("../data/ols.jpg")

# linear Regression in R

model1 <- lm(salary ~ roe, data = ceo) # salary is dependent variable and roe is independent

# to see the results of the estimation
summary(model1)
# results show that if the roe increase by 1 unit, the salary increase by 15.0802 units.

## June 13 #######################
library(tidyverse)

# I want to get the coefficients
model1$coefficients

# To get the coefficient of roe

model1$coefficients["roe"]

# least square or absolute approaches; google that

### Monte Carlo Simulation example ----

# section 4.5 of hanck et al had another very good example of simulation here:
# https;//www.econometrics-with-r.org/4.5-tsdotoe.html

# Pollution and house price in Boston 1970 census -------------------------------

# https://rpubs.com/ezrasote/housepricing

library(mlbench)

data("BostonHousing")

df <- BostonHousing

str(df)

summary(df)

# missing data in the df?
Amelia::missmap(df, col=c('yellow', 'black'))

# high correlation?
cor(df)
cor(select(df, -chas)) # have to remove chas because it is not a number. It is a factor.

corrplot::corrplot(cor(select(df, -chas))) # ggpairs()

# regression Boston ------
# how median value of owner-occupied home is related to Crime, Average number of rooms,
# Property tax, Percentage of lower status of the population

# see https://rpubs.com/ezrasote/housepricing     for more in case interested :)

model.boston <- lm(medv ~ crim + rm + tax + lstat, data = df)

summary(model.boston)

summary(model.boston) %>% broom::tidy()

# if you want to round the numbers
summary(model.boston) %>% broom::tidy() %>% mutate_if(is.numeric, round, 3)

# see section 6.2 of Hanck et al for a very good graphic representation

##### Logistic regression Ch. 11 Hanck et al --------
# load 'AER' package and attach the HDMA (Home Mortgage Disclosure Act Data)
library(AER)

data(HMDA)

mortgage <- HMDA
summary(mortgage)

?HMDA

# Estimate a linear model, deny based on single high school pirat

lm(deny ~ single + hschool + pirat, data = mortgage) # not correct

# I want to use linear model here

# convert 'deny' to numeric to be able to estimate linear model
mortgage$deny <- as.numeric(mortgage$deny) -1

model.hmda.linear <- lm(deny ~ single + hschool + pirat, data = mortgage)

summary(model.hmda.linear) %>% broom::tidy()

# June 15 --------------------

unique(mortgage$single)
# here singleyes is called the base level

# let's see how deny and pirat are linked!

ggplot(mortgage, aes(pirat, deny)) +
  geom_point() +
  geom_smooth(method = lm)

# why logistic regression?
magick::image_read("../data/logistic.jpg")

# model mortgage application denial

model.logit <- glm(deny ~ single + hschool + pirat, data = mortgage, 
                   family = "binomial")

?glm

summary(model.logit)

# the estimated coefficients show the log odds, to get the Odds Ratio:
exp(model.logit$coefficients)

# the results can be used to estimate the Predicted Portability of different cases

# usually if the predicted probability < 0.5 we call it NO (0) and
# if the predicted probability >= 0.5 we call it YES (1)

# Lots of usage in Machine Learning (Classification)

# to get the confusion matrix

library(regclass)

confusion_matrix(model.logit)

# using the diagonal values we can calculate the accuracy rate of the model

# False negative, False positive, True +tive and True -tive
# https://rylewww.medium.com/precision-recall-f-1-score-1e75341b0217

# accuracy rate = (2088 + 12) / 2380 = 0.88


    # prof said "Best of the best in the group is F1-score" - good to know 
    # in general but probably doesn't matter in this class

# false positive or false negative, which one is more serious error?
# depends on the context/situation

# independent variable -> predictor or feature
# dependent variable -> label

# training and test data to identify the best model
# we keep say 20% of data as the test data and remaing 80% as the training. 
# We use the training data to estimate and select the best model. Then we check 
# the performance of the model using the test data

# lm(y ~ . , data = df)   dot means all the variables

# reinforcement learning
# https://www.google.com/search?sxsrf=APwXEddvKdh1Lo_AQ-54BPFMa8u8Gnsn-Q:1686873257674&q=albert+reinforcement+learning&tbm=vid&sa=X&ved=2ahUKEwiXyrfKvMb_AhXSF1kFHe0OBJ8Q0pQJegQIChAB&biw=1225&bih=689&dpr=2


# LECTURE CONTENT IS OVER, EXTRA STUFFZ ##########

## Word Cloud #########

library(tm)
library(wordcloud2)
library(wordcloud)
library(SnowballC)
library(RColorBrewer)

# https://luk
report <- readLines(file.choose())


text <- Corpus(VectorSource(report))
inspect(text)

#... COPY THE REST






#...

# https://bookdown.org/eneminef/DRR_Bookdown/mapping-vector-data.html
# https://rstudio-pubs-static.s3.amazonaws.com/897298_1236edf8a50d42e297141695a8c44360.html
# https://censusmapper.ca/api/CA21
# https://cran.r-project.org/web/packages/cacensus/vignettes/cacensus.html



