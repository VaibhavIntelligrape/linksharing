<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		%{--<asset:stylesheet src="application.css"/>--}%
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body style="background-color:skyblue">
		%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>--}%
        <g:render template="/home/header_home"/>
        <g:layoutBody/>

    <div class="createTopic" id="createTopic" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:248px;width:450px;margin: auto;">
        <g:render template="/home/createTopic"  />
        %{--<g:myTag name="vaibhav from taglib"></g:myTag>--}%
    </div>
    <div class="senInvite" id="senInvite" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:200px;width:450px;margin: auto;">
        <g:render template="/home/senInvite"  />
    </div>
    <div class="createDocumentRes" id="createDocumentRes" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:265px;width:450px;margin: auto;">
        <g:render template="/home/createDocumentRes"  />
    </div>
    <div class="createLinkRes" id="createLinkRes" hidden="hidden" style="position: absolute;top: 0px;left: 0px;bottom: 0px;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:260px;width:450px;margin: auto;">
        <g:render template="/home/createLinkRes"  />
    </div>



    <div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
