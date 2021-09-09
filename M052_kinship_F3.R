kinMtx <- read.delim("kinshipMatricesRformat_allLoci.txt", header = T)
library(ggplot2)
library(RColorBrewer)
library(dplyr)
kinMtx_noSelf <- kinMtx %>%
  filter(selfComps!=T)
ggplot(kinMtx_noSelf, aes(pop1, kinship100, colour=pop2)) +
  geom_boxplot(outlier.shape=1, outlier.size=1) +
  labs(x = "Seed source") +
  labs(y="Kinship coefficient") +
  theme_bw(base_family = "Times New Roman") +
  theme(plot.title = element_text(hjust=0, size=8)) +
  scale_color_manual(values=c(brewer.pal(8,"Dark2")), name="Seed source",
                     breaks=c("A","B","C","D","E","F","G","U"),
                     labels=c("1","2","3","4","5","6","7","U")) +
  scale_x_discrete(limits=c("A","B","C","D","E","F","G","U"), 
                   labels=c("A"="1","B"="2","C"="3",
                            "D"="4","E"="5","F"="6","G"="7","U"="U"))
