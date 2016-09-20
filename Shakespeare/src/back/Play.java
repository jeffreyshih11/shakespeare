package back;
import java.util.ArrayList;

public class Play {
	
	private String title;
	public ArrayList<Speaker> speakers;
	
	public Play(){
		speakers = new ArrayList<Speaker>();
	}
	
	public ArrayList<Speaker> getSpeakerArray(){
		return speakers;
	}
	
	public String getSpeakers(){
		String out = "";
		for(Speaker s: speakers){
			out += '\'' + s.name + "\' ";
		}
		return out;
	}
	
	public void addSpeaker(String speaker){
		Speaker newSpeaker = new Speaker(speaker);
		speakers.add(newSpeaker);
	}
	
	public boolean speakerExists(String speaker){
		for(Speaker s: speakers){
			if(s.name.equals(speaker)){
				return true;
			}
		}
		
		return false;
	}
	
	public Speaker getSpeaker(String speaker){
		for(Speaker s: speakers){
			if(s.name.equals(speaker)){
				return s;
			}
		}
		
		return null;
	}
	
	public void setTitle(String newTitle){
		title = newTitle;
	}
	
	public String getTitle(){
		return title;
	}
}
