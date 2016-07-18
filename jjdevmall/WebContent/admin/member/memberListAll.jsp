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
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPw = "java0000";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, dbUser, dbPw);
	/*	select 
		m.member_id,m.member_pw,m.member_name,m.member_sex,m.member_age
		from member m left 
		join address a
		on m.member_no = a.member_no
		*/
	String sql = "select m.member_id,m.member_pw,m.member_name,m.member_sex,m.member_age,a.member_address  from member m left join address a on m.member_no = a.member_no";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
%>
<table>
<tr>
	<td>아이디</td>
	<td>비밀번호</td>
	<td>이름</td>
	<td>성별</td>
	<td>나이</td>
	<td>주소</td>
</tr>
<%
	while(rs.next()) {
%>
			<tr>
				<td><%=rs.getString("member_id")%></td>
				<td><%=rs.getString("member_pw")%></td>
				<td><%=rs.getString("member_name")%></td>
				<td><%=rs.getString("member_sex")%></td>
				<td><%=rs.getInt("member_age")%></td>
				<td><%=rs.getString("member_address")%></td>
			</tr>
<%		
	}

%>
</table>
</body>
</html>