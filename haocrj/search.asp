<!DOCTYPE html>
<!--#include file="inc/conn2.asp"-->
<!--#include file="inc/Nohtml.asp"-->
<%
keyword=Request("keyword")
%>
<% 
set rs=server.createobject("adodb.recordset")
sql="select * from web"
rs.open(sql),conn,1,1
web_name=rs("web_name")
web_keywords=rs("web_keywords")
web_description=rs("web_description")
web_zhuren=rs("web_zhuren")
web_banquan=rs("web_banquan")
web_gonggao=rs("web_gonggao")
web_url=rs("web_url")
web_diqu=rs("web_diqu")
web_csrq=rs("web_csrq")
web_mail=rs("web_mail")
rs.close
set rs=nothing
%>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>���� | <%=web_name%></title>
<meta name="keywords" content="<%=web_keywords%>" />
<meta name="description" content="<%=web_description%>" />
		<link rel="stylesheet" href="Template/v1/bootstrap.min.css" type="text/css">
	    <link href="Template/v1/style.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
<!--#include file="Template/header.asp"-->
<div class="container wrap page-search" id="page_list">
	<div class="row">
		<div class="iframe-wrap">
		     <div class="shadow-box search-alert">���������</div>
		     <div class="shadow-box search-wrap-list">
		         <ul class="search-wrap-list-ul">
<% 
set rs=server.createobject("adodb.recordset")
sql="select * from riji where w_title like '%"&keyword&"%' order by Classid"
rs.open(sql),conn,1,1
If rs.bof And rs.eof Then
Response.Write("�Բ�����ʱ��û���κμ�¼��")
else
rs.pagesize=10 'ÿҳ��¼����
p=Request.QueryString("p") '��URL����p����p����
if p="" then p=1
rs.absolutepage=p '����ҳ��Ϊp���õ�ҳ��

for i= 1 to rs.pagesize
if rs.eof then
exit for
end if

w_id=rs("w_id")
w_title=rs("w_title")
w_riji=rs("w_riji")
w_time=rs("w_time")
w_by=rs("w_by")
w_images=rs("w_images")
w_top=rs("w_top")
%>
		             <li><div class="title"><a href="content.asp?id=<%=w_id%>"><%=left(rs("w_title"),30)%></a></div><div class="mob-author"><span class="author"><a class="author-name" >muyuren</a></span><time class="time"><%=formatdatetime(w_time,1)%>&nbsp;<%=formatdatetime(w_time,1)%></time></div><div class="mob-sub mob-sub-zdy"><b>ժҪ��</b><%=RemoveHTML(w_riji,15)%></div>   
					     <%
rs.movenext
next
end if
%>
					  </ul>
		     </div>
		</div>
	</div>
</div>
	<!--#include file="Template/footer.asp"-->
</body>
</html>