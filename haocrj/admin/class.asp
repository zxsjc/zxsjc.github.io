<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<%
if request.form("classname")="" then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����Ŀ¼����-�ռǱ�����ϵͳ</title>
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
            <h3>����Ŀ¼����</h3>
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
                <p>�������ƣ�
                  <input name="classname" type="text" size="30"/>
                </p>
                <label>
                </p>
                <br />
                <input name="submit" type="submit"  value="�ύ" />
                </label>
                </p>
              </form>
              <p>&nbsp;</p>
                <% 
set rs=server.createobject("adodb.recordset")
sql="select * from class order by id desc"
rs.open(sql),conn,1,1

If rs.bof And rs.eof Then
Response.Write("�Բ�����ʱ��û�з���Ŀ¼�ļ�¼��")
else
 rs.pagesize=10 'ÿҳ��¼����
curpage=Request.QueryString("curpage") '��URL����curpage����curpage����
if curpage="" then curpage=1
rs.absolutepage=curpage '����ҳ��Ϊcurpage���õ�ҳ��

%>

              <table width="100%">
                <thead>
                  <tr>

                    <td width="9%"><strong>ѡ��
                    </th>
                    </strong>
                    <th width="6%">ID</th>
                    <th width="20%">��������</th>
                    <th width="25%">�����ַ</th>
                    <th width="24%">���ʱ��</th>
                    <th width="16%">ִ��</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <td colspan="6"><div class="bulk-actions align-left"></div>
                        <div class="pagination"> </div>
                        <div class="clear">
                          ��ǰ��<%=curpage%>ҳ������<%=rs.pagecount%>ҳ�����У�<%=rs.recordcount%>����¼
                          <%if curpage=1 then%>
                          ��ҳ
                          <%else%>
                          <a href="?curpage=1">��ҳ</a>
                          <%end if%>
                          <%if curpage=1 then%>
                          ��һҳ
                          <%else%>
                          <a href="?curpage=<%=curpage-1%>">��һҳ</a>
                          <%end if%>
                          <%if rs.pagecount<curpage+1 then%>
                          ��һҳ
                          <%else%>
                          <a href="?curpage=<%=curpage+1%>">��һҳ</a>
                          <%end if%>
                          <%if rs.pagecount<curpage+1 then%>
                          βҳ
                          <%else%>
                          <a href="?curpage=<%=rs.pagecount%>">βҳ</a>
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
response.write "<script>alert('����������Ŀ¼û����д��');location.href='class.asp'</script>"
else
set rs=server.createobject("adodb.recordset")
sql="select * from class"
rs.open sql,conn,1,3
rs.addnew
rs("classname")=""&classname&""

rs.update
rs.close
set rs=nothing
response.write "<script>alert('��ϲ������Ŀ¼��ӳɹ���');location.href='class.asp'</script>"
end if
end if
%>
<!--#include file="../inc/close.asp"-->