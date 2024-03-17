<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
if request.QueryString("id") =""then
response.write "<script>alert('没有获取到数据或者入口非法！');location.href='about_left.asp'</script>"
else

dim sql,rs,id
id=request.QueryString("id")

set rs=server.createobject("adodb.recordset")
sql="select * from about where id="&id&""
rs.open sql,conn,1,3
rs.filter= "id ="&id&""
rs.delete
rs.update

rs.close
set rs=nothing
response.write "<script>alert('删除成功！');location.href='about_left.asp'</script>"
end if
%>
<!--#include file="../inc/close.asp"-->