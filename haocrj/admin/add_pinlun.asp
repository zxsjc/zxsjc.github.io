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
Response.Write("�Բ�����ʱ��û���κ����ۼ�¼��")
else
 rs.pagesize=10 'ÿҳ��¼����
curpage=Request.QueryString("curpage") '��URL����curpage����curpage����
if curpage="" then curpage=1
rs.absolutepage=curpage '����ҳ��Ϊcurpage���õ�ҳ��
%>      <table width="100%">
                <thead>
                  <tr>

                    <td width="9%"><strong>ѡ��
                    </th>
                    </strong>
                    <th width="6%">ID</th>
                    <th width="6%">����</th>
                    <th width="43%">����</th>
                    <th width="20%">ʱ��</th>
                    <th width="20%">����</th>

                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <td colspan="6"><div class="bulk-actions align-left"></div>
                        <div class="pagination"> </div>
                      <!-- End .pagination -->
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
huifu="�ѻظ�"
else
huifu="<font color='#FF0000'>δ�ظ�</font>"
end if
%>
<tr> 
 <td><input type="checkbox" name="id" value="<%=p_id%>" >                    </td>
                    <td><%=p_id%></td>
                    <td><%=left(p_name,30)%></td>
                    <td><a href="../Content.asp?id=<%=p_idd%>#Comment" target="_blank" ><%=left(p_pinglun,30)%></a></td>
                    <td><%=p_time%></td>
                    <td>
                        <a href="huifu.asp?id=<%=p_id%>" title="Edit">�ظ�</a> - <%=huifu%></td>
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
			  <input type=checkbox value="ȫѡ" onClick="this.value=check(this.form.id)"> 
			  ȫѡ/ȫ��ѡ 
			  <input type="submit"  value="ɾ����ѡ" /></form>
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