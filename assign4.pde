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
int fighterXS, enemyXS, treasureXS;

final int GAME_START=1, GAME_RUN=2, GAME_END=3, EA=4, EB=5, EC=6; 

boolean upPressed = false,
        downPressed = false, 
        leftPressed = false, 
        rightPressed = false; 

int EY; 
int []E1 = {-100, -165, -230, -295, -360}; 

int EY2s=floor(random(0,175));  
int []EX2 = {-100, -165, -230, -295, -360}; 
int []EY2 = {EY2s, EY2s+60, EY2s+120, EY2s+180, EY2s+240}; 

int EY3s=floor(random(0,175)); 
int []EX3 = {-360, -295, -295, -230, -230, -165, -165, -100}; 
int []EY3 = {EY3s+120, EY3s+60, EY3s+180, EY3s, EY3s+240, EY3s+60, EY3s+180, EY3s+120}; 

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
   
   fighterXS=51;
   enemyXS=61;
   treasureXS=41;
   
   life = 40;
   x=580;
   y=240;
   xx = 590; 
   yy = 240;
   EY = floor(random(1,420));
   xx=floor(random(0,600));  
   yy=floor(random(1,439));
   enemyState = EA;
   

   for(int i = 0; i<EX2.length; i++){if(abs(EX2[i]-(x-40))==0){L2=EX2[i];}} 
   for(int i = 0; i<EX3.length; i++){if(abs(EX3[i]-(x-40))==0){L3=EX3[i];}} 
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
     for(int i = 0; i < E1.length; i++) { 
         image(enemy, E1[i], EY); 
         E1[i]+=4; 
 
         if(i==0){if(x-(fighterXS/2+enemyXS/2-10)<=E1[i] && x+(fighterXS/2+enemyXS/2-10)>=E1[i] && 
       y+(fighterXS/2+enemyXS/2-10)>EY && y-(fighterXS/2+enemyXS/2-10)<EY){E1[i]=800;life-=40; }} 
         if(i==1){if(x-(fighterXS/2+enemyXS/2-10)<=E1[i] && x+(fighterXS/2+enemyXS/2-10)>=E1[i] && 
       y+(fighterXS/2+enemyXS/2-10)>EY && y-(fighterXS/2+enemyXS/2-10)<EY){E1[i]=800;life-=40; }} 
         if(i==2){if(x-(fighterXS/2+enemyXS/2-10)<=E1[i] && x+(fighterXS/2+enemyXS/2-10)>=E1[i] &&
       y+(fighterXS/2+enemyXS/2-10)>EY && y-(fighterXS/2+enemyXS/2-10)<EY){E1[i]=800;life-=40; }} 
         if(i==3){if(x-(fighterXS/2+enemyXS/2-10)<=E1[i] && x+(fighterXS/2+enemyXS/2-10)>=E1[i] && 
       y+(fighterXS/2+enemyXS/2-10)>EY && y-(fighterXS/2+enemyXS/2-10)<EY){E1[i]=800;life-=40; }} 
         if(i==4){if(x-(fighterXS/2+enemyXS/2-10)<=E1[i] && x+(fighterXS/2+enemyXS/2-10)>=E1[i] && 
       y+(fighterXS/2+enemyXS/2-10)>EY && y-(fighterXS/2+enemyXS/2-10)<EY){E1[i]=800;life-=40; }} 

         if(E1[0] >= 1500) { 
         enemyState = EB; 
         EX2[0]=-100; EX2[1]=-165; EX2[2]=-230; EX2[3]=-295; EX2[4]=-360; 
         EY2[0]=EY2s; EY2[1]=EY2s+60; EY2[2]=EY2s+120; EY2[3]=EY2s+180; EY2[4]=EY2s+240;  
         EY2s=floor(random(1,175)); 
         } 
        
     } 
     break; 
     case EB: 
     for(int i = 0; i < 5; i++) { 
       image(enemy, EX2[i], EY2[i]); 
       EX2[i]+=4; 

       if(i==0){if(x-(fighterXS/2+enemyXS/2-10)<=EX2[i] && x+(fighterXS/2+enemyXS/2-10)>=EX2[i] && 
     y+(fighterXS/2+enemyXS/2-10)>EY2[i] && y-(fighterXS/2+enemyXS/2-10)<EY2[i]){EX2[i]=800;life-=40; }} 
       if(i==1){if(x-(fighterXS/2+enemyXS/2-10)<=EX2[i] && x+(fighterXS/2+enemyXS/2-10)>=EX2[i] && 
     y+(fighterXS/2+enemyXS/2-10)>EY2[i] && y-(fighterXS/2+enemyXS/2-10)<EY2[i]){EX2[i]=800;life-=40; }} 
       if(i==2){if(x-(fighterXS/2+enemyXS/2-10)<=EX2[i] && x+(fighterXS/2+enemyXS/2-10)>=EX2[i] && 
     y+(fighterXS/2+enemyXS/2-10)>EY2[i] && y-(fighterXS/2+enemyXS/2-10)<EY2[i]){EX2[i]=800;life-=40; }} 
       if(i==3){if(x-(fighterXS/2+enemyXS/2-10)<=EX2[i] && x+(fighterXS/2+enemyXS/2-10)>=EX2[i] && 
     y+(fighterXS/2+enemyXS/2-10)>EY2[i] && y-(fighterXS/2+enemyXS/2-10)<EY2[i]){EX2[i]=800;life-=40; }} 
       if(i==4){if(x-(fighterXS/2+enemyXS/2-10)<=EX2[i] && x+(fighterXS/2+enemyXS/2-10)>=EX2[i] && 
     y+(fighterXS/2+enemyXS/2-10)>EY2[i] && y-(fighterXS/2+enemyXS/2-10)<EY2[i]){EX2[i]=800;life-=40; }} 

       if(EX2[0] >= 1500) { 
       enemyState = EC; 

       EX3[0]=-360;  
       EX3[1]=-295; EX3[2]=-295;  
       EX3[3]=-230; EX3[4]=-230;  
       EX3[5]=-165; EX3[6]=-165;  
       EX3[7]=-100; 
 
       EY3s=floor(random(1,175)); 
       EY3[0]=EY3s+120;  
       EY3[1]=EY3s+60; EY3[2]=EY3s+180;  
       EY3[3]=EY3s; EY3[4]=EY3s+240;  
       EY3[5]=EY3s+60; EY3[6]=EY3s+180;  
       EY3[7]=EY3s+120; 
       } 
        
     } 
     break; 
     case EC: 
       image(enemy,EX3[0],EY3[0]); 
       image(enemy,EX3[1],EY3[1]);image(enemy,EX3[2],EY3[2]); 
       image(enemy,EX3[3],EY3[3]);image(enemy,EX3[4],EY3[4]); 
       image(enemy,EX3[5],EY3[5]);image(enemy,EX3[6],EY3[6]); 
       image(enemy,EX3[7],EY3[7]); 
       for(int i = 0; i < 8; i++) { 
         EX3[i]+=4; 
         if(i==0){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
         if(i==1){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
         if(i==2){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
         if(i==3){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
         if(i==4){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
         if(i==5){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
         if(i==6){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
         if(i==7){if(x-(fighterXS/2+enemyXS/2-10)<=EX3[i] && x+(fighterXS/2+enemyXS/2-10)>=EX3[i] && 
       y-(fighterXS/2+enemyXS/2-10)<=EY3[i] && y+(fighterXS/2+enemyXS/2-10)>=EY3[i]){EX3[i]=800;life-=40; }} 
 
       if(EX3[7] >= 1500) { 
       enemyState = EA; 
       E1[0] = -100;  E1[1] = -165;  E1[2] = -230;  E1[3] = -295;  E1[4] = -360;  
       EY = floor(random(1,420)); 
       } 
       } 
     break; 
     } 
      

       if(x <= xx + (fighterXS/2+treasureXS/2) && 
       x >= xx - (fighterXS/2+treasureXS/2) && 
       y <= yy + (fighterXS/2+treasureXS/2) && 
       y >= yy - (fighterXS/2+treasureXS/2)) { 
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
       enemyState = EA;E1[0] = -100;  
       E1[1] = -165;  
       E1[2] = -230;  
       E1[3] = -295;  
       E1[4] = -360;  
       EY = floor(random(1,420));}else { 
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
