import java.util.ArrayList;
import java.util.Collections;

public class Planner {

    // Array lists for each categories
    private ArrayList <Courses> prevCourse;
    private ArrayList <Courses> currCourse;
    private ArrayList <Courses> futureCourse;
    private ArrayList <Courses> preReqMet ;
    private ArrayList <Courses> preReqNotMet;

    // Constructor
    public void Plan(){
        this.prevCourse = null;
        this.currCourse = null;
        this.futureCourse = null;
        this.preReqMet = null;
        this.preReqNotMet = null;


    }
    public Planner (ArrayList<Courses> prevCourse, ArrayList<Courses> currCourse,
                    ArrayList <Courses> futureCourse, ArrayList<Courses> preReqMet,
                    ArrayList<Courses> preReqNotMet){

        this.prevCourse = prevCourse;
        this.currCourse = currCourse;
        this.futureCourse = futureCourse;
        this.preReqMet = preReqMet;
        this.preReqNotMet = preReqNotMet;
    }

    public void addCourse(ArrayList<String> courseType, String courseName){
        // Add the course to an arraylist
        courseType.add(courseName);
    }

    public void moveCourse(ArrayList <Courses> courseType, String courseName, ArrayList<String> toCourse){
        // Move a course from an arraylist to another arraylist
        courseType.remove(courseName);
        toCourse.add(courseName);
    }

    public ArrayList<Courses> getPrevCourse() {
        return prevCourse;
    }

    public ArrayList<Courses> getCurrCourse() {
        return currCourse;
    }

    public ArrayList<Courses> getFutureCourse() {
        return futureCourse;
    }

    public ArrayList<Courses> getPreReqMet() {
        return preReqMet;
    }

    public ArrayList<Courses> getPreReqNotMet() {
        return preReqNotMet;
    }

    // if there's at least 1 pre requisite class that we haven't taken,it will return false
    // which means that we cannot pick the class
    // true: can pick, false: can't pick
    public boolean canPickClass(){
        return preReqNotMet.size() < 1;
    }


    // Sort the arraylist
    public void sort(ArrayList<Courses> courseType) {
        Collections.sort(courseType);
    }
}
