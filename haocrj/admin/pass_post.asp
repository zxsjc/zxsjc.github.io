<% @language=vbscript codepage=936%>
<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%

u_user=request.form("u_user")
u_pass=request.form("u_pass")
u_mail=request.form("u_mail")
if u_user="" then
response.write "<script>alert('����Ա�ʺ�û����д');location.href='pass.asp'</script>"
elseif u_pass="" then
response.write "<script>alert('����Ա����û����д');location.href='pass.asp'</script>"
else
set rs=server.createobject("adodb.recordset")
sql="select * from i_user"
rs.open sql,conn,1,3

rs("u_user")=""&u_user&""
rs("u_pass")=""&u_pass&""
rs("u_mail")=""&u_mail&""

rs.update
rs.close
set rs=nothing
response.write "<script>alert('��ϲ������Ա��Ϣ���³ɹ������μ��������.');location.href='pass.asp'</script>"
end if
%>

<!--#include file="../inc/close.asp"-->
