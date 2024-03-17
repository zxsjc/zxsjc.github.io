<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from i_user"
rs.open sql,conn,1,1
u_user=rs("u_user")
u_mail=rs("u_mail")
u_pass=rs("u_pass")
rs.close
set rs=nothing
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<title>管理员设置 - 日记本管理系统</title>
<link rel="stylesheet" href="images/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/invalid.css" type="text/css" media="screen" />
</head>

<body>
<!--#include file="top.asp"-->
<div id="main-content">
  <div class="content-box">
    <div class="content-box-header">
      <h3>管理员信息设置：</h3>
      <ul class="content-box-tabs">
        <li></li>
      </ul>
      <div class="clear"></div>
    </div>
    <div class="content-box-content">
      <div class="tab-content" id="tab2">
        <form id="form1" name="form1" method="post" action="pass_post.asp">
		
         
          <p>管 理 员：
            <input name="u_user" type="text" value="<%=u_user%>" size="30" />
          </p>

          <p>新 密 码：
            <input name="u_pass" type="password" value="<%=u_pass%>" size="30"/>
&nbsp;</p>
          <p>管理邮箱：
            <input name="u_mail" type="text"  value="<%=u_mail%>" size="30"/>
&nbsp;</p>
          <label>
          </p>
          <br />
          <input name="submit" type="submit"  value="提交" />
          </label>
          </p>
        </form>
      </div>
    </div>
  </div>
  </h2>
  <div class="clear"></div>
</div>
</body>
</html>
<!--#include file="../inc/close.asp"-->