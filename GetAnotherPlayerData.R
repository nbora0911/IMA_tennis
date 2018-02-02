#This function outputs player as player1
p1constant <- function(traindata,player){
  p1data <- traindata %>% filter(Player_1 == player | Player_2 == player)
  
  for(p in  1:nrow(p1data)){  
    if (p1data[p,]$Player_2 == player){
      a=p1data[p,]$Player_1
      b=p1data[p,]$Player_2
      
      p1data[p,]$Player_1=b
      p1data[p,]$Player_2=a
      
      if (p1data[p,]$won == 0){p1data[p,]$won=1} else {p1data[p,]$won=0}
      
      
      colns1 <- c('age_diff', 'rankpts_diff', 'ranks_diff','ratio_ace_diff','ratio_1stIn_diff','ratio_1stWon_diff','ratio_2ndWon_diff')
      
      p1data[p,colns1 ]=-p1data[p,colns1 ]
    }
  }
  return(p1data)
}
