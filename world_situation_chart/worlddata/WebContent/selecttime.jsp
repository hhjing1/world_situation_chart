<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>根据时间进行全球疫情查询</title>
  <style>
  #top{
   height:30px; 
   border: solid 1px blue;
  } 
  #but
  {
   height:760px; 
   border: solid 1px red;
  }
  </style>
</head>
<body>
 <div id="top" align="center">
  输入时间：<input type="date" id="data" name="data"/><button name="wen" onclick="chaxun()">查询</button>
  </div>
  <div id="but">
  <iframe name="but" src="" width="100%" height="100%" style="background-color: gray;"></iframe>
  </div>
  <script type="text/javascript">
  function chaxun()
  {   
	  var data=document.getElementById("data").value;
	  alert("date"+data);
	  window.open("tabledata?Date="+data,"but");
	 
  }
  
  </script>
</body>
</html>