<%@page  import="java.sql.*" %>

<%
        String id = request.getParameter("id");
       
        Connection con;
        PreparedStatement pst;
        ResultSet rs;

     
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/guide", "root", "");
        pst = con.prepareStatement("delete from users where id = ? ");

        pst.setString(1, id);
        pst.executeUpdate();
        //  }
        //catch(Exception e){
      //}    

%>

<%

    response.sendRedirect("index.jsp");
%>

<script>
    alert("Student Deleted");
    
    
</script>


