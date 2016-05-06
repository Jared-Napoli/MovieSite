<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%
	if((Boolean)request.getSession().getAttribute("error") != null)
	{
		if((Boolean)request.getSession().getAttribute("error")){
%>
			<H2><font color="red">Error, please try again</font color></H2>
<%
		}
	}
%>