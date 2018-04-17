<%-- 
    Document   : ExamDuties
    Created on : 19 Feb, 2018, 5:37:25 AM
    Author     : basilscolu
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%@include file="header.jsp" %>


<html>
    <head>
        
        <title>Time Table</title>
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
        <form>
        <h1>Exam Duty List</h1>
        <table id="hidetable">
            <tr>   <td>Exam Name :</td><td><select onchange="chEck(this.value)"  >
                        <option value="0">--select--</option>
                <%
                    ResultSet rs=obj.selectData("select * from tbl_examtimetable ex,tbl_exam bb where ex.ExamId=bb.id  group by bb.id");
                    while(rs.next()){
                        %>
                        <option value="<%=rs.getString("Examid")%>"><%=rs.getString("ExamName")%></option>
                        
                        <%
                    }
                    %>
                
                    </select></td><tr>
            <tr>
               
        </table>
                    
                  
                    <div id="TimeTableDiv">
                    </div>
        </form>
                     <script src="MyJavaScript/jquery.min.js" type="text/javascript"></script>
    <script>
     
  
   function chEck(d)
   {
       alert(d);
        $.ajax({url:"AjaxDutyList.jsp?Eid="+d, 
         success: function(result){
         alert(result);
      $("#TimeTableDiv").html(result);
    }});
   }
    function MyPrint()
  {
      hidetable.style.display="none";
      prntbtn.style.display="none";
      window.print();
  }
    
    </script>
                       
    </body>
    
</html>
