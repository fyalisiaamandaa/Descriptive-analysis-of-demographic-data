library(readr)
library(lessR)
library(ggplot2)
library(xtable)
library(dplyr)
library(ggpubr)
library(tidyr)
library(reshape2) 

#version of packages
sessionInfo()

#setwd("C:/Users")
surveydata <- read.csv("D:/TU Dortmun WS/ics SS23/1/census2002_2022.csv", TRUE)
View(surveydata)
surveydata[!complete.cases(surveydata),] #check lines included missing values 10 missing value

year02 <- surveydata[surveydata$Year=="2002",]
year22 <- surveydata[surveydata$Year=="2022",]
year22[!complete.cases(year22),]
#View(year22)
#View(surveydata)

## add mising value Curaçao missing subregion : Caribbean and region : Americas 2022
year22$Subregion[which(year22$Country.Area.Name == "Curaçao")] <- "Carribean"
year22$Region[which(year22$Country.Area.Name == "Curaçao")] <- "Americas"

#add mising value Côte d'Ivoire missing subregion : Western Africa and region : africa 2022
year22$Subregion[which(year22$Country.Area.Name == "Côte d'Ivoire")] <- "Western Africa"
year22$Region[which(year22$Country.Area.Name == "Côte d'Ivoire")] <- "Africa"
#View(year22)

## add mising value Curaçao missing subregion : Caribbean and region : Americas 2002
year02$Subregion[which(year02$Country.Area.Name == "Curaçao")] <- "Carribean"
year02$Region[which(year02$Country.Area.Name == "Curaçao")] <- "Americas"
#View(year02)

#add mising value Côte d'Ivoire missing subregion : Western Africa and region : africa 2002
year02$Subregion[which(year02$Country.Area.Name == "Côte d'Ivoire")] <- "Western Africa"
year02$Region[which(year02$Country.Area.Name == "Côte d'Ivoire")] <- "Africa"
#View(year02)

#add median to missing value
year02$Life.Expectancy.at.Birth..Both.Sexes[is.na(year02$Life.Expectancy.at.Birth..Both.Sexes)] <- median(year02$Life.Expectancy.at.Birth..Both.Sexes, na.rm = T)
year02$Life.Expectancy.at.Birth..Males[is.na(year02$Life.Expectancy.at.Birth..Males)] <- median(year02$Life.Expectancy.at.Birth..Males, na.rm = T)
year02$Life.Expectancy.at.Birth..Females[is.na(year02$Life.Expectancy.at.Birth..Females)] <- median(year02$Life.Expectancy.at.Birth..Females, na.rm = T)
year02$Under.Age.5.Mortality..Both.Sexes[is.na(year02$Under.Age.5.Mortality..Both.Sexes)] <- median(year02$Under.Age.5.Mortality..Both.Sexes, na.rm = T)
year02$Under.Age.5.Mortality..Males[is.na(year02$Under.Age.5.Mortality..Males)] <- median(year02$Under.Age.5.Mortality..Males, na.rm = T)
year02$Under.Age.5.Mortality..Females[is.na(year02$Under.Age.5.Mortality..Females)] <- median(year02$Under.Age.5.Mortality..Females, na.rm = T)
#View(year02)

#check missing value again
year02[!complete.cases(year02),]
year22[!complete.cases(year22),]

#Question 1

