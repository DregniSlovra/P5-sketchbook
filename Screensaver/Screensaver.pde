class Ball
{
  PVector pos;
  PVector spd;
  PVector acc;
  int size;
  color c;
  
  Ball(PVector npos, int nsize, color nc)
  {
    pos = npos;
    size = nsize;
    c = nc;
    spd = new PVector(random(-5, 5), random(-5, 5));
  }
  
  void display()
  {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, size * 2, size * 2);
  }
  
  void change_direction()
  {
    if (spd.x > 5 || spd.x < -5)
    {
      spd.x *= -1;
    }
    if (pos.y + size > height || pos.y - size < 0)
    {
      spd.y *= -1;
    }
    spd.add(acc);
  }
  
  void move()
  {
    if (pos.x + size > width || pos.x - size < 0)
    {
      spd.x *= -1;
    }
    if (pos.y + size > height || pos.y - size < 0)
    {
      spd.y *= -1;
    }
    pos.add(spd);
  }
}

ArrayList<Ball> balles;

void setup()
{
  size(800, 800);
  color c;
  balles = new ArrayList();
  for (int i = 0; i < 500; ++i)
  {
    c = color(int(random(250)), int(random(250)), int(random(250)));
    balles.add(new Ball(new PVector(width/2, height/2), 10, c));
  }
}

void draw()
{
  background(0);
  for (Ball ball : balles)
  {
    ball.display();
    ball.move();
  }
}
