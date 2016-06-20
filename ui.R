   shinyUI(pageWithSidebar(
  headerPanel('Developing Data Products - Course Project'),
    sidebarPanel(
     h3('Instructions'),
     p('Enter the State, and diseases type to find the best hospital (i.e. lowest) 30-day mortality for 
       the specific disease in that state.'),
    h4('Please enter the 2-character abbreviated name of a state and a disease type below.'),
    selectInput('State', 'State', choices=list('AL'='AL', 'AK'='AK', 'AZ'='AZ', 'AR'='AR', 'CA'='CA', 'CO'='CO',
                                    'CT'='CT', 'DC'='DC', 'DE'='DE', 'FL'='FL', 'GA'='GA', 'GU'='GU', 'HI'='HI', 'ID'='ID',
                                    'IL'='IL', 'IN'='IN', 'IA'='IA', 'KS'='KS', 'KY'='KY', 'LA'='LA',
                                    'ME'='ME', 'MD'='MD', 'MA'='MA', 'MI'='MI', 'MN'='MN', 'MS'='MS',
                                    'MO'='MO', 'MT'='MT', 'NE'='NE', 'NV'='NV', 'NH'='NH', 'NJ'='NJ',
                                    'NM'='NM', 'NY'='NY', 'NC'='NC', 'ND'='ND', 'OH'='OH', 'OR'='OR', 
                                    'OK'='OK', 'PA'='PA', 'PR'='PR', 'RI'='RI', 'SC'='SC', 'SD'='SD', 'TN'='TN',
                                    'TX'='TX', 'UT'='UT', 'VA'='VA', 'VI'='VI', 'VT'='VT', 'WA'='WA', 'WV'='WV',
                                    'WI'='WI', 'WY'='Wy')
                                    ),
    radioButtons('outcome', 'Type of Disease:', choices = list ('heart attack' = 'heart attack',
                                                   'heart failure' = 'heart failure',
                                                   'pneumonia' = 'pneumonia')),
    submitButton('Submit')
                    ),
  mainPanel(
    h3('Best Hospital'),
    h4('You entered:'),
    verbatimTextOutput('inputvalues'),
    h4('Name of best hospital:'),
    verbatimTextOutput('besthospital'),
    h3('Method'),
    p('I write a function that take two arguments: the 2-character abbreviated name of a state 
      and three different types of diseases. I use outcome-of-care-measures.csv file which contains
      information about 30-day mortality and readmission rates for heart attacks, heart failure, 
      and pneumonia for over 4,000 hospitals. The outcome is the name of hospital that has the 
      best (i.e. lowest) 30-day mortality for the specified diseases in that state.')
  )
))
