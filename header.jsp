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
<title>How to create Calendar in JSP</title>
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
         <a href="Homepage.jsp"><label style="color: red">Back To Home</label>
      </a>
              </div>
      
</form>
</body></html>