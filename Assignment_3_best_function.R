# Llegir i importar les dades

outcome_care <- read.csv("C:/Users/ignas/OneDrive/Escritorio/Programming_3/outcome-of-care-measures.csv", colClasses = "character")

View(outcome_care)

ncol(outcome_care)


# Histogram of 30 days death rate heart attack

outcome_care_2 <- as.numeric(outcome_care[,11])

hist(outcome_care_2)


# Finding the best hospital in a state

## Esquema de com ha de ser la funció proporcionat amb l'enunciat

best <- function(state, outcome){
  
  state 
  # Read outcome data
  
  # Check the state and outcome are valid
  
  # Return hospital name in that state with the lowest
  # 30 day death rate 
}

## Obtenir el nom complet de les tres variables d'interès

colnames(outcome_care[11])
colnames(outcome_care[17])
colnames(outcome_care [23])


# L'Hospital de tot el país amb menys morts per atac de cor

outcome_care$Hospital.Name[min(as.numeric(outcome_care[,11]), na.rm = TRUE)]


# Creem un objecte nou (V) que emmagatzema la variable d'interes dins l'estat d'interes.
# L'objecte serveix per poder simplificar el codi.

V <- as.numeric(outcome_care[,11])[outcome_care$State == "AL"]


# Amb aquest fragment trobem l'Hospital de l'estat amb el menor valor per a la variable d'interès.

outcome_care$Hospital.Name[min(V, na.rm = TRUE)]


# Creem la funció "best"

best <- function(state, outcome){
  
  if((outcome == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" | 
           outcome == "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" |
           outcome == "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia") == FALSE){
    stop("Error: argumento outcome incorrecto ")
  }
  

  if(state %in% outcome_care$State == FALSE){stop("Error: argumento state incorrecto ")}
  
  
  V <- as.numeric(outcome_care[,11])[outcome_care$State == state]
  
  outcome_care$Hospital.Name[min(V, na.rm = TRUE)]
  
}



best("DE", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")

unique(outcome_care$State)



