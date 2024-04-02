library(data.table)
library(stringr)

Rprof()
start <- Sys.time()

columns_to_read = c("E Mail")
datanew <- fread("Email Records.csv", select = columns_to_read)
datanew <- datanew[1:10000,]


datanew[, First_Name := str_extract(`E Mail`, "^[^.]+")]
datanew[, Last_Name := str_extract(`E Mail`, "(?<=\\.)[^@]+")]
datanew[, Domain := str_extract(`E Mail`, "(?<=@)[^.]+\\..+")]

Rprof(NULL)
summaryRprof()
Sys.time() - start

