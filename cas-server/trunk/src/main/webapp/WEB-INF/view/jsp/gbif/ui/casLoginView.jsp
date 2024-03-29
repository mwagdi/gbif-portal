<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="includes/top.jsp" />


<%--
Adding custom javascript to remove the drupal cas_module cookie.
Only works if cas and drupal run on the same domain!
--%>
<script type="text/javascript">
  var exdate=new Date();
  exdate.setDate(exdate.getDate() - 1000);
  document.cookie = "cas_login_checked=;expires=100000" + exdate.toGMTString() + ";path=/;domain=gbif.org";
</script>



<div id="content">
<div id="login" class="infowindow" style="top: 100px; display: block; ">
      <div class="lheader"></div>
      <div class="content">
      
        <h2>SIGN IN TO GBIF</h2>
        <form:form method="post" id="fm2" cssClass="fm-v clearfix" commandName="${commandName}" htmlEscape="true">
        
          <div class="light_box">
            <div class="field email">
              <h3>Username</h3>
              <span class="input_text">
                
						<c:if test="${not empty sessionScope.openIdLocalId}">
						<input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}" />
						</c:if>

						<c:if test="${empty sessionScope.openIdLocalId}">
						<form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" />
						</c:if>                
                
                <span class="error" style="display:none">Username not recognized</span>
              </span>
            </div>
            <div class="field password">
              <h3>Password</h3>
              <span class="input_text">
                <form:password cssClass="required" cssErrorClass="error" id="password" size="25" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                <span class="error" style="display:none">Wrong password</span>
              </span>
            </div>
            <!-- div class="field">
              <span class="input_text">
                        <input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox" />
                        <label for="warn"><spring:message code="screen.welcome.label.warn" /></label>
              </span>
            </div -->
            
            
            
						<input type="hidden" name="lt" value="${loginTicket}" />
						<input type="hidden" name="execution" value="${flowExecutionKey}" />
						<input type="hidden" name="_eventId" value="submit" />
            
            <div class="tl"></div>
            <div class="tr"></div>
            <div class="bl"></div>
            <div class="br"></div>
          </div>
          <a href="http://staging.gbif.org/drupal/user/password" class="recover_password" title="Recover your password">Forgot your password?</a>
          <button type="submit" class="candy_blue_button"><span>Login</span></button>
          
        </form:form>
        <div class="footer">Do yo need to Sign up?
          <a href="http://staging.gbif.org/drupal/user/register" title="Create a new account">Create your account</a>
        </div>
      </div>
      <div class="lfooter"></div>
    </div>


  

    <div style="height:500px">
    </div>


  </div>

  </div>
<jsp:directive.include file="includes/bottom.jsp" />
