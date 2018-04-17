<%@page import="java.sql.ResultSet"%>
<%@ page  language="java" import="java.util.*,java.text.*"%>
<%@page import="java.util.Random"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>

<%!
public int nullIntconv(String inv)
{   
    int conv=0;
        
    try{
        conv=Integer.parseInt(inv);
    }
    catch(Exception e)
    {}
    return conv;
}
%>
<%
 int iYear=nullIntconv(request.getParameter("iYear"));
 int iMonth=nullIntconv(request.getParameter("iMonth"));

 Calendar ca = new GregorianCalendar();
 int iTDay=ca.get(Calendar.DATE);
 int iTYear=ca.get(Calendar.YEAR);
 int iTMonth=ca.get(Calendar.MONTH);

 if(iYear==0)
 {
      iYear=iTYear;
      iMonth=iTMonth;
 }

 GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1); 

 int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
 int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
 
 cal = new GregorianCalendar (iYear, iMonth, days); 
 int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
  
%>

 <%
        if(request.getParameter("btn_print")!=null)
        {
            response.sendRedirect("PrintTimeTable.jsp");
        }
        %>
<html>
    <style>
body
{
 font-family:cursive;
}
.dsb
{
 background-color:#EEEEEE
}
ul {
  margin: 0;
  padding: 0;
  list-style: none;
  widows: 100%;
}
ul li {
  cursor: pointer;
  position: relative;
  padding: 12px 8px 12px 40px;
  background: #eee;
  font-size: 18px;
  transition: 0.2s;
  
 
}

/* Set all odd list items to a different color (zebra-stripes) */
ul li:nth-child(odd) {
  background: #f9f9f9;
}

/* Darker background-color on hover */
ul li:hover {
  background: #ddd;
}

/* When clicked on, add a background color and strike out text */
ul li.checked {
  background: #888;
  color: #fff;
  text-decoration: line-through;
}

/* Add a "checked" mark when clicked on */

/* Style the close button */


/* Style the header */
.header {
  background-color: #f44336;
  padding: 30px 40px;
  color: white;
  text-align: center;

}
/* Clear floats after the header */
.header:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the input */
input {
  border: none;
  width: 75%;
  padding: 10px;
  float: left;
  font-size: 16px;
}

/* Style the "Add" button */
.addBtn {
  padding: 10px;
  width: 25%;
  background: #d9d9d9;
  color: #555;
  float: left;
  text-align: center;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s;
}

.addBtn:hover {
  background-color: #bbb;
}
.hiddenmodal
{
 width: 100%;
  display: none;
}

 #myTable {
  border-collapse: collapse;
  width: 100%;
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

#myTable tr.header, #myTable td:hover {
    background-color: #e0e0e0;
    color: #000;
}

</style>
</head>
<title>Time Table Entry</title>
<script>
function goTo()
{
  document.frm.submit()
}
</script>
<style>
body
{
 font-family:Verdana, Arial, Helvetica, sans-serif
}
.dsb
{
 background-color:#EEEEEE
}
</style>
</head>

<body>
<form name="frm" method="post" >
     <div style="width: 100%;height: 120px; background-color: #363636;margin-bottom: 10px;border: solid #363636;border-radius: 10px;">
              <div class="MalyaliMarriage_logo" style="float:left;"> 
					

                  <img src="logo/download (12).jpg" alt="Ilahia Exam Cell Automation" title="Ilahia Exam Cell Automation" width="120" height="100" >

				    </div> 
            <div    style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Ilahia Exam Cell Automation
         
            </div>
              </div>

    
     
    <div id="divcalender">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="25%">&nbsp;</td>
    <td width="45%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        </tr>
  <tr>
    <td>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="6%">Year</td>
        <td width="7%">
        <select name="iYear" onChange="goTo()" id='yearOfCalender'>
        <%
  int curretyear=0; 
 int currentmonth=0;
        // start year and end year in combo box to change year in calendar
        for(int iy=iTYear-70;iy<=iTYear+70;iy++)
        {
          if(iy==iYear)
          {
              curretyear=iy;
            %>
          <option value="<%=iy%>" selected="selected"><%=iy%></option>
          <%
          }
          else
          {
            %>
          <option value="<%=iy%>"><%=iy%></option>
          <%
          }
        }
       %>
        </select></td>
        <td width="73%" align="center" style="color:#4E96DE"><h3><%=new SimpleDateFormat("MMMM").format(new Date(2008,iMonth,01))%> <%=iYear%></h3></td>
        <td width="6%">Month</td>
        <td width="8%">
            <select name="iMonth" onChange="goTo()" id="MonthOfCalender">
        <%
        // print month in combo box to change month in calendar
        for(int im=0;im<=11;im++)
        {
          if(im==iMonth)
          {
              currentmonth=im;
         %>
          <option value="<%=im%>" selected="selected"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
          <%
          }
          else
          {
            %>
          <option value="<%=im%>"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
          <%
          }
        }
       %>
        </select></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table align="center" border="1" cellpadding="3" cellspacing="0" width="100%" id="myTable">
      <tbody>
        <tr>
          <th>Sun</th>
          <th>Mon</th>
          <th>Tue</th>
          <th>Wed</th>
          <th>Thu</th>
          <th>Fri</th>
          <th>Sat</th>
        </tr>
        <%
        int cnt =1;
        for(int i=1;i<=iTotalweeks;i++)
        {
        %>
        <tr>
          <% 
            for(int j=1;j<=7;j++)
            {
                if(cnt<weekStartDay || (cnt-weekStartDay+1)>days)
                {
                 %>
                <td align="center" height="35" class="dsb">&nbsp;</td>
              
                <% 
                }
                else
                {
                     int day=cnt-weekStartDay+1;
                 %>
                 <td align="center" height="35" id="day_<%=(cnt-weekStartDay+1)%>" onclick="showAlert(<%=(cnt-weekStartDay+1)%>)"><span style="color: #4E96DE;font:14px;"><%=(cnt-weekStartDay+1)%></span><br>
                      <%    ResultSet rsa=obj.selectData("select * from tbl_examtimetable td,tbl_exam ex,tbl_batch bb,tbl_semester ss,tbl_subject s  where td.ExamId=ex.id and bb.id=ex.BatchId and ss.id=ex.semId and s.id=td.languageid and td.dd='"+day+"'and td.mm='"+currentmonth+"' and td.yy='"+curretyear+"'");
                                 while(rsa.next())
                                 {
                                     %>
                     <div style="border: 1px solid #555;border-radius: 10px; padding: 5px;"> 
                         <label style="color: #f44336; margin-top: 5px;" >
                             <span><%=rsa.getString("subjectname")%>:<%=rsa.getString("sem")%></span><br>
                     <%=rsa.getString("timing")%>
                         </label></div><br>
                     <%
                                 }
                                 %>
                   
               <% 
                }
                cnt++;
              }
            %>
                 </td>
        </tr>
        <% 
        }
        %>
      </tbody>
    </table></td>
  </tr>
