class Tile
{
  boolean open;
  int value;
  PVector pos;
  int size;
  
  Tile(PVector _pos, int _size)
  {
    open = false;
    value = 0;
    pos = _pos.copy();
    size = _size;
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(2);
    if (!open)
    {
      fill(0, 255, 0);
      rect(pos.x, pos.y, size, size);
      return;
    }
    fill(100);
    rect(pos.x, pos.y, size, size);
    fill(200);
    if (value == -1) 
    {
      ellipse(pos.x + size / 2, pos.y + size / 2, size / 2, size / 2);
      return;
    }
    textSize(size / 2);
    text(value, pos.x + size / 3 , pos.y+2*size/3);
  }
  
  void onClick(PVector mouse)
  {
    if (mouse.x > pos.x && mouse.y > pos.y && mouse.x < pos.x + size && mouse.y < pos.y + size)
    {
      open = !open;
    }
  }
}
