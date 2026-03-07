/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Login;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;

@WebServlet("/DeleteExpenseServlet")
public class DeleteExpenseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id=Integer.parseInt(request.getParameter("id"));

        try{
            Connection con=DBConnection.getConnection();

            PreparedStatement ps=con.prepareStatement(
                "DELETE FROM expenses WHERE id=?"
            );

            ps.setInt(1,id);
            ps.executeUpdate();

            response.sendRedirect("ViewExpense.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}