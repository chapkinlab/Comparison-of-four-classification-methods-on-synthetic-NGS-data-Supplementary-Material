# Scatter plot TPR mean vs TPR standard deviation
library(ggplot2)
library(dplyr)
library(ggpubr)

parent.folder <- "C:/Users/Ultra/Desktop/BGSIAM20_Experiments/SyntheticDataBGSIAM20"
sub.folders <- list.dirs(parent.folder, recursive=TRUE)[-1]
sub.folders <- sub.folders[c(1,12,23,31:36,2:11,13:22,24:30)]

df <- data.frame(values=double(), variable=factor(), type=factor(),
                 stringsAsFactors=FALSE)
k <- 1
for(i in sub.folders) {
  setwd(i)
  result50 <- read.csv("result50_n.txt", header = FALSE, sep = " ")
  result150 <- read.csv("result150_n.txt", header = FALSE, sep = " ")
  result300 <- read.csv("result300_n.txt", header = FALSE, sep = " ")
  dfTPR <- as.data.frame(rbind(result50, result150, result300))
    
  dfTPR <- dfTPR[c(1,5,9,13)]
  dfTPR <- stack(dfTPR[1:4])
  dfTPR['variable'] <- c(rep("LDA50", 100), rep("LDA150", 100), rep("LDA300", 100),
                           rep("KNN50", 100), rep("KNN150", 100), rep("KNN300", 100),
                           rep("SVM50", 100), rep("SVM150", 100), rep("SVM300", 100),
                           rep("ANN50", 100), rep("ANN150", 100), rep("ANN300", 100))
  dfTPR$ind <- NULL
  dfTPR$variable <- factor(dfTPR$variable, levels = unique(dfTPR$variable), ordered = TRUE)
  dfTPR$type <- c(rep("LDA", 300), rep("KNN", 300), rep("SVM", 300), rep("ANN", 300))
  dfTPR$type <- factor(dfTPR$type, levels = c("LDA", "KNN", "SVM", "ANN"), ordered = TRUE)
  df <- rbind(df, dfTPR)
  k <- k + 1
}
k <- 0

# Calculate mean and standard deviation for each group
df$num <- c(rep(1:36, each = 1200))
df_sum <- df %>% group_by(variable, num) %>%
  summarize(mean = mean(values, na.rm = TRUE), sd = sd(values, na.rm = TRUE)) %>% as.data.frame()
df_sum$type <- c(rep("LDA", 108), rep("KNN", 108), rep("SVM", 108), rep("ANN", 108))
df_sum$type <- factor(df_sum$type, levels = c("KNN", "LDA", "ANN", "SVM"), ordered = TRUE)

ggplot(df_sum, aes(x = sd, y = mean, color = type)) + 
  geom_point(size = 3, alpha = 0.5) +
  xlab("TPR standard deviation") +
  ylab("TPR mean") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.title = element_blank(),
        axis.text.x = element_text(colour = "black", size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"))  +
  scale_x_continuous(limits = c(-0.005, 0.4)) +
  scale_y_continuous(limits = c(0.4, 1)) +
  scale_color_manual(values = c("#66FF66", "#FF0000", "#33CCFF", "#FFFF99"))


# Plot the classifiers separately
# Change color according to number of training samples
df_sum$variable <- factor(df_sum$variable, levels = unique(df_sum$variable), ordered = TRUE)

a <- ggplot(df_sum[1:108,], aes(x = sd, y = mean, color = variable)) + 
  geom_point(size = 3, alpha = 0.6) +
  xlab("TPR standard deviation") +
  ylab("TPR mean") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.title = element_blank(),
        axis.text.x = element_text(colour = "black", size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"))  +
  scale_x_continuous(limits = c(-0.005, 0.4)) +
  scale_y_continuous(limits = c(0.4, 1)) +
  scale_color_manual(values = c("#FF9999", "#FF0000", "#990000"))

b <- ggplot(df_sum[109:216,], aes(x = sd, y = mean, color = variable)) + 
  geom_point(size = 3, alpha = 0.6) +
  xlab("TPR standard deviation") +
  ylab("TPR mean") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.title = element_blank(),
        axis.text.x = element_text(colour = "black", size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"))  +
  scale_x_continuous(limits = c(-0.005, 0.4)) +
  scale_y_continuous(limits = c(0.4, 1)) +
  scale_color_manual(values = c("#66FF66", "#009900", "#003300"))

c <- ggplot(df_sum[217:324,], aes(x = sd, y = mean, color = variable)) + 
  geom_point(size = 3, alpha = 0.6) +
  xlab("TPR standard deviation") +
  ylab("TPR mean") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.title = element_blank(),
        axis.text.x = element_text(colour = "black", size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"))  +
  scale_x_continuous(limits = c(-0.005, 0.4)) +
  scale_y_continuous(limits = c(0.4, 1)) +
  scale_color_manual(values = c("#FFFF66", "#FFFF00", "#663300"))

d <- ggplot(df_sum[325:432,], aes(x = sd, y = mean, color = variable)) + 
  geom_point(size = 3, alpha = 0.6) +
  xlab("TPR standard deviation") +
  ylab("TPR mean") + 
  theme(text = element_text(size = 16),
        axis.line = element_line(colour = "black"), 
        panel.background = element_blank(),
        panel.grid.major = element_line(colour = "grey"),
        legend.title = element_blank(),
        axis.text.x = element_text(colour = "black", size = 10, face = "bold"),
        axis.text.y = element_text(colour = "black", size = 10, face = "bold"))  +
  scale_x_continuous(limits = c(-0.005, 0.4)) +
  scale_y_continuous(limits = c(0.4, 1)) +
  scale_color_manual(values = c("#33CCFF", "#0000CC", "#000033"))

theme_set(theme_pubr())
figure <- ggarrange(a, b, c, d, ncol = 2, nrow = 2)
figure
