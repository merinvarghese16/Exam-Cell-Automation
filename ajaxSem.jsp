
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
  <option>--Select--</option>
<%
   
 ResultSet rs= obj.selectData("select * from tbl_exam ex,tbl_subject ss,tbl_semester s where ex.semId=s.id and s.id=ss.Semester and ex.id='"+request.getParameter("d") +"'");
 while(rs.next())
 {
     %>
     <option value="<%=rs.getString("ss.id")%>"><%=rs.getString("subjectname")%></option>
     <%
 }
 %>

