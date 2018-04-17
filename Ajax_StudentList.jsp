
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>

    
<%
//String Eid=request.getParameter("EID");
    String S="";
    String SemId="",BID="",Sem="",lan="";
ResultSet rsss=obj.selectData("select * from tbl_exam ex,tbl_semester  sem,tbl_examtimetable et where ex.id='"+request.getParameter("EID")+"' and ex.semId=sem.id and et.ExamId=ex.id and et.dd=DAY(CURDATE()) and et.mm=MONTH(CURDATE())-1 and et.yy=YEAR(CURDATE()) ");
if(rsss.next()){
    %>
     <table id="myTable" >
     <tr>
         <th colspan="5"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">Exam Student Attendence </label>
         </th>
     </tr>
    
        <tr class="header" >
                              <th style="width:60%;">Student Name</th>
                              <th style="width:40%;">KTU Id</th>
                              <th style="width:40%;">Batch</th>
                              <th style="width:40%;">Sem</th>
                              
                               <th style="width:40%;">Present / Absent</th>
                             </tr>
    
    <%

//while(rsss.next())
//{
   SemId=rsss.getString("semId");
   BID=rsss.getString("BatchId");
   Sem=rsss.getString("sem");
   lan=rsss.getString("languageid");
//}

 ResultSet rs=obj.selectData("select * from tbl_student st,tbl_batch bb  where st.BatchId='"+BID+"' and st.BatchId=bb.id");
        
 while(rs.next())
 {
     
    
         %>
          <tr>
     <td>
         
    <%=rs.getString("Name")%>
</td>
<td>
    <%=rs.getString("KtuId")%>
</td>

<td>
    <%=rs.getString("BatchName")%>
</td>
<td>
    <%=Sem%>
</td>
<%
    String present="";
ResultSet rsa=obj.selectData("select * from tbl_studentattendence st where st.StudId='"+rs.getString("StudId") +"' and st.EDate=CURDATE()");
while(rsa.next())
{
    present=rsa.getString("Present");
}
if(present.equals("N"))
{
    %>
    <td>
    <input type="checkbox" name="<%=rs.getString("StudId")%>" value="<%=rs.getString("StudId")%>" onclick="saveAttendence(this.value)">
</td>
    <%
}
else
{
    %>
    <td>
        <input type="checkbox" name="<%=rs.getString("StudId")%>" value="<%=rs.getString("StudId")%>" onclick="saveAttendence(this.value)" checked="">
</td>
    <%
}
 %>



</tr>
         <%
         obj.executeCommand("insert into tbl_studentattendence(StudId,ExamId,EDate,Present,languageId)"
                 + " VALUES('"+rs.getString("StudId")+"','" + request.getParameter("EID") + "',CURDATE(),'N','"+lan+"')");
         
     }
     
     
     
 
 %>
 
 <%
 
}
else
{
    %>
 
    <label>There Is No Exam On This Daaayy !</label>
    <label><%=S%></label>

 <% 
}
%>
