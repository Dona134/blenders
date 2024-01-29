---
title: "Blenders Similarity"
output: html_document
date: "2024-01-29"
---


install.packages("proxy", dependencies=TRUE)
library(proxy)


#I've created a .txt file with 4 blender types with some basic data from Amazon (I'm planning to buy one)
blenders<-read.table("blenders.txt", header=TRUE)
print(blenders)

#Performing gower similarity calculation simil function in the proxy library since we have both numeric and binary values (thus, can't use Jaccard/Euclidean distance)

blenders_num<-blenders[,-1]
rownames(blenders_num)<-blenders$blenders
simil(blenders_num, method="gower")

#We can see that The Kidisle and The Black Decker are the most similar, and the latter is the least similar to Shardor. Now let's graph the Dendrogram:

h1<-hclust(dist(blenders_num, method="gower"))
plot(h1)

