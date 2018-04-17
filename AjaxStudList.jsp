<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
<%
     String Batcid=request.getParameter("id");
    %>

<table id="myTable" >
     <tr>
         <th colspan="4"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">Student List</label>
         </th>
     </tr>
    
     <tr > <th>Name</th> 
         <th>Roll No</th> 
         <th>KTU ID</th> 
      
        
     </tr>
    
                            
                           
<%
   

ResultSet exduty=obj.selectData("select * from tbl_student ss where ss.BatchId='"+Batcid+"'");
while(exduty.next())
{
%>
 <tr>
     <td>
    <%=exduty.getString("Name")%>
</td>
<td>
    <%=exduty.getString("rollNo")%>
</td>
<td>
    <%=exduty.getString("KtuId")%>
</td>

</tr>
<%
}
%>
     
                        </table> 
 <input type="button" value="Print Exam Duty" style="width: 200px;background: #66ff66;margin-left: 400px; display: block"onclick="MyPrint()" id="prntbtn">
