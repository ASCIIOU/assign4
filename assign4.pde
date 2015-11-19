PImage bg1;
PImage bg2;
PImage end1;
PImage end2;
PImage enemy;
PImage fighter;
PImage hp;
PImage enemy1;
PImage start1;
PImage start2;
PImage treasure;

int x,y,xx,yy,xxx,yyy,i,j,t,t2,con =0;

boolean upPressed,downPressed,rightPressed,leftPressed=false;

final int Game_start=1,Game_win=2,Game_lose=3,Game_run=4;

int gameState;

float life=0;

int xSpeed=5;
int ySpeed=5;
int xxSpeed=5;
float yySpeed=2.5;
float YY=0;

int enemyNum=5; 
float []enemyXC=new float[enemyNum]; 
float []enemyXB=new float[enemyNum]; 
float []enemyXA=new float[enemyNum]; 
float []enemyYC=new float[enemyNum]; 
float []enemyYB=new float[enemyNum]; 
float []enemyYAUp=new float[enemyNum]; 
float []enemyYADown=new float[enemyNum]; 
boolean [] imgEnemyC=new boolean[enemyNum]; 
boolean [] imgEnemyB=new boolean[enemyNum]; 
boolean [] imgEnemyAUp=new boolean[enemyNum]; 
boolean [] imgEnemyADown=new boolean[enemyNum]; 
final boolean imgEnemy=true; 

int enemyMove; 
final int C =0; 
final int B =1; 
final int A =2; 

int enemyWidth=61; 
int enemyHeight=61; 
int fighterWidth=51; 
int fighterHeight=51; 
int spacing=5; 
int yC=floor(random(0,420)); 
int yB=floor(random(0,175)); 
int yA=floor(random(0,175)); 


void setup () {

  gameState = Game_start;
  
  life = 195*0.2;
  t2=-60*5;
  
  size(640, 480) ;
  
  x=width-50;
  y=height/2-25;
  
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  
  xx=floor(random(600));
  yy=floor(random(440));
  xxx=0;
  yyy=floor(random(420));
  YY=floor(random(0,height-60));
  
  for(int i=0;i<enemyNum;i++){ 
   enemyXC[i]=i-i*(enemyWidth+spacing); 
   enemyXB[i]=i-i*(enemyWidth+spacing); 
   enemyXA[i]=i-i*(enemyWidth+spacing); 
   enemyYC[i]=yC; 
   enemyYB[i]=yB+i*enemyHeight; 
   enemyYAUp[i]=yA+i*enemyHeight; 
   enemyYADown[i]=yA-i*enemyHeight; 
 
   imgEnemyC[i]=imgEnemy; 
   imgEnemyB[i]=imgEnemy; 
   imgEnemyAUp[i]=imgEnemy; 
   imgEnemyADown[i]=imgEnemy; 
 } 
} 

  

