# надо посчитать среднее по файлам
#попробуем сначала взять среднее в одном файле.
setwd("specdata")
data <- read.csv("001.csv")
mean(data[, "sulfate"], na.rm = T) # mean(data$sulfate, na.rm = T) можно тоже, но
#                                   в такой синтаксис не включить переменную

#теперь заменим названия переменными
directory <- "specdata"
setwd(directory)

id<-1
fname<-paste("00", id, ".csv", sep="") 
data <- read.csv(fname)

pollutant <-"sulfate"
mean(data[,pollutant], na.rm = T)



data <- read.csv("001.csv")
mean(data$sulfate, na.rm = T)



pollutantmean <- function (directory, pollutant, id=1:332) {
        setwd(directory)
            mean(id$pollutant, na.rm = TRUE)
}
directory="specdata"
