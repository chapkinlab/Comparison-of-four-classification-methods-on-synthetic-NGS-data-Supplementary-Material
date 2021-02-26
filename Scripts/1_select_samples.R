# Divide data into training and complementary sets
library(dplyr)

setwd("C:/Users/Ultra/Desktop/BGSIAM20_Experiments/SyntheticDataBGSIAM20")

parent.folder <- "C:/Users/Ultra/Desktop/BGSIAM20_Experiments/SyntheticDataBGSIAM20"
sub.folders <- list.dirs(parent.folder, recursive=TRUE)[-1]
sub.folders <- sub.folders[c(1,12,23,31:36,2:11,13:22,24:30)]


k <- 1
for(i in sub.folders) {
  print(k)
  setwd(i)
  train0 <- read.csv("mcmcparams_trn.txt",skip = 1, nrows = 500, header = F)
  train1 <- read.csv("mcmcparams_trn.txt",skip = 501, header = F)
  test0 <- read.csv("mcmcparams_tst.txt",skip = 1, nrows = 500, header = F)
  test1 <- read.csv("mcmcparams_tst.txt",skip = 501, header = F)
  class0 <- rbind(train0, test0)
  class1 <- rbind(train1, test1)
  
  wholeData <- rbind(class0, class1)

  class0 <- wholeData[1:1000,]
  class1 <- wholeData[1001:2000,]
  
  set.seed(123)
  samples0 <- class0[sample(nrow(class0), 25), ]
  samples1 <- class1[sample(nrow(class1), 25), ]
  table50 <- rbind(samples0, samples1)
  write.table(table50, "samples50.txt", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")
  
  samples0 <- class0[sample(nrow(class0), 75), ]
  samples1 <- class1[sample(nrow(class1), 75), ]
  table150 <- rbind(samples0, samples1)
  write.table(table150, "samples150.txt", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")
  
  samples0 <- class0[sample(nrow(class0), 150), ]
  samples1 <- class1[sample(nrow(class1), 150), ]
  table300 <- rbind(samples0, samples1)
  write.table(table300, "samples300.txt", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")
  
  complement50 <- anti_join(wholeData,table50)
  write.table(complement50, "complement50.txt", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")
  
  complement150 <- anti_join(wholeData,table150)
  write.table(complement150, "complement150.txt", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")
  
  complement300 <- anti_join(wholeData,table300)
  write.table(complement300, "complement300.txt", col.names = FALSE, row.names = FALSE, quote = FALSE, sep = "\t")
  
  k <- k +1
}

k <- 0
