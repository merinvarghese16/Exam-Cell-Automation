<%-- 
    Document   : Remuneration
    Created on : 19 Feb, 2018, 8:52:41 AM
    Author     : basilscolu
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%@include file="header.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remuneration</title>
         <style>
            #myTable {
  border-collapse: collapse;
  width: 80%;
  border: 1px solid #ddd;
  font-size: 14px;
 
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}
         </style>
         
    </head>
    <body>
         <h1>Remuneration</h1>
        <table id="hidetable">
             <tr><td>Remuneration for One Duty :</td><td><input type="text" id="RemuoneDay"></td></tr>
            <tr>   <td>Exam Name:</td><td><select id="ExamCell" onchange="getRemuneration(this.value)" ><option value="0">--select--</option>
                <%
                    ResultSet rs=obj.selectData("select * from tbl_examtimetable ex,tbl_exam ex1 where ex.ExamId=ex1.id group by ex.ExamId");
                    while(rs.next()){
                        %>
                        <option value="<%=rs.getString("Examid")%>"><%=rs.getString("ExamName")%></option>
                        
                        <%
                    }
                    %>
                
                    </select></td><tr>
           
           
        </table>
                    <div id="remunerationDiv">
                        
                    </div>
    </body>
     <script src="MyJavaScript/jquery.min.js" type="text/javascript"></script>
    <script>
     
    
    function getRemuneration(d)
    {
        
     var r=RemuoneDay.value;
        alert(d);
       
         $.ajax({url:"AjaxRemuneration.jsp?EID="+d+"&r="+r, 
         success: function(result){
         alert(result);
      $("#remunerationDiv").html(result);
    }});
    }
  function MyPrint()
  {
      hidetable.style.display="none";
      prntbtn.style.display="none";
      window.print();
  }
  function saveAttendence(val)
  {
      alert(val);
  }
    
    </script>
</html>
