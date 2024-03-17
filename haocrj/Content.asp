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
a1_id=request.QueryString("id")
if a1_id="" then
response.write "erro."
response.end
end if
set rs4=server.createobject("adodb.recordset")
sql="select * from riji where w_id="&a1_id&""
rs4.open sql,conn,1,1
If rs4.bof And rs4.eof Then
response.write "erro."
response.end
end if
wz_title=rs4("w_title")
w_id=rs4("w_id")
w_by=rs4("w_by")
w_riji=rs4("w_riji")
ww_top=rs4("w_top")
ww_time=rs4("w_time")
rs4.close
set rs4=nothing

'计数
set rs=server.createobject("adodb.recordset")
sql="select w_top from riji where w_id="&a1_id&""
rs.open sql,conn,1,3
rs("w_top")=rs("w_top")+1
rs.update
rs.close
set rs=nothing
%>

	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title><%=left(wz_title,50)%> | <%=web_name%></title>
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
				<div class="title"><%=left(wz_title,50)%></div>
				<div class="clearfix article-other">
 
					<span class="pull-left author"> 
					<a class="author-name hx-card" userid="307307"><%=w_by%></a>
					<a class="i-icon icon-auth2" title="<%=w_by%>"></a>
					</span>
					<time class="pull-left time"><%=formatdatetime(ww_time,1)%></time>
<span>浏览次数：<%=(ww_top)%></span>
					<span class="pull-right action-box"> 				   
<ul id="content-share-list"  class="bdsharebuttonbox bdshare-button-style0-16">
		  <span><a class="content_qq" onclick="window.open('http://connect.qq.com/widget/shareqq/index.html?url='+encodeURIComponent(document.location.href));return false;" title="分享到QQ好友">QQ好友</a>
		  <a class="content_qqzone" onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+encodeURIComponent(document.location.href));return false;" title="分享到QQ空间">QQ空间</a></li>
		  <a class="content_weixin" data-cmd="weixin" title="分享到微信好友">微信好友</a></span>
		  
		</ul>
		<!-- 点击微信好友生成的二维码 -->
		<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
					</span>
				</div>

				<div class="art-ctt-iframe">
					<div id="article_content" class="article-content-wrap">
						<%=w_riji%>			</div>
						
						
