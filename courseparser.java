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

    
    for(String course : coursesArr){
      System.out.println(course);
    }
    

    for(String str : coursesArr) {
     // System.out.println(str);
      String[] temp = str.split(",");
      System.out.println(Arrays.toString(temp));
      ArrayList<String> cur = new ArrayList<>(Arrays.asList(str.split(",")));
      Course course;
      /*
      if(cur.size() > 2){
        course = new Course (Integer.parseInt(cur.get(0)), cur.get(1), toInteger(cur.subList(2, cur.size())));
      } else{
        course = new Course (Integer.parseInt(cur.get(0)), cur.get(1), new ArrayList<ArrayList<Integer>>());
      }

      addCourse(course);
      */
    }
    
  }

  private ArrayList<ArrayList<Integer>> toInteger(List<String> list){
      ArrayList<ArrayList<Integer>> res = new ArrayList<ArrayList<Integer>>();

      for(String s : list){
        ArrayList<String> strs = new ArrayList<>(Arrays.asList(s.split("%")));
        ArrayList<Integer> intList = new ArrayList<>();
        
        for(String str : strs){
          intList.add(Integer.parseInt(str));
        
        }
        
        if(!intList.isEmpty()){
          res.add(intList);
        }
      }

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
