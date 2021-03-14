# Vector over the Support of M
x <- 1:6
#Init Sum Value
sum = 0
total <- vector()
#Sum with potential
for (i in x){
  sum = sum + ((2*(i-1)+1)/36)
  print(sum)
}
