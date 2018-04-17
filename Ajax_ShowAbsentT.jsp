
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
<%
    String ex="";
    ResultSet rsex=obj.selectData("select * from tbl_exam ex where ex.id='"+request.getParameter("EID") +"'");
    while(rsex.next())
    {
        ex=rsex.getString("ExamName");
    }
    
    %>
<table id="myTable" >
     <tr>
         <th colspan="3"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;"><%=ex%> Teacher </label>
         </th>
     </tr>
     
    
     <tr > 
         <th>Date</th> 
          
         <th>Faculty</th> 
         <th>Class</th>
     </tr>
    
<%
  
       ResultSet rs=obj.selectData("select * from tbl_exam ex, tbl_teacherattendence th,tbl_teacher tt where ex.id=th.Eid and tt.FacultyId=th.Fid  and ex.id='"+request.getParameter("EID") +"'  ");
       while(rs.next())
       {
           String sfif="",classs="";
           ResultSet r=obj.selectData("select * from tbl_teacher where FacultyId='"+rs.getString("SFid")+"'");
           while(r.next()){
               sfif=" --> "+r.getString("Name");
           }
           ResultSet r1=obj.selectData("select * from tbl_examduty ex where ex.dateOf='"+rs.getString("AttDate")+"' and ex.Fid='"+rs.getString("Fid")+"' ");
           while(r1.next())
           {
               classs=r1.getString("class");
           }
           %>
              <tr > 
         <th><%=rs.getString("AttDate")%></th> 
         
          <th>
              <%=rs.getString("Name")+sfif%>
          </th> 
          <th><%=classs%></th>
     </tr>
          <%
       }
 %>
         <tr><td colspan="3">
     --> Indicates Substituted Faculty
     </td>
         </tr>
 <tr><td colspan="3"><input type="button" value="Print List " style="width: 200px;background: #66ff66;margin-left: 400px; display: block" onclick="MyPrint()" id="prntbtn">
     </td></tr>
</table>