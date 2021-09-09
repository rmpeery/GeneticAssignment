library(ggplot2)

AveAcc <- read.csv("AveAssignSummary_GeneClass2.txt", header = T, sep = "\t")

ggplot(AveAcc,aes(x=No.SNPs, y=Ave.assign.acc.95, group=DataType)) +
         geom_point(aes(shape=DataType)) +
         #geom_point(data=AveAcc,aes(x=No.SNPs, y=Ave.assign.acc.95)) +
         theme_bw() +
         ylab("Average accuracy") + xlab("Number of loci") +
         ylim(0,100) +
         theme(legend.position = c(0.85, 0.1),legend.title = element_blank()) +
         theme(text=element_text(family="Times New Roman", size = 12)) +
         scale_shape_manual(name="", 
                       labels = c("Fst ranked", 
                                  "Randomly selected"), 
                       values = c("Fst ranked"= 16, 
                                  "Randomly selected"= 21))
