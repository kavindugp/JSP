<%-- 
    Document   : index
    Created on : Apr 6, 2020, 3:35:41 PM
    Author     : Kavindu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page  import="java.sql.*" %>

<%
    if (request.getParameter("submit") != null) {

        String name = request.getParameter("sname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

     
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/guide", "root", "");
        pst = con.prepareStatement("insert into users (name,email,phone) values (?,?,?)");

        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, phone);

        pst.executeUpdate();
        //  }
        //catch(Exception e){
      //}    

%>

<script>
    alert("New Student added");
</script>

<%            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Student Registraion System</h1>
        <hr>

        <div class="row">
            <div class="col-sm-4">

                <form class="card" method="post" action="#" style="margin-left: 10px">

                    <div alight="left">
                        <label class="form-label" style="margin-left: 9px">Name</label>
                        <input type="text" class="form-control" placeholder="Enter Name " name="sname" id="sname" required style="margin-left: 8px; width: 407px;">
                    </div>
                    <div alight="left">
                        <label class="form-label" style="margin-left: 9px">Email</label>
                        <input type="Email" class="form-control" placeholder="Enter Email " name="email" id="email" required style="margin-left: 8px; width: 407px;">
                    </div>
                    <div alight="left">
                        <label class="form-label" style="margin-left: 9px">Phone</label>
                        <input type="text" class="form-control" placeholder="Enter Phone " name="phone" id="phone" required style="margin-left: 8px; width: 407px;">
                    </div>
                    <div alight="right">
                        <input type="submit" id="submit" name="submit" value="SUBMIT" class="btn btn-info" style="margin-top: 10px;margin-bottom: 10px;margin-left: 8px;">
                        <input type="reset" id="reset" name="reset" value="RESET" class="btn btn-warning" style="width: 80px;">
                    </div>
                </form>

            </div>

            <div class="col-sm-8">

                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width ="100%">
                    <thead>
                        <tr>
                            <th style="width: 300px;">Student ID</th>
                            <th style="width: 300px;">Student Name</th>
                            <th style="width: 300px;">Student Email</th>
                            <th style="width: 150px;">Student Phone</th>
                            <th>Edit</th>
                            <th>Delete</th>

                        </tr>

                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

//        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/guide", "root", "");
                            
                            String query="select * from users";
                            Statement st=con.createStatement();
                            rs=st.executeQuery(query);
                            
                            while(rs.next()){
                            String id=rs.getString("id");
                                
                            %>

                        <tr>
                            <td>
                                <%=rs.getString("id") %>
                            </td>
                            <td>
                                <%=rs.getString("name") %>   
                            </td>
                            <td>
                                <%=rs.getString("email") %>
                            </td>
                            <td>
                                <%=rs.getString("phone") %>
                            </td>
                            <td>
                                <a href="update.jsp?id=<%=id%>">Edit</a>
                            </td>
                            <td>
                                <a href="delete.jsp?id=<%=id%>" onsubmit="redirect("index.jsp");">Delete</a>
                            </td>
                        </tr>
                        
                    <%
                                    }             
                     %>               

                    </thead>
                </table>

            </div>
        </div>
    </body>
</html>
