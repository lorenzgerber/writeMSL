export <- function()
{

  fileOut	<-	file("gerberetal2012.msl","a+")

  for(currentRow in 1:nrow(combined)){
    cat(file = fileOut, "NAME: ", paste(combined[currentRow,1],collapse=" "),"\n", sep="")
    cat(file = fileOut, "RI: ", paste('0.000', sep=''),"\n",sep="")
    cat(file = fileOut, "RT: ", paste('0.000', sep=''),"\n",sep="")
    cat(file = fileOut, "COMMENTS: ", paste(combined[currentRow,3],collapse=" "), "\n", sep="")
    cat(file = fileOut, "SOURCE: Gerber et al. 2012\n", sep="")
    numPeaks <- 1
    for(checkNumPeak in seq(6,25,2))
    {
      if(combined[currentRow,checkNumPeak] != 0)
      {
        numPeaks <- numPeaks + 1
      }
    }

    cat(file = fileOut, "NUM PEAKS: ", numPeaks,"\n", sep="")
    cat(file= fileOut, paste('(',combined[currentRow,5],' 1000) ', sep=''))
    rowBreak <- 2
    for (mass in seq(6, 25, 2)){
      if(combined[currentRow,mass] != 0)
      {
        cat(file=fileOut, paste('(', combined[currentRow,mass], ' ', combined[currentRow,mass+1]*10,') ',sep=''))
      }
      if (rowBreak == 5)
      {
        cat(file=fileOut, "\n")
        rowBreak <- 0
      }
      rowBreak <- rowBreak + 1

    }

    cat(file=fileOut, paste('\n\n'))
  }

  close(fileOut)

}


