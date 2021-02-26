# Plot TPR, TNR, PPV and ER for all classifiers
library(ggplot2)
library(ggpubr)

parent.folder <- "C:/Users/Ultra/Desktop/BGSIAM20_Experiments/SyntheticDataBGSIAM20"
sub.folders <- list.dirs(parent.folder, recursive=TRUE)[-1]
sub.folders <- sub.folders[c(1,12,23,31:36,2:11,13:22,24:30)]

# Set plot titles
titles <- list(expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.1, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.1, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.1, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.1, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.1, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.1, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.1, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.1, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.1, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.1, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.1, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.1, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.4, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.4, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.4, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.4, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.4, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.4, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.4, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.4, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.4, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.4, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.4, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.4, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.8, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.8, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.8, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.8, D"[gm], " = 5, D"[hm], " = 50", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.8, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.8, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.8, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.8, D"[gm], " = 25, D"[hm], " = 40", sep = "")),
               expression(paste(sigma[0], " = 0.4, ", sigma[1], " = 0.4, ", rho, " = 0.8, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.7, ", sigma[1], " = 0.7, ", rho, " = 0.8, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.3, ", sigma[1], " = 0.5, ", rho, " = 0.8, D"[gm], " = 45, D"[hm], " = 30", sep = "")),
               expression(paste(sigma[0], " = 0.5, ", sigma[1], " = 0.8, ", rho, " = 0.8, D"[gm], " = 45, D"[hm], " = 30", sep = "")))

k <- 1
for(i in sub.folders) {
  setwd(i)

result50 <- read.csv("result50.txt", header = FALSE, sep = " ")
result150 <- read.csv("result150.txt", header = FALSE, sep = " ")
result300 <- read.csv("result300.txt", header = FALSE, sep = " ")
df <- as.data.frame(rbind(result50, result150, result300))

# TPR
dfTPR <- df[c(1,5,9,13)]
dfTPR <- stack(dfTPR[1:4])
dfTPR['variable'] <- c(rep("LDA50", 100), rep("LDA150", 100), rep("LDA300", 100),
                       rep("KNN50", 100), rep("KNN150", 100), rep("KNN300", 100),
                       rep("SVM50", 100), rep("SVM150", 100), rep("SVM300", 100),
                       rep("ANN50", 100), rep("ANN150", 100), rep("ANN300", 100))
dfTPR$ind <- NULL

dfTPR$variable <- factor(dfTPR$variable, levels = unique(dfTPR$variable), ordered = TRUE)
dfTPR$type <- c(rep("LDA", 300), rep("KNN", 300), rep("SVM", 300), rep("ANN", 300))
dfTPR$type <- factor(dfTPR$type, levels = c("LDA", "KNN", "SVM", "ANN"), ordered = TRUE)


a <- ggplot(dfTPR, aes(x = variable, y = values)) + 
  geom_boxplot(aes(fill = type), width = 0.3, outlier.size = 1) +
  ylab("TPR") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.position = "none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(colour = "black", angle = 90, hjust = 1, vjust = 0.5,
                                   size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black",
                                   size = 10, face = "bold"))  +
  scale_fill_manual(values = c("#FF0000", "#66FF66", "#FFFF99", "#33CCFF"))
  
# TNR
dfTNR <- df[c(2,6,10,14)]
dfTNR <- stack(dfTNR[1:4])
dfTNR['variable'] <- c(rep("LDA50", 100), rep("LDA150", 100), rep("LDA300", 100),
                       rep("KNN50", 100), rep("KNN150", 100), rep("KNN300", 100),
                       rep("SVM50", 100), rep("SVM150", 100), rep("SVM300", 100),
                       rep("ANN50", 100), rep("ANN150", 100), rep("ANN300", 100))
dfTNR$ind <- NULL

