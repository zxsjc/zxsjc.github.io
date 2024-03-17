<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
e_id=request.QueryString("eid")
set rs=server.createobject("adodb.recordset")
sql="select * from riji where w_id="&e_id&""
rs.open sql,conn,1,1
w_title=rs("w_title")
w_riji=rs("w_riji")
w_by=rs("w_by")
w_src=rs("w_src")
w_images=rs("w_images")
classname=rs("classname")
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑日记 - 日记本管理系统</title>
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
      <h3>编辑日记:</h3>
      <ul class="content-box-tabs">
        <li></li>
      </ul>
      <div class="clear"></div>
    </div>
    <div class="content-box-content">
      <div class="tab-content" id="tab2">	  
	  <form id="form1" name="form1" method="post" action="edit_post.asp">
	   <input name="w_id" type="hidden" value="<%=e_id%>" />
	  <p>标题：
        <input name="w_title" type="text" value="<%=w_title%>" size="30" />
	  </p>
	  <p>作者：
        <input name="w_by" type="text" value="<%=w_by%>" size="30" />
	  </p>
	  <p>来源：
        <input name="w_src" type="text" value="<%=w_src%>" size="30" />
	  </p>
	  <p>分类：  
 <%set rs=conn.execute("select * from class")%>
          <select name="ClassName" id="ClassName" onChange="dlchange(document.postart.ClassName.options[document.postart.ClassName.selectedIndex].value)">
            <option value="" selected>选择类别</option>
<%set rs=conn.execute("select * from class")
if rs.eof or rs.bof then
	response.write "<option value=''>没有分类</option>"
else
	do until rs.eof
%>
<option value="<%=rs("ClassName")%>" <%if rs("ClassName")=ClassName then%>selected<%end if%>><%=rs("ClassName")%></option> 
<%  rs.movenext
    loop
end if
rs.close
set rs = nothing
%>
 </select>
  <%set rs=conn.execute("select * from class")%>
           <select name="Classid" id="ClassName" onChange="dlchange(document.postart.ClassName.options[document.postart.ClassName.selectedIndex].value)">
            <option value="" selected>选择ID</option>
 <%set rs=conn.execute("select * from class")
if rs.eof or rs.bof then
	response.write "<option value=''>没有分类</option>"
else
	do until rs.eof
%>
<option value="<%=rs("id")%>" <%if rs("ClassName")=ClassName then%>selected<%end if%>><%=rs("ClassName")%></option> 
<%  rs.movenext
    loop
end if
rs.close
set rs = nothing
%></select></p>
	  <p>上传：
        <input name="w_images" type="text" class="text" id="w_images"  value="<%=w_images%>"/>
			               &nbsp;
			              <iframe style="top:2px" id="UploadFiles" src="Upload.asp" frameborder="0" scrolling="No" width="300" height="20" name="I1" marginwidth="1" marginheight="0"></iframe>
	  </p>
  <p>
    内容：
      <textarea id="editor_id" name="w_riji" style="width:100%;height:400px;"><%=w_riji%></textarea>
    
    </font>    </p>
  <label>
    </p>
    <br />    <br />
    <input type="submit"  value="OK,提交!" />
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
</body>
</html>
<!--#include file="../inc/close.asp"-->