export <- function()
{
  S		<-	t(SPECTRUM[,choice])
  RT		<-	VARID2[choice]
  NAME	<-	as.matrix(VARID1[choice])
  ID		<-	cbind(round(RT,2),NAME)

  for(j in 1:nrow(ID)){
    s				<-	S[j,]
    s				<-	s/max(s)*999
    s[round(s)<1.5]	<-	0
    N				<-	which(s == 0)

    if(length(N)){
      s	<-	s[-N]
      MZ	<-	SCAN_RANGE[-N]

    }else
      MZ		<-	SCAN_RANGE
    DATA	<-	cbind(MZ,round(s))

    cat("Name:", paste(ID[j,],collapse=" "),"\n",file=fid,sep="")
    cat("Synon:Annotated:\n",file=fid,sep="")
    cat("Synon:Classified:\n",file=fid,sep="")
    cat("Synon:RI:", round(RI[j],1),"\n",file=fid,sep="")
    cat("Synon:RT(s):", round(RT[j],1),"\n",file=fid,sep="")
    cat("Synon:MCR-Reference:", VARID1[choice][j],"\n",file=fid,sep="")
    cat("Synon:Date:",as.character(Sys.Date()),"\n",file=fid,sep="")
    cat("Comments:","\n",file=fid,sep="")
    cat("DB#:",j,"\n",file=fid,sep="")
    cat("Num peaks:", length(MZ),"\n",file=fid,sep="")
    cat(file=fid,paste(apply(DATA,1,function(DATA) paste(DATA,collapse= " ")),";",rep(c(rep("",3),"\n"),len=length(MZ)),sep="",collapse=" "),"\n")
  }
}


