# rankhospital("MD", "heart failure", 5)

# Output example 1:
## rankhospital("TX", "heart failure", 4)
## [1] "DETAR HOSPITAL NAVARRO"

# Output example 2:
## rankhospital("MN", "heart attack", 5000)
## [1] NA

outcome_care <- read.csv(
  "C:/Users/ignas/OneDrive/Escritorio/Programming_3/outcome-of-care-measures.csv",
  colClasses = "character")


rankhospital <- function(state, outcome, num = "best", outcome_care) {
  
  if (!outcome %in% c(11, 17, 23)) {
    stop("Error: argumento outcome incorrecto")
  }
  
  if (!(state %in% outcome_care$State)) {
    stop("Error: argumento state incorrecto")
  }
  
  data_state <- outcome_care[outcome_care$State == state, ]
  
  values <- as.numeric(data_state[, outcome])
  data_state <- data_state[!is.na(values), ]
  
  data_state <- data_state[
    order(as.numeric(data_state[, outcome]),
          data_state$Hospital.Name),
  ]
  
  data_state$Hospital.Name[num]
}



rankhospital("TX", 17, 4, outcome_care)
rankhospital("MN", 11, 5000, outcome_care)
