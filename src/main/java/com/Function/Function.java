package com.Function;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.http.Part;

public class Function {
	public static String  getCurrentTime() {
		LocalDateTime currentTime = LocalDateTime.now();
		String currentTime11 = currentTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return currentTime11;
	}

	public static String uploadImage(Part file) {
		String fileName = file.getSubmittedFileName();
		String uploadPath = "C:/Users/faker/eclipse-workspace/TruyenMa/src/main/webapp/user/assets/img/"+fileName;
		try {
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			String realpath = "assets/img/"+fileName;
			return realpath;
		}
		catch(Exception e ) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	
	
	public static String convertByteToHex1(byte[] data) {
		  BigInteger number = new BigInteger(1, data);
		  String hashtext = number.toString(16);
		  // Now we need to zero pad it if you actually want the full 32 chars.
		  while (hashtext.length() < 32) {
		    hashtext = "0" + hashtext;
		  }
		  return hashtext;
		}
	public static String getMD5(String input) {
		  try {
		    MessageDigest md = MessageDigest.getInstance("MD5");
		    byte[] messageDigest = md.digest(input.getBytes());
		    return convertByteToHex1(messageDigest);
		  } catch (NoSuchAlgorithmException e) {
		    throw new RuntimeException(e);
		  }
		}
	
	public static String getDifferentTime(String pass) {
		String diff="";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime localDateTime = LocalDateTime.parse(pass, formatter);
        LocalDateTime now = LocalDateTime.parse(getCurrentTime(), formatter);
        Duration timeElapsed = Duration.between(localDateTime, now);
        int s = (int) timeElapsed.getSeconds();
        int days = s/(60*60*24);
        int hours = s/(60*60);
        int m = s/60;
        if(days == 0) {
        	if(hours == 0) {
        		if(m == 0) {
        			diff = s+" giây trước";
        		}
        		else {
        			diff = m+" phút trước";
        		}
        	}
        	else {
        		diff = hours+" giờ trước";
        	}
        }
        else {
        	diff = days+" ngày trước";
        }
		return diff;
	}
	
	public static int getDayofDiffTime(String pass) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime localDateTime = LocalDateTime.parse(pass, formatter);
        LocalDateTime now = LocalDateTime.parse(getCurrentTime(), formatter);
        Duration timeElapsed = Duration.between(localDateTime, now);
        int s = (int) timeElapsed.getSeconds();
        int days = s/(60*60*24);
		return days;
	}
	
}
