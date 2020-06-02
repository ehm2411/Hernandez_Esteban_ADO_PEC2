rm(list=ls())
# lectura de los ficheros
targets <- read.csv("./input/targets.csv", header=TRUE, sep=",")
counts  <- read.csv("./input/counts.csv",  header=TRUE, sep=";",row.names = 1)

# comprobación de las dimensiones
dim(targets)
dim(counts)

# seleccionar aleatóriamente 10 muestras de cada grupo (NIT, SFI y ELI) del fichero "targets"
set.seed(12345)
sample_NIT <- sample(targets[which(targets$Group=="NIT"),"Sample_Name"],10)
sample_SFI <- sample(targets[which(targets$Group=="SFI"),"Sample_Name"],10)
sample_ELI <- sample(targets[which(targets$Group=="ELI"),"Sample_Name"],10)

# cambiar los guiones por puntos en el nombre de las muestras para poder buscar en el fichero "counts" 
sample_NIT <- gsub("[-]",".",sample_NIT)
sample_SFI <- gsub("[-]",".",sample_SFI)
sample_ELI <- gsub("[-]",".",sample_ELI)

counts_NTI <- counts[,sample_NIT]
counts_SFI <- counts[,sample_SFI]
counts_ELI <- counts[,sample_ELI]

rawdata <- cbind(counts_NTI,counts_SFI,counts_ELI)
nombrescol <- c(paste("NIT",1:10,sep=""),paste("SFI",1:10,sep=""),paste("ELI",1:10,sep=""))

colnames(rawdata) <- nombrescol





library(edgeR)
dgList <- DGEList(counts=rawdata, genes=rownames(rawdata))

dgList$samples
summary(dgList)
class(dgList$counts)
dim(dgList$counts)

head(dgList$counts)
head(dgList$genes)


maxexpr <- apply(rawdata,1,max)
summary(maxexpr)

length(maxexpr[which(maxexpr>-1)])
length(maxexpr[which(maxexpr>0)])
length(maxexpr[which(maxexpr>1)])



cant.ceros <- function(vector) {
  cont <- 0
  for (i in 1:length(vector)){
    if (vector[i]==0) cont <- cont + 1
  }
  return(cont)
}
df
apply(df,1,cant.ceros)
