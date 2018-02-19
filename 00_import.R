

#import des données de prix, consommation et production
prix<-read.csv("C:/Users/admin/Desktop/Certificat Datascientist/PROJET/Day-ahead Prices_201601010000-201701010000.csv",stringsAsFactors = FALSE)
consommation<-read.csv("C:/Users/admin/Desktop/Certificat Datascientist/PROJET/cdc_conso.csv", sep=";",stringsAsFactors = FALSE)
production<-read.csv("C:/Users/admin/Desktop/Certificat Datascientist/PROJET/cdc_prod_par_filiere.csv",sep=";",stringsAsFactors = FALSE)

#creation des objets Rdata
save(prix, file="prix.Rdata")
save(consommation, file="consommation.Rdata")
save(production, file="production.Rdata")

#load des objets
load("prix.Rdata")
load("consommation.Rdata")
load("production.Rdata")


plot(prix)




