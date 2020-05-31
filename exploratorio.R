targets <- read.csv("~/input/targets.csv", header=TRUE, sep=";")
counts  <- read.csv("~/input/counts.csv",  header=TRUE, sep=";")

dim(targets)
dim(counts)

set.seed(12345)
sample_NIT <- sample(targets[which(targets$Group=="NIT"),"Sample_Name"],10)
sample_SFI <- sample(targets[which(targets$Group=="SFI"),"Sample_Name"],10)
sample_ELI <- sample(targets[which(targets$Group=="ELI"),"Sample_Name"],10)

samples <- colnames(counts)
samples <- samples[-1]
samples <- gsub("[.]","-",samples)


# nuevo código de prueba
