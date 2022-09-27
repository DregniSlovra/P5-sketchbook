
// ------------------------------
// CODE 
// Do not touch below code if you don't know what you are doing
// ------------------------------

class Helice
{
  PVector pos;
  float radius;
  int rays;
  
  Helice(PVector npos, float nradius, int nrays)
  {
    pos = npos;
    radius = nradius;
    rays = nrays;
  }
  
  void display(float rotation)
  {
    float angle = 0;
    float x = 0;
    float y = 0;
    for (int i = 0; i < 360; i += 360/rays)
    {
      angle = radians(i);
      x = cos(rotation+angle) * radius;
      y = sin(rotation+angle) * radius;
      line(pos.x, pos.y, pos.x + x, pos.y + y);
    }
  }
}
