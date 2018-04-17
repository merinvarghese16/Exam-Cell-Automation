
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
<%
    String f="",s="";
    ResultSet rsss1=obj.selectData("select * from tbl_teacher tt where tt.FacultyId='"+request.getParameter("Fid")+"'");
   while(rsss1.next())
    {
      f= rsss1.getString("Name");
      s=rsss1.getString("FacultyId");
    }
    
    %>
 <label>Substitute Another Faculty for <%=f%></label> <select id="selsel" onchange="save()"><option>-select-</option>   
<%
obj.executeCommand("update tbl_teacherattendence set SFid='Y' where Fid='"+request.getParameter("Fid")+"' and AttDate=CURDATE()");
ResultSet rsss=obj.selectData("select * from tbl_teacher tt where tt.FacultyId!='"+request.getParameter("Fid")+"'");
while(rsss.next())
{
    %>
    <option value="<%=rsss.getString("FacultyId")%>"><%=rsss.getString("Name")%></option>
    <%
}
    %>
    
 </select>
    <input type="hidden" value="<%=s%>" id="sel1">
   
 

