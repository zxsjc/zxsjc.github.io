<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
if request.form("title") =""then
response.write "<script>alert('标题不能为空！');location.href='about.asp'</script>"
else


title=request.form("title")
by=request.form("by")
w_images=request.form("w_images")
content=request.form("content")

set rs=server.createobject("adodb.recordset")
sql="select * from about"
rs.open sql,conn,1,3
rs.addnew
rs("title")=""&title&""
rs("by")=""&by&""
rs("w_images")=""&w_images&""
rs("content")=""&content&""
rs("a_time")=now()

rs.update
rs.close
set rs=nothing
response.write "<script>alert('恭喜，发表成功！');location.href='about_left.asp'</script>"
end if
%>
<!--#include file="../inc/close.asp"-->