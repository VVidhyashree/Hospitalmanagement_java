<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>	
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<body style="background-image: url('https://wallpaperaccess.com/full/5930535.jpg'); background-repeat: no-repeat; background-size: cover;">
</head>
<body>
<h2><span style="color: white;">DOCTER APPOINTMENT DETAILS</span></h2>
<%
try {
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/today?characterEncoding=latin1","root","Vidhya@123");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from bankss");
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr><th>Appointment No</th><th>Docter name</th><th>Gender</th><th>Hospital name</th><th>Total bill</th><tr>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getFloat(5)%></TD>
</TR>
<% } %>
<%
// close all the connections.
rs.close();
st.close();
con.close();
} catch (Exception ex) {
%>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</TABLE><TABLE>
<TR>
<TD><FORM ACTION="Disp.jsp" method="get" >
<button type="submit"><-- back</button></TD>
</TR>
</TABLE>
</font>
</body>
</html>
