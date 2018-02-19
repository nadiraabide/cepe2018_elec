install.packages("lubridate")
library(lubridate)

install.packages("quantmod")
library(quantmod)

#creation de la dae au format POSIXt et spécification de la timezone
production$date_formate<-as.POSIXct(paste(production$Date,production$Heure),format="%Y-%m-%d %H:%M",tz="Europe/Paris")
consommation$date_formate<-as.POSIXct(paste(consommation$Date,consommation$Heure),format="%Y-%m-%d %H:%M",tz="Europe/Paris")

prix$date_utc<-as.POSIXct(prix$MTU..UTC.,format="%d.%m.%Y %H:%M",tz="GMT")

#conversion de la date en UTC pour pouvoir joindre avec la table des prix
production$date_utc=with_tz(production$date_formate,"GMT")
consommation$date_utc=with_tz(consommation$date_formate,"GMT")


#tri des donnees par date
consommation<-consommation[order(consommation$date_utc),]
production<-production[order(production$date_utc),]

#attention à la fin de la table il reste les dates des changements d'heure...

#agregation au pas horaire
consommation$lag1<- Lag(consommation$Consommation..MW., k=1)

consommation$Consommation..MW.2<- consommation$Consommation..MW.+consommation$lag1
consommation2<-consommation[which(consommation$Heure %in% c("00:30","01:30","02:30","03:30","04:30","05:30","06:30","07:30","08:30","09:30","10:30","11:30","12:30","13:30","14:30","15:30","16:30","17:30","18:30","19:30","20:30","21:30","22:30","23:30")),]
consommation2<-consommation2[,- c()]




