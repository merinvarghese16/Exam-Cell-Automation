<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
<%
     String Batcid=request.getParameter("Eid");
    %>

<table id="myTable" >
     <tr>
         <th colspan="4"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">MCA Department Exam Duty List</label>
         </th>
     </tr>
    
     <tr > <th>Date</th> 
         <th>Faculty</th> 
         <th>Class</th> 
         <th>Batch</th> 
        
     </tr>
    
                            
                           
<%
   

ResultSet exduty=obj.selectData("select * from tbl_examduty ex,tbl_teacher tt,tbl_batch bb where ex.Fid=tt.FacultyId and ex.ExamId='"+Batcid+"' and bb.id=ex.BatchId order by ex.dateOf");
while(exduty.next())
{
%>
 <tr>
     <td>
    <%=exduty.getString("dateOf")%>
</td>
<td>
    <%=exduty.getString("Name")%>
</td>
<td>
    <%=exduty.getString("class")%>
</td>
<td>
    <%=exduty.getString("BatchName")%>
</td>
</tr>
<%
}
%>
     
                        </table> 
 <input type="button" value="Print Exam Duty" style="width: 200px;background: #66ff66;margin-left: 400px; display: block"onclick="MyPrint()" id="prntbtn">
