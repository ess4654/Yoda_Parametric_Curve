import ddf.minim.*;

Minim minim;
AudioPlayer player;

float DefaultScale = 0.4;
float FR = 30;
float SampleRate = 20;

boolean running = true;
boolean DEBUGGING = false;
boolean SoundOn = true;

float t = 0;
float scale = DefaultScale;
color transparent = color(0, 0, 0, 0);
color darkgreen = color(122, 115, 68);
color green = color(62, 59, 26);
color brown = color(55, 48, 29);
color black = color(53, 50, 42);
color ears = color(120, 77, 53);
color white = color(255, 255, 255);
ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Integer> lineColor = new ArrayList<Integer>();
ArrayList<Integer> strokes = new ArrayList<Integer>();

void setup()
{
  fullScreen(P2D);
  //size(800, 800, P2D);
  background(0);
  noFill();
  smooth();
  frameRate(FR);
  
  minim = new Minim(this);
  player = minim.loadFile("StarWars Theme.mp3");
  if(SoundOn)
    player.loop();
}

void keyPressed() {
  if(key == ' ')
    running = !running;
  if(key == 'r')
    reset();
}

void reset()
{
  frameCount = -1;
  t = 0;
  lineColor.clear();
  strokes.clear();
  points.clear();
  minim.stop();
  minim = new Minim(this);
  if(SoundOn)
    player.loop();
  scale = DefaultScale;
}

float updateT(float T)
{
  T += 0.004;
  
  if(T >= 229.409) { //END
    strokes.add(1);
    lineColor.add(white);
    return 92 * PI;
  }
  if(T >= 226.071 && T < 229.409) { //MOUTH SLIT
    strokes.add(1);
    lineColor.add(darkgreen);
    return T - 0.001;
  }
  if(T >= 216.805 && T < 226.071) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 226.071;
  }
  if(T >= 213.674 && T < 216.805) { //NOSE LINES
    strokes.add(1);
    lineColor.add(darkgreen);
    return T;
  }
  if(T >= 204.328 && T < 213.674) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 213.674;
  }
  if(T >= 201.106 && T < 204.328) { //RIGHT UNDER EYEBROW
    strokes.add(1);
    lineColor.add(darkgreen);
    return T - 0.001;
  }
  if(T >= 191.697 && T < 201.106) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 201.106;
  }
  if(T >= 188.567 && T < 191.697) { //LEFT UNDER EYEBROW
    strokes.add(1);
    lineColor.add(darkgreen);
    return T - 0.001;
  }
  if(T >= 179.180 && T < 188.567) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 188.567;
  }
  if(T >= 175.934 && T < 179.180) { //NOSE
    strokes.add(2);
    lineColor.add(green);
    return T;
  }
  if(T >= 166.631 && T < 175.934) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 175.934;
  }
  if(T >= 163.413 && T < 166.631) { //RIGHT UPPER EYEBROW
    strokes.add(2);
    lineColor.add(green);
    return T;
  }
  if(T >= 153.922 && T < 163.413) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 163.413;
  }
  if(T >= 150.864 && T < 153.922) { //LEFT UPPER EYEBROW
    strokes.add(2);
    lineColor.add(green);
    return T;
  }
  if(T >= 141.345 && T < 150.864) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 150.864;
  }
  if(T >= 138.251 && T < 141.345) { //CHIN
    strokes.add(2);
    lineColor.add(darkgreen);
    return T + 0.002;
  }
  if(T >= 128.668 && T < 138.251) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 138.251;
  }
  if(T >= 125.666 && T < 128.668) { //MOUSTACHE
    strokes.add(2);
    lineColor.add(brown);
    return T - 0.003;
  }
  if(T >= 116.244 && T < 125.666) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 125.666;
  }
  if(T >= 113.098 && T < 116.244) { //FROWN LINES
    strokes.add(1);
    lineColor.add(darkgreen);
    return T - 0.003;
  }
  if(T >= 103.691 && T < 113.098) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 113.098;
  }
  if(T >= 100.573 && T < 103.691) { //FROWN LINES
    strokes.add(2);
    lineColor.add(green);
    return T;
  }
  if(T >= 94.164 && T < 100.573) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 100.573;
  }
  if(T >= 88.000 && T < 94.164) { //RIGHT EYE
    strokes.add(2);
    lineColor.add(green);
    return T + 0.004;
  }
  if(T >= 81.668 && T < 88.000) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 88.000;
  }
  if(T >= 75.444 && T < 81.668) { //LEFT EYE
    strokes.add(2);
    lineColor.add(green);
    return T + 0.004;
  }
  if(T >= 68.963 && T < 75.444) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 75.444;
  }
  if(T >= 62.870 && T < 68.963) { //LEFT EYEBALL
    strokes.add(5);
    lineColor.add(black);
    return T + 0.004;
  }
  if(T >= 54.454 && T < 62.870) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 62.870;
  }
  if(T >= 50.305 && T < 54.454) { //RIGHT EYEBALL
    strokes.add(4);
    lineColor.add(black);
    return T + 0.004;
  }
  if(T >= 43.950 && T < 50.305) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 50.305;
  }
  if(T >= 37.700 && T < 43.950) { //MOUTH
    strokes.add(2);
    lineColor.add(green);
    return T + 0.002;
  }
  if(T >= 31.402 && T < 37.700) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 37.700;
  }
  if(T >= 25.133 && T < 31.402) { //LEFT EAR
    strokes.add(3);
    lineColor.add(ears);
    return T + 0.004;
  }
  if(T >= 18.838 && T < 25.133) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 25.133;
  }
  if(T >= 12.571 && T < 18.838) { //RIGHT EAR
    strokes.add(3);
    lineColor.add(ears);
    return T + 0.004;
  }
  if(T >= 6.280 && T < 12.571) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 12.571;
  }
  else { //HEAD OUTLINE
    strokes.add(4);
    lineColor.add(green);
  }
  
  return T;
}

