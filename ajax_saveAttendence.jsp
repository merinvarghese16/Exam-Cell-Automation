
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
    
<%
    String present="";
ResultSet rs=obj.selectData("select * from tbl_studentattendence st where st.StudId='"+request.getParameter("SID") +"' and st.EDate=CURDATE()");
while(rs.next())
{
    present=rs.getString("Present");
}
if(present.equals("N"))
{
    obj.executeCommand("update tbl_studentattendence st set st.Present='Y' where st.StudId='"+request.getParameter("SID") +"' and st.EDate=CURDATE()");
}
else
{
   obj.executeCommand("update tbl_studentattendence st set st.Present='N' where st.StudId='"+request.getParameter("SID") +"' and st.EDate=CURDATE()"); 
}
 %>
 