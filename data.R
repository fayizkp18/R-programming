rm(list=lm())
library(Hmisc) #import



data <- read.csv("C:/Users/fayis/Downloads/COVID19_line_list_data.csv")
describe(data)

data$death_dummy <- as.integer(data$death != 0)
#death rate
sum(data$death_dummy) / nrow(data)


#age
dead = subset(data, data$death_dummy == 1)
alive = subset(data, data$death_dummy == 0)
mean(alive$age, na.rm = TRUE)
mean(dead$age, na.rm = TRUE)

t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.95)
#p-value <0.5, we reject null hypothesis

men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)

t.test(men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = 0.95)
