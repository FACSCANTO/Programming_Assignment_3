# Llegir i importar les dades

outcome_care <- read.csv("C:/Users/ignas/OneDrive/Escritorio/Programming_3/outcome-of-care-measures.csv", colClasses = "character")

View(outcome_care)



# Histogram of 30 days death rate heart attack

outcome_care_2 <- as.numeric(outcome_care[,11])

hist(outcome_care_2)


# Funció best programming assignment 3: 2a versió funcional

best <- function(state, outcome){
  
  outcome_care <- read.csv(
    "C:/Users/ignas/OneDrive/Escritorio/Programming_3/outcome-of-care-measures.csv",
    colClasses = "character")
  
  if((outcome == 11 | outcome == 17 | outcome == 23) == FALSE){
    stop("Error: argumento outcome incorrecto ")
  }
  
  if(state %in% outcome_care$State == FALSE){stop("Error: argumento state incorrecto ")}
  
  outcome_care_2 <- outcome_care[outcome_care$State == state,]
  
  outcome_care_3 <- outcome_care_2[order(outcome_care_2[,outcome]),]
  
  outcome_care_3$Hospital.Name[1]
}


best("NY", 11)

# Comprovar si el codi fucniona correctament

outcome_care$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[
  outcome_care$Hospital.Name == "GLENDALE ADVENTIST MEDICAL CENTER"
  
  