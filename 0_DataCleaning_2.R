
dat <- read.csv("../data/new_SeoulBikeData.csv",
                header = T, check.names = F)
attach(dat)

# create a new column for four season
# encoding: winter 0, autumn 1, spring 2, summer 3
spring <- spring*2
summer <- summer*3
dat$season <- autumn+spring+summer

season_fac <- factor(dat$season, levels = c(0,1,2,3), 
                     labels = c("winter","autumn","spring","summer"))


# create a new column for day
# encoding: sunday 0, monday 1, tue 2, wed 3, thur 4, fri 5, sat 6
tue <- tuesday*2
wed <- wednesday*3
thur <- thursday*4
fri <- friday*5
sat <- saturday*6

dat$day <- monday+tue+wed+thur+fri+sat
day_fac <- factor(dat$day, level = c(0,1,2,3,4,5,6),
                  labels = c("sunday","monday","tuesday","wednesday",
                             "thursday","friday","saturday"))

# create a weekend factor
weekend_fac <- factor(weekend,level = c(0,1),
                      labels = c("weekday","weekend"))

holiday_fac <- factor(holiday, level = c(0,1), 
                      labels = c("nonholiday","holiday"))

remov <- which(funcday == 0)
dat_1 <- dat[-remov,]
dat_2 <- dat_1[-12]

# Does not need to run this step each time.

write.csv(dat_2,
file = "/Users/carrie/Desktop/ERG\ project/new_SeoulBikeData_2.csv")

