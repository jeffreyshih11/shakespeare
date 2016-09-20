package back;

public class Speaker {

	String name;
	private int wordCount;
	
	public Speaker(String name){
		this.name = name;
		wordCount = 0;
	}
	
	public void add(int num){
		wordCount += num;
	}
	
	public int getCount(){
		return wordCount;
	}
	
	public String getName(){
		return name;
	}
}
