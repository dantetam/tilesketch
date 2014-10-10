PImage block;

int rows = 10; int cols = 10;
void setup()
{
  size(1000,1000);
}

void draw()
{
  background(255);
  for (int r = 0; r < rows; r++) 
  {
    for (int c = 0; c < cols; c++)
    {
      //image(block,r*(width/rows),c*(height/cols));
      block = getBlock(90,90);
      image(block,r*(width/rows) + 5,c*(height/cols) + 5);
    }
  }  
  noLoop();
}

PImage getBlock(int w, int h)
{
  PImage temp = createImage(w,h,ARGB);
  pushStyle();
  float red = 150*random(0,1);
  float green = 225*random(0,1);
  float blue = 255*random(0,1);
  for (int r = 0; r < w; r++)
  {
    for (int c = 0; c < h; c++)
    {
      //if (r == 0 || r == w-1 || c == 0 || c == h-1)
      /*
      if (r < borderWidth || r >= w-1-borderWidth)
      {  
        float a = float(min(r,w-r))/float(borderWidth)*255;
        temp.pixels[r*w + c] = color(0,0,0,a);
      }
      else if (c < borderWidth || c >= h-1-borderWidth)
      {
        float a = float(min(c,h-c))/float(borderWidth)*255;
        temp.pixels[r*w + c] = color(0,0,0,a);
      }
      */
      temp.pixels[r*w + c] = color(red,green,blue,(float(h-r)/float(h))*255);
    }
  }
 
  int borderWidth = 10;
  for (int i = borderWidth; i >= 0; i--)
  {
    red = 150; green = 150; blue = 150;
    float a = min(i,w-i-1)/float(borderWidth)*255 - 50;
    //float a = 255;
    for (int row = 0; row < h; row++)
    {
      temp.pixels[row*h + i] = color(red,green,blue,a);
      temp.pixels[row*h + (w-i-1)] = color(red,green,blue,a);
      //temp.pixels[(w-i)*h + row] = color(0,0,0,a);
    }
    for (int col = 0; col < w; col++)
    {
      temp.pixels[i*w + col] = color(red,green,blue,a);
      temp.pixels[(w-i-1)*h + col] = color(red,green,blue,a);
    }
  }
  
  temp.updatePixels();
  popStyle();
  return temp;
}
