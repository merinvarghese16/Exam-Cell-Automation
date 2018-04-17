<%-- 
    Document   : Exam Duty Assign
    Created on : 9 Feb, 2018, 5:53:56 PM
    Author     : basilscolu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ilahia Exam Cell Automation</title>
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
    <body><form >
            <div id="TohidePrintDiv" style="display: block">
                <label>Exam :</label><select id="batchExam" onchange="Attendence(this.value)">
        <option value="0">--select--</option>
        <%
        ResultSet rsbatch=obj.selectData("select * from tbl_exam");
        while(rsbatch.next())
        {
            %>
            <option value="<%=rsbatch.getString("id")%>"><%=rsbatch.getString("ExamName")%></option>
            <%
        }
        %>
    </select>
    <br>
    
  
    
        
                   

    </div>
                    
                    <div id="ExamDutyGenerationDiv">
                       
                        
                    </div>
        </form>
    </body>
    <script src="MyJavaScript/jquery.min.js" type="text/javascript"></script>
    <script>
        function semdiv()
    {
        semdivition.style.display="block";
    }
    function Attendence(d)
    {
       
       
        alert(d);
         $.ajax({url:"Ajax_ClassList.jsp?EID="+d, 
         success: function(result){
         alert(result);
      $("#ExamDutyGenerationDiv").html(result);
    }});
       
    }
    function MyPrint()
    {
        TohidePrintDiv.style.display="none";
        prntbtn.style.display="none";
   window.print();
   // myTable.print();
    }
    function getSeat()
    {
     var e=batchExam.value; 
      var date=dateExm.value;
      var noclass=noclassof.value;
      var k=ktuiddd.value;
      alert(e);
      alert(date);
     alert(noclass);
   alert(k);
         $.ajax({url:"AjaxSeat.jsp?EID="+e+"&KtuId="+k+"&date="+date+"&noOfclass="+noclass, 
         success: function(result){
         alert(result);
   $("#ExamDutyGenerationDiv").html(result);
    }}); 
    }
    
    function class1()
    {
      var divtopr=document.getElementById("class1");  
      newWin=window.open("");
      newWin.document.write(divtopr.outerHTML);
      
      newWin.print();
      newWin.close();
    }
    function class2()
    {
        var divtopr=document.getElementById("class2"); 
        newWin=window.open("");
      newWin.document.write(divtopr.outerHTML);
      
      newWin.print();
      newWin.close();
    }
    function class3()
    {
        var divtopr=document.getElementById("class3"); 
         newWin=window.open("");
      newWin.document.write(divtopr.outerHTML);
      
      newWin.print();
      newWin.close();
        
    }
    function class4()
    {
         var divtopr=document.getElementsByName("class4"); 
         newWin=window.open("");
      newWin.document.write(divtopr.outerHTML);
      
      newWin.print();
      newWin.close();
        
    }
</script>
</html>
