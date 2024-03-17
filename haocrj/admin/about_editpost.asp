<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<%
if request.form("title") =""then
response.write "<script>alert('标题不能为空！');location.href='about.asp'</script>"
else

id=request.form("id")
title=request.form("title")
content=request.form("content")
by=request.form("by")
w_images=request.form("w_images")

set rs=server.createobject("adodb.recordset")
sql="select * from about where id="&id&""
rs.open sql,conn,1,3

rs("title")=""&title&""
rs("content")=""&content&""
rs("by")=""&by&""
rs("w_images")=""&w_images&""
rs("a_time")=now()

rs.update
rs.close
set rs=nothing
response.write "<script>alert('恭喜，修改成功！');location.href='about_left.asp'</script>"
end if
%>
<!--#include file="../inc/close.asp"-->