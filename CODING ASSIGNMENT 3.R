#R Assignment 3
#Topic:Data_Extract_From_Jobs
#NAME: AKSHITA NEGI    21227707022
#Submitted to-Dr.Devesh Birwal


install.packages("ggplot2")
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)
install.packages("readxl")
library(readxl)
install.packages("dplR")
library(dplyr)
install.packages("xlsx")
library(xlsx)

Jobs<-read_excel('C:/Users/91870/Documents/Akshita Negi/CODING/project/Data_Extract_From_Jobs.xlsx')


View(Jobs)
attach(Jobs)
summary(Jobs)

df<- as.data.frame(Jobs)
Jobs$ADR
Jobs$CPI
Jobs$EXP
Jobs$GDP
Jobs$UNP
Jobs$URB

#####################################################
mean(ADR)
mean(CPI)
mean(EXP)
mean(GDP)
mean(UNP)
mean(URB)
dim(Jobs)
ncol(Jobs)
colnames(Jobs)
str(Jobs)
#histogram
hist(ADR)
hist(CPI)
hist(EXP)
hist(GDP)
hist(UNP)
hist(URB)


# basic one dimensional plots 
plot(ADR)
plot(CPI)
plot(EXP)
plot(GDP)
plot(UNP)
plot(URB)


df$YEARS<- as.factor(df$YEARS)
df$ADR<- as.numeric(df$ADR)
df$BR <- as.numeric(df$CPI)
df$CHE <- as.numeric(df$EXP)
df$DR <- as.numeric(df$GDP)
df$HCI<- as.numeric(df$UNP)


###ggplot2- data+aesthetics+ geometric expressions 
ggplot(Jobs,aes(x=ADR,fill=as.factor(YEARS )))+geom_histogram(bins = 30)
ggplot(Jobs,aes(x=CPI,fill=as.factor(YEARS )))+geom_histogram(bins = 30)
ggplot(Jobs,aes(x=EXP,fill=as.factor(YEARS )))+geom_histogram(bins = 30)
ggplot(Jobs,aes(x=GDP,fill=as.factor(YEARS )))+geom_histogram(bins = 30)
ggplot(Jobs,aes(x=UNP,fill=as.factor(YEARS )))+geom_histogram(bins = 30)
ggplot(Jobs,aes(x=URB,fill=as.factor(YEARS )))+geom_histogram(bins = 30)


# Two dimensional graphs with bar charts
ggplot(Jobs,aes(x=GDP,fill=EXP))+geom_bar(position="dodge")
ggplot(Jobs,aes(x=as.factor(GDP),fill=as.factor(YEARS)))+geom_bar(position="stack")
ggplot(Jobs,aes(x=as.factor(CPI),fill=as.factor(YEARS)))+geom_bar(position="fill")
ggplot(Jobs,aes(x=as.factor(UNP),fill=as.factor(YEARS)))+geom_bar(position="fill")

#two dimensional graph with column chart 
ggplot(Jobs,aes(x=as.factor(YEARS),y=GDP))+geom_col(color="YELLOW",fill="PINK")
ggplot(Jobs,aes(x=as.factor(YEARS),y=URB))+geom_col(color="YELLOW",fill="YELLOW")
ggplot(Jobs,aes(x=as.factor(YEARS),y=CPI))+geom_col(color="BLACK",fill="PINK")
ggplot(Jobs,aes(x=as.factor(YEARS),y=UNP))+geom_col(color="BLACK",fill="RED")
ggplot(Jobs,aes(x=as.factor(YEARS),y=EXP))+geom_col(color="BLACK",fill="LIGHT BLUE")
                                                    
#box plots and other additions 

ggplot(Jobs, aes(x=as.factor(YEARS),y=ADR))+ geom_boxplot()

ggplot(Jobs, aes(x=as.factor(YEARS),y=ADR))+ geom_boxplot(fill="BLACK",color="PURPLE", notch = TRUE)

ggplot(Jobs, aes(x=as.factor(YEARS),y=GDP))+ geom_boxplot(fill="BLACK",color="BLUE")+labs(title = "Box Plot of GDP", x="YEARS", y="GDP")

ggplot(Jobs, aes(x=as.factor(YEARS),y=EXP))+ geom_boxplot(fill="RED",color="BLACK")+
  labs(title = "Box Plot of EXP", x="NO. OF YEARS", y="EXPORT OF GOODS AND SERVICES")+
  scale_x_discrete(breaks=c("5","10","15","20","25"),labels=c("five","ten","fifteen","twenty","twentyfive"))+
  scale_y_continuous(breaks = c(10,15,20,25,30),labels=c("ten","fifteen","twenty","twenfive","thirty"))

ggplot(Jobs,aes(x=GDP,y=YEARS))+geom_point()
ggplot(Jobs,aes(x=GDP,y=CPI))+geom_point(pch=16,color="BLUE",size=3,alpha=0.9)

ggplot(Jobs,aes(x=UNP,y=YEARS,shape=as.factor(YEARS)))+geom_point(color="BLACK",size=3,alpha=0.9)

ggplot(Jobs,aes(x=UNP,y=URB,shape=as.factor(YEARS),color=as.factor(YEARS)))+geom_point(size=4,alpha=0.9)

ggplot(Jobs,aes(x=UNP,y=URB))+geom_point(pch=16,color="RED",size=3,alpha=0.9)+
  facet_wrap(~as.factor(YEARS),ncol = 2)

ggplot(Jobs,aes(x=EXP,y=GDP,fill=as.factor(YEARS)))+geom_point(pch=16,color="BLUE",size=3,alpha=0.9)+
  geom_smooth(method ="lm",color="BLACK",linetype=2)+theme(legend.position = c(.3,.7))

g1 <-ggplot(Jobs, aes(ADR,fill=as.factor(YEARS)))+geom_histogram(bins=30)

g2 <-ggplot(Jobs, aes(UNP,fill=as.factor(YEARS)))+geom_bar()

g3 <- ggplot(Jobs, aes(x=as.factor(YEARS),y=CPI,fill=as.factor(GDP)))+geom_boxplot()


grid.arrange(g1,g2,g3,ncol=2)

getwd()

###########################################









































