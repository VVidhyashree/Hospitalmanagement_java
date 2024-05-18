<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Tourism Bookings</title>
</head>
<body style="background-image: url('https://www.twincitysecurityal.com/images/AdobeStock_297026455_1.jpeg'); background-repeat: no-repeat; background-size: cover;">
<h2 style="color: white;">Search Guards</h2>
<%
String booking_no = request.getParameter("booking_no");
if (booking_no != null && !booking_no.isEmpty()) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/today?characterEncoding=latin1", "root", "Vidhya@123");
        PreparedStatement st = con.prepareStatement("SELECT * FROM Tourism WHERE Booking_No = ?");
        st.setInt(1, Integer.parseInt(booking_no));
        ResultSet rs = st.executeQuery();
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr><th>Booking No</th><th>Guard Name</th><th>Gender</th><th>Destination</th><th>Total Cost</th></tr>
<%
if (rs.next()) {
    do {
%>
<TR>
<TD><%=rs.getInt("Booking_No")%></TD>
<TD><%=rs.getString("Customer_Name")%></TD>
<TD><%=rs.getString("Gender")%></TD>
<TD><%=rs.getString("Destination")%></TD>
<TD><%=rs.getFloat("Total_Cost")%></TD>
</TR>
<%
    } while (rs.next());
} else {
%>
<tr><td colspan="5" style="text-align: center;">Guard not found</td></tr>
<%
}
rs.close();
st.close();
con.close();
} catch (Exception ex) {
    out.println("<font color='red'>Unable to connect to database.</font>");
    ex.printStackTrace();
}
} else {
%>
<center>
<form action="search.jsp" method="get">
    <span style="color: white;">Enter Booking Number:</span> <input type="text" name="booking_no">
    <input type="submit" value="Search">
</form>
</center>
<%
}
%>
<TABLE>
<TR>
<TD>
<FORM ACTION="bank.html" method="get">
<button type="submit"><-- Back</button>
</FORM>
</TD>
</TR>
</TABLE>
</body>
</html>





