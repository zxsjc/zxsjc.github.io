<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
if request.form("l_name")="" then
%>
<%
e_id=Request.QueryString("eid")
l_name=request.form("l_name")
l_url=request.form("l_url")

set rs=server.createobject("adodb.recordset")
sql="select * from link where l_id="&e_id&""
rs.open sql,conn,1,1
l_name=rs("l_name")
l_url=rs("l_url")
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑链接 - 日记本管理系统</title>
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
            <h3>友情链接管理：</h3>
            <ul class="content-box-tabs">
              <li></li>
            </ul>
            <div class="clear"></div>
          </div>
          <div class="content-box-content">
<div class="tab-content" id="tab2">
  <form id="form1" name="form1" method="post" action="edit_link.asp">
  <input name="w_id" type="hidden" value="<%=e_id%>" />
    <p>网站名称：
      <input name="l_name" type="text" value="<%=l_name%>" size="30" />
    </p>
    <p>网站地址：
      <input name="l_url" type="text" value="<%=l_url%>" size="30"/>
      &nbsp; 请以http://开头</p>
    <label>
    </p>
    <br />
    <input name="submit" type="submit"  value="提交" />
    </label>
    </p>
  </form>
</div>
    </div>
  </div></td>
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
else
e_id=request.form("w_id")
l_name=request.form("l_name")
l_url=request.form("l_url")

if l_url="" then
response.write "<script>alert('笨蛋，网站地址没有填写！');location.href='link.asp'</script>"
else
set rs=server.createobject("adodb.recordset")
sql="select * from link where l_id="&e_id&""
rs.open sql,conn,1,3
rs("l_name")=""&l_name&""
rs("l_url")=""&l_url&""
rs("l_time")=now()
rs.update
rs.close
set rs=nothing
response.write "<script>alert('恭喜，友情链接修改成功！');location.href='link.asp'</script>"
end if
end if

%>
<!--#include file="../inc/close.asp"-->