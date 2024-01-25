# Word Cloud

# Firouz Fallahi

library(tm)
library(wordcloud2)
library(wordcloud)
library(SnowballC)
library(RColorBrewer)

# https://lukesingham.com/how-to-make-a-word-cloud-using-r/
        # https://www.bankofcanada.ca/2023/06/entering-new-era-higher-interest-rates/
report <- readLines(file.choose())  


text <- Corpus(VectorSource(report))
inspect(text)
# Strip unnecessary whitespace
text <- tm_map(text, stripWhitespace)
# Convert to lowercase
text <- tm_map(text, tolower)
# Remove conjunctions etc.
text <- tm_map(text, removeWords, stopwords("english"))
# Remove suffixes to the common 'stem'
text <- tm_map(text, stemDocument)
# Remove commas etc.
text <- tm_map(text, removePunctuation)



DTM <- TermDocumentMatrix(text)

mat <- as.matrix(DTM)

f <- sort(rowSums(mat),decreasing=TRUE)

dat <- data.frame(word = names(f),freq=f)

head(dat, 5)

set.seed(147)

wordcloud(dat$word,
          max.words = 5000,
          freq = dat$freq,
          random.order = F,
          colors=brewer.pal(6, "Dark2"))

barplot(dat[1:10,]$freq, las = 2, names.arg = dat[1:10,]$word,
        
        col ="lightblue", main ="Most frequent words",
        
        ylab = "Word frequencies")

# Another example of working with text
# Titanic data extract titles ----
library(titanic)
library(tidyverse)

train <- titanic_train %>% select(!Survived)
test <- titanic_test

full <- rbind(train , test)

full$Title <- gsub('(.*, )|(\\..*)', '', full$Name)

# Titles by Sex
table(full$Sex, full$Title)

