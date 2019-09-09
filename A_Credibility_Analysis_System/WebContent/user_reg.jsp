<%@page import="MysqlConnection.DbConnection"%>
<%@page import="java.sql.*" %>
<%

String name = request.getParameter("name");
String pass = request.getParameter("pass");
String email = request.getParameter("email");
String state = request.getParameter("state");
String country = request.getParameter("country");
System.out.println("User Details : "+name+pass+email+state+country);

Connection con = DbConnection.getConnection();
Statement st = con.createStatement();
try{
	int in = st.executeUpdate("insert into user_details (uname, pass, email, state, country) values ('" + name + "', '" + pass + "', '" + email + "', '" + state + "', '" + country + "')");
	if(in!=0){
		response.sendRedirect("index.jsp?msg=Success");
	}else{
		response.sendRedirect("index.jsp?msgg=Error");
		
	}
}catch(Exception ex){
	ex.printStackTrace();
}
%>