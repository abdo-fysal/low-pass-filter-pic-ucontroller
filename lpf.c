





void main() {
double i;
 double y0=0;
 double y1=0;

 double x0=0;
 double x1=0;

 ADC_Init();



  TRISC  = 0;
  TRISB  = 0;

  for( i=0;i<1000;i=i+0.00005){
    x0 =(double) ADC_Read(1);
    y0=0.9391*y1-0.9692*x1+0.9692*x0;
    

    y1=y0;

    x1=x0;
    
    
         }


    }











 
 

  



