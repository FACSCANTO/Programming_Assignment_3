# rankall <- function(outcome, num = "best")


outcome_care <- read.csv(
  "C:/Users/ignas/OneDrive/Escritorio/Programming_3/outcome-of-care-measures.csv",
  colClasses = "character")


rankall <- function(outcome, num, outcome_care) {
  
  if (!outcome %in% c(11, 17, 23)) {
    stop("Error: argumento outcome incorrecto")
  }
  
  if(num > length(outcome_care[,outcome])){
    stop("Error: num fuera de rango")
  }

States <- unique(outcome_care$State)

rank_all_names <- c()
ab_states <- c()

for(i in States){
  
  data_state <- outcome_care[outcome_care$State == i, ]
  
  values <- as.numeric(data_state[, outcome])
  data_state <- data_state[!is.na(values), ]
  
  data_state <- data_state[
    order(as.numeric(data_state[, outcome]),
          data_state$Hospital.Name),]
  
  
  rank_all_names <- c(rank_all_names, data_state$Hospital.Name[num])
  ab_states <- c(ab_states, i)
  
}

data.frame(rank_all_names, ab_states)

}


States <- unique(outcome_care$State)


rankhospital("AK", 11, 1, outcome_care)

rankall(11, 1, outcome_care)





       