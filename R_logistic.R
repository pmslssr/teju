#logistic_regresssion
library(mlbench)
data("PimaIndiansDiabetes")
View(PimaIndiansDiabetes)
dim(PimaIndiansDiabetes)
str(PimaIndiansDiabetes)
summary(PimaIndiansDiabetes)
table(PimaIndiansDiabetes$diabetes)
colSums(is.na(PimaIndiansDiabetes))
head(PimaIndiansDiabetes)
#we are omitting last column 'diabetes' for correlation because it is not numeric. It has char values pos and neg
cor(PimaIndiansDiabetes[-9])



library(corrplot)
corrplot(cor(PimaIndiansDiabetes[-9]))
PimaIndiansDiabetes$new <- as.numeric(PimaIndiansDiabetes$diabetes=="pos")
plot(PimaIndiansDiabetes$glucose~PimaIndiansDiabetes$diabetes)
PimaIndiansDiabetes$diabetes <- NULL
View(PimaIndiansDiabetes)

library(caTools)
set.seed(88)
split<-sample.split(PimaIndiansDiabetes$new, SplitRatio = 0.80)
train<-subset(PimaIndiansDiabetes, split == T)
test<-subset(PimaIndiansDiabetes, split == F)
table(train$new)

#Generalized linear model
model<-glm(new~.,data = train, family = binomial)
train$f_v <- model$fitted.values
View(train)

#here if the fitted value is >0.5, it is considered to be a '1' in 'new' column which means diabetes test is pos. if fitted value is <0.5, it is considered to be a 0 in new column which means diabetes test is neg.
table(train$new, train$f_v>0.4)
(354+125)/(354+125+46+89)

dim(train)
(329+144)/614

library(ROCR)
pred<-prediction(train$new, train$f_v>0.5)
perf<-performance(pred, "tpr","fpr")
plot(perf)

summary(model)

step(glm(new~.,data=train,family = binomial))
train$f_v<-NULL
model_fin<-glm(new~.-insulin-triceps-age-pressure,data = train, family = binomial)
summary(model_fin)

test$pred<-predict(model_fin, newdata = test, type = 'response')
table(test$new, test$pred>0.5)
(89+27)/(89+27+11+27)


#Decision Tree
library(tree)
library(rpart)
model_tree<-tree(diabetes~.,data = train)
plot(model_tree)
text(model_tree)

pred_tree<-predict(model_tree, newdata = test, type = 'class')
table(test$diabetes,pred_tree)
(84+29)/(84+16+25+29)

#Random forest
library(randomForest)
rf_model<-randomForest(diabetes~.,data = train)
pred_rf <- predict(rf_model, newdata = test)

table(test$diabetes, pred_rf)
(86+28)/(86+28+14+26)