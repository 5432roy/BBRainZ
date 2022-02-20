
import java.util.ArrayList;

public class Course implements Comparable {

    private String abbrevName;
    private String fullName;
    private int number;
    private ArrayList<Course> preReqs;

    public Course(String abbrevName, String fullName, int number, ArrayList<Course> preReqs){
        this.abbrevName = abbrevName;
        this.fullName = fullName;
        this.number = number;
        this.preReqs = preReqs;
    }

    public int getNumber(){
        return number;
    }

    public String getAbbrevName(){
        return abbrevName;
    }
    
    public String getFullName(){
        return fullName;
    }
    
    public ArrayList<Course> getPreReqs(){
        return preReqs;
    }

    @Override
    public int compareTo(Object obj) {
        if(this.number > (int)(obj)){
            return 1;
        }
        else{
            return 0;
        }
    }

}
