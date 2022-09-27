Board board;

void setup()
{
  size(800, 800);
  board = new Board(10, 10, 50);
}

void draw() 
{
  board.display();
}

void mouseReleased()
{
  board.onClick(new PVector(mouseX, mouseY));
}

void keyReleased()
{
  if (key == ' ')
  {
    board.toggleAll();
  }
}
