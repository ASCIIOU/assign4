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

int enemystate; 
final int EA=0; 
final int EB=1; 
final int EC=2;  


boolean[]imgEnemy; 
int[]aEnemyX = {-360, -295, -295, -230, -230, -165, -165, -100}; 
int[]bEnemyX = {-100, -165, -230, -295, -360}; 
int[]cEnemyX = {-100, -165, -230, -295, -360};  
int e3Y=floor(random(0,175)); 
int[]aEnemyY = {e3Y+120, e3Y+60, e3Y+180, e3Y, e3Y+240, e3Y+60, e3Y+180, e3Y+120};; 
int e2Y=floor(random(0,175)); 
int[]bEnemyY = {e2Y, e2Y+60, e2Y+120, e2Y+180, e2Y+240};; 
 
int[]cEnemyY =new int[5]; 


int x,y,xx,yy,xxx,yyy,i,j,t,t2,enemyX,enemyY;

boolean upPressed,downPressed,rightPressed,leftPressed=false;

final int GAME_START=1,GAME_RUN=2,GAME_END=3;

int gameState;

float life=0;

int xSpeed=5;
int ySpeed=5;
int xxSpeed=5;
float yySpeed=2.5;
float YY=0;

void setup () {

  life = 40;
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
  end1= loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  
  xx=floor(random(600));
  yy=floor(random(440));
  xxx=0;
  yyy=floor(random(420));
  YY=floor(random(0,height-60));
  
  gameState = GAME_START;
  
  enemyX=-40; 
  enemyY=floor(random(30,440));  
  

}

