import java.nio.file.*;
import java.util.*;


public class courseparser {

  ArrayList<Course> courses;

  public courseparser(){
    courses = new ArrayList<>();
  }

  public void parseCourse() throws Exception
  {
    //Planner plan = new Planner();

    String data = new String(Files.readAllBytes(Paths.get("courses_real.txt")));
    String[] coursesArr = data.split("\n");
    System.out.println(coursesArr.length);

    for(int i = 0; i < coursesArr.length; i++) {
      List<String> cur = Arrays.asList(coursesArr[i].split(","));
      Course course;
      if(cur.size() > 2){
        course = new Course (Integer.parseInt(cur.get(0)), cur.get(1), toInteger(Arrays.asList(cur.get(2).split("%"))));
      } else{
        course = new Course (Integer.parseInt(cur.get(0)), cur.get(1), new ArrayList<Integer>());
      }
      addCourse(course);
    }
    
  }

  private ArrayList<Integer> toInteger(List<String> list){
      ArrayList<Integer> res = new ArrayList<Integer>();

      for(String s : list) res.add(Integer.parseInt(s));

      return res;
  }

  public void addCourse(Course course){
    this.courses.add(course);
    return;
  }

  public ArrayList<Course> getCourses(){
    return this.courses;
  }
}
