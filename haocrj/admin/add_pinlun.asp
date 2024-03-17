<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<% 
set rs=server.createobject("adodb.recordset")
sql="select * from pinglun order by p_id desc"
rs.open(sql),conn,1,1

rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>评论列表 - 日记本管理系统</title>
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
            <h3>评论列表：</h3>
            <ul class="content-box-tabs">
              <li><a href="#tab1" class="default-tab">Table</a></li>
              <li><a href="#tab2">Forms</a></li>
            </ul>
            <div class="clear"></div>
          </div>
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <% 
set rs=server.createobject("adodb.recordset")
sql="select * from pinglun order by p_id desc"
rs.open(sql),conn,1,1
If rs.bof And rs.eof Then
Response.Write("对不起，暂时还没有任何评论记录。")
else
 rs.pagesize=10 '每页记录条数
curpage=Request.QueryString("curpage") '将URL参数curpage传给curpage变量
if curpage="" then curpage=1
rs.absolutepage=curpage '将本页设为curpage设置的页数
%>      <table width="100%">
                <thead>
                  <tr>

                    <td width="9%"><strong>选择
                    </th>
                    </strong>
                    <th width="6%">ID</th>
                    <th width="6%">姓名</th>
                    <th width="43%">内容</th>
                    <th width="20%">时间</th>
                    <th width="20%">操作</th>

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
				<form id="form" name="form" method="post" action="delete_pinglun.asp"">
                  <%
for i= 1 to rs.pagesize
if rs.eof then
exit for
end if
p_id=rs("p_id")
p_idd=rs("p_idd")
p_pinglun=rs("p_pinglun")
p_name=rs("p_name")
p_time=rs("p_time")
huifu=rs("huifu")
if huifu<>"" then
huifu="已回复"
else
huifu="<font color='#FF0000'>未回复</font>"
end if
%>
<tr> 
 <td><input type="checkbox" name="id" value="<%=p_id%>" >                    </td>
                    <td><%=p_id%></td>
                    <td><%=left(p_name,30)%></td>
                    <td><a href="../Content.asp?id=<%=p_idd%>#Comment" target="_blank" ><%=left(p_pinglun,30)%></a></td>
                    <td><%=p_time%></td>
                    <td>
                        <a href="huifu.asp?id=<%=p_id%>" title="Edit">回复</a> - <%=huifu%></td>
                  </tr>
                  <%
rs.movenext
next
%>
                  <%
rs.close
set rs=nothing

%>
                </tbody>
              </table>
			  <input type=checkbox value="全选" onClick="this.value=check(this.form.id)"> 
			  全选/全不选 
			  <input type="submit"  value="删除所选" /></form>
<%end if%>
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
<!--#include file="../inc/close.asp"-->