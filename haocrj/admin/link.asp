<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
if request.form("l_name")="" then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>友情链接管理-日记本管理系统</title>
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
            <h3>友情链接管理：</h3>
            <ul class="content-box-tabs">
              <li></li>
              <li></li>
            </ul>
            <div class="clear"></div>
          </div>
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <p>
                <!-- This is the target div. id must match the href of this div's tab -->
				              </p>
              <form id="form1" name="form1" method="post" action="link.asp">
                <p>网站名称：
                  <input name="l_name" type="text" size="30" />
                </p>
                <p>网站地址：
                  <input name="l_url" type="text" size="30"/>
               &nbsp; 请以http://开头</p>
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
sql="select * from link order by l_id desc"
rs.open(sql),conn,1,1

If rs.bof And rs.eof Then
Response.Write("对不起，暂时还没有友情链接的记录。")
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
                    <th width="20%">网站名称</th>
                    <th width="25%">网站地址</th>
                    <th width="24%">添加时间</th>
                    <th width="16%">执行</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <td colspan="6"><div class="bulk-actions align-left"></div>
                        <div class="pagination"> </div>
                      <!-- End .pagination -->
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
				<form id="form" name="form" method="post" action="delete_all.asp"">
                  <%
for i= 1 to rs.pagesize
if rs.eof then
exit for
end if
l_id=rs("l_id")
l_name=rs("l_name")
l_url=rs("l_url")
l_time=rs("l_time")
%>
                  <tr> 


                    <td><input type="checkbox" name="id" value="<%=w_id%>" >                    </td>
                    <td><%=l_id%></td>
                    <td><%=left(l_name,30)%></td> 
                    <td><%=l_url%></td>
                    <td><%=l_time%></td>
                    <td><!-- Icons -->
                        <a href="edit_link.asp?eid=<%=l_id%>" title="Edit"><img src="images/images/icons/pencil.png" alt="Edit" border="0" /></a> <a href="delete_link.asp?did=<%=l_id%>" title="Delete">&nbsp;&nbsp; <img src="images/images/icons/cross.png" alt="Delete" border="0" /></a></td>
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

l_name=request.form("l_name")
l_url=request.form("l_url")
if l_url="" then
response.write "<script>alert('笨蛋，网站地址没有填写！');location.href='link.asp'</script>"
else
set rs=server.createobject("adodb.recordset")
sql="select * from link"
rs.open sql,conn,1,3
rs.addnew
rs("l_name")=""&l_name&""
rs("l_url")=""&l_url&""
rs("l_time")=now()

rs.update
rs.close
set rs=nothing
response.write "<script>alert('恭喜，友情链接添加成功！');location.href='link.asp'</script>"
end if
end if
%>
<!--#include file="../inc/close.asp"-->