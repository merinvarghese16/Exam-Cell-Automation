<%-- 
    Document   : Exam Duty Assign
    Created on : 9 Feb, 2018, 5:53:56 PM
    Author     : basilscolu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>


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
              <div style="width: 1400px;height: 120px; background-color: #363636;margin-bottom: 10px;">
              <div class="Happywedding_logo" style="float:left;"> 
					

					<img src="logo/download (12).jpg" alt="Ilahia Exam Cell" title="Ilahia Exam Cell" width="120" height="100">

				    </div> 
                                        <div style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Ilahia Exam Cell
                
            </div>
                                      
                                   </div>
            
            <div id="TohidePrintDiv" style="display: block">
         <label>Exam :</label><select id="batchExam">
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
    
  
    
        
                    <label>No Of Classes Assign For Exam !</label><input type="text" name="txt_noofclass"id="noOFclaSSes" ><br>
                    
                    <input type="button" value="Generate Exam Duty" name="btn_generate"style="width: 200px;background: #66ff66;display: block" onclick="genExamDuty()" >

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
    function genExamDuty()
    {
        var NoClass=noOFclaSSes.value;
        var Bsel=batchExam.value;
        alert(Bsel);
       
        alert(NoClass);
         $.ajax({url:"ajaxExamDutyGen.jsp?NOOFCLASS="+NoClass+"&BatchId="+Bsel, 
         success: function(result){
         alert(result);
      $("#ExamDutyGenerationDiv").html(result);
    }});
       
    }
    function MyPrint()
    {
        var divtopr=document.getElementById("myTable");  
      newWin=window.open("");
      newWin.document.write(divtopr.outerHTML);
      
      newWin.print();
      newWin.close();
    }
</script>
</html>
