
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>

<%
obj.executeCommand("update tbl_teacherattendence set SFid='"+request.getParameter("SFid")+"' where Fid='"+request.getParameter("fid")+"' and AttDate=CURDATE()");

    %>
 

