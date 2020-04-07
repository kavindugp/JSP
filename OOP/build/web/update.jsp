<%-- 
    Document   : edit
    Created on : Apr 6, 2020, 9:39:11 PM
    Author     : Kavindu
--%>
<%@page  import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (request.getParameter("submit") != null) {
        
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

     
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/guide", "root", "");
        pst = con.prepareStatement("update users set name =? , email=? , phone =? where id = ? ");

        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, phone);
        pst.setString(4, id);
        pst.executeUpdate();
        //  }
        //catch(Exception e){
      //}    

%>
<%

    response.sendRedirect("index.jsp");
%>

<script>
    alert("Student Updated");
</script>

<%            }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2 style="text-align: center">Student Update Section</h2>
        <hr>
        <div class="row" style="margin-left: 400px;">
            <div class="col-sm-4">

                <form class="card" method="post" action="#" style="margin-left: 10px;width: 500px;" >

                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/guide", "root", "");
                        
                        String id=request.getParameter("id");
                        pst=con.prepareStatement("select * from users where id = ?");
                        pst.setString(1,id);
                        rs=pst.executeQuery();
                        
                        while(rs.next()){
                        
                        
                            
                    %>   

                    <div alight="left">
                        <label class="form-label" style="margin-left: 9px">Name</label>
                        <input type="text" class="form-control" placeholder="Enter Name " value="<%= rs.getString("name") %>" name="sname" id="sname" required style="margin-left: 8px; width: 480px;">
                    </div>
                    <div alight="left">
                        <label class="form-label" style="margin-left: 9px">Email</label>
                        <input type="Email" class="form-control" placeholder="Enter Email " value="<%= rs.getString("email") %>" name="email" id="email" required style="margin-left: 8px; width: 480px;">
                    </div>
                    <div alight="left">
                        <label class="form-label" style="margin-left: 9px">Phone</label>
                        <input type="text" class="form-control" placeholder="Enter Phone " value="<%= rs.getString("phone") %>" name="phone" id="phone" required style="margin-left: 8px; width: 480px;">
                    </div>
                   <% } %>
                    <div alight="right">
                        <input type="submit" id="submit" name="submit" value="SUBMIT" class="btn btn-info" style="margin-top: 10px;margin-bottom: 10px;margin-left: 8px;">
                        <input type="reset" id="reset" name="reset" value="RESET" class="btn btn-warning" style="width: 80px;">
                    </div>
                    <div align ="right"><a href="index.jsp">Click to back </a><</div>
                </form>

            </div>
        </div>
    </body>
</html>
