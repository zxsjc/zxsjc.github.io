<% @language=vbscript codepage=936%>
<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->




<%
editid = request("id")
if editid=""then
response.write "<script>alert('��δѡ���κ����ݣ�');location.href='add_left.asp'</script>"
else
set rs=server.createobject("adodb.recordset")
sql="delete from riji  where w_id in ("& editid &")"
rs.open sql,conn,1,3

response.write "<script>alert('��ϲ���ѳɹ�ɾ��ѡ�������ݣ�');location.href='add_left.asp'</script>"
end if
%>




<!--#include file="../inc/close.asp"-->