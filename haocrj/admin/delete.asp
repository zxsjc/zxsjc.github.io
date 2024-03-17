<% @language=vbscript codepage=936%>
<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
if request.QueryString("did") =""then
response.write "<script>alert('没有获取到数据或者入口非法！');location.href='weibo_add.asp'</script>"
else

dim sql,rs,d_id
d_id=request.QueryString("did")

set rs=server.createobject("adodb.recordset")
sql="select * from riji where w_id="&d_id&""
rs.open sql,conn,1,3
rs.filter= "w_id ="&d_id&""
rs.delete
rs.update

rs.close
set rs=nothing
response.write "<script>alert('删除成功！');location.href='add_left.asp'</script>"
end if
%>
<!--#include file="../inc/close.asp"-->