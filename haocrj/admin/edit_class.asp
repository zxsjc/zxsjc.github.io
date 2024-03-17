<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
if request.form("classname")="" then
%>
<%
id=Request.QueryString("id")
classname=request.form("classname")

set rs=server.createobject("adodb.recordset")
sql="select * from class where id="&id&""
rs.open sql,conn,1,1
id=rs("id")
classname=rs("classname")
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑分类 - 日记本管理系统</title>
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
            <h3>目录分类管理：</h3>
            <ul class="content-box-tabs">
              <li></li>
            </ul>
            <div class="clear"></div>
          </div>
          <div class="content-box-content">
<div class="tab-content" id="tab2">
  <form id="form1" name="form1" method="post" action="edit_class.asp">
  <input name="id" type="hidden" value="<%=id%>" />
    <p>分 类 ID：
      <%=id%>
    </p>
    <p>分类名称：
      <input name="classname" type="text" value="<%=classname%>" size="30" />
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
classname=request.form("classname")
id=request.form("id")
if classname="" then
response.write "<script>alert('笨蛋，分类目录没有填写！');location.href='class.asp'</script>"
else
set rs=server.createobject("adodb.recordset")
sql="select * from class where id="&id&""
rs.open sql,conn,1,3
rs("classname")=""&classname&""
rs.update
rs.close
set rs=nothing
response.write "<script>alert('恭喜，分类目录修改成功！');location.href='class.asp'</script>"
end if
end if

%>
<!--#include file="../inc/close.asp"-->