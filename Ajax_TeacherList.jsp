
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>

    
<%
//String Eid=request.getParameter("EID");
    String S="";
    String SemId="",BID="",Sem="",lan="";
ResultSet rsss=obj.selectData("select * from tbl_exam ex where ex.id='"+request.getParameter("EID")+"' ");
while(rsss.next())
{
}
    %>
    
 <table id="myTable" >
     <tr>
         <th colspan="5"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">Exam Student Attendence </label>
         </th>
     </tr>
    
        <tr class="header" >
                              <th style="width:60%;">Teacher Name</th>
                              <th style="width:40%;">Class</th>
                              
                              
                               <th style="width:40%;">Present / Absent</th>
                             </tr>
 
 <%
ResultSet r=obj.selectData("select * from tbl_examduty ex ,tbl_teacher tt where   ex.dateOf=CURDATE() and ex.Fid=tt.FacultyId and ex.ExamId='"+request.getParameter("EID")+"'");
while(r.next())
{
    obj.executeCommand("insert into tbl_teacherattendence (AttDate,Fid,Eid) VALUES(CURDATE(),'"+r.getString("Fid")+"','"+request.getParameter("EID")+"')");
    %>
    
    <tr>
        <td><%=r.getString("Name")%></td>
        <td><%=r.getString("class")%></td>
        <td> <input type="checkbox" name="<%=r.getString("Fid")%>" value="<%=r.getString("Fid")%>" onclick="getTeacher(<%=r.getString("Fid")%>)" checked="">
            
 
           
            
        </td>
    </tr>
    <%
}


    %>
 </table>
   

 <% 

%>
