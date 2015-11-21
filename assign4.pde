float x, y, xx, yy; 

PImage bg1;
PImage bg2;
PImage end1;
PImage end2;
PImage enemy;
PImage fighter;
PImage hp;
PImage start1;
PImage start2;
PImage treasure; 

int t, gameState, life, m, enemyState; 

final int GAME_START=1, GAME_RUN=2, GAME_END=3, EA=4, EB=5, EC=6; 

boolean upPressed = false,
        downPressed = false, 
        leftPressed = false, 
        rightPressed = false; 

int eY; 
int []e1 = {-100, -165, -230, -295, -360}; 

int e2Ys=floor(random(0,175));  
int []e2X = {-100, -165, -230, -295, -360}; 
int []e2Y = {e2Ys, e2Ys+60, e2Ys+120, e2Ys+180, e2Ys+240}; 

int e3Ys=floor(random(0,175)); 
int []e3X = {-360, -295, -295, -230, -230, -165, -165, -100}; 
int []e3Y = {e3Ys+120, e3Ys+60, e3Ys+180, e3Ys, e3Ys+240, e3Ys+60, e3Ys+180, e3Ys+120}; 

float L1, L2, L3; 


void setup () { 
   size(640, 480) ; 
   background(255); 
   start1 = loadImage("img/start1.png"); 
   start2 = loadImage("img/start2.png"); 
   bg1 = loadImage("img/bg1.png"); 
   end1 = loadImage("img/end1.png"); 
   end2 = loadImage("img/end2.png"); 
   bg2 = loadImage("img/bg2.png"); 
   hp = loadImage("img/hp.png"); 
   enemy = loadImage("img/enemy.png");    
   fighter = loadImage("img/fighter.png"); 
   treasure = loadImage("img/treasure.png");
   life = 40;
   x=580;
   y=240;
   xx = 590; 
   yy = 240;
   eY = floor(random(1,420));
   xx=floor(random(0,600));  
   yy=floor(random(1,439));
   enemyState = EA;
   

   for(int i = 0; i<e2X.length; i++){if(abs(e2X[i]-(x-40))==0){L2=e2X[i];}} 
   for(int i = 0; i<e3X.length; i++){if(abs(e3X[i]-(x-40))==0){L3=e3X[i];}} 
   gameState = GAME_START; 
   frameRate(60); 
 } 
 
 void draw() { 
   switch (gameState) { 
     case GAME_START: 
     image(start2,0,0); 
     if(mousePressed) { 
       gameState = GAME_RUN;}else { 
     if(mouseX >= width/3 && mouseX <= 2*width/3 && mouseY >=380 && mouseY <=415) { 
           image(start1,0,0); 
         } 
   } 
   break; 
     case GAME_RUN: 
     {image(bg1, t, 0); 
     image(bg2, t-640, 0); 
     image(bg1, t-1280, 0); 
     t+=1; 
     t %= 1280; 
     } 
     image(treasure, xx, yy); 
     image(fighter, x, y); 
     if(upPressed == true) { y -= 5; } 
     if(downPressed == true) { y += 5; } 
     if(leftPressed == true) { x -= 5; } 
     if(rightPressed == true) { x += 5; } 
     if(x <= 20) { x = 20; }; if(x >= 570) { x = 570; }; 
     if(y <= 20) { y = 20; }; if(y >= 410) { y = 410; }; 
      
 
     switch(enemyState){ 
     case EA:   
     for(int i = 0; i < e1.length; i++) { 
         image(enemy, e1[i], eY); 
         e1[i]+=4; 
 
         if(i==0){if(x-40<=e1[i] && x+40>=e1[i] && y+40>eY && y-40<eY){e1[i]=800;life-=40; }} 
         if(i==1){if(x-40<=e1[i] && x+40>=e1[i] && y+40>eY && y-40<eY){e1[i]=800;life-=40; }} 
         if(i==2){if(x-40<=e1[i] && x+40>=e1[i] && y+40>eY && y-40<eY){e1[i]=800;life-=40; }} 
         if(i==3){if(x-40<=e1[i] && x+40>=e1[i] && y+40>eY && y-40<eY){e1[i]=800;life-=40; }} 
         if(i==4){if(x-40<=e1[i] && x+40>=e1[i] && y+40>eY && y-40<eY){e1[i]=800;life-=40; }} 

         if(e1[0] >= 1500) { 
         enemyState = EB; 
         e2X[0]=-100; e2X[1]=-165; e2X[2]=-230; e2X[3]=-295; e2X[4]=-360; 
         e2Y[0]=e2Ys; e2Y[1]=e2Ys+60; e2Y[2]=e2Ys+120; e2Y[3]=e2Ys+180; e2Y[4]=e2Ys+240;  
         e2Ys=floor(random(1,175)); 
         } 
        
     } 
     break; 
     case EB: 
     for(int i = 0; i < 5; i++) { 
       image(enemy, e2X[i], e2Y[i]); 
       e2X[i]+=4; 

       if(i==0){if(x-40<=e2X[i] && x+40>=e2X[i] && y+40>e2Y[i] && y-40<e2Y[i]){e2X[i]=800;life-=40; }} 
       if(i==1){if(x-40<=e2X[i] && x+40>=e2X[i] && y+40>e2Y[i] && y-40<e2Y[i]){e2X[i]=800;life-=40; }} 
       if(i==2){if(x-40<=e2X[i] && x+40>=e2X[i] && y+40>e2Y[i] && y-40<e2Y[i]){e2X[i]=800;life-=40; }} 
       if(i==3){if(x-40<=e2X[i] && x+40>=e2X[i] && y+40>e2Y[i] && y-40<e2Y[i]){e2X[i]=800;life-=40; }} 
       if(i==4){if(x-40<=e2X[i] && x+40>=e2X[i] && y+40>e2Y[i] && y-40<e2Y[i]){e2X[i]=800;life-=40; }} 

       if(e2X[0] >= 1500) { 
       enemyState = EC; 

       e3X[0]=-360;  
       e3X[1]=-295; e3X[2]=-295;  
       e3X[3]=-230; e3X[4]=-230;  
       e3X[5]=-165; e3X[6]=-165;  
       e3X[7]=-100; 
 
       e3Ys=floor(random(1,175)); 
       e3Y[0]=e3Ys+120;  
       e3Y[1]=e3Ys+60; e3Y[2]=e3Ys+180;  
       e3Y[3]=e3Ys; e3Y[4]=e3Ys+240;  
       e3Y[5]=e3Ys+60; e3Y[6]=e3Ys+180;  
       e3Y[7]=e3Ys+120; 
       } 
        
     } 
     break; 
     case EC: 
       image(enemy,e3X[0],e3Y[0]); 
       image(enemy,e3X[1],e3Y[1]);image(enemy,e3X[2],e3Y[2]); 
       image(enemy,e3X[3],e3Y[3]);image(enemy,e3X[4],e3Y[4]); 
       image(enemy,e3X[5],e3Y[5]);image(enemy,e3X[6],e3Y[6]); 
       image(enemy,e3X[7],e3Y[7]); 
       for(int i = 0; i < 8; i++) { 
         e3X[i]+=4; 
         if(i==0){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
         if(i==1){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
         if(i==2){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
         if(i==3){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
         if(i==4){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
         if(i==5){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
         if(i==6){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
         if(i==7){if(x-40<=e3X[i] && x+40>=e3X[i] && y-40<=e3Y[i] && y+40>=e3Y[i]){e3X[i]=800;life-=40; }} 
 
       if(e3X[7] >= 1500) { 
       enemyState = EA; 
       e1[0] = -100;  e1[1] = -165;  e1[2] = -230;  e1[3] = -295;  e1[4] = -360;  
       eY = floor(random(1,420)); 
       } 
       } 
     break; 
     } 
      

       if(x <= xx + 40 && x >= xx - 40 && y <= yy + 40 && y >= yy - 40) { 
       image(treasure, xx, yy); 
       xx=floor(random(600)); 
       yy=floor(random(440)); 
      
       life += 20; 
       if(life > 200) { 
         life = 200; 
       } 
     } 
        

       if(life <=0) { 
         gameState = GAME_END; 
       } 
        

         noStroke();
         fill(255,0,0);
         rect(30, 20, life, 20);
         image(hp, 20, 20); 
      
       break; 

       case GAME_END: 
       life = 40; 
         x = 580; 
         y = 240; 
         m = 0; 
       image(end2,0,0); 
       if(mousePressed) { 
       gameState = GAME_RUN; 
       enemyState = EA;e1[0] = -100;  
       e1[1] = -165;  
       e1[2] = -230;  
       e1[3] = -295;  
       e1[4] = -360;  
       eY = floor(random(1,420));}else { 
         if(mouseX >= width/3 && mouseX <= 2*width/3 && mouseY >=315 && mouseY <=350) { 
           image(end1,0,0); 
         } 
   } 
   break; 
      
 } 
 } 
   void keyPressed() { 
     if(key == CODED) { 
       switch(keyCode) { 
         case UP: 
         upPressed = true; 
         break; 
         case DOWN: 
         downPressed = true; 
         break; 
         case LEFT: 
         leftPressed = true; 
         break; 
         case RIGHT: 
         rightPressed = true; 
         break; 
       } 
     } 
   } 
    void keyReleased() { 
      if(key == CODED) { 
       switch(keyCode) { 
         case UP: 
         upPressed = false; 
         break; 
         case DOWN: 
         downPressed = false; 
         break; 
         case LEFT: 
         leftPressed = false; 
         break; 
         case RIGHT: 
         rightPressed = false; 
         break; 
       } 
     } 
    } 
