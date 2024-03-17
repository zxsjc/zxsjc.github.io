<!DOCTYPE html>
<!--#include file="inc/conn2.asp"-->
<!--#include file="inc/Nohtml.asp"-->
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
		<title><%=web_name%> | <%=web_gonggao%></title>
<meta name="keywords" content="<%=web_keywords%>" />
<meta name="description" content="<%=web_description%>" />
		<link rel="stylesheet" href="Template/v1/bootstrap.min.css" type="text/css">
	    <link href="Template/v1/style.css" rel="stylesheet" type="text/css">
	</head>
		
	<body>
		<!--#include file="Template/header.asp"-->
		<div class="container wrap page-idx" id="page_idx">
	<div class="row">
		<div class="pull-left wrap-left">       
		    <div class="clearfix shadow-box mod-info-flow">    
	<% 
set rs=server.createobject("adodb.recordset")
sql="select * from riji order by w_id desc"
rs.open(sql),conn,1,1
If rs.bof And rs.eof Then
Response.Write("对不起，暂时还没有任何记录。")
else
rs.pagesize=10 '每页记录条数
p=Request.QueryString("p") '将URL参数p传给p变量
if p="" then p=1
rs.absolutepage=p '将本页设为p设置的页数

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
	<div class="clearfix mod-b mod-art">
    <a class="pull-left mod-thumb" href="Content.asp?id=<%=w_id%>" target="_blank">
    	<img src="<%=w_images%>">
    </a>
    <div class="mob-ctt">
        <h3>
            <a href="Content.asp?id=<%=w_id%>" class="title" target="_blank"><%=left(rs("w_title"),30)%></a>
        </h3>
        <div class="mob-author">
            <span class="author">
                <a class="author-name hx-card" userid="19" href="#" target="_blank"><%=w_by%></a>
            </span>
            <time class="time"><%=formatdatetime(w_time,1)%></time>
        </div>
        <div class="mob-sub"><%=RemoveHTML(w_riji,100)%></div>
        <div class="clearfix mob-other">
            <ul class="pull-left list-inline tag-box">
            </ul>
            <span class="pull-right action-box">  
                <a class="fvr js-fvr-btn" aid="107438" actype="unread" title="浏览数"><i class="i-icon icon-fvr"></i>(<em><%=w_top%></em>)</a>
            </span>
        </div>
    </div>
</div>  
     <%
rs.movenext
next
end if
%>                                                                                     <nav class="text-right page-wrap">
<div class="pagination">
<%if p=1 then%>
当前第<%=p%>页，共有<%=rs.pagecount%>页<%=rs.recordcount%>条记录
<span class="page now-page">首页</span>
<%else%>
<a href="?p=1"><span class="page">首页</span></a>
<%end if%>
<%if p=1 then%>
<span class="page now-page">上一页</span>
<%else%>
<a href="?p=<%=p-1%>"><span class="page">上一页</span></a>
<%end if%>
<%if rs.pagecount<p+1 then%>
<span class="page now-page">下一页</span>
<%else%>
<a href="?p=<%=p+1%>"><span class="page">下一页</span></a>
<%end if%>
<%if rs.pagecount<p+1 then%>
<span class="page now-page">尾页</span>
<%else%>
<a href="?p=<%=rs.pagecount%>"><span class="page">尾页</span></a>
<%end if%>
		        </nav>
		    </div>
		</div>
<!--#include file="Template/lefter.asp"-->		
<!--#include file="Template/footer.asp"-->	
</body>
</html>