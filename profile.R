Rprof()
start <- Sys.time()

setwd("C:/Users/Jeb Gary/Documents/UT Documents/BZAN 583/HW/HW2")
dataold <- read.csv("Email Records.csv")
dataold <- dataold[1:10000,]
dataold <- dataold[,c("E.Mail"),drop = FALSE]
dataold$First_Name <- NA
dataold$Last_Name <- NA
dataold$Domain <- NA
for (i in 1:nrow(dataold)) {
  email_parts <- unlist(strsplit(dataold$E.Mail[i], "@"))
  name_parts <- unlist(strsplit(email_parts[1], "\\."))
  dataold$First_Name[i] <- name_parts[1]
  dataold$Last_Name[i] <- name_parts[length(name_parts)] 
  dataold$Domain[i] <- email_parts[2]
}


Rprof(NULL)
summaryRprof()
Sys.time() - start