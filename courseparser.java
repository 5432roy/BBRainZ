import java.nio.file.*;
import java.util.ArrayList;

public class courseparser {
  public static void main(String[] args) throws Exception
  {
    //Planner plan = new Planner();

    String data = new String(Files.readAllBytes(Paths.get("courses.txt")));
    String[] coursesArr = data.split("\n");

    for(int i = 0; i < coursesArr.length; i++) {
      String courNum = coursesArr[i].substring(0,3);
      String courName = coursesArr[i].substring(4).split("Course Prerequisite:")[0];
      Course c = new Course(courName, courNum, new ArrayList<String>());
    }
  }
}
