BEGIN {
rec= 0
drp=0
  tot=0
  rat=0.0
  sum=0
  sum1=0
sum2 = 0
  throughput=0.0
  throughput1=0.0
throughput2=0.0
}
{
if($1== "r" && $4== 4)
{
   
      rec++
    }
    if($1== "d" && $4 ==4)
      {
       drp++
      }
if($2 > 1.0 && $4 == 5)
{

sum = sum + $6

        }
if($2 > 1.0 && $4 == 6)
        {
     
          sum1 = sum1 + $6
 
        }
if($2 > 1.0 && $4 == 7)
        {
     
          sum2 = sum2 + $6
 
        }
}
END {
tot = rec + drp
      rat = (rec/tot) *100
      throughput= (sum*8)/1000000
      throughput1=(sum1*8)/1000000
throughput2=(sum2*8)/1000000
      printf(" \n Packets received %d ", rec)
        printf(" \n Packets dropped %d ", drp)
        printf("\n Packets delivery ratio %f",rat)
        printf("\n Throughput for udp1 (Node 5) is %f",throughput)
        printf("\n Throughput for udp2 (Node 6) is %f",throughput1)
printf("\n Throughput for udp3 (Node 7) is %f\n",throughput2)
}