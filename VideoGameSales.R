#DAD project analysis
#set wd
setwd("/Users/Eoin/Documents/BSHCE/Year 4/DAD/DAD")

#libraries
library(ggplot2)

#read in video game sales csv
vgData = read.csv("vgsales.csv", stringsAsFactors = F)
View(vgData)
mean(vgData$EU_Sales)
boxplot(vgData$NA_Sales)


#get subset data of each platform
subsetWii = subset(vgData, Platform == "Wii")
subsetNES = subset(vgData, Platform == "NES")
subsetGB = subset(vgData, Platform == "GB")
subsetDS = subset(vgData, Platform == "DS")
subsetX360 = subset(vgData, Platform == "X360")
subsetPS3 = subset(vgData, Platform == "PS3")
subsetPS2 = subset(vgData, Platform == "PS2")
subsetSNES = subset(vgData, Platform == "SNES")
subsetGBA = subset(vgData, Platform == "GBA")
subset3DS = subset(vgData, Platform == "3DS")
subsetPS4 = subset(vgData, Platform == "PS4")
subsetN64 = subset(vgData, Platform == "N64")
subsetPS = subset(vgData, Platform == "PS")
subsetXB = subset(vgData, Platform == "XB")
subsetPC = subset(vgData, Platform == "PC")
subset2600 = subset(vgData, Platform == "2600")
subsetPSP = subset(vgData, Platform == "PSP")
subsetXOne = subset(vgData, Platform == "XOne")
subsetGC = subset(vgData, Platform == "GC")
subsetWiiU = subset(vgData, Platform == "WiiU")
subsetGEN = subset(vgData, Platform == "GEN")
subsetDC = subset(vgData, Platform == "DC")
subsetPSV = subset(vgData, Platform == "PSV")
subsetSAT = subset(vgData, Platform == "SAT")
subsetSCD = subset(vgData, Platform == "SCD")
subsetWS = subset(vgData, Platform == "WS")
subsetNG = subset(vgData, Platform == "NG")
subsetTG16 = subset(vgData, Platform == "TG16")
subset3DO = subset(vgData, Platform == "3DO")
subsetGG = subset(vgData, Platform == "GG")
subsetPCFX = subset(vgData, Platform == "PCFX")

#count total num
totalNum = length(vgData$Rank)
round(totalNum, digits = 2)

#get numbers/percentages
percWii = round((length(subsetWii$Platform)/totalNum * 100), digits = 2)
percNES = round((length(subsetNES$Platform)/totalNum * 100), digits = 2)
percGB = round((length(subsetGB$Platform)/totalNum * 100), digits = 2)
percDS = round((length(subsetDS$Platform)/totalNum * 100), digits = 2)
percX360 = round((length(subsetX360$Platform)/totalNum * 100), digits = 2)
percPS3 = round((length(subsetPS3$Platform)/totalNum * 100), digits = 2)
percPS2 = round((length(subsetPS2$Platform)/totalNum * 100), digits = 2)
percSNES = round((length(subsetSNES$Platform)/totalNum * 100), digits = 2)
percGBA = round((length(subsetGBA$Platform)/totalNum * 100), digits = 2)
perc3DS = round((length(subset3DS$Platform)/totalNum * 100), digits = 2)
percPS4 = round((length(subsetPS4$Platform)/totalNum * 100), digits = 2)
percN64 = round((length(subsetN64$Platform)/totalNum * 100), digits = 2)
percPS = round((length(subsetPS$Platform)/totalNum * 100), digits = 2)
percXB = round((length(subsetXB$Platform)/totalNum * 100), digits = 2)
percPC = round((length(subsetPC$Platform)/totalNum * 100), digits = 2)
perc2600 = round((length(subset2600$Platform)/totalNum * 100), digits = 2)
percPSP = round((length(subsetPSP$Platform)/totalNum * 100), digits = 2)
percXOne = round((length(subsetXOne$Platform)/totalNum * 100), digits = 2)
percGC = round((length(subsetGC$Platform)/totalNum * 100), digits = 2)
percWiiU = round((length(subsetWiiU$Platform)/totalNum * 100), digits = 2)
percGEN = round((length(subsetGEN$Platform)/totalNum * 100), digits = 2)
percDC = round((length(subsetDC$Platform)/totalNum * 100), digits = 2)
percPSV = round((length(subsetPSV$Platform)/totalNum * 100), digits = 2)
percSAT = round((length(subsetSAT$Platform)/totalNum * 100), digits = 2)
percSCD = round((length(subsetSCD$Platform)/totalNum * 100), digits = 2)
percWS = round((length(subsetWS$Platform)/totalNum * 100), digits = 2)
percNG = round((length(subsetNG$Platform)/totalNum * 100), digits = 2)
percTG16 = round((length(subsetTG16$Platform)/totalNum * 100), digits = 2)
perc3DO = round((length(subset3DO$Platform)/totalNum * 100), digits = 2)
percGG = round((length(subsetGG$Platform)/totalNum * 100), digits = 2)
percPCFX = round((length(subsetPCFX$Platform)/totalNum * 100), digits = 2)

#create vector of percentages
percVector = c(percWii,percNES,percGB,percDS,percX360,percPS3,percPS2,percSNES,percGBA,perc3DS,percPS4,percN64,percPS,percXB,percPC,perc2600,percPSP,percXOne,percGC,percWiiU,percGEN,percDC,percPSV,percSAT,percSCD,percWS,percNG,percTG16,perc3DO,percGG,percPCFX)

sliceNames = c("Wii","NES","GB","DS","X360","PS3","PS2","SNES","GBA","3DS","PS4","N64","PS","XB","PC","2600","PSP","XOne","GC","WiiU","GEN","DC","PSV","SAT","SCD","WS","NG","TG16","3DO","GG","PCFX")

#create pie chart
percentlabels = round(100*percVector/sum(percVector), 1)
pielabels = paste(percentlabels, "%", sep="")
uselabels = paste(sliceNames , pielabels,sep="")
png("VideoGamePercentageByPlatform.png", width = 15, height = 15, units = "in", res = 300)
pie(percVector, labels = uselabels, main = "Percentage Distribution of Platforms from Data")
dev.off()

#total sales for eu/na for Playstation in 1997
subPS97 = subset(subsetPS, Year == 1997)
eusales = round(sum(subPS97$EU_Sales), digits = 3)
nasales = round(sum(subPS97$NA_Sales), digits = 3)

#get eu sales totals per category
aggregate(vgData$EU_Sales, by=(list(Category=vgData$Genre)), FUN=sum)
aggregate(.vgData$Genre, vgData$EU_Sales, sum)
aggregate(EU_Sales ~ Genre, vgData, sum)
tapply(vgData$EU_Sales, vgData$Genre, sum)

#distribution of sales for playstation grouped by genre (counts)
ggplot(subsetPS, aes(x=Genre, y=Global_Sales)) + stat_binhex(colour="white") +
  theme_bw() + scale_fill_gradient(low="white", high="blue") +
  labs(x="Genre", y="Global Sales (Million)")+
  coord_cartesian(ylim = c(0, 10))+
  scale_y_continuous(breaks=seq(0,10,0.5), expand = c(0, 0))

#ggplot showing violin plot of global ps sales per genre, also showing what genres can have great sales
ggplot(data=subsetX360, aes(Genre, Global_Sales)) +
  geom_violin(fill="lightblue") +
  geom_boxplot( alpha=.2)
