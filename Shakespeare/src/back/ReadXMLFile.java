package back;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

//import org.w3c.dom.NamedNodeMap;
//File fXmlFile = new File("\\Users\\jshih\\Documents\\GitHub\\StatusDashboard\\src\\staff.xml");


public class ReadXMLFile {

    public ReadXMLFile() {
    }

    public int parseFile(String fileName, Play play, String finder) {
        try {
            //ClassLoader classLoader = this.getClass().getClassLoader();

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = dbFactory.newDocumentBuilder();
            Document document = documentBuilder.parse(fileName);

            //optional, but recommended
            //read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
            document.getDocumentElement().normalize();
            
//            System.out.println("Root element: " + document.getDocumentElement().getNodeName());
//            System.out.println("Next: " + document.getDocumentElement().getChildNodes().getLength());
            
            /*for(int i = 0; i < document.getDocumentElement().getChildNodes().getLength(); i++){
            	System.out.println(document.getDocumentElement().getChildNodes().item(i).getNodeName());
            }*/
            
            NodeList nodeList = document.getDocumentElement().getElementsByTagName("SPEECH");
            for(int j = 0 /*nodeList.getLength() - 20*/; j < nodeList.getLength(); j++){
            	
            	Element element = (Element) nodeList.item(j);
            	NodeList speakerList = element.getElementsByTagName("SPEAKER");
            	
            	String speaker = speakerList.item(0).getTextContent();	//gets the speaker
            	if(!play.speakerExists(speaker)){
            		play.addSpeaker(speaker);
            	}
            	
            	Speaker currSpeaker = play.getSpeaker(speaker);
            	
            	//Form the line spoken in one string
            	NodeList lines = element.getElementsByTagName("LINE");
            	//System.out.println("   Lines: ");
            	String sLines = "";
            	for(int k = 0; k < lines.getLength(); k++){
            		sLines += lines.item(k).getTextContent() + " ";
            	}
            	
            	int numFound = findString(finder, sLines);
            	currSpeaker.add(numFound);
            	//System.out.println(currSpeaker.name + " count: " + currSpeaker.getCount());
            	//System.out.println("      " + sLines);
            	//System.out.println(nodeList.item(j).getParentNode().getFirstChild().getFirstChild().getTextContent());	//scene
            	//NodeList children = nodeList.item(j).getChildNodes();
//            	System.out.println("Speaker: " + children.item(1).getTextContent());
            	
            	//System.out.println("	Line: " + children.item(3).getTextContent());	//line
//            	System.out.println(nodeList.item(j).GET("SPEAKER"));
//            	System.out.println(nodeList.item(j).getTextContent());
            }
            
        } catch (Exception e) {
            System.out.println("Error while processing resource file: " + e.getStackTrace());
            return -1;
        }
        return 0;
    }
    
    public int findString(String target, String full){
    	int lastIndex = 0;
    	int count = 0;
    	String lowerFull = full.toLowerCase();
    	lowerFull = " " + lowerFull + " ";
    	target = " " + target + " ";
  
    	while(lastIndex != -1){
    		lastIndex = lowerFull.indexOf(target, lastIndex);
    		
    		if(lastIndex != -1){
    			count++;
    			lastIndex += target.length();
    		}
    	}
    	
    	return count;
    }
    
    public int getTitle(String fileName, Play play){
    	try{
	    	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder documentBuilder = dbFactory.newDocumentBuilder();
	        Document document = documentBuilder.parse(fileName);

	        //optional, but recommended
	        //read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
	        document.getDocumentElement().normalize();
        
	        NodeList titles = document.getElementsByTagName("TITLE");
	        play.setTitle(titles.item(0).getTextContent());
	        //System.out.println(play.getTitle());
    	}
    	catch (Exception e){
    		System.out.println("fucked up");
    		return -1;
    	}
    	
    	return 0;
        
    }

  
}