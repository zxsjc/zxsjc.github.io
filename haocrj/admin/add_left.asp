<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����б� - �ռǱ�����ϵͳ</title>
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
            <h3>�����б�</h3>
            <ul class="content-box-tabs">
              <li></li>
              <li></li>
            </ul>
            <div class="clear"></div>
          </div>
          <div class="content-box-content">
            <div class="tab-content default-tab" id="tab1">
              <% 
set rs=server.createobject("adodb.recordset")
sql="select * from riji order by w_id desc"
rs.open(sql),conn,1,1

If rs.bof And rs.eof Then
Response.Write("�Բ�����ʱ��û���κ��ռǼ�¼��")
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
                    <th width="40%">����</th>
                    <th width="29%">ʱ��</th>
                    <th width="16%">ִ��</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <td colspan="5"><div class="bulk-actions align-left"></div>
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

				<form id="form" name="form" method="post" action="delete_all.asp"">
                  <%
for i= 1 to rs.pagesize
if rs.eof then
exit for
end if
w_id=rs("w_id")
w_title=rs("w_title")
w_time=rs("w_time")

%>
                  <tr> 


                    <td><input type="checkbox" name="id" value="<%=w_id%>" >
					
                    </td>
                    <td><%=w_id%></td>
                    <td><a href="../Content.asp?id=<%=w_id%>" target="_blank" ><%=left(w_title,30)%></a></td> 
                    <td><%=w_time%></td>
                    <td><!-- Icons -->
                        <a href="edit.asp?eid=<%=w_id%>" title="Edit"><img src="images/images/icons/pencil.png" alt="Edit" /></a> <a href="delete.asp?did=<%=w_id%>" title="Delete"><img src="images/images/icons/cross.png" alt="Delete" /></a> </td>
                  </tr>
                  <%
rs.movenext
next
%>

                </tbody>
              </table>
			  <input type=checkbox value="ȫѡ" onClick="this.value=check(this.form.id)"> 
			  ȫѡ/ȫ��ѡ 
			  <input type="submit"  value="ɾ����ѡ" /></form>
                  <%
rs.close
set rs=nothing
end if
%>
            </div>
            <!-- End #tab1 -->
            <div class="tab-content" id="tab2"></div>
            <!-- End #tab2 -->
          </div>
        <!-- End .content-box-content -->
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
<!--#include file="../inc/close.asp"-->