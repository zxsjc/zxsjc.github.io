<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
id=Request.QueryString("id")
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql = "select * from class where id=" & id
rs.Open sql,conn,1,3 '此处不是1是3，3是写模式
If not rs.eof Then		
	rs.delete
	rs.update
End If


rs.Close
set rs=nothing
conn.close
set conn=nothing
response.write "<script>alert('恭喜，分类目录删除成功！');location.href='class.asp'</script>"
%>