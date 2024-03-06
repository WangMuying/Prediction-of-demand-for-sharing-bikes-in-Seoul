
library(mlr)
data <- read.csv(file='../data/SeoulBikeData.csv')
# no missing data
sum(is.na(data))

dates <- as.Date(data$Date, "%d/%m/%Y")
weekday <- weekdays(dates)
weekend<-ifelse(c(weekday=="Saturday"|weekday=="Sunday"),1,0)

data$Holiday <- ifelse(data$Holiday == 'Holiday', 1, 0)
data$Functioning.Day <- ifelse(data$Functioning.Day == 'Yes', 1, 0)

data1 <- cbind(data,createDummyFeatures(data$Seasons), createDummyFeatures(weekday), weekend)

new_data <- subset(data1, select = -c(Date,Seasons,Winter,Sunday))

colnames(new_data) <- c("count","hour","temp","hum","wind","visb","dew","solar",
                        "rain","snow","holiday","funcday","autumn","spring","summer",
                        "friday","monday","saturday","thursday","tuesday","wednesday","weekend")

write.csv(new_data,"new_SeoulBikeData.csv")