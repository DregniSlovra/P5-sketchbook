
// ------------------------------
// PARAMETERS
// You are free to change the following parameters
// ------------------------------

float DEFAULT_SPEED = 0.05;
int HELICE_NUMBER = 2;

// ------------------------------
// CODE 
// Do not touch below code if you don't know what you are doing
// ------------------------------

Helice hell;
float rotation = 1;
float speed = DEFAULT_SPEED;

void setup()
{
  size(800, 800);
  hell = new Helice(new PVector(width/2, height/2), width/4, HELICE_NUMBER);
  textSize(50);
}

void draw()
{
  background(200);
  hell.display(rotation);
  text(speed, 0, 50);
  rotation += speed;
}

void keyPressed()
{
  if (key == '-')
  {
    speed -= 0.001;
  }
  else if (key == '+')
  {
    speed += 0.001;
  }
}
