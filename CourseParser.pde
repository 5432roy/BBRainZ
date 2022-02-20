import java.util.*;
public class CourseParser {

  ArrayList<Course> courses;

  public CourseParser(){
    courses = new ArrayList<>();
  }

  public void parseCourse() throws Exception
  {
    InputStream input = createInput("courses_real.txt");
    String data = "";
    try{
      int aChar = input.read();
      while (aChar != -1) {
        data += char(aChar);
        aChar = input.read();
      }
    }
    catch (Exception e){
      println("Error in file input");
    }
    String[] coursesArr = data.split("\n");
    

    for(String str : coursesArr) {
      String[] cur = str.split(",");
      Course course;
      if(cur.length > 2){
        course = new Course (Integer.parseInt(cur[0]), cur[1], toInteger(Arrays.copyOfRange(cur, 2, cur.length)));
      } else{
        course = new Course (Integer.parseInt(cur[0]), cur[1], new ArrayList<ArrayList<Integer>>());
      }

      addCourse(course);
    }
    
  }

  private ArrayList<ArrayList<Integer>> toInteger(String[] array){
      ArrayList<ArrayList<Integer>> res = new ArrayList<ArrayList<Integer>>();

      for(String s : array){
        
        String[] strs = s.split("%");
        ArrayList<Integer> intList = new ArrayList<>();
        for(String str : strs){
          String newStr = "";
          newStr = newStr + str.charAt(0) + str.charAt(1) + str.charAt(2);
          intList.add(Integer.parseInt(newStr));
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
