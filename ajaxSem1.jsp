
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
 <option>--select--</option>
<%
   
 ResultSet rs= obj.selectData("select * from tbl_examtimetable ex,tbl_subject ss,tbl_semester sem where ex.batchid='"+request.getParameter("bId") +"' and ss.id=ex.languageid and sem.id=ss.Semester group by ss.Semester");
 while(rs.next())
 {
     %>
     <option value="<%=rs.getString("Semester")%>"><%=rs.getString("sem")%></option>
     <%
 }
 %>

