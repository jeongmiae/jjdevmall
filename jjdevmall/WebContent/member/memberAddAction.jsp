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
	String memberAdd = request.getParameter("memberAdd");
	
	System.out.println(memberId+":memberId");
	System.out.println(memberPw+":memberPw");
	System.out.println(memberName+":memberName");
	System.out.println(memberSex+":memberSex");
	System.out.println(memberAge+":memberAge");
	System.out.println(memberAdd+":memberAdd");
	
	Connection conn = null;
	
		
	try{
	//드라이버로딩,db연결	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPw = "java0000";
	Class.forName(driver);
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	//commit
	conn.setAutoCommit(false);
	
	String sql1 = "insert into member(member_id,member_pw,member_name,member_sex,member_age) VALUES(?,?,?,?,?)";
	PreparedStatement stmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
	stmt1.setString(1,memberId);
	stmt1.setString(2,memberPw);
	stmt1.setString(3,memberName);
	stmt1.setString(4,memberSex);
	stmt1.setInt(5, memberAge);
	
	int result= stmt1.executeUpdate();

	if(result != 0){
		ResultSet rs = stmt1.getGeneratedKeys();
		int key = 0;
			if(rs.next()){
			key = rs.getInt(1);
			System.out.println(key + "key");
		}
	String sql2 = "insert into address(member_no,member_address) VALUES(?,?)";
	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	stmt2.setInt(1,key);
	stmt2.setString(2,memberAdd);
	result = stmt2.executeUpdate();
	
	conn.commit();

	}
	
	}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}
%>
</body>
</html>