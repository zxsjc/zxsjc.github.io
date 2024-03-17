<% @language=vbscript codepage=936%>
<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<%
if request.form("w_title") =""then
response.write "<script>alert('标题不能为空！');location.href='add.asp'</script>"
else

w_id=request.form("w_id")
w_title=request.form("w_title")
w_riji=request.form("w_riji")
w_src=request.form("w_src")
w_by=request.form("w_by")
w_images=request.form("w_images")
classid=request.form("classid")
classname=request.form("classname")

set rs=server.createobject("adodb.recordset")
sql="select * from riji where w_id="&w_id&""
rs.open sql,conn,1,3

rs("w_title")=""&w_title&""
rs("w_riji")=""&w_riji&""
rs("w_by")=""&w_by&""
rs("w_src")=""&w_src&""
rs("w_images")=""&w_images&""
rs("classname")=""&classname&""
rs("classid")=""&classid&""
rs("w_time")=now()

rs.update
rs.close
set rs=nothing
response.write "<script>alert('恭喜，修改成功！');location.href='add_left.asp'</script>"
end if
%>
<!--#include file="../inc/close.asp"-->