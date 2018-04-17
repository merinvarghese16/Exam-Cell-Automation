
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
 <table id="myTable" >
     <tr>
         <th colspan="4"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">Exam time Table</label>
         </th>
     </tr>
    
     <tr > <th>Date</th> 
         <th>Subject</th> 
         <th>Time</th> 
         <th>Batch</th> 
         <th>Sem</th> 
     </tr>
<%
   
 ResultSet rs= obj.selectData("select * from tbl_examtimetable ex,tbl_subject ss,tbl_semester sem,tbl_batch bh where ex.batchid='"+request.getParameter("bId") +"' and ex.languageid=ss.id and sem.id='"+request.getParameter("sid") +"' and ex.batchid=bh.id");
 while(rs.next())
 {
     %>
     <tr>
     <td>
         <%
     int a=Integer.parseInt(rs.getString("mm"));
     a=a+1;
     %>
    <%=rs.getString("dd")%>/<%=a%>/<%=rs.getString("yy")%>
</td>
<td>
    <%=rs.getString("subjectname")%>
</td>
<td>
    <%=rs.getString("timing")%>
</td>
<td>
    <%=rs.getString("BatchName")%>
</td>
<td>
    <%=rs.getString("sem")%>
</td>
</tr>
     <%
 }
 %>
 <tr><td colspan="2" > <input type="button" value="Print Exam Duty" style="width: 200px;background: #66ff66;margin-left: 400px; display: block"onclick="MyPrint()" id="prntbtn"></td></tr>

