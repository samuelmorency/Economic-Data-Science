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

model1 <- lm(salary ~ roe , data = ceo)

# to see teh results of teh estimation
summary(model1)










