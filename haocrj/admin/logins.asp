<% @language=vbscript codepage=936%>
<!-- #include file="../inc/conn.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
t_pass=request.Form("t_pass")
t_user=request.Form("t_user")
set rs=server.createobject("adodb.recordset")
sql="select * from i_user where u_user='"&t_user&"'"
rs.open sql,conn,1,1
if rs.eof or rs.bof then'����û���������
response.Write"<script language=javascript>alert('��������ȷ���û�����');history.go(-1);</script>"
Response.End()
else
if rs("u_pass")<>t_pass then'������벻��

response.write "<script language=JavaScript>alert('��������');history.back();</script>" 
else
session("username")=request.Form("t_user")
Response.Cookies("username")=request.Form("t_user")
response.Redirect("index.asp")
end if
end if%>

<!--#include file="../inc/close.asp"-->


