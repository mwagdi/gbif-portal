<script type="text/javascript">
$(function() {
  $( "#tagbox" ).click(function() {
    loader = cfg.baseUrl + "/img/ajax-loader.gif";
    $("#currentTags").html( "<img src='" + loader + "'>" );
    actionUrl = cfg.baseUrl + "/admin/organization/add/tag/step";
    alert(actionUrl);
    value = $("input[name='currentTag']").val();  
    $.post( actionUrl, { 
      'tag.value': value },
        function( data ) {
          $( "#currentTags" ).empty().append( data );
          $("input[name='currentTag']").val('');	  
    });
  });
});
</script>
  
<div class="field">
  <p>TAGS</p>
  <div id="currentTags"></div>
  <@s.textfield name="currentTag" size="20" maxlength="50"/>
  <img src="<@s.url value='/img/admin/add.png'/>" name="tagbox" id="tagbox">
</div>
		
			<div class="field">
              <p>TITLE</p>
                <@s.textfield name="member.title" value="${(member!).title!}" size="20" maxlength="50" />
                <@s.fielderror fieldName="member.title"/>
            </div>

            <div class="field">
              <p>DESCRIPTION</p>
              <@s.textarea name="member.description" value="${(member!).description!}" rows="2" cols="20" />
              <@s.fielderror fieldName="member.description"/>
            </div>
            
            <div class="field">
              <p>LANGUAGE</p>
              <@s.select name="member.language" value="'${((member!).language!).interpreted!}'" list="languages" 
               listKey="key" listValue="value" headerKey="" headerValue="Choose a language"/>
               <@s.fielderror fieldName="member.language"/>
            </div>            

            <div class="field">
              <p>HOMEPAGE</p>
                <@s.textfield name="member.homepage" value="${(member!).homepage!}" size="20" maxlength="60" />
                <@s.fielderror fieldName="member.homepage"/>
            </div>                
            
            <div class="field">
              <p>LOGO URL</p>
                <@s.textfield name="member.logoURL" value="${(member!).logoURL!}" size="20" maxlength="60" />
                <@s.fielderror fieldName="member.logoURL"/>
            </div>