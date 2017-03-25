#########################
## Házi feladat 3       #
## Programozás I.       #
## 2016/17 II. félév    #
## Takács Bence         #
## 2017-03-25           #
#########################

# list from 5  vectors - length = 10-20, interval = (1,2)
seq(from =1, to = 2, length.out = sample(10:20, 1))
rand_list <- list(seq(from =1, to = 2, length.out = sample(10:20, 1)), 
                  seq(from =1, to = 2, length.out = sample(10:20, 1)),
                  seq(from =1, to = 2, length.out = sample(10:20, 1)),
                  seq(from =1, to = 2, length.out = sample(10:20, 1)),
                  seq(from =1, to = 2, length.out = sample(10:20, 1)))
rand_list

# length of the list with "for", outcome = vector
# length_for <- lengths(rand_list) - ellenőrzés
x_listsum <- NA
for (j in 1:length(rand_list)) {
  x_listsum[j] <- lengths(rand_list[j])
}
x_listsum
class(x_listsum)

# length of the list with "apply", outcome = list
lapply(rand_list, function(x) length(x))

# length of the list with "apply", outcome = vector
sapply(rand_list, length)

# call chickwts dataset
data("chickwts")

# mean weight of chickens (aggregate)
df_weight <- aggregate(chickwts$weight, by = list(chickwts$feed), mean)

# sort df_weight by mean weight
df_weight[order(-df_weight[, 2]), ]

# 50 row, 10 columns matrix from normal dist., sd = row num
new_martix <- matrix(rnorm(500), nrow = 50, ncol = 10)
new_martix
?matrix
?rnorm

# sd of rows with "for", outcome = vector
rowsd_for <- NA
for (i in 1:nrow(new_martix)) {
  rowsd_for[i] <- sd(new_martix[i, ])
}
rowsd_for

# sd of rows with "apply", outcome = vector
apply(new_martix, 1, sd)

# normalize "new_matrix" between -1 and 1, get mean of rows
normalize <- function(x) { 
  x <- sweep(x, 2, apply(x, 2, min)) 
  x <- sweep(x, 2, apply(x, 2, max), "/") 
  2*x - 1
}
norm_matrix <- normalize(new_martix)
max(norm_matrix)
min(norm_matrix)

# mean of rows
apply(norm_matrix, 1, mean)

# fivethitryeight data
require("fivethirtyeight")
data("comic_characters")

# only primary name in name column
# install "splitstackshape" package 
install.packages("splitstackshape")
library(splitstackshape)
?cSplit()
comic_names<-cSplit(comic_characters, splitCols = "name", sep = "(", direction = "wide", drop = T)
comic_names$name_2 <- NULL
comic_names$name_3 <- NULL
comic_names$name_4 <- NULL
comic_names<-cSplit(comic_names, splitCols = "sex", sep = " ", direction = "wide", drop = T)
comic_names$sex_2 <- NULL

# write get_gender function
  source("src/homework-03-functions.R")
  
  get_gender("Thor")
  get_gender("Katherine Pryde")
  get_gender("Loki Laufeyson")
 