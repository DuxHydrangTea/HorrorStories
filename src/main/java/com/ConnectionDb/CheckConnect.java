package com.ConnectionDb;

import java.sql.Connection;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import org.apache.tomcat.jakartaee.commons.lang3.StringUtils;

import com.DAO.*;
import com.DAO.CommentDAO;
import com.DAO.UserDAO;
import com.Function.Function;
import com.Model.*;

public class CheckConnect {

	public static void main(String[] args) {
		List<SavedSeri> list = SavedSeriDAO.getAllByUsername("ngocdung");
		System.out.println(list.size());
	}

}
	