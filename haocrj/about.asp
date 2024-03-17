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
<%
id=request.QueryString("id")
if id="" then
response.write "erro."
response.end
end if
set rs=server.createobject("adodb.recordset")
sql="select * from about where id="&id&""
rs.open sql,conn,1,1
If rs.bof And rs.eof Then
response.write "erro."
response.end
end if
title=rs("title")
id=rs("id")
by=rs("by")
content=rs("content")
a_time=rs("a_time")
rs.close
set rs=nothing
%>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title><%=left(title,50)%> | <%=web_name%></title>
<meta name="keywords" content="<%=web_keywords%>" />
<meta name="description" content="<%=web_description%>" />
		<link rel="stylesheet" href="Template/v1/bootstrap.min.css" type="text/css">
	    <link href="Template/v1/style.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
	<!--#include file="Template/header.asp"-->
	<div class="container wrap page-article" id="page_article">
	<div class="row">
		<div class="pull-left wrap-left">
			<div class="shadow-box article-wrap">
				<h1 class="t-h1"><%=left(title,50)%></h1>
				<div class="clearfix article-other">
					<span class="pull-left author"> 
					<a class="author-name hx-card" userid="307307"><%=by%></a>
					<a class="i-icon icon-auth2" title="<%=by%>"></a>
					</span>
					<time class="pull-left time"><%=formatdatetime(a_time,1)%></time>
					<span class="pull-right action-box"> 				   
<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"2","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
					</span>
				</div>

				<div class="art-ctt-iframe">
					<div id="article_content" class="article-content-wrap">
						<%=content%>			</div>
				</div>
		 
 
		  </div>
		</div>
<!--#include file="Template/lefter.asp"-->		
<!--#include file="Template/footer.asp"-->	
</body>
</html>