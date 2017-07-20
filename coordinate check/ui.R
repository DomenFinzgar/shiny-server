shinyUI(fluidPage(
  titlePanel('  Check country data'),
  sidebarLayout(
    sidebarPanel(
    fileInput('file1', 'Choose your local allele size file in Excel format (.xlsx)',
              accept=c('.xlsx')),
    selectInput("country", label = h3("Select country"), 
                choices = list("Albania" = "Albania",	"Austria" = "Austria",	
                               "Belgium" = "Belgium",	"Bielorussia" = "Bielorussia",	
                               "Bosnia" = "Bosnia",	
                               "Bosnia and Herzegovina" = "Bosnia and Herzegovina",	
                               "Bulgaria" = "Bulgaria",	"Croatia" = "Croatia",	
                               "Cyprus" = "Cyprus",	"Czech Republic" = "Czech Republic",	
                               "Denmark" = "Denmark",	"England" = "England",	
                               "Estland" = "Estland",	"Estonia" = "Estonia",	
                               "Finland" = "Finland",	"France" = "France",	
                               "Germany" = "Germany",	"Greece" = "Greece",	
                               "Hungary" = "Hungary",	"Ireland" = "Ireland",	
                               "Italia" = "Italia",	"Italy" = "Italy",	
                               "Kosovo" = "Kosovo",	"Latvia" = "Latvia",	
                               "Lettonia" = "Lettonia",	"Lithuania" = "Lithuania",	
                               "Luxembourg" = "Luxembourg",	"Macedonia" = "Macedonia",	
                               "Malta" = "Malta",	"Montenegro" = "Montenegro",	
                               "Netherlands" = "Netherlands",	"Norway" = "Norway",	
                               "Poland" = "Poland",	"Portugal" = "Portugal",	
                               "Romania" = "Romania",	"Scotland" = "Scotland",	
                               "Serbia" = "Serbia",	"Slovak Republic" = "Slovak Republic",	
                               "Slovakia" = "Slovakia",	"Slovenia" = "Slovenia",	
                               "Spain" = "Spain",	"Sweden" = "Sweden",	
                               "Switzerland" = "Switzerland",	"Ukraine" = "Ukraine",	
                               "Ukraine - Crimea" = "Ukraine - Crimea",	
                               "United Kingdom" = "United Kingdom"), 
                selected = 1),
    #strong('HOW TO CITE:'),
    #p('Finzgar D. 2017 Allele size calculator and sampler. https://lifegenmon.shinyapps.io/allelesize/'),
    #a("Contact author",     href="mailto:domen.finzgar@gozdis.si"),
    #p('Packages used: DT, zoo, readxl, data.table')),

  mainPanel(
    tabsetPanel(
      tabPanel("Instructions",
             strong('Allele size calculator and sampler is a combination of two tools. Calculator automatically 
      converts allele size according to the ring test that was performed between
                    3 laboratories from Germany (ASP), Greece (AUTH) and Slovenia (SFI) during
                    LIFEGENMON project. Its Output can be find in TABLE 1. The Sampler allows user to perform random sampling
                    with desired number of cohorts and samples per cohort. Sampler output can be found in TABLE 2'),
             p(),
             p('COLUMN NAMES SHOULD BE (case sensitive): Sample Name, "marker1", "marker2", etc...'),
             p('Currently supported markers: Aag01,	Aat01,	Aat04,	Aat06,	Aat11,	Aat15,	concat_14_A_0,	csolfagus_05,	csolfagus_06,	
               csolfagus_19,	csolfagus_29,	csolfagus_31,	DE576_A_0,	
               DUKCT_A_0,	DZ447_A_0,	EEU75_A_0,	EJV8T_A_0,	EMILIY_A_0,	
               ERHBI_A_0,	FS1_15,	NFF3,	NFF7,	NFH15,	SF1,	SFb4,	
               sfc_0036,	sfc_1143 '),
             p('NOTE THAT ALL MARKER NAMES SHOULD BE NAMED EXACTLY AS STATED ABOVE. (CASE SENSITIVE!)'),
             p('If you want to use ony the Sampler, make sure that your home and "convert" options 
               are the same. If you want to use Calculator only, simply ignore options 
               "Number of cohorts" and "Number of samples per cohort"'),
             p('after the xlsx file is loaded, the table is being automatically processed and user can
               download the processed data in a desired format (csv, xlss, or printed) '),
             p(),
             p(  strong('Fig1: How should your excel file look like'),
                 img(src='example_www.png', align = "left")),
             br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),br(),
             p(strong('Fig2: If you get no score for a given sample, write zero (0) for both alleles.'),
               img(src='no_score.png', align = "left"))),
             
             
             

               
    tabPanel("Plot", 
             ggiraph::ggiraphOutput("plot")), 
  ))
    
  )  


  
))
