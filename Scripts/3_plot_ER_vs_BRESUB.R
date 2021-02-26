# Compare distribution of ER and BRESUB
library(ggplot2)
library(ggpubr)
library(dplyr)

parent.folder <- "C:/Users/Ultra/Desktop/BGSIAM20_Experiments/LDA_BRESUB"
sub.folders <- list.dirs(parent.folder, recursive=TRUE)[-1]
sub.folders <- sub.folders[c(1,12,23,31:36,2:11,13:22,24:30)]
df <- data.frame(bresub = numeric(), test = character(), stringsAsFactors=FALSE)

k <- 1
for(i in sub.folders) {
  setwd(i)
  tmp <- read.csv("BRESUB_result.txt", header = FALSE, sep = "\t")
  tmp <- tmp[4]
  colnames(tmp) <- c("bresub")
  tmp$test <- c(rep(paste("Param", k, sep = ""), 200))
  df <- rbind(df, tmp)
  k <- k +1
}
k <- 0

df$test <- factor(df$test, levels = unique(df$test), ordered = TRUE)

a <- ggplot(df, aes(x = test, y = bresub)) + 
  geom_boxplot(fill = "#FF0000", width = 0.3, outlier.size = 1) +
  ylab("bresub") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.position = "none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(colour = "black", angle = 90, hjust = 1, vjust = 0.5,
                                   size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold")) +
  scale_y_continuous(limits = c(0, 0.25))

parent.folder <- "C:/Users/Ultra/Desktop/BGSIAM20_Experiments/SyntheticDataBGSIAM20"
sub.folders <- list.dirs(parent.folder, recursive=TRUE)[-1]
sub.folders <- sub.folders[c(1,12,23,31:36,2:11,13:22,24:30)]

ER <- data.frame(ER = numeric(), test = character(), stringsAsFactors=FALSE)

k <- 1
for(i in sub.folders) {
  setwd(i)
  print(i)
  tmp <- read.csv("result50.txt", header = FALSE, sep = " ")
  tmp <- tmp[4]
  colnames(tmp) <- c("ER")
  tmp$test <- c(rep(paste("Param", k, sep = ""), 100))
  ER <- rbind(ER, tmp)
  k <- k + 1
}
k <- 0

ER$test <- factor(ER$test, levels = unique(ER$test), ordered = TRUE)
b <- ggplot(ER, aes(x = test, y = ER)) + 
  geom_boxplot(fill = "#6633CC", width = 0.3, outlier.size = 1) +
  ylab("ER") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.position = "none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(colour = "black", angle = 90, hjust = 1, vjust = 0.5,
                                   size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold")) +
  scale_y_continuous(limits = c(0, 0.25))

theme_set(theme_pubr())
figure <- ggarrange(a, b, ncol = 1, nrow = 2)
figure

# Overlay
ggplot(ER, aes(x = test, y = ER)) + 
  geom_boxplot(ER, mapping = aes(x = test, y=ER, fill = "#6633CC"), width = 0.3, outlier.size = 1, alpha = 0.5, position = "dodge") +
  geom_boxplot(df, mapping = aes(x = test, y=bresub, fill = "#FF0000"), width = 0.3, outlier.size = 1, alpha = 0.5, position = "dodge") +
  ylab("") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        axis.title.x = element_blank(),
        axis.text.x = element_text(colour = "black", angle = 90, hjust = 1, vjust = 0.5,
                                   size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"),
        legend.position = "right",
        legend.title = element_blank()) +
  scale_y_continuous(limits = c(0, 0.25))+ 
  scale_fill_manual(values = c("#6633CC", "#FF0000"), labels = c("ER", "bresub")) + 
  ggtitle("50 samples")
