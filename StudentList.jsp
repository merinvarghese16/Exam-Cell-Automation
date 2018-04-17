<%-- 
    Document   : StudentList
    Created on : Mar 23, 2018, 2:48:25 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student List</title>
    </head>
    <body>
           
        Batch      <select name="selBatch" onchange="chEck(this.value)"><option>-select--</option>
                                <%
        ResultSet rsbatch=obb.selectData("select * from tbl_batch");
        while(rsbatch.next())
        {
            %>
            <option value="<%=rsbatch.getString("id")%>"><%=rsbatch.getString("BatchName")%></option>
            <%
        }
        %>
                                </select>
                                 <div id="ExamDutyGenerationDiv">
                       
                        
                    </div>
                        
    </body>
      <script src="MyJavaScript/jquery.min.js" type="text/javascript"></script>
    <script>
     
  
   function chEck(d)
   {
       alert(d);
        $.ajax({url:"AjaxStudList.jsp?id="+d, 
         success: function(result){
         alert(result);
      $("#ExamDutyGenerationDiv").html(result);
    }});
   }
   function MyPrint(d)
   {
       window.print();
   }
   </script>
</html>
