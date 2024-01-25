## Regression in R
# June 8th 

# Machine learning: Supervised and unsupervised

# https://data-mining.philippe-fournier-viger.com/funny-pictures-about-data-mining-machine-learning/

magick::image_read("D:/R/Course/supervised.png")

# in more details
magick::image_read("D:/R/Course/supervised_2.png")

# another funny one
magick::image_read("D:/R/Course/funny_data_cleaning.png")

# Linear regression
# Heiss Ch. 2

library(wooldridge)

# read data on CEO's salary (ceosal1) from wooldrige's package and name it CEO

ceo <-  wooldridge::ceosal1

# names of columns?
names(ceo)

log(ceo$salary)

#explore the data
skimr::skim(ceo)

# Let's estimate the relationship between rate of return and the salary of CEOs

ceo %>% ggplot(aes(salary, roe)) +
  geom_point()   # outliers in salary, let's limit that to 3000. HOW?

ceo <- ceo %>% filter(salary <= 3000)

# repeat  the graph 
ceo %>% ggplot(aes(salary, roe)) +
  geom_point()

# add a trend line to the plot
ceo %>% ggplot(aes(salary, roe)) +
  geom_point()+
  geom_smooth()

# it is not linear!
ceo %>% ggplot(aes(salary, roe)) +
  geom_point()+
  geom_smooth(method = "lm", se = F)   # this fits a linear model

# is it possible to have a better line? For example the red line or green one?
ceo %>% ggplot(aes(salary, roe)) +
  geom_point()+
  geom_smooth(method = "lm", se = F) +
  geom_abline(intercept = 5, slope = 0.005,  color = "red" , size = 1) +
  geom_abline(intercept = 0, slope = 0.01, color = "green", size = 2)

# which line to choose? Ordinary least squares (OLS)
magick::image_read("D:/R/Course/ols.jpg")

# linear Regression in R

model1 <- lm(salary ~ roe , data = ceo) # salary is dependent variable and roe is independent var

# to see the results of teh estimation
summary(model1)
# results show that if teh roe increase by 1 unit, teh salary increase by 15.0802 units.



#  June 13 ------------

# I want to get the coefficients
model1$coefficients

# TO GET THE COEEFICIENT OF ROE
model1$coefficients[2]
model1[["coefficients"]][["roe"]]
model1$coefficients["roe"]
model1$coefficients$roe # here this one will not work

#  least square or absolute approaches; google that

###  Monte Carlo Simulation example ----

# section 4.5 of Hanck et al has another very good example of simulation here:
# https://www.econometrics-with-r.org/4.5-tsdotoe.html

# Pollution and house price in Boston 1970 census  ------------------------------

#   https://rpubs.com/ezrasote/housepricing
#install.packages("mlbench")
library(mlbench)

data(BostonHousing)

df <- BostonHousing

str(df)

summary(df)

# missing data in the df?
Amelia::missmap(df, col=c('yellow','black'))

#high correlations?
cor(df)
cor(select(df, -chas))

corrplot::corrplot(cor(select(df, -chas))) # ggpairs()

# regression Boston ------
# how median value of owner-occupied home is related to Crime, Average number of rooms,
# Property tax, Percentage of lower status of the population

# see https://rpubs.com/ezrasote/housepricing   for more details in case interested :)

model.boston <- lm(medv ~ crim + rm + tax + lstat, data = df)

summary(model.boston)

summary(model.boston) %>% broom::tidy()

# if yuo want to round teh numbers
summary(model.boston) %>% broom::tidy() %>% mutate_if(is.numeric, round, 3)


# see section 6.2 of Hanck et al for a very good graphic representation

##### Logistic regression Ch. 11 Hanck et al --------
# load `AER` package and attach the HMDA (Home Mortgage Disclosure Act Data)
library(AER)

data(HMDA)

mortgage <- HMDA
summary(mortgage)

?HMDA

# Estimate a linear model, deny based on single, high school, pirat

lm(deny ~ single + hschool + pirat, data = mortgage)

# I want to use linear model here

# convert 'deny' to numeric to be able to estimate linear model
mortgage$deny <- as.numeric(mortgage$deny) -1

model.hmda.linear <- lm(deny ~ single + hschool + pirat, data = mortgage)

summary(model.hmda.linear) %>% broom::tidy()




