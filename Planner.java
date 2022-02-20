import java.util.ArrayList;
import java.util.Collections;

public class Planner {

    // Array lists for each categories
    private ArrayList<Course> prevCourse;
    private ArrayList<Course> currCourse;
    private ArrayList<Course> futureCourse;
    private ArrayList<Course> preReqMet ;
    private ArrayList<Course> preReqNotMet;

    public Planner(){
        this.prevCourse = new ArrayList<>();
        this.currCourse = new ArrayList<>();
        this.futureCourse = new ArrayList<>();
        this.preReqMet = new ArrayList<>();
        this.preReqNotMet = new ArrayList<>();
    }

    public void addPrevCourse(Course newCourse){
        prevCourse.add(newCourse);
    }
    
    public void addCurrCourse(Course newCourse){
        currCourse.add(newCourse);
    }
    
    private void addPreReqMet(Course newCourse){
        preReqMet.add(newCourse);
    }
    
    private void addPreReqNotMet(Course newCourse){
        preReqNotMet.add(newCourse);
    }
    
    public ArrayList<Boolean> preReqsMet(Course course){
        ArrayList<Boolean> temp = new ArrayList<>();
        for(ArrayList<Course> preReqList : course.getPreReqs()){
            Boolean flag = false;
            for(Course preReq: preReqList){
                if(prevCourse.contains(preReq) || currCourse.contains(preReq)){
                     flag = true;
                }
            }
            temp.add(flag);
        }
        return temp;
    }
    
    public void addCourse(Course newCourse){
        ArrayList<Boolean> temp = preReqsMet(newCourse);
        if(temp.contains(false)){
            addPreReqNotMet(newCourse);
        }
        else{
            addPreReqMet(newCourse);
        }
    }

    public void moveCourse(String from, String to, Course course){
        if(from.equals("future")){
            futureCourse.remove(course);
        }
        else if(from.equals("met")){
            preReqMet.remove(course);
        }
        else if(from.equals("notMet")){
            preReqNotMet.remove(course);
        }
        
        if(to.equals("future")){
            futureCourse.add(course);
            Collections.sort(futureCourse);
        }
        else if(to.equals("met")){
            preReqMet.add(course);
            Collections.sort(preReqMet);
        }
        else if(to.equals("notMet")){
            preReqNotMet.add(course);
            Collections.sort(preReqNotMet);
        }
    }

    public ArrayList<Course> getPrevCourse() {
        return prevCourse;
    }

    public ArrayList<Course> getCurrCourse() {
        return currCourse;
    }

    public ArrayList<Course> getFutureCourse() {
        return futureCourse;
    }

    public ArrayList<Course> getPreReqMet() {
        return preReqMet;
    }

    public ArrayList<Course> getPreReqNotMet() {
        return preReqNotMet;
    }
}