<%
set rs3=server.createobject("adodb.recordset")
sql="select * from pinglun where p_idd="""&a1_id&""" order by p_time desc"
rs3.open(sql),conn,1,1
zs=rs3.recordcount
%>						
<% 
id=a1_id
set rs=server.createobject("adodb.recordset")
sql="select w_id,w_title from riji where w_id >"&id&" order by w_id"
rs.open(sql),conn,1,1

If rs.bof And rs.eof Then
w_title="没有了"
else
w_title_d=rs("w_title")
w_title_d1=left(rs("w_title"),20)
w_id=rs("w_id")
w_title="<a href='Content.asp?id="&w_id&"' title='上一篇："&w_title_d&"'>"&w_title_d1&"</a>"

end if
rs.close
set rs=nothing

set rs2=server.createobject("adodb.recordset")
sql="select w_id,w_title from riji where w_id <"&id&"  order by w_id desc"
rs2.open(sql),conn,1,1
If rs2.bof And rs2.eof Then
w_title_up="没有了"
else
w_id_up=rs2("w_id")
w_title_u=rs2("w_title")
w_title_u1=left(rs2("w_title"),20)

w_title_up="<a href='Content.asp?id="&w_id_up&"' title='下一篇："&w_title_u&"'>"&w_title_u1&"</a>"
end if
rs2.close
set rs2=nothing
%>	
<div>

← <%=w_title%></span>
<span style="float: right;"><%=w_title_up%> →</div>
						
				</div>
			</div>
 
<div class="comment">
<div class="pinlun">
评论列表 ( <%=zs%> )
<div class="xian"></div>
<% 
If rs3.bof And rs3.eof Then
response.write "<li>暂时还没有评论。</li>"
end if
do while not rs3.eof
i=i+1
p_name=rs3("p_name")
p_id=rs3("p_id")
p_pinglun=rs3("p_pinglun")
p_time=rs3("p_time")
p_url=rs3("p_url")
p_huifu=rs3("huifu")
p_huifutime=rs3("huifutime")
%>
<a id="Comment-<%=p_id%>"></a>
<ul>
<li>评论者：<%=p_name%><span>时间：<%=p_time%></span></li>
<li><%=p_pinglun%></li>
</ul>
<%if p_huifu<>"" then%>
<div class="pinlunhf">
<ul>
<li>回复者：管理员<span> 时间：<%=p_huifutime%></span></li>
<%=p_huifu%>
</ul>
</div>
<% end if %>
<div class="xian"></div>
<% rs3.movenext
loop
rs3.close
set rs3=nothing
%>
</div>
<div class="fa"> 
发表评论 ( <%=zs%> )
<div class="xian"></div>
  <form id="form1" name="form1" method="post" action="">
  <input type="hidden" name="id" value="<%=a1_id%>">
<li>昵称：<input name="name" type="text" value="<%=request.Cookies("p_name") %>"  /> <span>*</span></li>
<li>邮箱：<input name="mail" type="text" value="<%=request.Cookies("p_mail") %>" /> <span>*</span></li>
<li>网站：<input name="url" type="text" value="<%=request.Cookies("p_url") %>" /></li>
<li>
内容：<textarea name="content" ></textarea> <span>*</span>
</li>
<li><span><input type="submit" value="提交"/></span></li>
  
 </form>



</div>
                			</div>
		</div>
<!--#include file="Template/lefter.asp"-->		
<!--#include file="Template/footer.asp"-->	
</body>
</html>

<%
if request.form("id")<>"" then
pa_id=request.form("id")
p_name=request.form("name")
p_mail=RemoveHTML(""&p_name&"",50)
p_mail=request.form("mail")
p_mail=RemoveHTML(""&p_mail&"",50)
p_url=request.form("url")
p_url=RemoveHTML(""&p_url&"",50)
p_content=request.form("content")
p_content=RemoveHTML(""&p_content&"",1000)

if p_name="" then
response.write "<Script language=JavaScript>alert('亲爱的，您还没有告诉我你的名字哦？');history.back();</Script>"
response.end 
end if

if p_mail="" then
response.write "<Script language=JavaScript>alert('亲爱的，你还没有告诉我你的邮箱呢？');history.back();</Script>"
response.end 
end if

if p_url<>"" and instr(p_url,".")<=0 then
response.write "<Script language=JavaScript>alert('亲爱的，网站地址错误，可以为空，正确格式如：www.isea.so');history.back();</Script>"
response.end 
end if

if instr(p_mail,"@")<=0 or instr(p_mail,".")<=0 then
response.write "<Script language=JavaScript>alert('亲爱的，邮箱填写有错误，正确格式如：me@isea.so');history.back();</Script>"
response.end 
end if

if p_content="" then
response.write "<Script language=JavaScript>alert('亲爱的，你还没有告诉我你要说的话呢？');history.back();</Script>"
response.end 
end if

if instr(p_content,"http://")>0 or instr(u_mail,"www")>0 then
response.write "<Script language=JavaScript>alert('您的信息已触发反垃圾系统，请检查修正后重新提交！');history.back();</Script>"
response.end 
end if

function HasChinese(str)
HasChinese = false
dim ia
for ia=1 to Len(str)
if Asc(Mid(str,ia,1)) < 0 then
HasChinese = true
exit for
end if
next
end function

jc=HasChinese(p_content)
if jc = false then
response.write "<Script language=JavaScript>alert('亲爱的，您提交的信息已被反垃圾系统拦截，请修正后重新提交？');history.back();</Script>"
response.end 
end if

if p_url ="" then
p_url=""
elseif instr(p_url,"http://")>0 then
p_url=p_url
else
p_url=trim("http://"&p_url)
end if

set rs=server.createobject("adodb.recordset")
sql="select * from pinglun"
rs.open sql,conn,1,3
rs.addnew
rs("p_idd")=""&pa_id&""
rs("p_name")=""&p_name&""
rs("p_mail")=""&p_mail&""
rs("p_url")=""&p_url&""
rs("p_pinglun")=""&p_content&""
rs("p_time")=now()


rs.update
rs.close
set rs=nothing

Response.Cookies("p_name")=""&p_name&""
Response.Cookies("p_mail")=""&p_mail&""
Response.Cookies("p_url")=""&p_url&""
Response.Cookies("p_name").Expires=DateAdd("m",3,now())
Response.Cookies("p_mail").Expires=DateAdd("m",3,now())
Response.Cookies("p_url").Expires=DateAdd("m",3,now())

response.write "<script>alert('恭喜您，评论成功！');location.href='Content.asp?id="&pa_id&"'</script>"
end if
%>