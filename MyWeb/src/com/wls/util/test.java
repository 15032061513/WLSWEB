package com.wls.util;

import java.io.File;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;

public class test {
    public static void main(String[] args){
    	
    	try{
	        File file = new File("D://test//123.mp3");
	        System.out.println(file.length());
	        System.out.println(file.getPath());
	        System.out.println(file.getParentFile());
	        System.out.println(file.getParent());
	        System.out.println(file.getName());
	        System.out.println("-----------------11-------------------");
//	        
	        Clip clip = AudioSystem.getClip();
	        System.out.println(clip);
	        System.out.println("-----------------22-------------------");
//	        
	        AudioInputStream ais = AudioSystem.getAudioInputStream(file);
	        System.out.println(ais);
	        System.out.println("-----------------33-------------------");
//	        
	        clip.open(ais);
//	        System.out.println(clip);
//	        System.out.println("-----------------44-------------------");
//	        
//	        String second = clip.getMicrosecondLength() / 1000000D + " s" ;
//	    	System.out.println("获取音频文件时长"+second );//获取音频文件时长
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
}