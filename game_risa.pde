void setup() 
{
 size(1000,500); 
}

boolean gameover = false ;
float ballX1 = 0;
float ballY1 = 0;
float ballX2 = 1000;
float ballY2 = 0;
float speedX1 = 5;
float speedY1 = 3;
float speedX2 = -3;
float speedY2 = -5;
int sizeball1 = 75;
int sizeball2 = 25;
int missX = 10;
int missY = 10;
int hit = 0;
int miss = 0;
int score = 0;

void draw()
{
  if (!gameover){
  
  float player = 30;
   
  if(ballX1 < 0 || ballX1 > width) speedX1 = -speedX1;

  if(ballY1 > height ) 
  {
  speedY1 = -speedY1;
  float distance = abs(mouseX - ballX1); 
  if(distance < player) hit += 1;
  else miss += 1 ;
  } 
  else speedY1 +=1; 
  
  if(ballX2 < 0 || ballX2 > width) speedX2 = -speedX2;
  if(ballY2 > height ) 
  {
  speedY2 = -speedY2;
  float distance = abs(mouseX - ballX2); 
  if(distance < player) hit += 1;
  else miss += 1 ;
  }
  else speedY2 +=1;
  
  ballX1 += speedX1;
  ballY1 += speedY1;
  ballX2 += speedX2;
  ballY2 += speedY2;
  
  if (miss == missX) 
  {
  speedX1 += 10;
  missX+=10;
  } 
  
  if (miss == missY) 
  {
  sizeball2 += 15;
  missY+=10;
  }
  
  score += 1;
  
  background(70, 130, 180);
  fill(219, 112, 147);
  ellipse(ballX1, ballY1, sizeball1, sizeball1);
  ellipse(ballX2, ballY2, sizeball2, sizeball2);
   
  fill(219, 112, 147);
  rect(mouseX-player,height-70,player,60);
  
  fill(250);
  textAlign(LEFT);
  textSize(30);
  text("Score : "+ score, 10,20);
  //text("hit   : "+ hit , 10,40);
  //text("miss  : "+ miss, 10,60);
  
  if (hit == 1) 
  {
    gameover =true;
    background(250, 99, 71);
    textAlign(CENTER);
    textSize (30);
    fill(245, 222, 179);
    text ("GAME OVER", 380, 210);
    text("Your Score = "+score, 380, 240);
    text("👾", 380, 270);
  }
}
}
