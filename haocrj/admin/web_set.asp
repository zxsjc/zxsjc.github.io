<!--#include file="../inc/checklogin.asp"-->
<!--#include file="../inc/conn.asp"-->
<% 
set rs=server.createobject("adodb.recordset")
sql="select * from web"
rs.open(sql),conn,1,1
web_name=rs("web_name")
web_keywords=rs("web_keywords")
web_description=rs("web_description")
web_zhuren=rs("web_zhuren")
web_banquan=rs("web_banquan")
web_gonggao=rs("web_gonggao")
web_url=rs("web_url")
web_diqu=rs("web_diqu")
web_mail=rs("web_mail")
web_csrq=rs("web_csrq")
rs.close
set rs=nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��վ������Ϣ���� - �ռǱ�����ϵͳ</title>
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
      <h3>��վ������Ϣ����:</h3>
      <ul class="content-box-tabs"><!-- href must be unique and match the id of target div -->
        <li></li>
      </ul>
      <div class="clear"></div>
    </div>
    <div class="content-box-content">
<div class="tab-content" id="tab2">
  <form id="form1" name="form1" method="post" action="web_setpost.asp">
    <p>��վ���ƣ�
      <input name="web_name" type="text" value="<%=web_name%>" size="30" />
    </p>
    <p>��վ��ַ��
      <input name="web_url" type="text" size="30" value="<%=web_url%>"/>
    </p>
    <p> �� �� �֣�
      <input name="web_keywords" type="text" size="60" value="<%=web_keywords%>" />
    </p>
    <p>��վ������
      <input name="web_description" type="text" size="60" value="<%=web_description%>"/>
    </p>
    <p> վ��������
      <input name="web_zhuren" type="text" size="60" value="<%=web_zhuren%>"/>
    </p>
        <p> ���ڵ�����
      <input name="web_diqu" type="text" size="60" value="<%=web_diqu%>"/>
    </p>
            <p> վ�����䣺
      <input name="web_mail" type="text" size="60" value="<%=web_mail%>"/>
    </p>
            <p> վ��������
      <input name="web_csrq" type="text" size="60" value="<%=web_csrq%>"/>
    </p>
    <p> ��վ���
      <input name="web_gonggao" type="text" size="60" value="<%=web_gonggao%>"/>
    </p>
    <p>��Ȩ��Ϣ��
        <textarea name="web_banquan" cols="60" rows="3" ><%=web_banquan%></textarea>
      </p>
     <br />
    <input name="submit" type="submit"  value="�ύ" />
    </label>
  </form>
</div>
    </div>
  </div>
  </td>
  </tr>
  </table>
  <h2>&nbsp;</h2>
  <!-- End .shortcut-buttons-set -->
  <div class="clear"></div>
  <div class="clear"></div>
</div>
<p>&nbsp;</p>
</body>
</html>
<!--#include file="../inc/close.asp"-->