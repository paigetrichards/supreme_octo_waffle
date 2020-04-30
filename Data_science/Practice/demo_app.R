#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny) #these will be used as globally accessible
library(tidyverse)
theme_set(theme_minimal())


# Define UI for application that draws a histogram. UI = client whoever visits the website. User interface. Whatever the users see
ui <- fluidPage( #page that is fluid
    
    # Application title
    titlePanel("Sepal Length Histogram"), #title for the graph
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
            ## Content in the sidebarPanel. This is a widget! 
            sliderInput("user_bins",             ### The value will be stored in input$user_bins
                        "Number of bins:",  ### Text prompt for user
                        min = 1,            ### Minimum value allowed from user. This is reactive!
                        max = 50,           ### Maximum value allowed from user. This is reactive!
                        value = 30),         ### Default value. Value that is defaulted when the app opens
            
            ###input$which_species
            selectInput(inputId ="which_species", 
                        label = "Which species would you like to view?", 
                        choices = c("setosa",
                                    "virginica",
                                    "versicolor",
                                    "All"), 
                        selected = "setosa"),#dont need a comma and setosa is the default
            radioButtons("make_it_facet",
                         "Should we facet SECOND PLOT by species?",
                         choices = c("No", "Yes"), selected = "No"),
            #radioButtons
            actionButton("run_me", "GO!!!!!!")
        ), # HAS A COMMA since next code line is a function. Needs to have a comma because there is a new function. NO COMMA NEEDED IF YOU HAVE A PARANTHESIS AFTER A PARANTHESIS. Closes sidebar panel
        
           
                    
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("firstPlot"),
            br(),
            br(),
            plotOutput("secondPlot", height = "300px")# DOES NOT HAVE A COMMA since next code line is )  <- closing paranthesis
        ) #this closes mainPanel
    ) #This closes out sidebarLayout
) #MAKE SURE TO KEEP TRACK OF PARANTHESIS AND COMMAS!!!! This closes out fluidpage

# Define server logic required to draw a histogram. Background stuff that the user never sees
server <- function(input, output) { #baseline! This is a template concept. Input is anything the server is doing. The output is the response that the server needs to do in regards to the input
    
##NOT ALLOWED TO HAVE REGULAR R CODE in SHINY
    
    subset_iris <- reactive({
        if (input$which_species == "All") {
            iris
        } else{iris %>%
                filter(Species == input$which_species)
            }
    }) #define a variable like this!
    
    output$firstPlot <- renderPlot({ #renderPlot can only go with plot Output. Takes paranthesis AND curly bracket
        subset_iris() %>% ##use the REACTIVE variable. make sure it has paranthesis
        ggplot(aes(x = Sepal.Length)) + 
            geom_histogram(bins = input$user_bins, ## Aha!!!! Using the input variable. Need this for a response! Nothing will happen if you don't include THIS LINE
                           fill = "dodgerblue", 
                           color = "purple") + 
            labs(x = "Sepal Length (cm)", y = "Count", title = input$which_species) #can add a title show with title = input$user_bins to make it show the number of bins
    })
    
    observeEvent(input$run_me, {
        output$secondPlot <- renderPlot({ #renderPlot can only go with plot Output. Takes paranthesis AND curly bracket
            iris %>%
                ggplot(aes(x = Petal.Length)) + 
                geom_histogram(bins = input$user_bins, ## Aha!!!! Using the input variable. Need this for a response! Nothing will happen if you don't include THIS LINE
                           fill = "maroon",
                           alpha = 0.4, 
                           color = "firebrick") + 
                labs(x = "Petal Length (cm)", y = "Count") -> second_hist
        
            if(input$make_it_facet == "Yes"){
                second_hist <- second_hist + facet_wrap(~Species) #if the selection
            }
            ## return it back
            second_hist
        })
    })
}







# Run the application 
shinyApp(ui = ui, server = server)
