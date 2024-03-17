<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
id=request.QueryString("id")
set rs=server.createobject("adodb.recordset")
sql="select * from about where id="&id&""
rs.open sql,conn,1,1
title=rs("title")
by=rs("by")
w_images=rs("w_images")
content=rs("content")
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>发表新单页 - 日记本管理系统</title>
<link rel="stylesheet" href="images/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/invalid.css" type="text/css" media="screen" />
<script charset="utf-8" src="../editor/kindeditor.js"></script>
<script charset="utf-8" src="../editor/lang/zh_CN.js"></script>
<script>
        var editor;
        KindEditor.ready(function(K) {
                editor = K.create('#editor_id');
        });
</script>
</head>

<body>
<!--#include file="top.asp"-->
<div id="main-content">
  <noscript>
  </noscript>
  <div class="content-box">
    <div class="content-box-header">
      <h3>发表内容:</h3>
      <ul class="content-box-tabs">
        <li></li>
      </ul>
      <div class="clear"></div>
    </div>
    <div class="content-box-content">
      <div class="tab-content" id="tab2">	  
	  <form id="form1" name="form1" method="post" action="about_editpost.asp">
	  <input name="id" type="hidden" value="<%=id%>" />
	  <p>标题：
        <input name="title" type="text"  value="<%=title%>"size="30" />
	  </p>
	  <p>作者：
        <input name="by" type="text" size="30" value="<%=by%>" />
	  </p>
	  <p>图片：
        <input name="w_images" type="text" class="text" id="w_images" value="<%=w_images%>" />
			               &nbsp;
			              <iframe style="top:2px" id="UploadFiles" src="Upload.asp" frameborder="0" scrolling="No" width="300" height="20" name="I1" marginwidth="1" marginheight="0"></iframe>
	  </p>
  <p>
    内容：
      <textarea id="editor_id" name="content" style="width:100%;height:400px;"><%=content%></textarea>
    </font>    </p>
  <label>
    </p>
    <br />    <br />
    <input type="submit"  value="提交" />
      </label>
  </p>
	</form></div>
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
<!--#include file="../inc/close.asp"-->