
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
             <label style=" font-size: 18px ; margin-left: 200px;"><%=ex%> Absent Student</label>
         </th>
     </tr>
     
    
     <tr > 
         <th>Date</th> 
         <th>Language</th> 
         <th>Absence Student</th> 
     </tr>
    
<%
  
       ResultSet rs=obj.selectData("select * from tbl_studentattendence st,tbl_subject sb where st.ExamId='"+request.getParameter("EID") +"' and st.Present='N' and sb.id=st.languageId  group BY st.EDate");
       while(rs.next())
       {
           %>
              <tr > 
         <th><%=rs.getString("EDate")%></th> 
         <th><%=rs.getString("subjectname")%></th> 
          <th>
           <%
           ResultSet rs1=obj.selectData("select * from tbl_studentattendence st,tbl_student sd where st.ExamId='"+request.getParameter("EID")+"' and st.Present='N' and st.EDate='"+rs.getString("EDate") +"' and sd.StudId=st.StudId  ");
          while(rs1.next())
           {
               %>
            
        <%=rs1.getString("Name")%>  <%=rs1.getString("KtuId")%><br>
               <%
           }
          %>
          </th> 
     </tr>
          <%
       }
 %>
 <tr><td colspan="3"><input type="button" value="Print Absent Duty" style="width: 200px;background: #66ff66;margin-left: 400px; display: block" onclick="MyPrint()" id="prntbtn">
     </td></tr>
</table>