setwd("H:/Project Results/")
library(openxlsx)
library(pheatmap)

eira <- read.xlsx("Summary_all-marker_201502.xlsx", sheet=7)
eira_new <- eira[1:26,2:18]
eira_new <- sapply(eira_new, as.numeric)
eira_new <- -log10(eira_new)
row.names(eira_new) <- eira[1:26,1]
pheatmap(eira_new, scale="column", clustering_distance_col="correlation", cluster_rows=T, cluster_cols=T, fontsize=15, fontsize_rows=9)

wtccc <- read.xlsx("Summary_all-marker_201502.xlsx", sheet=9)
wtccc_new <- wtccc[,2:16]
row.names(wtccc_new) <- wtccc[,1]
wtccc_new <- as.matrix(wtccc_new)
wtccc_new <- sapply(wtccc_new, as.numeric)
wtccc_new <- -log10(wtccc_new)
pheatmap(wtccc_new, scale="column", clustering_distance_col="correlation", cluster_rows=T, cluster_cols=T, fontsize=15, fontsize_rows=9)

narac <- read.xlsx("NARAC_summary.xlsx", sheet=1)
narac_new <- narac[,2:18]
narac_new <- sapply(narac_new, as.numeric)
narac_new <- -log10(narac_new)
row.names(narac_new) <- narac[,1]
pheatmap(narac_new, scale="column", clustering_distance_col="correlation", cluster_rows=T, cluster_cols=T, fontsize=15, fontsize_rows=9)

MyPC <- princomp(~., data = test[,3:30], cor = TRUE, na.action = na.omit) 
summary(MyPC)
biplot(MyPC, xlabs=test$case, cex=c(1, 0.75), col=c("grey", "red"))

