<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String itemName =request.getParameter("itemName");
	int itemPrice =Integer.parseInt(request.getParameter("itemPrice"));
	double itemRate =Double.parseDouble(request.getParameter("itemRate"));
	
	System.out.println(itemName + " : itemName");
	System.out.println(itemPrice + " : itemPrice");
	System.out.println(itemRate + " : itemRate");
	
	Connection conn =null;
	PreparedStatement stmt = null;
	//드라이버로딩,db연결
	try{	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPw = "java0000";
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	conn.setAutoCommit(false);
	
	//쿼리실행
	String sql = "insert into item(item_name,item_price,item_rate) VALUES(?,?,?)";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1,itemName);
	stmt.setInt(2,itemPrice);
	stmt.setDouble(3,itemRate);
	
	stmt.executeUpdate();
	
	conn.commit();
	
	
	}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}
%>
</body>
</html>