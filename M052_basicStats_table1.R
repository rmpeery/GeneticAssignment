library(adegenet)
library(hierfstat)
library(diveRsity)
C2C.data <- read.structure("M052_seedSourcesA_G.str", onerowperind = TRUE, n.ind = 249, n.loc = 27961,
                           col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
C2Cknowns.stats <- basic.stats(C2C.data, diploid = TRUE, digits = 3) 
names(C2Cknowns.stats)
sum <- summary(C2C.data)
names(sum)
head(sum$NA.perc) #0.9548009

A.data <- read.structure("M052_SS_A.str", onerowperind = TRUE, n.ind = 22, n.loc = 27961,
                           col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")

A.stats <- basic.stats(A.data, diploid = TRUE, digits = 3) 
A.stats$overall

B.data <- read.structure("M052_SS_B.str", onerowperind = TRUE, n.ind = 36, n.loc = 27961,
                            col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
B.stats <- basic.stats(B.data, diploid = TRUE, digits = 3) 
B.stats$overall

C.data <- read.structure("M052_SS_C.str", onerowperind = TRUE, n.ind = 54, n.loc = 27961,
                            col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
C.stats <- basic.stats(C.data, diploid = TRUE, digits = 3) 
C.stats$overall

D.data <- read.structure("M052_SS_D.str", onerowperind = TRUE, n.ind = 32, n.loc = 27961,
                            col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
D.stats <- basic.stats(D.data, diploid = TRUE, digits = 3) 
D.stats$overall

E.data <- read.structure("M052_SS_E.str", onerowperind = TRUE, n.ind = 19, n.loc = 27961,
                            col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
E.stats <- basic.stats(E.data, diploid = TRUE, digits = 3) 
E.stats$overall

F.data <- read.structure("M052_SS_F.str", onerowperind = TRUE, n.ind = 53, n.loc = 27961,
                            col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
F.stats <- basic.stats(F.data, diploid = TRUE, digits = 3) 
F.stats$overall

G.data <- read.structure("M052_SS_G.str", onerowperind = TRUE, n.ind = 33, n.loc = 27961,
                            col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
G.stats <- basic.stats(G.data, diploid = TRUE, digits = 3) 
G.stats$overall

UNK.data <- read.structure("M052_SS_U.str", onerowperind = TRUE, n.ind = 55, n.loc = 27961,
                            col.lab = 1, col.pop = 2, row.marknames = 1, NA.char = "-9")
UNK.stats <- basic.stats(UNK.data, diploid = TRUE, digits = 3)
UNK.stats$overall
