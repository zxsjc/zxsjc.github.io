<% @language=vbscript codepage=936%>
<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
d_id=request.QueryString("did")

set rs=server.createobject("adodb.recordset")
sql="select * from link where l_id="&d_id&""
rs.open sql,conn,1,3
rs.filter= "l_id ="&d_id&""
rs.delete
rs.update

rs.close
set rs=nothing
response.write "<script>alert('友情链接记录删除成功！');location.href='link.asp'</script>"

%>
<!--#include file="../inc/close.asp"-->