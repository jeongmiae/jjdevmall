<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	String memberSex = request.getParameter("memberSex");
	int memberAge =Integer.parseInt(request.getParameter("memberAge"));
	
	System.out.println(memberId+":memberId");
	System.out.println(memberPw+":memberPw");
	System.out.println(memberName+":memberName");
	System.out.println(memberSex+":memberSex");
	System.out.println(memberAge+":memberAge");
	
	Connection conn = null;
	PreparedStatement stmt =null;
	
	
	try{
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPw = "java0000";
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	String sql = "insert into member(member_id,member_pw,member_name,member_sex,member_age) VALUES(?,?,?,?,?)";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1,memberId);
	stmt.setString(2,memberPw);
	stmt.setString(3,memberName);
	stmt.setString(4,memberSex);
	stmt.setInt(5, memberAge);
	stmt.executeUpdate();

	
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {		
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>
</body>
</html>