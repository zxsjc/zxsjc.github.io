<% @language=vbscript codepage=936%>
<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
t1=request.form("t1")
if t1<>"" then
t2=request.form("t2")
Dim rs,sql,text 
Set rs=Server.CreateObject("ADODB.Recordset") 
sql="Select w_title,w_riji From riji" 
rs.Open sql,conn,1,3 
Do While Not rs.Eof 
w_title=rs("w_title")
w_riji=rs("w_riji")

text1=Replace(w_title,""&t1&"",""&t2&"")
rs("w_title")=""&text1&""

text2=Replace(w_riji,""&t1&"",""&t2&"")
rs("w_riji")=""&text2&""

rs.Update 
rs.MoveNext 
Loop 
rs.Close 
Set rs=Nothing 
response.write "<script>alert('恭喜，替换完成！');location.href='tihuan.asp'</script>"
response.end 
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>数据库内容替换</title>
</head>

<body>
<div style=" font-size:12px; width:300px; height:150px; margin-left:auto; margin-right:auto; margin-top:5%; background:#f6f6f6">
<div style=" padding:30px;">
<form id="form1" name="form1" method="post" action="">
  <p>替换前：
    <input type="text" name="t1" id="t1" />
    </p>
  <p>替换后：
    <input type="text" name="t2" id="t2" />
  </p>
  <p>
    <input type="submit" name="button" id="button" value="提交" />
  </p>
</form>
</div></div>
</body>
</html>