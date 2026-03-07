<%-- 
    Document   : viewExpense
    Author     : ARPITA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Login.DBConnection"%>

<%
if(session.getAttribute("userEmail")==null){
 response.sendRedirect("index.html");
 return;
}

request.setAttribute("activePage","view");

String email=(String)session.getAttribute("userEmail");
Connection con=DBConnection.getConnection();
%>

<html>
<head>
<style>

body{
 margin:0;
 background:#f1f5f9;
 font-family:'Segoe UI';
}

.main{
 margin-left:260px;
 padding:20px;
}

table{
 width:100%;
 background:white;
 border-collapse:collapse;
 border-radius:10px;
 overflow:hidden;
 box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

th{
 background:#3b82f6;
 color:white;
 padding:12px;
}

td{
 padding:10px;
 border-bottom:1px solid #eee;
}

.delete-btn{
 background:#b91c1c;     /* decent dark red */
 color:white;
 padding:6px 12px;
 border-radius:6px;
 text-decoration:none;
 font-size:14px;
 transition:0.3s;
}

.delete-btn:hover{
 background:#7f1d1d;     /* darker hover */

}

</style>
</head>

<body>

<jsp:include page="sidebar.jsp"/>

<div class="main">

<h2>All Expenses</h2>

<table>

<tr>
<th>No.</th>
<th>Category</th>
<th>Amount</th>
<th>Date</th>
<th>Action</th>
</tr>

<%
Statement st=con.createStatement();

ResultSet rs=st.executeQuery(
"SELECT * FROM expenses WHERE user_email='"+email+"'");

int count=1;   // ⭐ CONTINUOUS NUMBERING

while(rs.next()){
%>

<tr>

<td><%=count++%></td>

<td><%=rs.getString("category")%></td>

<td>₹ <%=rs.getDouble("amount")%></td>

<td><%=rs.getString("expense_date")%></td>

<td>
<a class="delete-btn"
   href="DeleteExpenseServlet?id=<%=rs.getInt("id")%>">
   Delete
</a>
</td>

</tr>

<% } %>

</table>

</div>
</body>
</html>