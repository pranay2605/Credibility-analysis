package com.searchTweet.main.src;

import twitter4j.*;
import twitter4j.conf.*;

import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.List;

public class TwitterAnalysis {

    
    @SuppressWarnings({ "deprecation", "static-access" })
	public List<Status> TweetsRetrival(String word, String place){
    	System.out.println("Get Before Keywords and Place : "+word+place);

        ConfigurationBuilder cb = new ConfigurationBuilder();
//        cb.setIncludeRetweetsEnabled(false);
  	  cb.setDebugEnabled(true)
  	        .setOAuthConsumerKey("jT2Au0BlPAlZZy2gYENAGVKl4")
            .setOAuthConsumerSecret("MERRQssKeHCfZaYt6agSj7Brz8qBKfmEIjEFXgDS7qvWmMMBC4")
             .setOAuthAccessToken("345752065-7BNwnw8pCYF5eZeWyLzVfRTPhPQB6EHIv8TJsBGd")
             .setOAuthAccessTokenSecret("4IOXcEB7IlNHfgXQmdo9GbvtYCvPynZbhCVPvKbkAoKY0");
  	  TwitterFactory tf = new TwitterFactory(cb.build());
  	  Twitter twitter = tf.getInstance();
  	  double lat = 55.32443216228089;   // a search with no correct place given will return tweets from Ireland. 
  	  double lon = -9.602050778750026;
  	  int radius = 350;    // the radius of a country; the radius of a city will be 20 km
        try {
        	AspectDetection maps = new AspectDetection();
        	if(maps.countries.get(place) != null){
    			String l = "";
    			String pl = maps.countries.get(place);
    			int i=0;
       			for (i = 0; i < pl.length(); i++) {
       				if (pl.charAt(i) == '\t') {
       					break;
       				}
       				l = l + pl.charAt(i);
       			}
       			lat = Double.parseDouble(l);
       			lon = Double.parseDouble(pl.substring(i + 1, pl.length()));
       		}
        	else if (maps.cities.get(place) != null){ 
        		radius = 20; 
        		String l = "";
        		String pl = maps.cities.get(place);
				int i=0;	
        		for (i = 0; i < pl.length(); i++) {
       					if (pl.charAt(i) == '\t') {
       						break;
       					}
       					l = l + pl.charAt(i);
       				}
       				lat = Double.parseDouble(l);
       				lon = Double.parseDouble(pl.substring(i + 1, pl.length()));
        		}
            Query query = new Query(word);
            query.setCount(500);
            query.setResultType(query.MIXED);  //  - retrieves recent / popular tweets 
            query.setLang("en");
            query.setGeoCode(new GeoLocation(20.593684, 78.96288), radius, "km");  // coordinates for Ireland
            QueryResult result;
                result = twitter.search(query);
                List<Status> tweets = result.getTweets();
                System.out.println("Core Retrive Tweet's : "+tweets);
            
            return  tweets; 
            
        } catch (TwitterException te) {
            te.printStackTrace();
            System.out.println("Your search encountered the following error: " + te.getMessage());
            System.exit(-1);
        } catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
        
    }
}