</table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
          
      <div class="Happywedding_registerform_details" style="margin-top: 0px;margin-left: 350px;display: none;" id="hiddenDiv">
         <table >
                       
             
               <tr><td><div class="bengali_innerregisterform_new" id="lname"><label name="lname">Exam Name:</label></div>
                             
                             
                             </td><td>
                                 
                                 <div class="bengali_innerregisterform_new">
                                     <select class="regtxtbox" onchange="AjaxSem(this.value)" id="examSel" >
                                         
                                         <option>--Select--</option>
                                         <%
   
 ResultSet rs= obj.selectData("select * from tbl_exam ");
 while(rs.next())
 {
     %>
     <option value="<%=rs.getString("id")%>"><%=rs.getString("ExamName")%></option>
     <%
 }
 %>
        
       
                                     </select>
                                 </div>
                                 
                             </td>
                         </tr>
             
                         <tr><td><div class="bengali_innerregisterform_new" id="lname"><label name="lname">Subject:</label></div>
                             
                             
                             </td><td>
                                 
                                 <div class="bengali_innerregisterform_new">
                                     <select class="regtxtbox" id="language">
                                        
                                       
        
       
                                     </select>
                                 </div>
                                 
                             </td>
                         </tr>
                       
                         <tr>
                             <td>
                                 <div class="bengali_innerregisterform_new">Timing:</div> </td><td><div class="bengali_innerregisterform_new"><input type="text" name="txt_KTU_ID" class="regtxtbox"  id="timing"></div></td>
                         </tr>
                         <tr><td><div class="bengali_innerregisterform_new"></div></td><td> <div class="bengali_innerregisterform_new"><button class="button"  onclick="addTime()"><span>Add </span></button></div><br clear="all"></td>
                         </tr>
                         
                         <!--religion -->
                        
                         <!--cast/division-->
                        
         </table>
        </div>
                                     <input type="submit" value="Print Time Table" name="btn_print"style="width: 200px;background: #66ff66;margin-left: 400px;">
    </div>
                                 
</form>
       
</body>
<script src="MyJavaScript/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var day="";
    var year="";
    var month="";
    
    function showAlert(d)
    {
       day=d;
       alert(day);
        year=document.getElementById("yearOfCalender").value;
         alert(year);
         month=(document.getElementById("MonthOfCalender").value);
        
         alert(month);
       
         hiddenDiv.style.display="block";
    }
    function addTime()
    {
       var l=language.value;
       alert(l);
       var t=timing.value;
       alert(t);
        var ExamId=examSel.value;
        alert(ExamId);
        
        $.ajax({url:"ajaxDate.jsp?d="+day+"&m="+month+"&y="+year+"&l="+l+"&t="+t+"&b="+ExamId, 
         success: function(result){
         alert(result);
      $("#"+day).html(result);
    }});
    }
     function visibleTime(d)
     {
       divcalender.style.display="block" ;
       alert(d);
      
     }
    function semdiv()
    {
        semdivition.style.display="block";
    }
    function AjaxSem(d)
    {
        alert(d);
         $.ajax({url:"ajaxSem.jsp?d="+d, 
         success: function(result){
         alert(result);
      $("#language").html(result);
    }});
    }
</script>
</html>