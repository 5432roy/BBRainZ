import java.io.FileNotFoundException;

public class Main {
    public static void main(String[] args) throws Exception{
        courseparser parser = new courseparser();
        try{
            parser.parseCourse();
        }catch (FileNotFoundException ie){
            System.out.println("FileNotFound");
            return;
        }

        System.out.println(parser.getCourses().toString());
    }
    
}
