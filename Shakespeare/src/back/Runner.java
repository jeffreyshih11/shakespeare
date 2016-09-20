package back;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class Runner {

	public static Properties CONFIG = null;
	public static final String CONFIG_PATH = "C:\\Users\\Jeff\\Documents\\jeffrey\\school\\senior\\workspace\\Shakespeare\\src\\back\\config.properties";
	public static final String SHAKS = "C:\\Users\\Jeff\\Documents\\jeffrey\\school\\senior\\workspace\\Shakespeare\\src\\shaks200\\";
	//public static final String FILE_NAME = "shaks200/coriolan.xml";
	//public static final String FILE_NAME = "shaks200/cymbelin.xml";
	//public Play coriolan = new Play();
	//public Play cymbelin = new Play();

	private Play play = new Play();
	
	public Play getPlay(){
		return play;
	}
	
	
	public void run(String finder, String playname){
		ReadXMLFile fileReader = new ReadXMLFile();
		CONFIG = new Properties();
		try {
			//String configpath = CONFIG_PATH + "config.properties";
			FileInputStream fn = new FileInputStream(CONFIG_PATH);
			CONFIG.load(fn);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("config not found");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String playName = CONFIG.getProperty(playname);
    	System.out.println("In runner this is the play: " + playName);
    	String playFileLoc = SHAKS + playName;
    	
    	//Play play = new Play();
    	fileReader.getTitle(playFileLoc, play);
    	
    	System.out.println("Play title is: " + play.getTitle());
    	
        if (fileReader.parseFile(playFileLoc, play, finder) == 0) {
        	for(Speaker s: play.speakers){
            	System.out.println(s.name + " count: " + s.getCount());
            }
            System.out.println("\n\n***** Success *****");
        } else {
            System.out.println("\n\n***** Fail *****");
        }
        
        
        
//        fileReader.getTitle(FILE_NAME, cymbelin);
//    	System.out.println("Play title is: " + cymbelin.getTitle());
//    	
//        if (fileReader.parseFile(FILE_NAME, cymbelin, finder) == 0) {
//        	for(Speaker s: cymbelin.speakers){
//            	System.out.println(s.name + " count: " + s.getCount());
//            }
//            System.out.println("\n\n***** Success *****");
//        } else {
//            System.out.println("\n\n***** Fail *****");
//        }
        
        
	}

	public static void main(String argv[]) {

		Runner r = new Runner();
		r.run("he", "hen_v");
				
	}
}
