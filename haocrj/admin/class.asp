<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
if request.form("classname")="" then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>分类目录管理-日记本管理系统</title>
<link rel="stylesheet" href="images/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="images/css/invalid.css" type="text/css" media="screen" />
</head>
<SCRIPT LANGUAGE="JavaScript">

<!-- Begin
var checkflag = "false";
function check(field) {
if (checkflag == "false") {
for (i = 0; i < field.length; i++) {
field[i].checked = true;}
checkflag = "true";
return "false"; }
else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
return "true"; }
}
//  End -->
</script>

<body>
<!--#include file="top.asp"-->
<div id="main-content">
  <noscript>
  </noscript>
  <div class="content-box">
          <div class="content-box-header">
            <h3>分类目录管理：</h3>
            <ul class="content-box-tabs">
              <li></li>
              <li></li>
            </ul>
            <div class="clear"></div>
          </div>
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <p>
				              </p>
              <form id="form1" name="form1" method="post" action="class.asp">
                <p>分类名称：
                  <input name="classname" type="text" size="30"/>
                </p>
                <label>
                </p>
                <br />
                <input name="submit" type="submit"  value="提交" />
                </label>
                </p>
              </form>
              <p>&nbsp;</p>
                <% 
set rs=server.createobject("adodb.recordset")
sql="select * from class order by id desc"
rs.open(sql),conn,1,1

If rs.bof And rs.eof Then
Response.Write("对不起，暂时还没有分类目录的记录。")
else
 rs.pagesize=10 '每页记录条数
curpage=Request.QueryString("curpage") '将URL参数curpage传给curpage变量
if curpage="" then curpage=1
rs.absolutepage=curpage '将本页设为curpage设置的页数

%>

              <table width="100%">
                <thead>
                  <tr>

                    <td width="9%"><strong>选择
                    </th>
                    </strong>
                    <th width="6%">ID</th>
                    <th width="20%">分类名称</th>
                    <th width="25%">分类地址</th>
                    <th width="24%">添加时间</th>
                    <th width="16%">执行</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <td colspan="6"><div class="bulk-actions align-left"></div>
                        <div class="pagination"> </div>
                        <div class="clear">
                          当前第<%=curpage%>页，共有<%=rs.pagecount%>页，共有：<%=rs.recordcount%>条记录
                          <%if curpage=1 then%>
                          首页
                          <%else%>
                          <a href="?curpage=1">首页</a>
                          <%end if%>
                          <%if curpage=1 then%>
                          上一页
                          <%else%>
                          <a href="?curpage=<%=curpage-1%>">上一页</a>
                          <%end if%>
                          <%if rs.pagecount<curpage+1 then%>
                          下一页
                          <%else%>
                          <a href="?curpage=<%=curpage+1%>">下一页</a>
                          <%end if%>
                          <%if rs.pagecount<curpage+1 then%>
                          尾页
                          <%else%>
                          <a href="?curpage=<%=rs.pagecount%>">尾页</a>
                          <%end if%>
                      </div></td>
                  </tr>
                </tfoot>
                <tbody>
				<form id="form" name="form" method="post" action="delete_class.asp"">
                  <%
for i= 1 to rs.pagesize
if rs.eof then
exit for
end if
id=rs("id")
classname=rs("classname")
%>
                  <tr> 


                    <td><input type="checkbox" name="id" value="<%=id%>" >                    </td>
                    <td><%=id%></td>
                    <td><%=left(classname,30)%></td> 
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <a href="edit_class.asp?id=<%=id%>" title="Edit"><img src="images/images/icons/pencil.png" alt="Edit" border="0" /></a> <a href="delete_class.asp?id=<%=id%>" title="Delete">&nbsp;&nbsp; <img src="images/images/icons/cross.png" alt="Delete" border="0" /></a></td>
                  </tr>
                  <%
rs.movenext
next
%>

                </tbody>
              </table>

                  <%
rs.close
set rs=nothing
end if
%>
            </div>
            <div class="tab-content" id="tab2"></div>
          </div>
  </div></td>
    </tr>
  </table>
  <h2>&nbsp;</h2>
  <div class="clear"></div>
  <!-- End .clear -->
  <div class="clear"></div>
</div>
<p>&nbsp;</p>
</body>
</html>
<%
else
classname=request.form("classname")
if classname="" then
response.write "<script>alert('笨蛋，分类目录没有填写！');location.href='class.asp'</script>"
else
set rs=server.createobject("adodb.recordset")
sql="select * from class"
rs.open sql,conn,1,3
rs.addnew
rs("classname")=""&classname&""

rs.update
rs.close
set rs=nothing
response.write "<script>alert('恭喜，分类目录添加成功！');location.href='class.asp'</script>"
end if
end if
%>
<!--#include file="../inc/close.asp"-->