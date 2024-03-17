<% @language=vbscript codepage=936%>
<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
if request.form("web_name") =""then
response.write "<script>alert('网站名称为能为空！');location.href='web_set.asp'</script>"
else

dim sql,rs,web_name,web_url,web_keywords,web_description,web_zhuren,web_banquan,web_dh,web_ad
web_name=request.form("web_name")
web_url=request.form("web_url")
web_keywords=request.form("web_keywords")
web_description=request.form("web_description")
web_zhuren=request.form("web_zhuren")
web_gonggao=request.form("web_gonggao")
web_banquan=request.form("web_banquan")
web_diqu=request.form("web_diqu")
web_mail=request.form("web_mail")
web_csrq=request.form("web_csrq")

set rs=server.createobject("adodb.recordset")
sql="select * from web where web_id=1 "
rs.open sql,conn,1,3
rs("web_name")=""&web_name&""
rs("web_url")=""&web_url&""
rs("web_keywords")=""&web_keywords&""
rs("web_description")=""&web_description&""
rs("web_zhuren")=""&web_zhuren&""
rs("web_gonggao")=""&web_gonggao&""
rs("web_banquan")=""&web_banquan&""
rs("web_diqu")=""&web_diqu&""
rs("web_mail")=""&web_mail&""
rs("web_csrq")=""&web_csrq&""
rs.update
rs.close
set rs=nothing
response.write "<script>alert('修改成功！');location.href='web_set.asp'</script>"
end if
%>
<!--#include file="../inc/close.asp"-->