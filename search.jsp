<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search appointment Bookings</title>
</head>
<body style="background-image: url('https://wallpaperaccess.com/full/5930535.jpg'); background-repeat: no-repeat; background-size: cover;">
<h2>Search appointment</h2>
<%
String transaction_no = request.getParameter("transaction_no");
if (transaction_no != null && !transaction_no.isEmpty()) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/today?characterEncoding=latin1", "root", "Vidhya@123");
        PreparedStatement st = con.prepareStatement("SELECT * FROM bankss WHERE Transaction_no = ?");
        st.setInt(1, Integer.parseInt(transaction_no));
        ResultSet rs = st.executeQuery();
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr><th>Appointment No</th><th>Doctor name</th><th>Gender</th><th>Hospital name</th><th>Total bill</th><tr>
<%
if (rs.next()) {
    do {
%>
<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getFloat(5)%></TD>
</TR>
<%
    } while (rs.next());
} else {
%>
<tr><td colspan="5">Appointment not found</td></tr>
<%
}
rs.close();
st.close();
con.close();
} catch (Exception ex) {
    out.println("Unable to connect to database.");
    ex.printStackTrace();
}
} else {
%>
<center>
<form action="search.jsp" method="get">
    <span style="color: white;">Enter Appointment Number:</span> <input type="text" name="transaction_no">
    <input type="submit" value="Search">
</form>
</center>
<%
}
%>
<TABLE>
<TR>
<TD>
<FORM ACTION="display.jsp" method="get" >
<button type="submit"><-- Back</button>
</FORM>
</TD>
</TR>
</TABLE>
</body>
</html>





