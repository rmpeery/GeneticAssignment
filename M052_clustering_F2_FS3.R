library(adegenet)
## read in data ##
SNPdata <- read.PLINK("M052_genotypes.raw", map.file = "M052_loci.map")

## calculate Fstats ##
library(dartR)
SNPdata.genind <- gl2gi(SNPdata)
library(hierfstat)
SNPdata.hierfstat <- genind2hierfstat(SNPdata.genind)
basicstat <- basic.stats(SNPdata.hierfstat, diploid = TRUE, digits = 3) 
names(basicstat)
WCfst <- pairwise.WCfst(SNPdata.hierfstat,diploid=TRUE)
WCfst

## look at clustering ##
SNPdata.pca <- glPca(SNPdata,parallel = T)
10
SNPdata.pca$eig
library(RColorBrewer)
myCol <- brewer.pal(8, "Dark2")
s.class(SNPdata.pca$scores, pop(SNPdata),xax=1,yax=2, axesell=F,
        cstar=1, cpoint=1, cellipse = 2.5, grid=F, col= myCol, pch = 16)

## use DAPC to cluster ##
find.grp <- find.clusters(x = SNPdata,
                          max.n.clust=10,
                          choose.n.clust = T,
                          method = c("kmeans"),
                          n.iter = 100,
                          n.start = 100,
                          stat = c("BIC"),
                          pca.select = c("percVar"),
                          perc.pca = 80)

## 225 PC explain ~80% var ##
plot(find.grp$Kstat, type="o", xlab="number of clusters (K)", ylab="BIC",
     col="#66a61e", main="")
## one dimension ##
dapc1 <- dapc(SNPdata, n.pca=225, n.da=1)
scatter(dapc1, scree.da=FALSE)
scatter(dapc1, scree.da=FALSE, legend=TRUE,
        txt.leg=paste("seed source", 1:8), col=myCol)
## two dimenisons ##
dapc2 <- dapc(SNPdata, n.pca=225, n.da=2)
scatter(dapc2, scree.da=FALSE, col=myCol)
## admixture plot ##
compoplot(dapc1, col=myCol, lab="", txt.leg=paste("seed source", 1:8), ncol=8)

## Fig 2 ##
par(mfrow=c(1,2))
s.class(SNPdata.pca$scores, pop(SNPdata),xax=1,yax=2, axesell=F,
        cstar=1, cpoint=1, cellipse = 2.5, grid=F, col= myCol, pch = 16)
scatter(dapc2, scree.da=FALSE, col=myCol)
dev.off()

## Fig S3 ##
library(png)
library(grid)
library(cowplot)

dapc_imgA <- "M052_BICplot.png"
dapc_imgA <- readPNG(dapc_imgA, native = T, info = T)
attr(dapc_imgA, "info")
dapc_imageA <- rasterGrob(dapc_imgA, interpolate=TRUE)

dapc_imgB <- "M052_DAPC_discriminantFnx1.png"
dapc_imgB <- readPNG(dapc_imgB, native = T, info = T)
attr(dapc_imgB, "info")
dapc_imageB <- rasterGrob(dapc_imgB, interpolate=TRUE)

dapc_imgC <- "M052_DAPC_compoplot.png"
dapc_imgC <- readPNG(dapc_imgC, native = T, info = T)
attr(dapc_imgC, "info")
dapc_imageC <- rasterGrob(dapc_imgC, interpolate=TRUE)

ggdraw() +
  draw_plot(dapc_imageA, x = 0, y = .5, width = .5, height = .5) +
  draw_plot(dapc_imageB, x = .5, y = .5, width = .5, height = .5) +
  draw_plot(dapc_imageC, x = 0, y = 0, width = 1, height = 0.5) +
  draw_plot_label(label = c("A", "B", "C"), size = 12,
                  x = c(0, 0.5, 0), y = c(.9, .9, 0.5))

dev.off()
