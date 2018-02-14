# Hello

prix<-read.csv("//telemaque/users/CEPE-S1-11/Telechargements/Day-ahead Prices_201601010000-201701010000.csv",stringsAsFactors = FALSE)
plot(prix)


consommation<-read.csv("//telemaque/users/CEPE-S1-11/Telechargements/cdc_conso.csv", sep=";",stringsAsFactors = FALSE)

production<-read.csv("//telemaque/users/CEPE-S1-11/Telechargements/cdc_prod_par_filiere.csv",sep=";",stringsAsFactors = FALSE)
names(production)



#creation de la dae au format POSIXt et spécification de la timezone
production$date_formate<-as.POSIXct(paste(production$Date,production$Heure),format="%Y-%m-%d %H:%M",tz="Europe/Paris")

#conversion de la date en UTC pour pouvoir joindre avec la table des prix
production$date_utc=with_tz(production$date_formate,"GMT")


#?timezones

#?format.POSIXct