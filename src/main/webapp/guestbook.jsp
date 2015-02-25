<%@ page contentType="text/html; charset=utf8"	%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="/guestbook/css/stylesheet.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title></title>
</head>

<body>
    <h1>GUEST BOOK by uts</h1>
    
    <form:form method="post" action="add" commandName="guestbook" id="addform">
        
            <table id="add" cellspacing=0 cellpadding=1
                <tr>
                    <td><label for="username">Имя<font color=red>*</font>:</label></td>
                    <td><form:input path="username" size="38" class="left" name="username"/></td>                   
                </tr>
                <tr>
                    <td><label for="email">Email<font color=red>*</font>:</label></td>
                    <td><form:input path="email" size="38" name="email"/></td>
                </tr>
                <tr>
                    <td><label for="homepage">URL:</label></td>
                    <td><form:input path="homepage" size="38" id="homepage"/></td>
                </tr>
                <tr>
                    <td>Ваш IP адресс:</td>
                    <td><form:input path="ip"  readonly="true" size="38" value="${ipAddress}"/></td>
                </tr>
                <tr>
                    <td>Ваш браузер:</td>
                    <td><form:input path="browser"  readonly="true" size="38" id="browser"/></td>
                        <script>
                            function browser(){ 
                                var userAg = navigator.userAgent;
                                if (userAg.indexOf("Chrome") != -1) {
                                    return "Google Chrome";
                                } else if (userAg.indexOf("Firefox")!=-1) {
                                    return "Mozilla Firefox";
                                } else if (userAg.indexOf("Opera")!=-1) {
                                    return "Opera";
                                } else if (userAg.indexOf("MSIE")!=-1) {
                                    return "Internet Explorer";
                                } else if (userAg.indexOf("Safari")!=-1) {
                                    return "Safari";
                                } else {
                                    return "unknown browser";
                                }
                            } 
                            $("input[id='browser']").val(browser());
                        </script>
                </tr>
                <tr>
                    <td><label for="text" >Сообщение<font color=red>*</font></label></td>
                    <td><form:textarea path="text" cols="40" rows="7" tabindex="4" id="text" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        
                        <div class="g-recaptcha" data-sitekey="6LfJdwITAAAAAJOI6tli8PrfQV36cIJxNo9ehae2"></div>
                        <script type="text/javascript">
                            // скрипт отслеживания 
                            var data = file_get_contents('https://www.google.com/recaptcha/api/siteverify?');
                        </script>
                    </td>
                </tr>
                <tr>
                    <td><td><input type="submit" value="Отправить" />
            </table>
</form:form>

       

    
    <h3 align="center">Сообщения</h3>
<c:if test="${!empty guestbookList}">
    <table id="message" border=1 width="800" cellpadding="1" cellspacing="1">
    <c:forEach items="${guestbookList}" var="guestbook">
                <tr>
                    <td id="date" align="right"><div>Дата: <fmt:formatDate value="${guestbook.created}" type="both" timeStyle="short" /> </div></td>
                </tr>
                <tr>
                    <td>
                        <table border="0" width="800">
                            <tr> 
                                <td width="250">Имя: ${guestbook.username}</td>
                                <td width="550">${guestbook.text}</td>
                            </tr>
                            <tr> 
                                <td>E-mail:${guestbook.email}</td>
                            </tr>
                            <tr> 
                                <td>IP:${guestbook.ip}</td>
                            </tr>
                        </table>    
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="0" width="800">
                            <tr> 
                                
                                <td><div id='url'>URL: ${guestbook.homepage}</div></td>
                                <td><div id='browser'>${guestbook.browser}</div></td>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
            
                            
    </c:forEach>
    </table>                          
	
</c:if>

</body>
<script type = "text/javascript">
    
    
        $(document).ready(function(){
            $("#addform").validate({
                rules: {
                    username: {
                        required: true,
                        minlength : 4,
                        maxlength : 20
                    }, 
                    email: {
                        required: true,
                        email:true,
                        maxlength : 25
                    }, 
                    homepage: {
                        required: false,
                        url: true,
                        maxlength : 100
                    }, 
                    text: {
                        required: true,
                        minlength : 10,
                        maxlength : 1000
                    }, 
                    
                }
            });
        });
</script>     
</html>