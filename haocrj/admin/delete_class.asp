<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
id=Request.QueryString("id")
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql = "select * from class where id=" & id
rs.Open sql,conn,1,3 '�˴�����1��3��3��дģʽ
If not rs.eof Then		
	rs.delete
	rs.update
End If


rs.Close
set rs=nothing
conn.close
set conn=nothing
response.write "<script>alert('��ϲ������Ŀ¼ɾ���ɹ���');location.href='class.asp'</script>"
%>