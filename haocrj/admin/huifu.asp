<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<% 
p_id=request.QueryString("id")
set rs=server.createobject("adodb.recordset")
sql="select * from pinglun Where p_id="&p_id&""
rs.open(sql),conn,1,1
p_id=rs("p_id")
p_idd=rs("p_idd")
p_pinglun=rs("p_pinglun")
p_name=rs("p_name")
p_mail=rs("p_mail")
p_url=rs("p_url")
p_huifu=rs("huifu")
p_time=rs("p_time")

rs.close
set rs=nothing
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站基本信息设置 - 日记本管理系统</title>
<link rel="stylesheet" href="images/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/invalid.css" type="text/css" media="screen" />
</head>

<body>
<!--#include file="top.asp"-->
<div id="main-content">
  <noscript>
  </noscript>
  <div class="content-box">
    <div class="content-box-header">
      <h3>回复评论:</h3>
      <ul class="content-box-tabs">
        <li></li>
      </ul>
      <div class="clear"></div>
    </div>
    <div class="content-box-content">
      <!-- End #tab1 -->
<div class="tab-content" id="tab2">
  <form id="form1" name="form1" method="post" action="">
   <input type="hidden" name="id" value="<%=p_id%>">
    <p>昵称：
      <input name="p_name" type="text" value="<%=p_name%>" size="30" />
    </p>
    <p>邮箱：
      <input name="p_mail" type="text" id="p_mail" value="<%=p_mail%>" size="30"/>
    </p>
    <p> 网址：
      <input name="p_url" type="text" size="60" value="<%=p_url%>" />
    </p>
    <p>内容：
      <textarea name="p_content" cols="60" rows="3" id="p_content"><%=p_pinglun%></textarea>
    </p>
    <p> 时间：
      <input name="p_time" type="text" size="60" value="<%=p_time%>"/>
    </p>
    <p> 回复：
      <textarea name="p_huifu" cols="60" rows="3" ><%=p_huifu%></textarea>
      <label><br />
        <br />
        <input name="submit" type="submit"  value="回复" />
      </label>
    </p>
  </form>
</div>
    </div>
  </div>
  </td>
  </tr>
  </table>
  <h2>&nbsp;</h2>
  <div class="clear"></div>
  <div class="clear"></div>
</div>
<p>&nbsp;</p>
</body>
</html>
<%
if request.form("id")<>"" then
p_id=request.form("id")
p_name=request.form("p_name")
p_mail=request.form("p_mail")
p_url=request.form("p_url")
p_time=request.form("p_time")
p_content=request.form("p_content")
p_huifu=request.form("p_huifu")

set rs=server.createobject("adodb.recordset")
sql="select * from pinglun where p_id="&p_id&""
rs.open sql,conn,1,3

rs("p_name")=""&p_name&""
rs("p_mail")=""&p_mail&""
rs("p_url")=""&p_url&""
rs("p_pinglun")=""&p_content&""
rs("p_time")=""&p_time&""
rs("huifu")=""&p_huifu&""
rs("huifutime")=now()
rs.update
rs.close
set rs=nothing

response.write "<script>alert('恭喜您，回复成功！');location.href='add_pinlun.asp'</script>"
end if
%>
<!--#include file="../inc/close.asp"-->