<%@page import="java.sql.*,
 javax.sql.*,
 java.io.IOException,
 javax.servlet.http.*,
 javax.servlet.*,
 java.util.*,
 SQLClasses.*"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
    <HEAD>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
     </HEAD>
    <script language="javascript" type="text/javascript">
        <!--
        //Browser Support Code
        function autocompleteSearch()
        {
          var ajaxRequest;  // The variable that makes Ajax possible!
          try{
            // Opera 8.0+, Firefox, Safari
            ajaxRequest = new XMLHttpRequest();
          } catch (e){
            // Internet Explorer Browsers
            try{
              ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
              try{
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
              } catch (e){
                // Something went wrong
                alert("Your browser broke!");
                return false;
              }
            }
          }
          // Create a function that will receive data sent from the server
          ajaxRequest.onreadystatechange = function()
          {
            if(ajaxRequest.readyState == 4)
            {
              var str = ajaxRequest.responseText;
              var result = str.split("$%");

              $("#autocomplete").autocomplete({
                minLength: 0,
              source: function (request, response) {
                      response(result);
                  }
              });
            }
          }

          ajaxRequest.open("GET", "/project4/customer/BackgroundSearch/" + document.myForm.title.value, true);
          ajaxRequest.send(null);
        }
    </script>
    <FORM ACTION="/project4/customer/search/result" METHOD="get" name='myForm'>
        <input id="autocomplete" type='text' onkeyup="autocompleteSearch();" name='title' placeholder="Search.." style="width: 280px;">
        <INPUT TYPE="HIDDEN" NAME="orderBy" VALUE="title">
        <INPUT TYPE="HIDDEN" NAME="direction" VALUE="ASC">
        <INPUT TYPE="HIDDEN" NAME="numResults" VALUE="10">
        <INPUT TYPE="HIDDEN" NAME="currResult" VALUE="0">
        <INPUT TYPE="HIDDEN" NAME="totalResults" VALUE="0">
        <INPUT TYPE="HIDDEN" NAME="year" VALUE="">
        <INPUT TYPE="HIDDEN" NAME="director" VALUE="">
        <INPUT TYPE="HIDDEN" NAME="a_first_name" VALUE="">
        <INPUT TYPE="HIDDEN" NAME="a_last_name" VALUE="">
        <INPUT TYPE="SUBMIT" style="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 14px; background-color: #808080" VALUE="Quick Search">
    </FORM>
</HTML>