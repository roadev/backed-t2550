import processing.serial.*;
Serial myPort; //creamos el objeto clase serial
float datoin,dist;
int count =0,dl=0,dh=0,tempo;

void setup(){
  size(500,300);

  
 String portName = Serial.list()[0]; 
  myPort = new Serial(this, portName, 9600);
}

void draw(){
background(#000000);
fill(255);
text("Prueba de ultrasonido distacia",10,15);
if(myPort.available()>1){
  if(count==0) datoin=float(myPort.read());
  if(count==1)dl=myPort.read();
  if(count==2)dh=myPort.read();
  if(count==3)tempo=myPort.read();
  count++;
  if(count>=4){
    count=0;
    dist=(dl|(dh<<8));
    println ("Valor obtenido 16bits "+datoin);
    println ("Valor dl 8bits "+dl);
    println ("Valor dh 8bits "+dh);
    println ("Valor dist 16bits "+dist);
    println ("Valor tempo 16bits "+((tempo/58.0)+1));
    println ("Valor dist/10 16bits "+dist/10);
}
  
}
float v_error;

//v_error=dist*0.33;
//dist=dist-v_error;

textSize(85);
text((dist+2)+ "Cm",122,163);
textSize(16);
}