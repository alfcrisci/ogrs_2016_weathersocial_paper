library(ggplot2)

setwd("/home/alf/Scrivania/lav_perugia/twitter_social")

numerosity=read.csv("numerosity.csv")

p_rep <- qplot(sem_con_cat ,repubblica_freq,data=numerosity[2:7,],label=words_meteo) + geom_text(check_overlap = F) + stat_smooth()+xlab("Semantic Connection \n From babelnet.org Semantic Category Meteorology")+ylab("Corpus La Repubblica Lex.it Pisa")
ggsave("p_rep.png",p_rep)

p_malt <- qplot(sem_con_cat ,freq_maltempo,data=numerosity[2:7,],label=words_meteo) + geom_text(check_overlap = F) + stat_smooth()+xlab("Semantic Connection \n From babelnet.org Semantic Category Meteorology")+ylab("Corpus Twitter Corpus Channel Maltempo DISIT")
ggsave("p_malt.png",p_malt)

p_users<- qplot(sem_con_cat ,freq_meteouser_df,data=numerosity[2:7,],label=words_meteo) + geom_text(check_overlap = F) + stat_smooth()+xlab("Semantic Connection \n From babelnet.org Semantic Category Meteorology")+ylab("Corpus Twitter Corpus Channel MeteoUsers DISIT")
ggsave("p_users.png",p_users)

p_chiparla_df<- qplot(sem_con_cat ,freq_chiparla_df,data=numerosity[2:7,],label=words_meteo) + geom_text(check_overlap = F) + stat_smooth()+xlab("Semantic Connection \n From babelnet.org Semantic Category Meteorology")+ylab("Corpus Twitter Corpus Channel MeteoUsers DISIT")
ggsave("p_chiparla_df.png",p_chiparla_df)

