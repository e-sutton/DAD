#set wd
setwd("/Users/Eoin/Documents/BSHCE/Year 4/DAD/DAD")

#libraries
library(ggplot2)

#read in salaries sales csv
salData = read.csv("salaries.csv", stringsAsFactors = F)
View(salData)

#create data frame
d = data.frame(salData)
View(d)

#pre processing, change chars in numeric columsn to 0
d[d$BasePay == "Not Provided",]$BasePay = as.numeric(0)
d[d$OvertimePay == "Not Provided",]$OvertimePay = 0
d[d$OtherPay == "Not Provided",]$OtherPay = 0
d[d$Benefits == "Not Provided",]$Benefits = 0

#change to numeric
d$OvertimePay = as.numeric(as.character(d$OvertimePay))
d$BasePay = as.numeric(as.character(d$BasePay))
d$OtherPay = as.numeric(as.character(d$OtherPay))
d$Benefits = as.numeric(as.character(d$Benefits))
d$TotalPayBenefits = as.numeric(as.character(d$TotalPayBenefits))


#top 10 job titles for pay through 2011-2014
sort(d$TotalPayBenefits, decreasing = TRUE)

top10 = as.data.frame(head(d, 10))
View(top10)

#ggplot of total pay grouped by year
ggplot(data=d, aes(group=Year, Year, TotalPayBenefits)) +
  geom_violin(fill="lightblue") +
  geom_boxplot( alpha=.2)+
  coord_cartesian(ylim = c(0, 1000000))

#average % of overtime on total pay bill
sumTotalPay = sum(d$TotalPayBenefits)
sumTotalOvertime = sum(d$OvertimePay)

percOvertimeTotal = round((sumTotalOvertime/sumTotalPay) *100,2)

#get data on job titles for fire/police roles
policeRoles = d[(grep("POLICE", toupper(d$JobTitle))),]
sheriffRoles = d[(grep("SHERIFF", toupper(d$JobTitle))),]
#combine
allPoliceRoles = rbind(policeRoles,sheriffRoles)

fireRoles = d[grep("FIRE",toupper(salData$JobTitle)),]

#distribution of salary levels per year for all police roles
ggplot(allPoliceRoles, aes(x=Year, y=TotalPayBenefits)) + stat_binhex(colour="white") +
  theme_bw() + scale_fill_gradient(low="white", high="blue") +
  labs(x="year", y="total pay") +   coord_cartesian(ylim = c(0, 400000))+
  scale_y_continuous(breaks=seq(0,400000,50000), expand = c(0, 0))

#distribution of salary levels per year for all fire roles
ggplot(fireRoles, aes(x=Year, y=TotalPayBenefits)) + stat_binhex(colour="white") +
  theme_bw() + scale_fill_gradient(low="white", high="blue") +
  labs(x="year", y="total pay") +   coord_cartesian(ylim = c(0, 400000))+
  scale_y_continuous(breaks=seq(0,400000,50000), expand = c(0, 0))

#ggplot of how levels of overtime have changed 2011-2014
ggplot(data=d, aes(group=Year, Year, OvertimePay)) +
  geom_violin(fill="lightblue") +
  geom_boxplot( alpha=.2)+
  coord_cartesian(ylim = c(0, 250000))

