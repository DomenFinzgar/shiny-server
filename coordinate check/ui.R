shinyUI(fluidPage(
  
    h3('Coordinate checker GD2 (for Europe)') ,
    
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
    ggiraph::ggiraphOutput("plot", width="900", height="900")
    
  )
)
