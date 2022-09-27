class Board
{
  ArrayList<Tile> tiles;
  PVector max;
  int size;
  
  Board(int rows, int cols, int _size)
  {
    tiles = new ArrayList();
    max = new PVector(cols, rows);
    size = _size;
    PVector it = new PVector(0, 0);
    for (it.x = 0; it.x < cols * size; it.x += size)
    {
      for (it.y = 0; it.y < rows * size; it.y += size)
      {
        tiles.add(new Tile(it, size));
      }
    }
    for (int i = rows * cols / 10; i > 0;)
    {
      it = new PVector(int(random(0, cols)), int(random(0, rows)));
      Tile tile = tiles.get(int(it.x*cols + it.y));
      if (tile.value != -1)
      {
        tile.value = -1;
        _incrementValuesAround(it);
        --i;
      }
    }
  }
  
  void display()
  {
    for (Tile tile : tiles)
    {
      tile.display();
    }
  }
  
  void toggleAll()
  {
    for (Tile tile : tiles)
    {
      tile.open = !tile.open;
    }
  }
  
  void onClick(PVector pos)
  {
    for (Tile tile : tiles)
    {
      tile.onClick(pos);
    }
  }
  
  void _tileInc(Tile tile)
  {
    if (tile.value  != -1)
    {
      tile.value += 1;
    }
  }
  
  void _incrementValuesAround(PVector pos)
  {
    if (pos.y - 1 > 0)
    {
      _tileInc(tiles.get(int(pos.x * max.x + (pos.y - 1))));
    }
    if (pos.y + 1 < max.y)
    {
      _tileInc(tiles.get(int(pos.x * max.x + (pos.y + 1))));
    }
    if (pos.x - 1 > 0)
    {
      _tileInc(tiles.get(int((pos.x - 1) * max.x + pos.y)));
      if (pos.y - 1 > 0)
      {
        _tileInc(tiles.get(int((pos.x - 1) * max.x + (pos.y - 1))));
      }
      if (pos.y + 1 < max.y)
      {
        _tileInc(tiles.get(int((pos.x - 1) * max.x + (pos.y + 1))));
      }
    }
    if (pos.x + 1 < max.x)
    {
      _tileInc(tiles.get(int((pos.x + 1) * max.x + pos.y)));
      if (pos.y - 1 > 0)
      {
        _tileInc(tiles.get(int((pos.x + 1) * max.x + (pos.y - 1))));
      }
      if (pos.y + 1 < max.y)
      {
        _tileInc(tiles.get(int((pos.x + 1) * max.x + (pos.y + 1))));
      }
    }
  }
}