void draw()
{ 
  if(frameCount < 30) return;
  if(t <= 92 * PI && running)
  {
    for(int z = 0; z<SampleRate; z++) {
      t = updateT(t);
      points.add(new PVector(x(t), -y(t)));
      if(DEBUGGING)
        print(t + "\n");
    }
  } else {
    if(!DEBUGGING)
      scale += 0.00054;
  }
  
  translate(width/2, height/2 + 30);
  background(0);
  
  beginShape();
  for(int i = 0; i < points.size(); i++)
  {
    if(points.get(i).x == 0 && points.get(i).y == 0) continue;
    strokeWeight(strokes.get(i));
    stroke(lineColor.get(i));
    point(points.get(i).x * scale, points.get(i).y * scale);
  }
  endShape();
}

float sgn(float x)
{
  if(x == 0) return 0;
  else if(x > 0) return 1;
  else return -1;
}

float theta(float x)
{
  if(x == 0) return 0.5;
  else if(x > 0) return 1;
  else return 0;
}

float SIN(float x)
{
  return sin(x);
}

float x(float t)
{
  return ((-4.0/7*sin(3.0/2 - 2*t) + 879.0/7*sin(t + 11.0/7) + 113.0/9*sin(3*t + 11.0/7) + 9.0/10*sin(4*t + 14.0/9) + 32.0/7*sin(5*t + 11.0/7) + 1.0/3*sin(6*t + 8.0/5) + 26.0/11*sin(7*t + 11.0/7) + 1.0/3*sin(8*t + 14.0/9) + 3.0/2*sin(9*t + 11.0/7) + 1.0/11*sin(10*t + 28.0/19) + 8.0/9*sin(11*t + 11.0/7) + 1.0/7*sin(12*t + 11.0/7) + 5.0/8*sin(13*t + 19.0/12) - 31.0/6)*theta(75*PI -t)*theta(t - 71*PI) + (-1.0/6*sin(14.0/9 - 10*t) - 8.0/15*sin(14.0/9 - 8*t) - 101.0/51*sin(23.0/15 - 7*t) - 121.0/8*sin(14.0/9 - 6*t) + 21.0/8*sin(t + 11.0/7) + 441.0/44*sin(2*t + 11.0/7) + 127.0/15*sin(3*t + 11.0/7) + 129.0/10*sin(4*t + 19.0/12) + 343.0/19*sin(5*t + 11.0/7) + 2.0/5*sin(9*t + 8.0/5) + 37.0/38*sin(11*t + 21.0/13) + 1.0/9*sin(12*t + 41.0/9) + 2.0/7*sin(13*t + 8.0/5) - 273.0/10)*theta(71*PI -t)*theta(t - 67*PI) + (1323.0/10*sin(t + 11.0/7) + 22.0/15*sin(2*t + 47.0/10) + 210.0/17*sin(3*t + 11.0/7) + 49.0/13*sin(4*t + 11.0/7) + 17.0/4*sin(5*t + 19.0/12) + 12.0/23*sin(6*t + 29.0/19) + 18.0/11*sin(7*t + 19.0/12) + 5.0/4*sin(8*t + 11.0/7) + 22.0/13*sin(9*t + 8.0/5) + 7.0/9*sin(10*t + 14.0/9) + 5.0/7*sin(11*t + 14.0/9) + 5.0/11*sin(12*t + 18.0/11) + 12.0/13*sin(13*t + 19.0/12) + 1892.0/9)*theta(67*PI -t)*theta(t - 63*PI) + (-1.0/15*sin(19.0/14 - 8*t) - 16.0/7*sin(11.0/7 - 4*t) + 713.0/6*sin(t + 11.0/7) + 4.0/3*sin(2*t + 47.0/10) + 159.0/14*sin(3*t + 11.0/7) + 23.0/6*sin(5*t + 19.0/12) + 5.0/8*sin(6*t + 75.0/16) + 17.0/8*sin(7*t + 11.0/7) + 6.0/11*sin(9*t + 14.0/9) + 1.0/9*sin(10*t + 8.0/5) + 11.0/16*sin(11*t + 19.0/12) + 1.0/12*sin(12*t + 23.0/13) + 3.0/7*sin(13*t + 11.0/7) - 854.0/3)*theta(63*PI -t)*theta(t - 59*PI) + (-3.0/8*sin(28.0/19 - 13*t) - 16.0/17*sin(23.0/15 - 12*t) - 35.0/11*sin(14.0/9 - 11*t) - 131.0/26*sin(11.0/7 - 7*t) + 380.0/7*sin(t + 11.0/7) + 185.0/6*sin(2*t + 33.0/7) + 313.0/8*sin(3*t + 33.0/7) + 92.0/13*sin(4*t + 11.0/7) + 8.0/3*sin(5*t + 47.0/10) + 509.0/34*sin(6*t + 33.0/7) + 21.0/4*sin(8*t + 33.0/7) + 11.0/21*sin(9*t + 13.0/9) + 33.0/8*sin(10*t + 20.0/13) - 444.0/13)*theta(59*PI -t)*theta(t - 55*PI) + (-20.0/11*sin(34.0/23 - 2*t) + 892.0/7*sin(t + 11.0/7) + 154.0/13*sin(3*t + 11.0/7) + 45.0/23*sin(4*t + 14.0/9) + 34.0/7*sin(5*t + 14.0/9) + 1699.0/9)*theta(55*PI -t)*theta(t - 51*PI) + (999.0/8*sin(t + 11.0/7) + 13.0/8*sin(2*t + 67.0/34) + 87.0/8*sin(3*t + 5.0/3) + 9.0/7*sin(4*t + 39.0/10) + 39.0/7*sin(5*t + 12.0/7) - 2664.0/11)*theta(51*PI -t)*theta(t - 47*PI) + (-13.0/7*sin(11.0/7 - 4*t) + 789.0/11*sin(t + 11.0/7) + 19.0/8*sin(2*t + 13.0/8) + 279.0/13*sin(3*t + 11.0/7) + 13.0/6*sin(5*t + 11.0/7) - 301.0/9)*theta(47*PI -t)*theta(t - 43*PI) + (-1.0/89*sin(11.0/12 - 29*t) - 5.0/7*sin(14.0/9 - 27*t) - 14.0/9*sin(11.0/7 - 24*t) - 155.0/16*sin(11.0/7 - 19*t) - 81.0/11*sin(11.0/7 - 17*t) - 11.0/9*sin(17.0/11 - 15*t) - 11.0/8*sin(14.0/9 - 13*t) - 3.0/5*sin(7.0/5 - 4*t) + 1310.0/11*sin(t + 11.0/7) + 3.0/8*sin(2*t + 47.0/10) + 95.0/7*sin(3*t + 11.0/7) + 157.0/39*sin(5*t + 19.0/12) + 16.0/13*sin(6*t + 19.0/12) + 7.0/4*sin(7*t + 11.0/7) + 26.0/17*sin(8*t + 33.0/7) + 3.0/7*sin(9*t + 18.0/11) + 17.0/16*sin(10*t + 11.0/7) + 8.0/11*sin(11*t + 8.0/5) + 20.0/11*sin(12*t + 17.0/11) + 27.0/14*sin(14*t + 11.0/7) + 25.0/6*sin(16*t + 19.0/12) + 14.0/15*sin(18*t + 23.0/5) + 8.0/11*sin(20*t + 32.0/7) + 28.0/5*sin(21*t + 33.0/7) + 4.0/13*sin(22*t + 23.0/5) + 21.0/10*sin(23*t + 33.0/7) + 1.0/3*sin(25*t + 51.0/11) + 5.0/9*sin(26*t + 20.0/13) + 7.0/15*sin(28*t + 33.0/7) + 2.0/3*sin(30*t + 14.0/9) - 34)*theta(43*PI -t)*theta(t - 39*PI) + (-9.0/5*sin(13.0/9 - 24*t) - 2.0/9*sin(4.0/11 - 23*t) - 1.0/7*sin(14.0/9 - 22*t) - 19.0/20*sin(16.0/11 - 18*t) - 19.0/4*sin(11.0/7 - 10*t) - 1.0/4*sin(5.0/8 - 7*t) - 34.0/7*sin(34.0/23 - 6*t) - 8.0/7*sin(1 - 5*t) + 59.0/13*sin(t + 13.0/9) + 95.0/11*sin(2*t + 47.0/10) + 1970.0/7*sin(3*t + 19.0/12) + 31.0/5*sin(4*t + 37.0/8) + 37.0/25*sin(8*t + 31.0/7) + 143.0/6*sin(9*t + 21.0/13) + 11.0/5*sin(11*t + 3.0/2) + 4.0/7*sin(12*t + 9.0/7) + 14.0/11*sin(13*t + 16.0/11) + 30.0/11*sin(14*t + 17.0/10) + 89.0/8*sin(15*t + 18.0/11) + 28.0/27*sin(16*t + 14.0/3) + 5.0/7*sin(17*t + 4.0/3) + 11.0/7*sin(19*t + 8.0/5) + 13.0/5*sin(20*t + 17.0/10) + 35.0/8*sin(21*t + 5.0/3) + 4.0/9*sin(25*t + 21.0/13) + 4.0/3*sin(26*t + 16.0/9) + 7.0/3)*theta(39*PI -t)*theta(t - 35*PI) + (-2.0/11*sin(8.0/7 - 20*t) - 49.0/11*sin(23.0/15 - 5*t) + 5881.0/34*sin(t + 11.0/7) + 164.0/13*sin(2*t + 26.0/17) + 559.0/12*sin(3*t + 11.0/7) + 44.0/9*sin(4*t + 20.0/13) + 2.0/9*sin(6*t + 17.0/11) + 42.0/5*sin(7*t + 14.0/9) + 7.0/9*sin(8*t + 11.0/8) + 19.0/9*sin(9*t + 11.0/7) + 20.0/9*sin(10*t + 33.0/7) + 5.0/9*sin(11*t + 13.0/9) + 19.0/8*sin(12*t + 3.0/2) + 57.0/11*sin(13*t + 17.0/11) + 3.0/4*sin(14*t + 4.0/3) + 24.0/23*sin(15*t + 13.0/9) + 5.0/4*sin(16*t + 3.0/2) + 5.0/9*sin(17*t + 7.0/5) + 7.0/10*sin(18*t + 10.0/7) + 7.0/4*sin(19*t + 14.0/9) - 571.0/30)*theta(35*PI -t)*theta(t - 31*PI) + (-17.0/12*sin(5.0/8 - 2*t) + 613.0/5*sin(t + 13.0/9) + 197.0/16*sin(3*t + 6.0/5) + 9.0/5*sin(4*t + 1.0/6) + 91.0/16*sin(5*t + 23.0/22) + 1861.0/10)*theta(31*PI -t)*theta(t - 27*PI) + (-50.0/33*sin(15.0/11 - 4*t) + 3359.0/32*sin(t + 11.0/8) + 7.0/12*sin(2*t + 5.0/6) + 51.0/5*sin(3*t + 45.0/44) + 58.0/11*sin(5*t + 11.0/17) + 6.0/5*sin(6*t + 95.0/21) + 39.0/14*sin(7*t + 12.0/25) - 2275.0/9)*theta(27*PI -t)*theta(t - 23*PI) + (-1.0/4*sin(1.0/8 - 9*t) - 3.0/8*sin(7.0/9 - 8*t) - 34.0/15*sin(6.0/11 - 6*t) + 59.0/14*sin(t + 11.0/16) + 37.0/6*sin(2*t + 14.0/3) + 151.0/13*sin(3*t + 23.0/9) + 135.0/13*sin(4*t + 17.0/10) + 43.0/9*sin(5*t + 10.0/3) + 9.0/7*sin(7*t + 43.0/21) + 3.0/10*sin(10*t + 21.0/5) + 1.0/8*sin(11*t + 19.0/7) + 2.0/9*sin(12*t + 37.0/12) - 1178.0/5)*theta(23*PI -t)*theta(t - 19*PI) + (-18.0/11*sin(14.0/15 - 5*t) + 7.0/3*sin(t + 9.0/7) + 25.0/8*sin(2*t + 23.0/14) + 103.0/17*sin(3*t + 25.0/6) + 80.0/7*sin(4*t + 17.0/5) + 9.0/11*sin(6*t + 1.0/5) + 9.0/7*sin(7*t + 15.0/7) + 13.0/8*sin(8*t + 61.0/13) + 13.0/10*sin(9*t + 18.0/19) + 31.0/30*sin(10*t + 35.0/9) + 9.0/10*sin(11*t + 2.0/11) + 20.0/21*sin(12*t + 32.0/9) + 3.0/5*sin(13*t + 1.0/5) + 1919.0/11)*theta(19*PI -t)*theta(t - 15*PI) + (-13.0/25*sin(5.0/9 - 16*t) - 1.0/4*sin(5.0/9 - 14*t) - 5.0/9*sin(9.0/19 - 12*t) - 7.0/8*sin(2.0/5 - 10*t) - 9.0/8*sin(3.0/13 - 8*t) + 457.0/3*sin(t + 29.0/19) + 23.0/8*sin(2*t + 1.0/29) + 131.0/9*sin(3*t + 7.0/5) + 13.0/5*sin(4*t + 1.0/3) + 37.0/6*sin(5*t + 22.0/15) + 10.0/9*sin(6*t + 3.0/10) + 42.0/13*sin(7*t + 25.0/17) + 17.0/10*sin(9*t + 11.0/9) + 8.0/7*sin(11*t + 15.0/14) + 2.0/3*sin(13*t + 11.0/9) + 4.0/13*sin(15*t + 26.0/17) - 156.0/7)*theta(15*PI -t)*theta(t - 11*PI) + (-18.0/11*sin(1.0/6 - 7*t) - 5.0/7*sin(5.0/7 - 6*t) - 1561.0/8*sin(9.0/13 -t) + 59.0/13*sin(2*t + 33.0/14) + 71.0/4*sin(3*t + 25.0/19) + 16.0/7*sin(4*t + 11.0/4) + 4*sin(5*t + 10.0/3) + 11.0/23*sin(8*t + 5.0/8) + 29.0/19*sin(9*t + 37.0/19) + 5.0/9*sin(10*t + 35.0/13) + 14.0/13*sin(11*t + 23.0/6) - 4057.0/6)*theta(11*PI -t)*theta(t - 7*PI) + (620.0/3*sin(t + 33.0/17) + 151.0/11*sin(2*t + 8.0/15) + 221.0/12*sin(3*t + 26.0/11) + 68.0/11*sin(4*t + 20.0/9) + 19.0/4*sin(5*t + 30.0/11) + 23.0/7*sin(6*t + 25.0/9) + 8.0/7*sin(7*t + 25.0/9) + 26.0/11*sin(8*t + 29.0/9) + 10.0/13*sin(9*t + 31.0/11) + 9547.0/15)*theta(7*PI -t)*theta(t - 3*PI) + (-8.0/9*sin(3.0/10 - 18*t) - 9.0/4*sin(17.0/18 - 17*t) - 9.0/5*sin(9.0/11 - 15*t) - 13.0/7*sin(19.0/14 - 14*t) - 68.0/9*sin(10.0/7 - 13*t) - 10.0/7*sin(9.0/7 - 2*t) + 8369.0/11*sin(t + 36.0/11) + 286.0/3*sin(3*t + 3.0/7) + 23.0/13*sin(4*t + 103.0/23) + 152.0/3*sin(5*t + 19.0/5) + 34.0/3*sin(6*t + 31.0/8) + 41.0/8*sin(7*t + 15.0/14) + 28.0/5*sin(8*t + 5.0/6) + 149.0/37*sin(9*t + 27.0/7) + 39.0/7*sin(10*t + 47.0/10) + 75.0/8*sin(11*t + 34.0/23) + 31.0/12*sin(12*t + 26.0/17) + 24.0/7*sin(16*t + 23.0/9) - 8)*theta(3*PI -t)*theta(t +PI))*theta(sqrt(sgn(sin(t/2))));
}

