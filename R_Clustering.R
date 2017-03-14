
#Given the mean and standard deviation of each state we perofrm K-means clustering to group them accordingly  
unemployement <- read.csv("C:/R_2017/unemployment.csv")
unemployement[1:3,]
set.seed(1)
clust_unemp<- kmeans(unemployement[,c("mean","stddev")], centers=3, nstart=10)

o=order(clust_unemp$cluster)
data.frame(unemployement$state[o],clust_unemp$cluster[o])
plot(unemployement$mean,unemployement$stddev,type="n",xlab="mean", ylab="standard_dev")
text(x=unemployement$mean,y=unemployement$stddev,labels=unemployement$state, col=clust_unemp$cluster+1)
