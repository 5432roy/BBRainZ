import java.io.*;

int boxSizeX = 70;
int boxSizeY = 20;
color green1 = #259B1E;
color green2 = #0EE500;
color blue1 = #344E93;
color blue2 = #0030EA;
color yellow1 = #A09D42;
color yellow2 = #E4F500;
color orange1 = #B47600;
color orange2 = #FF8D00;
color red1 = #FF4646;
color red2 = #FF0000;
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
PShape sendButton;
Planner planner;

void setup(){
  size(1600, 900);
  textAlign(CENTER);
  rectMode(RADIUS);
  
  sendButton = createShape();
  sendButton.beginShape();
  sendButton.fill(#31BCFF);
  sendButton.vertex(1485, 10);
  sendButton.vertex(1565, 45);
  sendButton.vertex(1485, 80);
  sendButton.vertex(1485, 50);
  sendButton.vertex(1535, 45);
  sendButton.vertex(1485, 40);
  sendButton.endShape(CLOSE);
  
  
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
  
  boxes = new ArrayList<>();
  
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
  
  Planner planner = new Planner();
  CourseParser parser = new CourseParser();
  try{
      parser.parseCourse();
  }catch (Exception e){
      System.out.println("Error in loading file");
  }
  
  ArrayList<Course> courses = parser.getCourses();
  planner.addTakingCourse(courses.get(0));
  Box box0 = new Box("CTP S " + courses.get(0).getNumber(), courses.get(0), true, green1, green2);
  semester1.add(box0);
  boxes.add(box0);
  planner.addTakingCourse(courses.get(3));
  Box box3 = new Box("CTP S " + courses.get(3).getNumber(), courses.get(3), true, green1, green2);
  semester2.add(box3);
  boxes.add(box3);
  planner.addTakingCourse(courses.get(4));
  Box box4 = new Box("CTP S " + courses.get(4).getNumber(), courses.get(4), true, green1, green2);
  semester3.add(box4);
  boxes.add(box4);
  planner.addTakingCourse(courses.get(8));
  Box box8 = new Box("CTP S " + courses.get(8).getNumber(), courses.get(8), true, blue1, blue2);
  semester5.add(box8);
  boxes.add(box8);
  planner.addTakingCourse(courses.get(9));
  Box box9 = new Box("CTP S " + courses.get(9).getNumber(), courses.get(9), true, blue1, blue2);
  semester5.add(box9);
  boxes.add(box9);
  planner.addTakingCourse(courses.get(10));
  Box box10 = new Box("CTP S " + courses.get(10).getNumber(), courses.get(10), false, yellow1, yellow2);
  semester6.add(box10);
  boxes.add(box10);
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

  shape(sendButton, 0, 0);
  
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
  
  for(int i = 0; i < allBuckets.size() && !mousePressed; i++){
    ArrayList<Box> bucket = allBuckets.get(i);
    for(int j = 0; j < bucket.size(); j++){
      Box box = bucket.get(j);
      if(bucket == prereqMet){
        box.setCoord(170 + 180 * (j / 6), 580 + (j % 6) * 50);
      }
      else if(bucket == prereqNotMet){
        box.setCoord(790 + 180 * (j / 6), 580 + (j % 6) * 50);
      }
      else{
        box.setCoord(170 + 180 * i, 180 + j * 50);
      }
    }
  }
  for(Box box:boxes){
    box.display();
  }
  
}
void mouseClicked(){
  for(Box box:boxes){
    box.myMouseClicked();
  }
}
void mousePressed(){
  for(Box box:boxes){
    box.myMousePressed();
  }
  if (mouseX > 1470 && mouseX < 1580 && 
      mouseY > 10 && mouseY < 85) {
    save("schedule.jpg");
    delay(3000);
    try{
      ProcessBuilder builder = new ProcessBuilder(
          "cmd.exe", "/c", "python3 C:\\Users\\bensy\\Desktop\\BBRainZ\\emailer.py Ben 11776385 bensyliu@gmail.com shuyan.liu1@wsu.edu");
      builder.redirectErrorStream(true);
      Process p = builder.start();
    }
    catch (IOException e){
      println("Error calling python code");
    }
    
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