dfTNR$variable <- factor(dfTNR$variable, levels = unique(dfTNR$variable), ordered = TRUE)
dfTNR$type <- c(rep("LDA", 300), rep("KNN", 300), rep("SVM", 300), rep("ANN", 300))
dfTNR$type <- factor(dfTNR$type, levels = c("LDA", "KNN", "SVM", "ANN"), ordered = TRUE)

b <- ggplot(dfTNR, aes(x = variable, y = values)) + 
  geom_boxplot(aes(fill = type), width = 0.3, outlier.size = 1) +
  ylab("TNR") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.position = "none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(colour = "black", angle = 90, hjust = 1, vjust = 0.5,
                                   size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black",
                                   size = 10, face = "bold"))  +
  scale_fill_manual(values = c("#FF0000", "#66FF66", "#FFFF99", "#33CCFF"))

# PPV
dfPPV <- df[c(3,7,11,15)]
dfPPV <- stack(dfPPV[1:4])
dfPPV['variable'] <- c(rep("LDA50", 100), rep("LDA150", 100), rep("LDA300", 100),
                       rep("KNN50", 100), rep("KNN150", 100), rep("KNN300", 100),
                       rep("SVM50", 100), rep("SVM150", 100), rep("SVM300", 100),
                       rep("ANN50", 100), rep("ANN150", 100), rep("ANN300", 100))
dfPPV$ind <- NULL

dfPPV$variable <- factor(dfPPV$variable, levels = unique(dfPPV$variable), ordered = TRUE)
dfPPV$type <- c(rep("LDA", 300), rep("KNN", 300), rep("SVM", 300), rep("ANN", 300))
dfPPV$type <- factor(dfPPV$type, levels = c("LDA", "KNN", "SVM", "ANN"), ordered = TRUE)

c <- ggplot(dfPPV, aes(x = variable, y = values)) + 
  geom_boxplot(aes(fill = type), width = 0.3, outlier.size = 1) +
  ylab("PPV") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.position = "none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(colour = "black", angle = 90, hjust = 1, vjust = 0.5,
                                   size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"))  +
  scale_fill_manual(values = c("#FF0000", "#66FF66", "#FFFF99", "#33CCFF"))

# ER
dfER <- df[c(4,8,12,16)]
dfER <- stack(dfER[1:4])
dfER['variable'] <- c(rep("LDA50", 100), rep("LDA150", 100), rep("LDA300", 100),
                       rep("KNN50", 100), rep("KNN150", 100), rep("KNN300", 100),
                       rep("SVM50", 100), rep("SVM150", 100), rep("SVM300", 100),
                       rep("ANN50", 100), rep("ANN150", 100), rep("ANN300", 100))
dfER$ind <- NULL

dfER$variable <- factor(dfER$variable, levels = unique(dfER$variable), ordered = TRUE)
dfER$type <- c(rep("LDA", 300), rep("KNN", 300), rep("SVM", 300), rep("ANN", 300))
dfER$type <- factor(dfER$type, levels = c("LDA", "KNN", "SVM", "ANN"), ordered = TRUE)

d <- ggplot(dfER, aes(x = variable, y = values)) + 
  geom_boxplot(aes(fill = type), width = 0.3, outlier.size = 1) +
  ylab("ER") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.position = "none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(colour = "black", angle = 90, hjust = 1, vjust = 0.5,
                                   size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"))  +
  scale_fill_manual(values = c("#FF0000", "#66FF66", "#FFFF99", "#33CCFF"))


theme_set(theme_pubr())
figure <- ggarrange(a, b, c, d, ncol = 2, nrow = 2)
annotate_figure(figure,
                top = text_grob(titles[[k]], face = "bold", size = 18))
figure
ggsave(paste("Test", which(i == sub.folders), ".png", sep = ""))
k <- k + 1
}
k <- 0

# Copy plots to Results directory

files <- sapply(sub.folders, list.files, full.names = TRUE, pattern = "\\.png$")

for(file in files) {
  file.copy(file, "C:/Users/Ultra/Desktop/BGSIAM20_Experiments/Results")
}
