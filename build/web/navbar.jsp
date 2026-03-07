<style>
/* Remove default browser spacing */
html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

/* Top Navigation Bar */
.topnav {
    background-color: #2E86C1;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 55px;
    display: flex;
    align-items: center;
    z-index: 1000;
}

/* Links */
.topnav a {
    color: white;
    padding: 18px 22px;
    text-decoration: none;
    font-weight: bold;
}

/* Hover */
.topnav a:hover {
    background-color: #1B4F72;
}
</style>

<div class="topnav">
    <a href="home.jsp">Dashboard</a>
    <a href="AddExpense.jsp">Add Expense</a>
    <a href="ViewExpense.jsp">View Expense</a>
    <a href="Report.jsp">Report</a>
    <a href="LogoutServlet">Logout</a>
</div>