float y(float t)
{
  return ((-9.0/17*sin(11.0/7 - 13*t) - 1.0/32*sin(3.0/2 - 11*t) - 2.0/5*sin(11.0/7 - 9*t) - 10.0/7*sin(11.0/7 - 5*t) - 38.0/15*sin(11.0/7 - 3*t) + 125.0/12*sin(t + 11.0/7) + 134.0/7*sin(2*t + 11.0/7) + 23.0/9*sin(4*t + 11.0/7) + 17.0/11*sin(6*t + 11.0/7) + 2.0/3*sin(7*t + 33.0/7) + 1.0/5*sin(8*t + 11.0/7) + 3.0/7*sin(10*t + 11.0/7) + 1.0/3*sin(12*t + 11.0/7) - 1648.0/7)*theta(75*PI -t)*theta(t - 71*PI) + (-4.0/7*sin(23.0/15 - 13*t) - 7.0/9*sin(11.0/7 - 12*t) - 75.0/19*sin(14.0/9 - 10*t) - 119.0/40*sin(17.0/11 - 9*t) - 25.0/9*sin(14.0/9 - 8*t) - 22.0/9*sin(14.0/9 - 7*t) - 7.0/9*sin(14.0/9 - 6*t) - 83.0/15*sin(14.0/9 - 5*t) - 22.0/7*sin(14.0/9 - 4*t) - 62.0/9*sin(11.0/7 - 3*t) - 4.0/3*sin(14.0/9 - 2*t) - 341.0/7*sin(11.0/7 -t) + 53.0/16*sin(11*t + 8.0/5) + 1579.0/20)*theta(71*PI -t)*theta(t - 67*PI) + (-14.0/15*sin(11.0/7 - 13*t) - 18.0/19*sin(11.0/7 - 11*t) - 23.0/12*sin(14.0/9 - 9*t) - 18.0/11*sin(14.0/9 - 7*t) - 38.0/15*sin(11.0/7 - 5*t) - 22.0/3*sin(11.0/7 - 3*t) + 699.0/35*sin(t + 11.0/7) + 316.0/9*sin(2*t + 11.0/7) + 41.0/15*sin(4*t + 11.0/7) + 58.0/19*sin(6*t + 19.0/12) + 1.0/7*sin(8*t + 12.0/7) + 1.0/4*sin(10*t + 21.0/13) + 1.0/17*sin(12*t + 5.0/3) - 124.0/7)*theta(67*PI -t)*theta(t - 63*PI) + (-11.0/6*sin(14.0/9 - 6*t) - 85.0/6*sin(11.0/7 -t) + 308.0/13*sin(2*t + 11.0/7) + 15*sin(3*t + 11.0/7) + 1.0/7*sin(4*t + 9.0/5) + 4*sin(5*t + 19.0/12) + 17.0/5*sin(7*t + 19.0/12) + 3.0/5*sin(8*t + 11.0/7) + 11.0/12*sin(9*t + 11.0/7) + 2.0/9*sin(10*t + 8.0/5) + 8.0/15*sin(11*t + 11.0/7) + 1.0/9*sin(12*t + 5.0/3) + 7.0/11*sin(13*t + 19.0/12) - 157.0/9)*theta(63*PI -t)*theta(t - 59*PI) + (-3.0/2*sin(20.0/13 - 13*t) - 8.0/5*sin(17.0/11 - 11*t) - 53.0/12*sin(14.0/9 - 7*t) + 565.0/13*sin(t + 11.0/7) + 1289.0/14*sin(2*t + 11.0/7) + 17*sin(3*t + 33.0/7) + 34.0/9*sin(4*t + 11.0/7) + 103.0/13*sin(5*t + 33.0/7) + 1.0/40*sin(6*t + 13.0/6) + 19.0/14*sin(8*t + 14.0/3) + 31.0/8*sin(9*t + 33.0/7) + 3.0/7*sin(10*t + 21.0/13) + 5.0/4*sin(12*t + 8.0/5) + 299.0/7)*theta(59*PI -t)*theta(t - 55*PI) + (133.0/10*sin(t + 33.0/7) + 458.0/17*sin(2*t + 33.0/7) + 15.0/7*sin(3*t + 8.0/5) + 29.0/15*sin(4*t + 33.0/7) + 9.0/4*sin(5*t + 11.0/7) + 2746.0/19)*theta(55*PI -t)*theta(t - 51*PI) + (-31.0/10*sin(10.0/7 - 5*t) - 30.0/13*sin(15.0/11 - 4*t) - 209.0/8*sin(14.0/9 - 2*t) + 26.0/9*sin(t + 3.0/2) + 19.0/10*sin(3*t + 4.0/3) + 1918.0/13)*theta(51*PI -t)*theta(t - 47*PI) + (-213.0/14*sin(14.0/9 - 4*t) - 54.0/5*sin(11.0/7 - 3*t) + 128.0/17*sin(t + 33.0/7) + 145.0/7*sin(2*t + 11.0/7) + 11.0/12*sin(5*t + 14.0/9) - 1088.0/3)*theta(47*PI -t)*theta(t - 43*PI) + (-sin(3.0/2 - 24*t) -sin(11.0/10 - 21*t) - 89.0/8*sin(14.0/9 - 17*t) - 9.0/8*sin(16.0/11 - 12*t) - 5.0/4*sin(22.0/15 - 11*t) - 4.0/11*sin(8.0/7 - 8*t) - 2*sin(28.0/19 - 3*t) + 9.0/5*sin(t + 33.0/7) + 82.0/7*sin(2*t + 11.0/7) + 23.0/9*sin(4*t + 11.0/7) + 3.0/8*sin(5*t + 57.0/13) + 26.0/9*sin(6*t + 14.0/9) + 2.0/7*sin(7*t + 4.0/3) + 5.0/13*sin(9*t + 23.0/14) + 19.0/8*sin(10*t + 51.0/11) + 41.0/8*sin(13*t + 37.0/8) + 37.0/10*sin(14*t + 14.0/9) + 127.0/13*sin(15*t + 14.0/9) + 319.0/14*sin(16*t + 33.0/7) + 259.0/6*sin(18*t + 11.0/7) + 35.0/6*sin(19*t + 17.0/11) + 18*sin(20*t + 19.0/12) + 13.0/7*sin(22*t + 26.0/17) + 5.0/7*sin(23*t + 49.0/11) + 12.0/13*sin(25*t + 5.0/3) + 3.0/7*sin(26*t + 3.0/2) + 2.0/3*sin(27*t + 11.0/7) + 9.0/11*sin(28*t + 19.0/11) + 5.0/12*sin(29*t + 23.0/15) + 5.0/13*sin(30*t + 16.0/11) - 1010.0/7)*theta(43*PI -t)*theta(t - 39*PI) + (-38.0/7*sin(3.0/2 - 24*t) - 8.0/7*sin(17.0/12 - 23*t) - 5.0/14*sin(20.0/13 - 22*t) - 20.0/7*sin(19.0/13 - 21*t) - 4.0/9*sin(9.0/7 - 17*t) - 43.0/5*sin(3.0/2 - 12*t) - 65.0/8*sin(3.0/2 - 11*t) - 11.0/5*sin(17.0/11 - 10*t) - 636.0/11*sin(14.0/9 - 6*t) - 389.0/16*sin(17.0/11 - 5*t) - 155.0/7*sin(11.0/7 - 3*t) + 3071.0/32*sin(t + 11.0/7) + 98.0/13*sin(2*t + 33.0/7) + 4.0/3*sin(4*t + 5.0/3) + 23.0/11*sin(7*t + 14.0/9) + 35.0/12*sin(8*t + 12.0/7) + 1.0/4*sin(9*t + 42.0/11) + 22.0/13*sin(13*t + 5.0/3) + 17.0/10*sin(14*t + 12.0/7) + 3.0/5*sin(15*t + 22.0/13) + 26.0/17*sin(16*t + 13.0/8) + 1.0/9*sin(18*t + 9.0/5) + 211.0/42*sin(19*t + 28.0/17) + 9.0/14*sin(20*t + 79.0/17) + 20.0/7*sin(25*t + 5.0/3) + 16.0/9*sin(26*t + 33.0/7) + 1651.0/4)*theta(39*PI -t)*theta(t - 35*PI) + (-6.0/5*sin(14.0/9 - 18*t) - 7.0/5*sin(31.0/21 - 15*t) - 1.0/7*sin(3.0/10 - 12*t) - 7.0/2*sin(25.0/17 - 9*t) - 49.0/2*sin(11.0/7 - 6*t) - 181.0/17*sin(11.0/7 - 5*t) - 15.0/8*sin(11.0/10 - 3*t) - 7.0/9*sin(8.0/7 -t) + 1131.0/11*sin(2*t + 11.0/7) + 1847.0/26*sin(4*t + 11.0/7) + 36.0/5*sin(7*t + 11.0/7) + 155.0/7*sin(8*t + 14.0/9) + 9.0/19*sin(10*t + 17.0/4) + 1.0/4*sin(11*t + 47.0/10) + 6.0/7*sin(13*t + 23.0/5) + 24.0/23*sin(14*t + 5.0/3) + 21.0/10*sin(16*t + 19.0/12) + 23.0/9*sin(17*t + 75.0/16) + 16.0/9*sin(19*t + 17.0/11) + 5.0/2*sin(20*t + 14.0/9) + 605.0/2)*theta(35*PI -t)*theta(t - 31*PI) + (-10.0/9*sin(7.0/5 - 4*t) - 39.0/7*sin(1.0/16 - 3*t) - 82.0/11*sin(7.0/9 - 2*t) + 269.0/8*sin(t + 29.0/9) + 3.0/2*sin(5*t + 9.0/2) + 107.0/2)*theta(31*PI -t)*theta(t - 27*PI) + (-23.0/10*sin(12.0/11 - 5*t) - 49.0/10*sin(16.0/17 - 3*t) + 503.0/15*sin(t + 23.0/8) + 35.0/13*sin(2*t + 46.0/11) + 20.0/11*sin(4*t + 32.0/11) + 12.0/13*sin(6*t + 28.0/9) + 5.0/12*sin(7*t + 41.0/11) + 533.0/9)*theta(27*PI -t)*theta(t - 23*PI) + (-2.0/5*sin(14.0/11 - 12*t) - 1.0/4*sin(13.0/9 - 11*t) - 29.0/30*sin(18.0/19 - 10*t) - 51.0/10*sin(13.0/11 - 5*t) - 39.0/14*sin(5.0/8 - 2*t) + 18.0/5*sin(t + 43.0/17) + 47.0/7*sin(3*t + 361.0/90) + 124.0/15*sin(4*t + 29.0/9) + 22.0/13*sin(6*t + 18.0/11) + 7.0/12*sin(7*t + 65.0/14) + 13.0/25*sin(8*t + 12.0/5) + 19.0/20*sin(9*t + 34.0/35) + 422.0/7)*theta(23*PI -t)*theta(t - 19*PI) + (-6.0/19*sin(3.0/5 - 12*t) - 10.0/13*sin(2.0/9 - 10*t) - 161.0/16*sin(4.0/3 - 4*t) - 47.0/8*sin(4.0/9 - 3*t) + 7.0/10*sin(5*t) + 14.0/11*sin(t + 33.0/7) + 20.0/9*sin(2*t + 41.0/12) + 4.0/7*sin(6*t + 35.0/17) + 23.0/14*sin(7*t + 34.0/9) + 9.0/7*sin(8*t + 2.0/5) + 5.0/7*sin(9*t + 83.0/28) + 11.0/9*sin(11*t + 113.0/38) + 5.0/12*sin(13*t + 22.0/7) + 3961.0/66)*theta(19*PI -t)*theta(t - 15*PI) + (-4.0/9*sin(17.0/16 - 15*t) - 5.0/12*sin(1.0/5 - 14*t) - 7.0/13*sin(2.0/5 - 13*t) - 2.0/7*sin(9.0/8 - 10*t) - 1.0/6*sin(2.0/9 - 8*t) - 14.0/11*sin(6.0/5 - 7*t) - 21.0/11*sin(4.0/13 - 6*t) - 47.0/16*sin(13.0/14 - 5*t) + 673.0/32*sin(t + 1.0/11) + 232.0/9*sin(2*t + 3.0/2) + 49.0/16*sin(3*t + 23.0/5) + 29.0/9*sin(4*t + 14.0/11) + 8.0/15*sin(9*t + 14.0/3) + 5.0/14*sin(11*t + 77.0/17) + 1.0/10*sin(12*t + 7.0/12) + 3.0/11*sin(16*t + 1.0/5) - 704.0/3)*theta(15*PI -t)*theta(t - 11*PI) + (-142.0/9*sin(7.0/10 - 3*t) + 737.0/7*sin(t + 23.0/7) + 173.0/15*sin(2*t + 27.0/10) + 13.0/8*sin(4*t + 29.0/9) + 47.0/6*sin(5*t + 7.0/6) + 16.0/9*sin(6*t + 13.0/12) + 28.0/17*sin(7*t + 37.0/11) + 21.0/11*sin(8*t + 129.0/32) + 2.0/3*sin(9*t + 6.0/17) + 24.0/25*sin(10*t + 7.0/10) + 6.0/13*sin(11*t + 13.0/7) + 2687.0/21)*theta(11*PI -t)*theta(t - 7*PI) + (-14.0/11*sin(4.0/13 - 4*t) + 588.0/5*sin(t + 11.0/10) + 465.0/19*sin(2*t + 47.0/14) + 118.0/9*sin(3*t + 31.0/21) + 17.0/8*sin(5*t + 7.0/5) + 3.0/4*sin(6*t + 37.0/10) + 31.0/13*sin(7*t + 19.0/8) + 7.0/11*sin(8*t + 37.0/16) + 7.0/9*sin(9*t + 18.0/7) + 681.0/8)*theta(7*PI -t)*theta(t - 3*PI) + (-21.0/11*sin(2.0/11 - 16*t) - 64.0/5*sin(2.0/7 - 7*t) - 440.0/21*sin(7.0/9 - 6*t) - 443.0/12*sin(19.0/14 - 2*t) + 2706.0/7*sin(t + 5.0/3) + 787.0/9*sin(3*t + 99.0/49) + 194.0/5*sin(4*t + 19.0/9) + 247.0/6*sin(5*t + 9.0/4) + 19.0/5*sin(8*t + 25.0/7) + 23.0/11*sin(9*t + 83.0/42) + 25.0/17*sin(10*t + 74.0/73) + 29.0/7*sin(11*t + 37.0/11) + 13.0/3*sin(12*t + 2.0/7) + 109.0/13*sin(13*t + 23.0/7) + 18.0/7*sin(14*t + 10.0/9) + 86.0/29*sin(15*t + 1.0/12) + 19.0/14*sin(17*t + 9.0/8) + 3.0/2*sin(18*t + 34.0/9) + 457.0/4)*theta(3*PI -t)*theta(t +PI))*theta(sqrt(sgn(sin(t/2))));
}
