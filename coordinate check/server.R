library(data.table)
library(rnaturalearth)
library(sp)
library(rgeos)
library(broom)
library(dplyr)
library(tidyr)
library(ggplot2)
library(hrbrthemes)
library(mapview)
library(stringr)
suppressPackageStartupMessages(library(ggiraph))

#marjana_in<-
#head(t(marjana_in))

#marjana_out <-  t(na.locf(t(marjana_in), fromLast=F))

#head(data.table(marjana.out))

shinyServer(function(input, output) {
  
  output$plot <- renderggiraph({
    
    diversity_measures <- as.data.table(read.csv("diversity_measures_all_markers.csv", header=T, sep = ";", encoding="UTF-8"))
    frequency_measures <- as.data.table(read.csv("frequency_measures.csv", header=T, sep = ";", encoding="UTF-8") )
    populations_datasets <- as.data.table(read.csv("populations_datasets_review.csv", header=T, sep = ",", encoding="UTF-8")) 
    projects_datasets <- as.data.table(read.csv("projects_datasets.csv", header=T, sep = ";", encoding="UTF-8") )
    genotypic_measures<-as.data.table(read.csv("genotypic_measures.csv", header=T, sep = ";", encoding="UTF-8") )
    euforgen_members<-as.data.table(read.csv("euforgen_member.csv", header=T, sep = ";", encoding="UTF-8") )
    
    #########
    #add projects_datasets
    diversity_measures<-merge(diversity_measures,projects_datasets, by="dataset_name")
    frequency_measures<-merge(frequency_measures,projects_datasets, by="dataset_name")
    populations_datasets<-merge(populations_datasets,projects_datasets, by="dataset_name")
    genotypic_measures<-merge(genotypic_measures, projects_datasets, by="dataset_name")
    
    
    ## SETKEY for faster results
    setkey(diversity_measures,population_name)
    setkey(frequency_measures,population_name)
    setkey(populations_datasets,population_name)
    setkey(genotypic_measures,population_name)
    
    #mergaj da dobiš megabazo
    #merge(diversity_measures, frequency_measures, all.x=TRUE)
    #merge(diversity_measures, frequency_measures, all.x=TRUE)
    
    ##########
    #PREPARE EUROPE!
    world <- rnaturalearth::countries110
    europe <- world[world$region_un=="Europe"&world$name!='Russia',]
    # plot(europe)
    # Let's add a unique ID column to our data.
    europe@data$id <- row.names(europe@data)
    
    #merge additional data (20.7.2017 - EUFORGEN)
    europe@data<-merge(europe@data,euforgen_members, by="name_long")
    
    # A bounding box for continental Europe.
    europe.bbox <- SpatialPolygons(list(Polygons(list(Polygon(
      matrix(c(-25,29,45,29,45,75,-25,75,-25,29),byrow = T,ncol = 2)
    )), ID = 1)), proj4string = CRS(proj4string(europe)))
    # Get polygons that are only in continental Europe.
    europe.clipped <-
      rgeos::gIntersection(europe, europe.bbox, byid = TRUE, id=europe$id)
    #GGPLOT REQUIRES TIDY data!
    europe.tidy <- broom::tidy(europe.clipped)
    europe.tidy <- dplyr::left_join(europe.tidy, europe@data, by='id')
    
    #### GGPLOT2 STATIC
    
    max(populations_datasets$latitude) #COORDINATE PROBLEMS!!!!
    
    
    ### EXCLUDE NON EU countries
    populations_datasets_EUROPE<-populations_datasets[populations_datasets$country=='Germany'| 
                                                        populations_datasets$country=='United Kingdom'| 
                                                        populations_datasets$country=='France'| 
                                                        populations_datasets$country=='Italy'| 
                                                        populations_datasets$country=='Spain'| 
                                                        populations_datasets$country=='Ukraine'| 
                                                        populations_datasets$country=='Poland'| 
                                                        populations_datasets$country=='Romania'| 
                                                        populations_datasets$country=='Netherlands'| 
                                                        populations_datasets$country=='Belgium'| 
                                                        populations_datasets$country=='Greece'| 
                                                        populations_datasets$country=='Czech Republic'| 
                                                        populations_datasets$country=='Portugal'| 
                                                        populations_datasets$country=='Sweden'| 
                                                        populations_datasets$country=='Hungary'| 
                                                        populations_datasets$country=='Belarus'| 
                                                        populations_datasets$country=='Serbia'| 
                                                        populations_datasets$country=='Austria'| 
                                                        populations_datasets$country=='Switzerland'| 
                                                        populations_datasets$country=='Bulgaria'| 
                                                        populations_datasets$country=='Denmark'| 
                                                        populations_datasets$country=='Finland'| 
                                                        populations_datasets$country=='Slovakia'| 
                                                        populations_datasets$country=='Norway'| 
                                                        populations_datasets$country=='Ireland'| 
                                                        populations_datasets$country=='Croatia'| 
                                                        populations_datasets$country=='Moldova'| 
                                                        populations_datasets$country=='Bosnia and Herzegovina'| 
                                                        populations_datasets$country=='Albania'| 
                                                        populations_datasets$country=='Lithuania'| 
                                                        populations_datasets$country=='TFYR Macedonia'| 
                                                        populations_datasets$country=='Slovenia'| 
                                                        populations_datasets$country=='Latvia'| 
                                                        populations_datasets$country=='Estonia'| 
                                                        populations_datasets$country=='Montenegro'| 
                                                        populations_datasets$country=='Luxembourg'| 
                                                        populations_datasets$country=='Malta'| 
                                                        populations_datasets$country=='Iceland'| 
                                                        populations_datasets$country=='Andorra'| 
                                                        populations_datasets$country=='Liechtenstein'| 
                                                        populations_datasets$country=='Monaco'| 
                                                        populations_datasets$country=='San Marino'| 
                                                        populations_datasets$country=='Holy See'| 
                                                        populations_datasets$country=='England']
    #####
    #Make a country switch
    populations_datasets_EUROPE<-
      populations_datasets_EUROPE[populations_datasets_EUROPE$country=='Slovenia']
    
    
    #populations_datasets_EUROPE<-
    #populations_datasets[populations_datasets$latitude=='Germany'|
    
    
    
    
    #DELETE INDIVIDUAL NAMES
    populations_datasets_EUROPE$individual_name<-NULL
    #delete duplicate rows
    EU_nondup<-populations_datasets_EUROPE[!duplicated(populations_datasets_EUROPE),]
    
    a<-ggplot()+
      geom_polygon_interactive(data=europe.tidy, alpha=0.8,color='black', 
                               aes(long, lat, group=group, fill=member_of_EUFORGEN,
                                   tooltip=sprintf("%s<br/>%s",iso_a3,remarks_EUFORGEN))) +
      coord_map("azequalarea") +
      hrbrthemes::theme_ipsum_rc() +
      #viridis::scale_fill_viridis(
      #name='Median GDP \n(in Billions)', direction = -1, labels=scales::dollar) +
      labs(x=NULL, y=NULL, 
           title='Members of EUFORGEN \nContinental Europe & Iceland',
           caption='Source: EVOLTREE GD^2 database and \nhttp://www.euforgen.org/member-countries/')+
      geom_point_interactive(data=EU_nondup, 
                             aes(x=longitude, y=latitude, 
                                 tooltip=sprintf("%s<br/>%s",
                                                 country,
                                                 dataset_name)), color="red")
    ggiraph(code=print(a))
    
  })

})
