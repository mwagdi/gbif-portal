<#import "/WEB-INF/macros/common.ftl" as common>
<html>
<head>
  <title>Edit Organization - GBIF</title>
  <meta name="menu" content="datasets"/>
    <script type="text/javascript" src="<@s.url value='/js/vendor/jquery-1.7.1.min.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/custom/modal_form.js'/>"></script>
    <style>
      body { font-size: 62.5%; }
      label, input { display:block; }
      input.text { margin-bottom:12px; width:95%; padding: .4em; }
      fieldset { padding:0; border:0; margin-top:25px; }
      h1 { font-size: 1.2em; margin: .6em 0; }
      div#users-contain { width: 350px; margin: 20px 0;  overflow: auto;}
      div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
      div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
      .ui-dialog .ui-state-error { padding: .3em; }
      .validateTips { border: 1px solid transparent; padding: 0.3em; }
    </style>        
</head>
<body class="dataset">

  <article id="edit" class="tunnel">
    <header></header>
    <div class="content">
      <ul class="breadcrumb">
        <li><h2>Administration</h2></li>
        <li class="active"><h2>Edit Organization</h2></li>
        <li class="last"><h2>Finish</h2></li>
      </ul>


      <p>Please edit the necessary fields:</p>
      <div class="important">
        <div class="top"></div>
        <div class="inner">
          <@s.form action="organization/${id}/add">
			<div class="field">
              <p>TITLE</p>
                <@s.textfield name="member.title" value="${member.title!}" size="20" maxlength="10" />
                <@s.fielderror fieldName="member.title"/>
            </div>

            <div class="field">
              <p>DESCRIPTION</p>
              <@s.textarea name="member.description" value="${member.description!}" rows="2" cols="20" />
              <@s.fielderror fieldName="member.description"/>
            </div>

            <div class="field">
              <p>ADDRESS</p>
                <@s.textfield name="member.address" value="${member.address!}" size="20" maxlength="10" />
                <@s.fielderror fieldName="member.address"/>
            </div>
            
            <div class="field">
              <p>CITY</p>
                <@s.textfield name="member.city" value="${member.city!}" size="20" maxlength="10" />
                <@s.fielderror fieldName="member.city"/>
            </div>         
            
            <div class="field">
              <p>ZIP</p>
                <@s.textfield name="member.zip" value="${member.zip!}" size="20" maxlength="10" />    
                <@s.fielderror fieldName="member.zip"/>            
            </div>       
             
            <div class="field">
              <p>PHONE</p>
                <@s.textfield name="member.phone" value="${member.phone!}" size="20" maxlength="10" />  
                <@s.fielderror fieldName="member.phone"/>                 
            </div>    

            <div class="field">
              <p>E-MAIL</p>
                <@s.textfield name="member.email" size="20" maxlength="10" />  
                <@s.fielderror fieldName="member.email"/>                 
            </div> 
                                      
            <div class="field">
              <p>COUNTRY - ${(member.country!).iso2LetterCode!}</p>
              <@s.select name="member.country" value="${(member.country!).iso2LetterCode!}" list="officialCountries" 
               listKey="iso2LetterCode" listValue="title" headerKey="" headerValue="Choose a country"/>
               <@s.fielderror fieldName="member.country"/>
            </div>        
            
            <div class="field">
              <p>HOMEPAGE</p>
                <@s.textfield name="member.homepage" value="${member.homepage!}" size="20" maxlength="60" />
                <@s.fielderror fieldName="member.homepage"/>
            </div>                
            
            <div class="field">
              <p>LOGO URL</p>
                <@s.textfield name="member.logoURL" value="${member.logoURL!}" size="20" maxlength="60" />
                <@s.fielderror fieldName="member.logoURL"/>
            </div>                                  
	        
            <div class="field">
              <p>CONTACTS  [ <a href="#">add contacts</a> ] - popup to add a new contact
                <ul class="team">
                  <#list member.contacts! as c>
                  <li>
                    <img src="<@s.url value='/img/minus.png'/>">
                      <@common.contact con=c />
                  </li>
                </#list>
              </ul>
            </div>
            
            <div class="create_contact">
              <div id="dialog-form" title="Create new contact">
                <p class="validateTips">All form fields are required.</p>
                  <fieldset>
                    <label for="name">Salutation</label>
                    <select name="new_contact_salutation" id="new_contact_salutation">
                      <option> - Select The Title - </option>
                      <option value="Mr.">Mr.</option>
                      <option value="Mrs.">Mrs.</option>
                      <option value="Miss">Miss</option>
                      <option value="Ms.">Ms.</option>
                      <option value="Dr.">Dr.</option>
                      <option value="Prof.">Prof.</option>
                      <option value="Rev.">Rev.</option>
                      <option value="Other">Other</option>		
                    </select>		
                    <label for="firstName">First Name</label>
                    <input type="text" name="new_contact_first_name" id="new_contact_first_name" value="" class="text ui-widget-content ui-corner-all" />
                    <label for="lastName">Last Name</label>
                    <input type="text" name="new_contact_last_name" id="new_contact_last_name" value="" class="text ui-widget-content ui-corner-all" />		
                    <label for="type">Type</label>
                    <select name="new_contact_type" id="new_contact_type">
                      <#list contactTypes as c>
                        <option value="${c}"><@s.text name="enum.contacttype.${c}"/></option>
                      </#list>
                    </select>	
                    <label for="position">Position</label>
                    <input type="text" name="new_contact_position" id="new_contact_position" value="" class="text ui-widget-content ui-corner-all" />		     
                    <label for="description">Description</label>
                    <input type="text" name="new_contact_description" id="new_contact_description" value="" class="text ui-widget-content ui-corner-all" />
                    <label for="province">Province</label>
                    <input type="text" name="new_contact_province" id="new_contact_province" value="" class="text ui-widget-content ui-corner-all" />
                    <label for="city">City</label>
                    <input type="text" name="new_contact_city" id="new_contact_city" value="" class="text ui-widget-content ui-corner-all" />
                    <label for="postal_code">Postal Code</label>
                    <input type="text" name="new_contact_postal_code" id="new_contact_postal_code" value="" class="text ui-widget-content ui-corner-all" />
                    <label for="country">Country</label>
                    <select name="new_contact_country" id="new_contact_country">              
                      <#list officialCountries as c>
                        <option value="${c.iso2LetterCode}" <#if member.country??><#if member.country==c>selected</#if></#if> >${c.title}</option>
                      </#list>
                    </select>	
                    <label for="email">E-Mail</label>
                    <input type="text" name="new_contact_email" id="new_contact_email" value="" class="text ui-widget-content ui-corner-all" />
                    <label for="phone">Phone</label>
                    <input type="text" name="new_contact_phone" id="new_contact_phone" value="" class="text ui-widget-content ui-corner-all" />                                                                                                                    	                                   
                  </fieldset>
              </div>

              <div id="users-contain" class="ui-widget">
                <table id="users" class="ui-widget ui-widget-content">
                  <thead>
                    <tr class="ui-widget-header ">
                      <th>Salutation</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Type</th>
                      <th>Position</th>
                      <th>Description</th>
                      <th>Province</th>
                      <th>City</th>
                      <th>Postal Code</th>
                      <th>Country</th>
                      <th>E-mail</th>
                      <th>Phone</th>
                      <th>Is Primary?</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
                
              <button id="create-user">Create new contact</button>

            </div>
            <!-- End contact creation -->               
             
            <div class="field">
              <p>GBIF Endorsing Node</p>
              <!-- TODO: 'member' is being mapped as a WritableMember, therefore 'endorsingKey' cant be mapped. Investigate further on this --> 
              <!-- Possibly this might mean creating a 'member' objecto for each entity at their respective Action class --> 
              <@s.select name="member.endorsingNodeKey" value="${member.endorsingNodeKey!}" list="nodes" 
               listKey="key" listValue="title" headerKey="" headerValue="Choose a node"/>
               <!-- <@s.fielderror fieldName="member.endorsingNodeKey"/> -->
            </div>          

      
            <nav><@s.submit title="Edit" class="candy_white_button next"><span>Save Changes</span></@s.submit>         
          </@s.form>
       
          
        </div>
        <div class="bottom"></div>
      </div>



        <p>When you are sure about the changes, press 'Save Changes'</p></nav>
    </div>
    <footer></footer>
  </article>
</body>
</html>
