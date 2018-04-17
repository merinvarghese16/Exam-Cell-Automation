
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
 <table id="myTable" >
     <tr>
         <th colspan="6"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">Exam Remuneration </label>
         </th>
     </tr>
    
     <tr > <th>Name</th> 
         <th>No Of Duties</th> 
         
         <th>Batch</th> 
         <th>Sem</th> 
          <th>Examination</th>
         <th>Total Remuneration</th> 
     </tr>
<%
   int a=Integer.parseInt(request.getParameter("r"));
 ResultSet rs=obj.selectData("select * from tbl_examduty ex,tbl_teacher th,tbl_batch bh,tbl_semester sem,tbl_exam ex1 where ex.ExamId='"+request.getParameter("EID")+"'  and th.FacultyId=ex.Fid and bh.id=ex.BatchId and ex1.id=ex.ExamId group by Fid ");
        
 while(rs.next())
 {
     
     ResultSet rsCount=obj.selectData("select count(*) from tbl_examduty ex where ex.Fid='"+rs.getString("Fid")+"' and ex.ExamId='"+request.getParameter("EID")+"' ");
     while(rsCount.next())
     {
         
         int count=Integer.parseInt(rsCount.getString("count(*)"));
         int tot=count*a;
         %>
          <tr>
     <td>
         
    <%=rs.getString("Name")%>
</td>
<td>
    <%=rsCount.getString("count(*)")%>
</td>

<td>
    <%=rs.getString("BatchName")%>
</td>
<td>
    <%=rs.getString("sem")%>
</td>
<td>
    <%=rs.getString("ExamName")%>
</td>
<td>
    <%=tot%>
</td>
</tr>
         <%
     }
     
     
     
 }
 %>
 <tr><td colspan="6">Remuneration for one day :<%=a%> </td></tr>
 <tr><td colspan="6" > <input type="button" value="Print remuneration" style="width: 200px;background: #66ff66;margin-left: 400px; display: block"onclick="MyPrint()" id="prntbtn"></td></tr>

