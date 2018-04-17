
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
<%
   
 obj.executeCommand("insert into tbl_examtimetable (dd,mm,yy,languageid,timing,ExamId) VALUES('"+request.getParameter("d") +"','"+request.getParameter("m") +"','"+request.getParameter("y") +"','"+request.getParameter("l") +"','"+request.getParameter("t") +"','"+request.getParameter("b") +"')");
 String s="donee" ;
 %>
 <%=s%>
