#Linear Regression
library(MASS)
View(Boston)
data("Boston")
dim(Boston)
?Boston
summary(Boston)

plot(Boston$medv~Boston$crim)
boxplot(Boston$medv)
c<-cor(Boston)
library(corrplot)
corrplot(c)
corrplot(c, method = "number")
corrplot(c, method = "square")
corrplot(c, method = "pie")
corrplot(c, method = "shade")
corrplot(c, method = "ellipse")
#to find the no of N/A cells in columns of Boston
colSums((is.na(Boston)))

library(caTools)
set.seed(8)
#sample(1:10,8)

set.seed(3)
split<-sample.split(Boston$medv, SplitRatio = 0.80)
split
#This table shows all the values of boston medv column from minimum to maximum and how many cells of that value went to True(training data) and how many went to False(testing data)
table(split,Boston$medv)

train<-subset(Boston, split == T)
test<-subset(Boston, split == F)

dim(train)
dim(test)

View(train)
View(test)

#lm below stands for linear model
model <- lm(medv~rm+lstat, data=train)
model
summary(model)

model1 <- lm(medv~rm+lstat+age, data=train)
model1
summary(model1)

model3 <- lm(medv~., data = train)
summary(model3)

model_final<-lm(medv~.-indus-age, data=train)
summary(model_final)

step(lm(medv~.,data = train))

train$f_v<-model_final$fitted.values
View(train)

train$rs <- model_final$residuals

library(car)
vif(model_final)

test$pred_res<-predict(model_final, newdata = test)
pred_res
View(test)


library(hydroGOF)
mse(test$pred_res,test$medv)
rmse(test$pred_res,test$medv)

plot(test$medv, type='l', col='blue')
lines(test$pred_res, col='red')

#Decision Tree
library(rpart)
library(tree)

model_tree<-tree(medv~.,data = train)
plot(model_tree)
text(model_tree)

pred_tree<-predict(model_tree, newdata = test)
library(hydroGOF)
rmse(pred_tree,test$medv)

#RandomForest
library(randomForest)
#We are building the random forest algorithm model for train data(80%)
model_rf <-randomForest(medv~., data = train, ntree = 500)
#now we are predicting the test data based on the train data we have built above
pred_rf <- predict(model_rf, newdata = test)
#now we are comparing the predicted test data with original test data and calculate the error
rmse(pred_rf,test$medv)

#Removing highly correleated variable
library(car)
vif(model_final)
model_new<-lm(medv~.-indus-age-tax-rad, data=train)
new_pred<-predict(model_new,newdata=test)
rmse(new_pred,test$medv)


# Writing functions

lmmod <- function(args){
  new_entry <- data.frame(args)
  result <- predict(model_new, newdata = new_entry)
  return(result)
}

names(test)

newdata <- test[1,]

lmmod(newdata)

boxplot(model_new$residuals)


#Dummy variables
View(train)
getwd()
df<-read.csv("Regression.csv")

#D:\\New Volume\\R\\Regression
#D:/New Volume/R/Regression

#'i\'m new'


View(df)
colSums(is.na(df))
mean(df$Age, na.rm = T)

df$Age[is.na(df$Age)] <- 38
names(df)

model <- lm(Purchase.made~., data=df)
summary(model)

sapply(df,unique)

unique(df$Job.Type)


df$employed <- as.numeric(df$Job.Type=='Employed')
df$student <- as.numeric(df$Job.Type=='Student')
df$retired <- as.numeric(df$Job.Type=='Retired')

df$Job.Type <- NULL


#Removing outliers
boxplot(df$signed.in.since.Days.)
b$stats
quantile(df$signed.in.since.Days., probs = seq(0,1,0.02))
min(df$signed.in.since.Days)
df$signed.in.since.Days. <- ifelse(df$signed.in.since.Days.<45,45,df$signed.in.since.Days.) 






#Importing and exporting data
library(learningr)
alpe<-read_excel("D:/Users/sgonella/Documents/R/R-3.5.3/library/learningr/extdata/Alpe.d.Huez.xls")
View(alpe)
jamaica<-read_json("D:/Users/sgonella/Documents/R/R-3.5.3/library/learningr/extdata/Jamaican.Cities.json")
View(jamaica)
readLines("D:/Users/sgonella/Documents/R/R-3.5.3/library/learningr/extdata/Shakespeare.s.The.Tempest..from.Project.Gutenberg.pg2235.txt")
