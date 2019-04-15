sessionInfo()
#install.packages(ClusterR)
library(ClusterR)
center_scale(mtcars)
1:10
c(1,4,8)
v = 1:10
v1 <- 50:55
20:25 -> v2
getwd()
#setwd("D:/Users/sgonella/Desktop")

#Data Structures in R


#vectors: single dimension and elements of same data type
v<-1:10
class(v)
v
v[5]
v[3:8]
v[c(2,9,5)]

v1<-c(2,9,5)
v1

v2<-c("A","B")
class(v2)

v3<-c(TRUE,FALSE)
class(v3)

v3<-c(TRUE,FALSE, T, F)
class(v3)

v4<-c("A","B",1,2)
v4
class(v4)

v5<-c("A","B",T,F)
v5

v6<-c(1,0,T,F)
v6

1:10
c(1,5)

v
as.character(v)
as.numeric(v)
as.logical(v)

c(2,3,4,5)
as.integer(c(2.3,4.5))
bird<-c("w","x",1,2)

mean(v)

seq(from=1,to=10, by=2)

rep(1:4,4)
rep(1:4,4, each=2)

v+v
v+1
v*2

c(1,2)+c(5,8)
c(4,8)/2

v+1/2

c(1,2,3)*c(3,4)
c(1,2,3)+c(3,4)

#Matrix: Two dimensional
m <- 1:10
dim(m)
dim(m)<-c(2,5)
m
class(m)
m[2,4]
m[,5]
m[2,]
m[1:2,4:5]
m[1:2,4]
m[1,4:5]

m1 <- matrix(1:8,2,4)
m1

m1 <- matrix(1:8,2,4, byrow = T, dimnames = list(c('a','b'),c('c1','c2','c3','c4')))
m1

t(m)
m[2,4]+m[2,2]

m1

v1<-c(12,14,16,18)

rbind(m1,v1)
cbind(m1,c(1,2))
cbind(m1,new = c(1,2))

dimnames(m1)

x<-c(1,2,3)
y<-c(4,5,6)
cbind(x,y)
rbind(x,y)

Z = matrix( m, nrow = 2, ncol = 5, byrow = TRUE)
print(Z)


#Arrays: N dimension
a<-array(1:20, dim=c(2,4,2))
a
a[2,,]
a[2,3,2]
a[2,3,1]
a[1,2,1]
a[1,2,2]
a[1,2, ]
a[1, ,2]




#Data Frames:

data()

View(AirPassengers)
View(mtcars)

dim(mtcars)
mtcars[1,1]
mtcars[1,]

mtcars $mpg
class(mtcars)

as.matrix(mtcars)



#Lists:
l1 = list(v,v1,v3,m1,mtcars[1:5,])
l1[[4]][3]

l2<-list('ca'=20000,'ny'=40000)
l2
l2$ca


#Factors: used for representing characters

cities <- c("Blr","Mum","Hyd","Del","Blr","Mum")
cities

c_fac<-as.factor(cities)
c_fac
as.integer(c_fac)
levels(c_fac)<-c("Mum","Blr","Hyd","Del")


#Naming Sequence

#vector
v<-c(1,2)
names(v)<-c('a','b')
v


#Matrix
m <- matrix(1:4, c(2,4), dimnames = list(c('a','b'),c('x','y')))
m

rownames(m)<-c('p','q')
colnames(m)<-c('i','j')
m


#Data Frames
row.names(mtcars)
names(mtcars)


#Subsetting
df <- data.frame('Days' = c("Mon","Tue","Wed","Thu","Fri","Sun","Fri"), 'Temp'= c(20,15,17,28,25,34,32), 'Rain' = c("Y","N","Y","N","N","Y","Y"))
df
dim(df)
View(df)

df1<-df[1:5,]
View(df1)

#Str
str(df)
df_rain<-subset(df,df$Rain=="Y")
View(df_rain)

c(3,8,4,3)<3
df_rain_tmp <- subset(df, df$Rain == "Y" & df$Temp > 25)
View(df_rain_tmp)

df_rain_tmp$New<-c(10,20)
View(df_rain_tmp)

InsertRow(df,c("Mon",20,"Y"), RowNum = 5)
View(df_rain_tmp)

str(df)

df$Rain <- as.character((df$Rain))



#statistics
mean(mtcars$mpg)
median(mtcars$mpg)
table(df$Rain)

range(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)

boxplot(mtcars$mpg)
b<-boxplot(mtcars$mpg)
b

mtcars1<-edit(mtcars)

boxplot(mtcars$mpg)
