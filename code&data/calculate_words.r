options(java.parameters = "-Xmx1024m")

library(XLConnect)
library(rTwChannel)

setwd("/home/alf/Scrivania/lav_perugia/twitter_social")

source("babelnet_function.r")


words_meteo=c("alluvione","maltempo","meteo","nubifragio","pioggia","temporale","acquazzone","ciclone","tornado","precipitazione","rovescio","grandine","fulmin","diluvio")
repubblica_freq=c(50343, 2478,3093,504,654, 19038,7161,463,2277,322,1982,2745, 507,2545,1323)

res=list()

for ( i in 1:length(words_meteo)) {
                                   res[[i]]=get_babelnet_Senses(words_meteo[i])
}

freq=data.frame(words_meteo=words_meteo,Noun=unlist(lapply(res,nrow)))

#########################################################################################################################à

maltempo_df=readRDS("maltempo_dfx.rds")
meteouser_df=readRDS("meteouser_dfx.rds")
chiparla_df=readRDS("chiparla_dfx.rds")
#########################################################################################################################à


freq_maltempo=sapply(words_meteo,function(x) length(grep(x,maltempo_df$message)))
freq_meteouser_df=sapply(words_meteo,function(x) length(grep(x,meteouser_df$message)))
freq_chiparla_df=sapply(words_meteo,function(x) length(grep(x,chiparla_df$message)))

freq=data.frame(freq,repubblica_freq=repubblica_freq,freq_maltempo=freq_maltempo,freq_meteouser_df=freq_meteouser_df,freq_chiparla_df=freq_chiparla_df)

