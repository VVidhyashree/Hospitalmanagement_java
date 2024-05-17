2.Insert.jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Docter appointment Management System</title>
<body style="background-image: url('https://wallpaperaccess.com/full/5930535.jpg'); background-repeat: no-repeat; background-size: cover;">
</head>

<body bgcolor="#ffffcc">
<center>
<font size="+3" color="white"><br>Welcome!</font>
<FORM action="Insert.jsp" method="get">
    <TABLE style="background-color: #ECE5B6;" WIDTH="30%">
        <TR>
            <TH width="50%">Appointment No:</TH>
            <TD width="50%"><INPUT TYPE="text" NAME="Transaction_No"></TD>
        </TR>
        <TR>
            <TH width="50%">Docter name </TH>
            <TD width="50%"><INPUT TYPE="text" NAME="Transaction_done_to"></TD>
        </TR>
        <tr>
            <TH width="50%"> Gender</TH>
            <TD width="50%"><INPUT TYPE="text" NAME="Gender"></TD>
        </tr>
        <tr>
            <TH width="50%">Hospital name</TH>
            <TD width="50%"><INPUT TYPE="text" NAME="Enter_Bank"></TD>
        </tr>
        <tr>
            <TH width="50%">Total bill</TH>
            <TD width="50%"><INPUT TYPE="text" NAME="Transaction_amount"></TD>
        </tr>
        <TR>
            <TH></TH>
            <TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
        </TR>
    </TABLE>
</FORM>
</center>

<%
int uq=0;
try {
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/today?characterEncoding=latin1", "root", "Vidhya@123");
PreparedStatement pstatement = con.prepareStatement("INSERT INTO BANKSS VALUES (?, ?, ?, ?, ?)");
pstatement.setInt(1, Integer.valueOf(request.getParameter("Transaction_No")));
pstatement.setString(2, request.getParameter("Transaction_done_to"));
pstatement.setString(3, request.getParameter("Gender"));
pstatement.setString(4, request.getParameter("Enter_Bank"));
pstatement.setFloat(5, Float.valueOf(request.getParameter("Transaction_amount")));

uq=pstatement.executeUpdate();
pstatement.close();
con.close();
}
catch(Exception ex) { 
//out.println("Unable to connect to database.");
}
if (uq != 0) {
%>
<br>
<center>
<TABLE style="background-color: #E3E4FA;" 
WIDTH="30%" border="1">
<tr><th>Data is inserted successfully in database.</th></tr>
</center>
</table>
<%
} %> 
</form> 
</body>
</html>