bp1=hist(year22$Life.Expectancy.at.Birth..Both.Sexes,xlim = c(30,100), ylim = c(0,90),col="darkmagenta", border="white",labels = F,
         cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Life expectancy at birth both sexes")
text(x=bp1$mids, y=bp1$counts, labels=bp1$counts ,cex=1.5,pos=3)

bp2=hist(year22$Life.Expectancy.at.Birth..Males, xlim = c(30,100), ylim = c(0,80),col="darkmagenta", border="white",labels = F,
         cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Life expectancy males")
text(x=bp2$mids, y=bp2$counts, labels=bp2$counts ,cex=1.15,pos=3)

bp3=hist(year22$Life.Expectancy.at.Birth..Females, xlim = c(30,100), ylim = c(0,80),col="darkmagenta", border="white",labels = F,
         cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Life expectancy females")
text(x=bp3$mids, y=bp3$counts, labels=bp3$counts ,cex=1.15,pos=3)

bp4=hist(year22$Under.Age.5.Mortality..Both.Sexes, xlim = c(0,160), ylim = c(0,150),col="darkmagenta", border="white",labels = F,
         cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Under age 5 mortality rate both sexes")
text(x=bp4$mids, y=bp4$counts, labels=bp4$counts ,cex=1.5,pos=3)

bp5=hist(year22$Under.Age.5.Mortality..Males, xlim = c(0,230), ylim = c(0,150),col="darkmagenta", border="white",labels = F,
         cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Under age 5 mortality rate males")
text(x=bp5$mids, y=bp5$counts, labels=bp5$counts ,cex=1.5,pos=3)

bp6=hist(year22$Under.Age.5.Mortality..Females, xlim = c(0,200), ylim = c(0,150),col="darkmagenta", border="white",labels = F,
         cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Under age 5 mortality rate females")
text(x=bp6$mids, y=bp6$counts, labels=bp6$counts ,cex=1.5,pos=3)

#new histogram combine all life expectancy
gfg1=hist(year22$Life.Expectancy.at.Birth..Males, xlim = c(30,100), ylim = c(0,80),col=rgb(1,0,0,0.5), border="white",labels = F, cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Life expectancy")
text(x=gfg1$mids, y=gfg1$counts, labels=gfg1$counts ,cex=1.15,pos=3.2, col=rgb(1,0,0,0.5))
gfg2=hist(year22$Life.Expectancy.at.Birth..Females, xlim = c(30,100), ylim = c(0,80),col=rgb(0,0,1,0.5), border="white",labels = F,
          cex.lab=1.5, cex.axis=2, main=NULL, add=TRUE)
legend("topleft", c("Males", "Females"), lwd=4, col=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)))
text(x=gfg2$mids, y=gfg2$counts, labels=gfg2$counts ,cex=1.15,pos=3, col=rgb(0,0,1,0.5))

#new histogram combine under age 5 mortality
gf1=hist(year22$Under.Age.5.Mortality..Males, xlim = c(0,200), ylim = c(0,150),col=rgb(1,0,0,0.5), border="white",labels = F, cex.lab=1.5, cex.axis=2, main=NULL, xlab = "Under Age 5 Mortality")
text(x=gf1$mids, y=gf1$counts, labels=gf1$counts ,cex=1.15,pos=3, col=rgb(1,0,0,0.5))
gf2=hist(year22$Under.Age.5.Mortality..Females, xlim = c(0,200), ylim = c(0,150),col=rgb(0,0,1,0.5), border="white",labels = F,
          cex.lab=1.5, cex.axis=2, main=NULL, add=TRUE)
text(x=gf2$mids, y=gf2$counts, labels=gf2$counts ,cex=1.15,pos=3, col=rgb(0,0,1,0.5))
legend("topright", c("Males", "Females"), lwd=4, col=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)))


#Question 2
table(surveydata$Subregion) #list of Subregion

#Africa
Africa <- subset(year22, Region=="Africa")

dat.m <- melt(Africa,id.vars='Subregion', measure.vars=c('Life.Expectancy.at.Birth..Both.Sexes','Life.Expectancy.at.Birth..Males','Life.Expectancy.at.Birth..Females'))
colnames(dat.m) <- c('Subregion','LifeExpectancy','LifeExpectancyValue')
#View(dat.m)
p <- ggplot(dat.m) +
  geom_boxplot(aes(x=LifeExpectancyValue, y=Subregion, color=LifeExpectancy))
p

#UA5MR
dat.u <- melt(Africa,id.vars='Subregion', measure.vars=c('Under.Age.5.Mortality..Both.Sexes','Under.Age.5.Mortality..Males','Under.Age.5.Mortality..Females'))
colnames(dat.u) <- c('Subregion','UnderAge5Mortality','UnderAge5MortalityValue')
View(dat.u)

d <- ggplot(dat.u, aes(x=UnderAge5MortalityValue, y=Subregion, color=UnderAge5Mortality)) +
  geom_boxplot()
d

#Question 3
x <- 1:100
y <- x + rnorm(100, mean = 0, sd = 15)
panel.cor <- function(x, y, digits = 3, prefix = "", cex.cor, ...) {
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  Cor <- cor(x, y)
  txt <- paste0(prefix, format(c(Cor, 0.123456789), digits = digits)[1])
  if(missing(cex.cor)) {
    cex.cor <- 0.4 / strwidth(txt)
  }
  text(0.5, 0.5, txt, cex = 2)
}

pairs(~Life.Expectancy.at.Birth..Both.Sexes+Life.Expectancy.at.Birth..Males+Life.Expectancy.at.Birth..Females+Under.Age.5.Mortality..Both.Sexes+Under.Age.5.Mortality..Males+Under.Age.5.Mortality..Females,
      data = year22, upper.panel = panel.cor,
      labels = c("LE Both","LE Males","LE Females", "MR Both", "MR Males", "MR Females"),
      cex.axis=1.5,cex.labels=1, cor.method = "pearson")


#Question 4
View(year02)
View(year22)
newdata1<- rbind(year02, year22)
View(newdata1)

#LE 
bxp <- ggplot(newdata1, aes(x = Region, y = Life.Expectancy.at.Birth..Both.Sexes)) + 
  geom_boxplot(aes(color = factor(Year))) + labs(color="Year") + labs(y="Life expectancy")+
  scale_color_manual(values = c("#00AFBB", "#FC4E07"))
bxp
#LE scatterplot
plot(year02$Life.Expectancy.at.Birth..Both.Sexes, year22$Life.Expectancy.at.Birth..Both.Sexes, xlim = c(40,90), ylim = c(40,90), abline(lm(year02$Life.Expectancy.at.Birth..Both.Sexes~year22$Life.Expectancy.at.Birth..Both.Sexes), col = "red"),
     xlab = "Life expectancy at both sexes on 2002", ylab = "Life expectancy at both sexes on 2022", pch=1)

#UA5
bxd <- ggplot(newdata1, aes(x = Region, y = Under.Age.5.Mortality..Both.Sexes)) + 
  geom_boxplot(aes(color = factor(Year))) + labs(color="Year") + labs(y="Under Age 5 Mortality")+
  scale_color_manual(values = c("#00AFBB", "#FC4E07"))
bxd
#UA5 scatterplot
plot(year02$Under.Age.5.Mortality..Both.Sexes, year22$Under.Age.5.Mortality..Both.Sexes, abline(lm(year02$Under.Age.5.Mortality..Both.Sexes~year22$Under.Age.5.Mortality..Both.Sexes), col = "red"),
     xlab = "Under Age 5 Mortality Both Sexes on 2002", ylab = "Under Age 5 Mortality Both Sexes on 2022", pch=1)

#table
year22[which.min(year22$Life.Expectancy.at.Birth..Both.Sexes),] #which country has minimum value
year22[which.max(year22$Life.Expectancy.at.Birth..Both.Sexes),]

#table-q1 life expectancy
sum_year22<-summary(year22)
tab1<-xtable(sum_year22)
View(tab1)
tab1<-tab1[,-c(1,2,3,4,5)]
View(tab1)
tab1[7,]<-round(c(var(year22$Life.Expectancy.at.Birth..Both.Sexes),var(year22$Life.Expectancy.at.Birth..Males),
                  var(year22$Life.Expectancy.at.Birth..Females), var(year22$Under.Age.5.Mortality..Both.Sexes),
                  var(year22$Under.Age.5.Mortality..Males), var(year22$Under.Age.5.Mortality..Females)),4)
                  
View(tab1)

#correlation table-q2
View(year22)
corr<-year22[,-c(1,2,3,4,5)]
View(corr)
mcor<-round(cor(corr),4)
View(mcor)
upper<-mcor
upper[upper.tri(mcor)]<-""
upper<-as.data.frame(upper)
View(upper)
corr_table<-xtable(upper)
View(corr_table)

#table- box LE IQR
sum_box_bs <- Africa %>%
  group_by(Subregion) %>%
  summarise(min=min(Life.Expectancy.at.Birth..Both.Sexes),
            q1=quantile(Life.Expectancy.at.Birth..Both.Sexes, 0.25),
            median=median(Life.Expectancy.at.Birth..Both.Sexes),
            mean=mean(Life.Expectancy.at.Birth..Both.Sexes),
            q3=quantile(Life.Expectancy.at.Birth..Both.Sexes, 0.75),
            max=max(Life.Expectancy.at.Birth..Both.Sexes),
            IQR=quantile(Life.Expectancy.at.Birth..Both.Sexes, 0.75)-quantile(Life.Expectancy.at.Birth..Both.Sexes, 0.25))
tab7<-xtable(sum_box_bs)
View(tab7)

sum_box_m <- Africa %>%
  group_by(Subregion) %>%
  summarise(min=min(Life.Expectancy.at.Birth..Males),
            q1=quantile(Life.Expectancy.at.Birth..Males, 0.25),
            median=median(Life.Expectancy.at.Birth..Males),
            mean=mean(Life.Expectancy.at.Birth..Males),
            q3=quantile(Life.Expectancy.at.Birth..Males, 0.75),
            max=max(Life.Expectancy.at.Birth..Males),
            IQR=quantile(Life.Expectancy.at.Birth..Males, 0.75)-quantile(Life.Expectancy.at.Birth..Males, 0.25))
tab8<-xtable(sum_box_m)
View(tab8)

sum_box_f <- Africa %>%
  group_by(Subregion) %>%
  summarise(min=min(Life.Expectancy.at.Birth..Females),
            q1=quantile(Life.Expectancy.at.Birth..Females, 0.25),
            median=median(Life.Expectancy.at.Birth..Females),
            mean=mean(Life.Expectancy.at.Birth..Females),
            q3=quantile(Life.Expectancy.at.Birth..Females, 0.75),
            max=max(Life.Expectancy.at.Birth..Females),
            IQR=quantile(Life.Expectancy.at.Birth..Females, 0.75)-quantile(Life.Expectancy.at.Birth..Females, 0.25))
tab9<-xtable(sum_box_f)
View(tab9)

#table- box UA5MR IQR
sum_box_lb <- Africa %>%
  group_by(Subregion) %>%
  summarise(min=min(Under.Age.5.Mortality..Both.Sexes),
            q1=quantile(Under.Age.5.Mortality..Both.Sexes, 0.25),
            median=median(Under.Age.5.Mortality..Both.Sexes),
            mean=mean(Under.Age.5.Mortality..Both.Sexes),
            q3=quantile(Under.Age.5.Mortality..Both.Sexes, 0.75),
            max=max(Under.Age.5.Mortality..Both.Sexes),
            IQR=quantile(Under.Age.5.Mortality..Both.Sexes, 0.75)-quantile(Under.Age.5.Mortality..Both.Sexes, 0.25))
tab4<-xtable(sum_box_lb)
View(tab4)

sum_box_UA5 <- Africa %>%
  group_by(Subregion) %>%
  summarise(min=min(Under.Age.5.Mortality..Males),
            q1=quantile(Under.Age.5.Mortality..Males, 0.25),
            median=median(Under.Age.5.Mortality..Males),
            mean=mean(Under.Age.5.Mortality..Males),
            q3=quantile(Under.Age.5.Mortality..Males, 0.75),
            max=max(Under.Age.5.Mortality..Males),
            IQR=quantile(Under.Age.5.Mortality..Males, 0.75)-quantile(Under.Age.5.Mortality..Males, 0.25))
tab5<-xtable(sum_box_UA5)
View(tab5)

sum_box_UA5M <- Africa %>%
  group_by(Subregion) %>%
  summarise(min=min(Under.Age.5.Mortality..Females),
            q1=quantile(Under.Age.5.Mortality..Females, 0.25),
            median=median(Under.Age.5.Mortality..Females),
            mean=mean(Under.Age.5.Mortality..Females),
            q3=quantile(Under.Age.5.Mortality..Females, 0.75),
            max=max(Under.Age.5.Mortality..Females),
            IQR=quantile(Under.Age.5.Mortality..Females, 0.75)-quantile(Under.Age.5.Mortality..Females, 0.25))
tab6<-xtable(sum_box_UA5M)
View(tab6)