void draw() {
  
  switch (gameState){
    case Game_start:
         image(start2,0,0);
         if (mouseX>200 & mouseX<455 & mouseY>375 & mouseY<415){
             image(start1,0,0);
             if(mousePressed){
                  gameState = Game_run;
              }
         }
         break; 
     case Game_run:
          image(bg1,t,0);
          image(bg2,t-640,0);
          image(bg1,t-1280,0);
          t++;
          t%=1280;
          
          noStroke();
          fill(255,0,0);
          rect(10,0,life,20);
          
          image(hp,0,0);                      
          image(treasure,xx,yy);
          image(fighter,x,y);         
          translate(t2,0);  
          t2+=5;
  
int i; 
   switch(enemyMove){ 
   case C:  
   for(i=0;i<enemyNum;i++){ 
     if(imgEnemyC[i]){ 
     image(enemy,enemyXC[i],enemyYC[i]); 
     } 
     enemyXC[i]+=3; 
     enemyYC[i] %= height-enemyHeight; 
     if(x>=enemyXC[i] && x+fighterWidth<=enemyXC[i]+enemyWidth && y+fighterHeight>=enemyYC[i] && y<=enemyYC[i]+enemyHeight && imgEnemyC[i]){ 
     imgEnemyC[i]=!imgEnemy; 
     life-=39; 
     if(life<0){ 
     life=0; 
     life-=0; 
     } 
     } 
   } 
    
 
   if (enemyXC[4]>width){ 
     enemyMove= B;  
   } 
 
   break; 
    
   case B: 
   for(i=0;i<enemyNum;i++){ 
     if(imgEnemyB[i]){ 
     image(enemy,enemyXB[i],enemyYB[i]); 
     } 
     enemyXB[i]+=3; 
     enemyYB[i] %= height-enemyHeight; 
     if(x>=enemyXB[i] && x+fighterWidth<=enemyXB[i]+enemyWidth && y+fighterHeight>=enemyYB[i] && y<=enemyYB[i]+enemyHeight && imgEnemyB[i]){ 
     imgEnemyB[i]=!imgEnemy; 
     life-=39; 
     if(life<0){ 
     life=0; 
     life-=0; 
     } 
     } 
   } 
    
   if (enemyXB[4]>width){ 
     enemyMove= A; 
   } 
   break; 
    
   case A: 
   for(i=0;i<5;i++){ 
     if(i<=2){ 
      if(imgEnemyAUp[i]){ 
      image(enemy,enemyXA[i],enemyYAUp[i]); 
      } 
      if(imgEnemyADown[i]){ 
      image(enemy,enemyXA[i],enemyYADown[i]); 
      } 
     }else{ 
      if(imgEnemyAUp[i]){ 
      image(enemy,enemyXA[i],enemyYAUp[4-i]); 
      } 
      if(imgEnemyADown[i]){ 
      image(enemy,enemyXA[i],enemyYADown[4-i]); 
      } 
     } 
      
     enemyXA[i]+=3; 
     enemyYAUp[i] %= height-3*enemyHeight; 
     enemyYADown[i] %= height-3*enemyHeight; 
     if(x>=enemyXA[i] && x+fighterWidth<=enemyXA[i]+enemyWidth && y+fighterHeight>=enemyYAUp[i] && y<=enemyYAUp[i]+enemyHeight && imgEnemyAUp[i]){ 
     imgEnemyAUp[i]=!imgEnemy; 
     life-=39; 
     if(life<0){ 
     life=0; 
     life-=0; 
     } 
     } 
     if(x>=enemyXA[i] && x+fighterWidth<=enemyXA[i]+enemyWidth && y+fighterHeight>=enemyYADown[i] && y<=enemyYADown[i]+enemyHeight && imgEnemyADown[i]){ 
     imgEnemyADown[i]=!imgEnemy; 
     life-=39; 
     if(life<0){ 
     life=0; 
     life-=0; 
     } 
     } 
   } 
   if (enemyXA[4]>width){ 
     enemyMove= C; 
   } 
   break; 
   
   } 

          
          if (t2>=width){
              t2=-60*5;  
              switch(con%3){
                case 0:
                YY=floor(random(0,height-200));
                break;
                
                case 1:
                YY=floor(random(0,height-300));
                break;
                
                case 2:
                YY=floor(random(0,height-60));       

                break;
              }
              con++;
          }

          if (upPressed){
            y-=ySpeed;
          }
          if (downPressed){
            y+=ySpeed;
          }
          if (rightPressed){
            x+=xSpeed;
          }
          if (leftPressed){
            x-=xSpeed;
          }
          
          if (x<=0){
            x=0;
          }
          if (x>=width-50){
            x=width-50;
          }
          if (y<=0){
            y=0;
          }
          if (y>=height-50){
            y=height-50;
          }
                                    
          if ((x>=xx-50)&(x<=xx+40)&(y>=yy-50)&(y<yy+40)){
            xx=floor(random(600));
            yy=floor(random(440));
            life+=19.5;
               if (life >=195){
               life =195;
               }
          }
          break;
  }
         
}
void keyPressed(){
     if (key==CODED){
         if (keyCode == UP){
            upPressed=true;
         }else if (keyCode == DOWN){
                  downPressed=true;
               }
     
          if (keyCode == RIGHT){
             rightPressed=true;
          }else if (keyCode == LEFT){
                    leftPressed=true;
                 }
     }

}
void keyReleased(){
     if (key==CODED){
         if (keyCode == UP){
            upPressed=false;
         }else if (keyCode == DOWN){
                  downPressed=false;
               }
     
        if (keyCode == RIGHT){
            rightPressed=false;
        }else if (keyCode == LEFT){
                  leftPressed=false;
               }
     }

}
