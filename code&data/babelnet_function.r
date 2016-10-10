library(httr)
library(jsonlite)

keyAPI="ddc6c5c1-7a1c-40f3-9610-04411beedd5e"

get_babelnet_version=function(key=keyAPI) {
    r <- GET(paste0("https://babelnet.io/v4/getVersion?key","&key=",key))
   return(content(r)$version)
}


get_babelnet_SynsetIds=function(word,langs="IT",filterLang="IT",pos="NOUN",key=keyAPI) {
  
   r <- GET(paste0("https://babelnet.io/v4/getSynsetIds?word=",word,"&langs=",langs,"&filterLangs=",filterLang,"&pos=",pos,"&key=",key))
  
   df_getSynsetIds=data.frame(id=sapply(httr::content(r),function(x) x$id),
                             pos=sapply(httr::content(r),function(x) x$pos),
                             source=sapply(httr::content(r),function(x) x$source))
  return(df_getSynsetIds)
}

get_babelnet_Synset=function(id,filterLang="IT",key=keyAPI) {
  
  r <- GET(paste0("https://babelnet.io/v4/getSynset?id=",id,"&key=",key,"&filterLangs=",filterLang))
  
  df_getSynsetId=data.frame(lemma=lapply(httr::content(r)[[1]],function(x) x$lemma),
                            simpleLemma=lapply(httr::content(r)[[1]],function(x) x$simpleLemma),
                            source=sapply(httr::content(r)[[1]],function(x) x$source),
                            id=sapply(httr::content(r)[[1]],function(x) x$synsetID$id))
  return(df_getSynsetId)
}

get_babelnet_Senses=function(word,lang_1="IT",lang_2="EN",pos="NOUN",key=keyAPI) {
  
  r <- GET(paste0("https://babelnet.io/v4/getSenses?word=",word,"&lang=",lang_1,"&lang=",lang_2,"&pos=",pos,"&key=",key))
  
  df_sense=data.frame(lemma=sapply(httr::content(r),function(x) x$lemma),
                      synsetID=sapply(httr::content(r),function(x) x$synsetID$id),
                      language=sapply(httr::content(r),function(x) x$language),
                      synsetIDpos=sapply(httr::content(r),function(x) x$synsetID$pos),
                      synsetIDsource=sapply(httr::content(r),function(x) x$synsetID$source))
  return(df_sense)                    
}


get_babelnet_Edges=function(id,key=keyAPI,langs="IT") { 
  
  rgraph <- GET(paste0("https://babelnet.io/v4/getEdges?id=",id,"&key=",key))
  
  df_graph=data.frame(language=sapply(content(rgraph),function(x) x$language),
                      target=sapply(content(rgraph),function(x) x$target),
                      weight=sapply(content(rgraph),function(x) x$weight),
                      pointername=sapply(content(rgraph),function(x) x$pointer$name),
                      pointershortName=sapply(content(rgraph),function(x) x$pointer$shortName))
  if ( langs != ""){
  df_graph=df_graph[which(df_graph$language==langs),]
  }
  return(df_graph)
}

