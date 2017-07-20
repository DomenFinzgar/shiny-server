library(shiny)
library(readxl)
library(data.table)
library(zoo)
library(DT)

#marjana_in<-
#head(t(marjana_in))

#marjana_out <-  t(na.locf(t(marjana_in), fromLast=F))

#head(data.table(marjana.out))

shinyServer(function(input, output) {
  
  
  output$contents <- DT::renderDataTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
     
      
      inFile <- input$file1
      
      if(is.null(inFile))
        return(NULL)
      file.rename(inFile$datapath,
                  paste(inFile$datapath, ".xlsx", sep=""))
    #marjana_out <-  t(na.locf(t(marjana_in), fromLast=F))
#############
    
    data_in  <-read_excel(paste(inFile$datapath, ".xlsx", sep=""), col_names=FALSE)
    
    ### podvoji vrednosti prenovljeno. TO JE ZA NOV APP!
    data_out <-  na.locf(t(data_in), fromLast=F)
    colnames(data_out)<-data_out[1,]
    data_out<-data_out[-1,]
    data_out<-data.table(data_out)
    
    data_out$`Sample Name`

    ### uštimaj popravke
    ###uvoz legende
    
    legenda=data.table(`Sample Name`=c("Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"csolfagus_05",	"csolfagus_05",	"csolfagus_05",	"csolfagus_05",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"concat_14_A_0",	"concat_14_A_0",	"concat_14_A_0",	"concat_14_A_0",	"sfc_1143",	"sfc_1143",	"sfc_1143",	"sfc_1143",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"csolfagus_06",	"csolfagus_06",	"csolfagus_06",	"csolfagus_06",	"csolfagus_29",	"csolfagus_29",	"csolfagus_29",	"csolfagus_29",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0"),
                       home=c("ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI"),
                       foreign=c("ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI"),
                       conversion=c(0,	4,	3,	-4,	0,	-1,	-3,	1,	0,	0,	-2,	-4,	2,	0,	-2,	4,	2,	0,	0,	-6,	-9,	6,	0,	-3,	9,	3,	0,	0,	6,	1,	-6,	0,	-5,	-1,	5,	0,	0,	-4,	-4,	4,	0,	0,	4,	0,	0,	0,	-5,	-5,	5,	0,	0,	5,	0,	0,	0,	-3,	-4,	3,	0,	-1,	4,	1,	0,	0,	-1,	-5,	1,	0,	-4,	5,	4,	0,	0,	-1,	-2,	1,	0,	-1,	2,	1,	0,	0,	-2,	-4,	2,	0,	-2,	4,	2,	0,	0,	4,	3,	-4,	0,	-1,	-3,	1,	0,	0,	-2,	-2,	2,	0,	0,	2,	0,	0,	0,	-1,	-2,	1,	0,	-1,	2,	1,	0,	0,	-7,	7,	0,	0,	5,	3,	-5,	0,	-2,	-3,	2,	0,	0,	-1,	-1,	1,	0,	0,	1,	0,	0,	0,	8,	0,	-8,	0,	-8,	0,	8,	0,	0,	3,	1,	-3,	0,	-2,	-1,	2,	0,	0,	-1,	1,	0,	0,	-4,	4,	0,	0,	1,	0,	-1,	0,	-1,	0,	1,	0,	0,	0,	0,	0,	0,	-2,	2,	0,	0,	-3,	-5,	3,	0,	-2,	5,	2,	0,	0,	-3,	-5,	3,	0,	-2,	5,	2,	0,	0,	3,	-2,	-3,	0,	-5,	2,	5,	0,	0,	-6,	-8,	6,	0,	-2,	8,	2,	0))
    
    #določitev popravka
    home_in<-input$home_in
    away_in<-input$away_in
    
    
    legenda<- legenda[legenda$home %in% home_in]
    legenda_final<-legenda[legenda$foreign %in% away_in]
    
    
    #Setkey
    #setkey(legenda_final, `Sample Name`)
    #setkey(data_out,`Sample Name`)
    
    #združi
    proba<-merge(data_out, legenda_final, sort=FALSE)
    proba$home<-NULL
    proba$foreign<-NULL
    
    
    #naredi matrike
    conversion_vector<-data.matrix(proba$conversion)
    proba$conversion<-NULL
    conversion_matrix<-data.matrix(proba[,-1])
    
    #popravljena matrika
    cor_matrix<-(conversion_matrix + c(conversion_vector))
    cor_matrix<-apply(cor_matrix, 2, function(x) ifelse(x < 20, 0, x))
    cor_table<-data.table(cor_matrix)
    
    
    
    
    #dodaj imena in obrni kot je bilo
    out<-t(cbind(proba[,1], cor_table))
    
    #zrihtaj tabelo da bo redi za samplanje
    sampling<-as.data.frame(out)
    sampling<-cbind(a=row.names(sampling), sampling)
    sampling1<-sampling[-1,]
    row.names(sampling1)<-1:nrow(sampling1)

    #ponavljanje samplanja:
    nr_cohorts<-input$nr_cohorts
    nr_samples_cohorts<-input$nr_samples_cohorts


    dep<-NULL
    for (i in 1:nr_cohorts){
      dep <- rbind(dep,  sampling1[sample(nrow(sampling1), nr_samples_cohorts,replace=F), ])
    }

    t_vzorcev<-as.data.frame(dep)
    row.names(t_vzorcev)<-1:nrow(t_vzorcev)

    colnames(t_vzorcev)<-c("`Sample Name`",proba$`Sample Name`)


    #dodaj Sample name
    t_vzorcev<-cbind(sample_cohort=rep(1:nr_cohorts, times = 1, length.out = NA, each = nr_samples_cohorts), t_vzorcev)


    
#############    
    datatable(out, extensions = 'Buttons',
              options = list(dom = 'Bfrtip',pageLength = 10000000,
                             buttons = c('copy', 'print',"excel","csv"),rownames= FALSE, colnames=FALSE))


   })


  output$contents2 <- DT::renderDataTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    
    inFile <- input$file1
    
    if(is.null(inFile))
      return(NULL)
    file.rename(inFile$datapath,
                paste(inFile$datapath, ".xlsx", sep=""))
    #marjana_out <-  t(na.locf(t(marjana_in), fromLast=F))
    #############
    
    data_in  <-read_excel(paste(inFile$datapath, ".xlsx", sep=""), col_names=FALSE)
    
    ### podvoji vrednosti prenovljeno. TO JE ZA NOV APP!
    data_out <-  na.locf(t(data_in), fromLast=F)
    colnames(data_out)<-data_out[1,]
    data_out<-data_out[-1,]
    data_out<-data.table(data_out)
    
    data_out$`Sample Name`
    
    ### uštimaj popravke
    ###uvoz legende
    
    legenda=data.table(`Sample Name`=c("Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aag01",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat04",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"Aat11",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFF3",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"NFH15",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"SF1",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat01",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat06",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"Aat15",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"NFF7",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"SFb4",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"csolfagus_31",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"FS1_15",	"csolfagus_05",	"csolfagus_05",	"csolfagus_05",	"csolfagus_05",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"csolfagus_19",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EEU75_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"EJV8T_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"ERHBI_A_0",	"concat_14_A_0",	"concat_14_A_0",	"concat_14_A_0",	"concat_14_A_0",	"sfc_1143",	"sfc_1143",	"sfc_1143",	"sfc_1143",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"sfc_0036",	"csolfagus_06",	"csolfagus_06",	"csolfagus_06",	"csolfagus_06",	"csolfagus_29",	"csolfagus_29",	"csolfagus_29",	"csolfagus_29",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"DUKCT_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"EMILIY_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DZ447_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0",	"DE576_A_0"),
                       home=c("ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"AUTH",	"AUTH",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI",	"ASP",	"ASP",	"ASP",	"AUTH",	"AUTH",	"AUTH",	"SFI",	"SFI",	"SFI"),
                       foreign=c("ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI",	"ASP",	"AUTH",	"SFI"),
                       conversion=c(0,	4,	3,	-4,	0,	-1,	-3,	1,	0,	0,	-2,	-4,	2,	0,	-2,	4,	2,	0,	0,	-6,	-9,	6,	0,	-3,	9,	3,	0,	0,	6,	1,	-6,	0,	-5,	-1,	5,	0,	0,	-4,	-4,	4,	0,	0,	4,	0,	0,	0,	-5,	-5,	5,	0,	0,	5,	0,	0,	0,	-3,	-4,	3,	0,	-1,	4,	1,	0,	0,	-1,	-5,	1,	0,	-4,	5,	4,	0,	0,	-1,	-2,	1,	0,	-1,	2,	1,	0,	0,	-2,	-4,	2,	0,	-2,	4,	2,	0,	0,	4,	3,	-4,	0,	-1,	-3,	1,	0,	0,	-2,	-2,	2,	0,	0,	2,	0,	0,	0,	-1,	-2,	1,	0,	-1,	2,	1,	0,	0,	-7,	7,	0,	0,	5,	3,	-5,	0,	-2,	-3,	2,	0,	0,	-1,	-1,	1,	0,	0,	1,	0,	0,	0,	8,	0,	-8,	0,	-8,	0,	8,	0,	0,	3,	1,	-3,	0,	-2,	-1,	2,	0,	0,	-1,	1,	0,	0,	-4,	4,	0,	0,	1,	0,	-1,	0,	-1,	0,	1,	0,	0,	0,	0,	0,	0,	-2,	2,	0,	0,	-3,	-5,	3,	0,	-2,	5,	2,	0,	0,	-3,	-5,	3,	0,	-2,	5,	2,	0,	0,	3,	-2,	-3,	0,	-5,	2,	5,	0,	0,	-6,	-8,	6,	0,	-2,	8,	2,	0))
    
    #določitev popravka
    home_in<-input$home_in
    away_in<-input$away_in
    
    
    legenda<- legenda[legenda$home %in% home_in]
    legenda_final<-legenda[legenda$foreign %in% away_in]
    
    
    #Setkey
    #setkey(legenda_final, `Sample Name`)
    #setkey(data_out,`Sample Name`)
    
    #združi
    proba<-merge(data_out, legenda_final, sort=FALSE)
    proba$home<-NULL
    proba$foreign<-NULL
    
    
    #naredi matrike
    conversion_vector<-data.matrix(proba$conversion)
    proba$conversion<-NULL
    conversion_matrix<-data.matrix(proba[,-1])
    
    #popravljena matrika
    cor_matrix<-(conversion_matrix + c(conversion_vector))
    cor_matrix<-apply(cor_matrix, 2, function(x) ifelse(x < 20, 0, x))
    cor_table<-data.table(cor_matrix)
    
    #dodaj imena in obrni kot je bilo
    out<-t(cbind(proba[,1], cor_table))
    
    #zrihtaj tabelo da bo redi za samplanje
    sampling<-as.data.frame(out)
    sampling<-cbind(a=row.names(sampling), sampling)
    sampling1<-sampling[-1,]
    row.names(sampling1)<-1:nrow(sampling1)
    
    #ponavljanje samplanja:
    nr_cohorts<-input$nr_cohorts
    nr_samples_cohorts<-input$nr_samples_cohorts
    
    
    dep<-NULL
    for (i in 1:nr_cohorts){
      dep <- rbind(dep,  sampling1[sample(nrow(sampling1), nr_samples_cohorts,replace=F), ])
    }
    
    t_vzorcev<-as.data.frame(dep)
    row.names(t_vzorcev)<-1:nrow(t_vzorcev)
    
    colnames(t_vzorcev)<-c("`Sample Name`",proba$`Sample Name`)
    
    
    #dodaj Sample name
    t_vzorcev<-cbind(sample_cohort=rep(1:nr_cohorts, times = 1, length.out = NA, each = nr_samples_cohorts), t_vzorcev)
    
    
    
    #############    
    datatable(t_vzorcev, extensions = 'Buttons',
              options = list(dom = 'Bfrtip',pageLength = 10000000,
                             buttons = c('copy', 'print',"excel","csv"),rownames= FALSE, colnames=FALSE))
    
    
  })    

    



})
