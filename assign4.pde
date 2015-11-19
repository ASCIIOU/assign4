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

void setup () {

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
  
  gameState = Game_start;
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
  
          for (int i=1;i<=5;i++){
            for (int j=1;j<=5;j++){
              switch(con%3){
                case 0:
                image(enemy,i*60,YY);
                break;
                case 1:
                if (i+j==6){
                image(enemy,i*60,YY+(j-1)*40);
                }
                break;
                case 2:
                if (abs(j-3)+abs(i-3)==2){
                  image(enemy,i*60,YY+(j-1)*60);
                }
                break;
              }
            }
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