void draw() {
  
  switch (gameState){
    case GAME_START:
         image(start2,0,0);
         if (mouseX>200 & mouseX<455 & mouseY>375 & mouseY<415){
             image(start1,0,0);
             if(mousePressed){
                  gameState = GAME_RUN;
              }
         }
         break; 
         
         
     case GAME_RUN:
          image(bg1,t,0);
          image(bg2,t-640,0);
          image(bg1,t-1280,0);
          t++;
          t%=1280;
          
          noStroke();
          fill(255,0,0);
          rect(10,0,life,20);
          
          image(hp,0,0);            //life          
          image(treasure,xx,yy);
          image(fighter,x,y);         
          translate(t2,0);  
          t2+=5;
 
 switch(enemystate){ 
       case EA: 
         for(int i=0;i<cEnemyX.length;i++){ 
            
           image(enemy,cEnemyX[i],enemyY);                        
           cEnemyX[i]+=2;                                
       
          if(i==0){ 
            if(cEnemyX[i]>=x-30 && cEnemyX[i]<=x+30 && enemyY>=y-40 && enemyY<=y+40){ 
          cEnemyX[i]=1000; life-=40; 
           }} 
          if(i==1){ 
            if(cEnemyX[i]>=x-30 && cEnemyX[i]<=x+30 && enemyY>=y-40 && enemyY<=y+40){ 
          cEnemyX[i]=1000; life-=40; 
          }} 
          if(i==2){ 
            if(cEnemyX[i]>=x-30 && cEnemyX[i]<=x+30 && enemyY>=y-40 && enemyY<=y+40){ 
          cEnemyX[i]=1000; life-=40; 
          }} 
          if(i==3){ 
            if(cEnemyX[i]>=x-30 && cEnemyX[i]<=x+30 && enemyY>=y-40 && enemyY<=y+40){ 
          cEnemyX[i]=1000; life-=40; 
          }} 
          if(i==4){ 
            if(cEnemyX[i]>=x-30 && cEnemyX[i]<=x+30 && enemyY>=y-40 && enemyY<=y+40){ 
          cEnemyX[i]=1000; life-=40; 
         }} 
       
                 if(life<=0){ 
           gameState=GAME_END; 
           } 
          }                       
              
          if(cEnemyX[0]>1600){ 
             enemystate=EB; 
             bEnemyX[0]=-100; bEnemyX[1]=-165; bEnemyX[2]=-230; bEnemyX[3]=-295; bEnemyX[4]=-360; 
             bEnemyY[0]=e2Y; bEnemyY[1]=e2Y+60; bEnemyY[2]=e2Y+120;  bEnemyY[3]=e2Y+180;  bEnemyY[4]=e2Y+240;  
             e2Y=floor(random(5,250)); 
           } 
            
          
          
       break; 
        
      case EB:     
         for(int i=0;i<bEnemyX.length;i++){ 
           
          image(enemy,bEnemyX[i],bEnemyY[i]); 
           bEnemyX[i]+=2; 
              
           if(i==0){ 
             if(bEnemyX[i]>=x-30 && bEnemyX[i]<=x+30 && bEnemyY[i]>=y-40 && bEnemyY[i]<=y+40 ){ 
            bEnemyX[i]=1000; life-=40; 
           }}  
           if(i==1){ 
             if(bEnemyX[i]>=x-30 && bEnemyX[i]<=x+30 && bEnemyY[i]>=y-40 && bEnemyY[i]<=y+40 ){ 
            bEnemyX[i]=1000; life-=40; 
           }} 
           if(i==2){ 
             if(bEnemyX[i]>=x-30 && bEnemyX[i]<=x+30 && bEnemyY[i]>=y-40 && bEnemyY[i]<=y+40 ){ 
            bEnemyX[i]=1000; life-=40; 
           }} 
           if(i==3){ 
             if(bEnemyX[i]>=x-30 && bEnemyX[i]<=x+30 && bEnemyY[i]>=y-40 && bEnemyY[i]<=y+40 ){ 
            bEnemyX[i]=1000; life-=40; 
           }} 
           if(i==4){ 
             if(bEnemyX[i]>=x-30 && bEnemyX[i]<=x+30 && bEnemyY[i]>=y-40 && bEnemyY[i]<=y+40 ){ 
            bEnemyX[i]=1000; life-=40; 
           }}  

if(bEnemyX[0]>1500){ 
             enemystate=EC; 
             aEnemyX[0]=-360;  
             aEnemyX[1]=-295; aEnemyX[2]=-295;  
             aEnemyX[3]=-230; aEnemyX[4]=-230;  
             aEnemyX[5]=-165; aEnemyX[6]=-165;  
             aEnemyX[7]=-100; 
            ///ENEMY3_Y/// 
             e3Y=floor(random(1,175)); 
             aEnemyY[0]=e3Y+120;  
             aEnemyY[1]=e3Y+60; aEnemyY[2]=e3Y+180;  
             aEnemyY[3]=e3Y; aEnemyY[4]=e3Y+240;  
             aEnemyY[5]=e3Y+60; aEnemyY[6]=e3Y+180;  
             aEnemyY[7]=e3Y+120;  
           }         
 

             if(life<=0){ 
             gameState=GAME_END; 
             } 
            } 
            
        break; 
        
      case EC: 
      image(enemy,aEnemyX[0],aEnemyY[0]); 
      image(enemy,aEnemyX[1],aEnemyY[1]);image(enemy,aEnemyX[2],aEnemyY[2]); 
      image(enemy,aEnemyX[3],aEnemyY[3]);image(enemy,aEnemyX[4],aEnemyY[4]); 
      image(enemy,aEnemyX[5],aEnemyY[5]);image(enemy,aEnemyX[6],aEnemyY[6]); 
      image(enemy,aEnemyX[7],aEnemyY[7]); 
 

       for(int i=0;i<8;i++){ 
           
        aEnemyX[i]+=2; 
          
            
         if(i==0){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 
         if(i==1){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 
         if(i==2){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 
         if(i==3){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 
         if(i==4){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 
         if(i==5){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 
         if(i==6){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 
         if(i==7){ 
           if(aEnemyX[i]>=x-30 && aEnemyX[i]<=x+30 && aEnemyY[i]>=y-40 && aEnemyY[i]<=y+40 ){            
            aEnemyX[i]=1000; life-=40; 
           }} 

         if(life<=0){ 
           gameState=GAME_END; 
           } 
         if(aEnemyX[0]>1500){ 
         enemystate=EA; 
         cEnemyX[0] = -100; cEnemyX[1] = -165; cEnemyX[2] = -230; cEnemyX[3] = -295; cEnemyX[4] = -360;  
         enemyY=floor(random(5,415));  
        } 
          } 
                      
     break; 
     
     
         case GAME_END:
    image(end2, 0, 0);
    if (mouseY > 310 && mouseY < 360 && mouseX >200 && mouseX < 440){
    image(end1, 0, 0);
    if (mousePressed){
      gameState = GAME_RUN;
      life=40;
      x=580;
      y=240;
     enemystate = EA; 
     cEnemyX[0] = -100; cEnemyX[1] = -165; cEnemyX[2] = -230; cEnemyX[3] = -295; cEnemyX[4] = -360;        
      enemyY=floor(random(30,440)); 
      life=40; 
    }else{ 
      image(end1,0,0);           
}
      
    break;
}
          
          
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
                                    //treasure
          if ((x>=xx-50)&(x<=xx+40)&(y>=yy-50)&(y<yy+40)){
            xx=floor(random(600));
            yy=floor(random(440));
            life+=20;
               if (life >=200){
               life =200;
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
