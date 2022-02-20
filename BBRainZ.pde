final int boxSizeX = 70;
final int boxSizeY = 20;
ArrayList<Box> boxes;
ArrayList<int[]> areas;
ArrayList<ArrayList<Box>> allBuckets;
ArrayList<Box> semester1;
ArrayList<Box> semester2;
ArrayList<Box> semester3;
ArrayList<Box> semester4;
ArrayList<Box> semester5;
ArrayList<Box> semester6;
ArrayList<Box> semester7;
ArrayList<Box> semester8;
ArrayList<Box> prereqMet;
ArrayList<Box> prereqNotMet;

PShape s;

void setup(){
  size(1600, 900);
  textAlign(CENTER);
  rectMode(RADIUS);
  
  s = createShape();
  s.beginShape();
  s.fill(#31BCFF);
  s.vertex(1485, 10);
  s.vertex(1565, 45);
  s.vertex(1485, 80);
  s.vertex(1485, 50);
  s.vertex(1535, 45);
  s.vertex(1485, 40);
  s.endShape(CLOSE);
  
  boxes = new ArrayList<>();
  Box myBox = new Box("CPT_S 370");
  boxes.add(myBox);
  Box myBox1 = new Box("CPT_S 360");
  boxes.add(myBox1);
  
  areas = new ArrayList<>();
  for(int i = 0; i < 8; i++){
    int[] area = new int[4];
    area[0] = 80 + 180 * i;
    area[1] = 79 + 180 * (i+1);
    area[2] = 100;
    area[3] = 450;
    areas.add(area);
  }
  int[] area1 = new int[4];
  area1[0] = 80;
  area1[1] = 600;
  area1[2] = 500;
  area1[3] = 850;
  areas.add(area1);
  int[] area2 = new int[4];
  area2[0] = 700;
  area2[1] = 1520;
  area2[2] = 500;
  area2[3] = 850;
  areas.add(area2);
  
  InputStream input = createInput("test.txt");
  String content = "";
  try{
    int data = input.read();
    while (data != -1) {
      content += char(data);
      data = input.read();
    }
    println(content);
  }
  catch (Exception e){
    println("Error in file input");
  }
  
  semester1 = new ArrayList<>();
  semester2 = new ArrayList<>();
  semester3 = new ArrayList<>();
  semester4 = new ArrayList<>();
  semester5 = new ArrayList<>();
  semester6 = new ArrayList<>();
  semester7 = new ArrayList<>();
  semester8 = new ArrayList<>();
  prereqMet = new ArrayList<>();
  prereqNotMet = new ArrayList<>();
  allBuckets = new ArrayList<>();
  allBuckets.add(semester1);
  allBuckets.add(semester2);
  allBuckets.add(semester3);
  allBuckets.add(semester4);
  allBuckets.add(semester5);
  allBuckets.add(semester6);
  allBuckets.add(semester7);
  allBuckets.add(semester8);
  allBuckets.add(prereqMet);
  allBuckets.add(prereqNotMet);
}

void draw() { 
  background(0);
  noStroke();
  fill(50);
  rect(530, 275, 450, 175);
  fill(70);
  rect(890, 275, 90, 175);
  fill(90);
  rect(1250, 275, 270, 175);
  fill(100);
  rect(340, 675, 260, 175);
  rect(1110, 675, 410, 175);

  shape(s, 0, 0);
  
  rectMode(CORNERS);
  
  if (mouseX > 1470 && mouseX < 1580 && 
      mouseY > 10 && mouseY < 85) {
    noFill();
    strokeWeight(3);
    stroke(255);
    line(1485, 10, 1565, 45);
    line(1485, 80, 1565, 45);
    line(1485, 10, 1485, 40);
    line(1485, 50, 1485, 80);
    line(1485, 40, 1535, 45);
    line(1485, 50, 1535, 45);
  }
  
  for(int[] area : areas){
    noFill();
    strokeWeight(5);
    stroke(255);
    rect(area[0], area[2], area[1], area[3]);
  }
  rectMode(RADIUS);
  
  line(80, 150, 1520, 150);
  line(80, 550, 600, 550);
  line(700, 550, 1520, 550);
  
  
  textSize(25);
  fill(255);
  text("2019 Fall", 170, 130);
  text("2020 Spring", 350, 130);
  text("2020 Fall", 530, 130);
  text("2021 Spring", 710, 130);
  text("2021 Fall", 890, 130);
  text("2022 Spring", 1070, 130);
  text("2022 Fall", 1250, 130);
  text("2023 Spring", 1430, 130);
  text("Courses with pre-requisites met", 340, 530);
  text("Courses with pre-requisites not met", 1110, 530);
  
  textSize(50);
  text("Course Planner", 800, 60);
  
  textSize(30);
  text("Send to advisor", 1370, 60);
  
  for(Box box:boxes){
    box.display();
  }
  
}

void mousePressed() {
  for(Box box:boxes){
    box.myMousePressed();
  }
}

void mouseDragged() {
  for(Box box:boxes){
    box.myMouseDragged();
  }
}

void mouseReleased() {
  for(Box box:boxes){
    box.myMouseReleased();
  }
}

class Box{
  
  private String name;
  private float x;
  private float y;
  private boolean overBox;
  private boolean locked;
  private boolean draggable;
  private float xOffset; 
  private float yOffset;
  
  Box(String name){
    this.name = name;
    this.x = random(100, 800);
    this.y = random(100, 800);
    this.overBox = false;
    this.locked = false;
    this.draggable = false;
    this.xOffset = 0.0;
    this.yOffset = 0.0;
  }
  
  void setCoord(float newX, float newY){
    x = newX;
    y = newY;
  }
  
  void display(){
    // Test if the cursor is over the box 
    if (mouseX > x-boxSizeX && mouseX < x+boxSizeX && 
        mouseY > y-boxSizeY && mouseY < y+boxSizeY) {
      overBox = true;  
      if(!draggable) { 
        stroke(255); 
      } 
    } else {
      stroke(#FF0000);
      overBox = false;
    }
    
    // Draw the box
    fill(#FF4646);
    strokeWeight(5);
    rect(x, y, boxSizeX, boxSizeY, 20);
    textSize(25);
    fill(255);
    text(name, x,y+10);
  }
  
  void myMousePressed(){
    if(overBox) { 
      draggable = true;
    } else {
      draggable = false;
    }
    xOffset = mouseX-x; 
    yOffset = mouseY-y; 
  }
  
  void myMouseDragged(){
    if(draggable && !locked) {
      x = mouseX-xOffset; 
      y = mouseY-yOffset; 
    }
  }
  
  void myMouseReleased(){
    draggable = false;
    boolean flag = true;
    for(int i = 0; i < areas.size() && flag && !locked; i++){
      int[] area = areas.get(i);
      if(x > area[0] && x < area[1] && 
         y > area[2] && y < area[3]){
         x = (area[0] + area[1]) / 2;
         y = (area[2] + area[3]) / 2;
         flag = false;
      }
    }
  }
}
