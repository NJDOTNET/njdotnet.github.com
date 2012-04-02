﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>NJDOTNET - Home</title>

    <!-- #include file="includes/head.inc" -->

    <script  id="eventTemplate" type="text/x-jquery-tmpl">
        <div>
            <h3>
                <span>${Date.parse(start_date).toString("dddd, MMMM d, h:mm tt")}</span>:&nbsp;<span>${extractContent(description, "#topic")}</span>
                <div style="display:inline; float: right;">
                    <a href="${url}" target="_blank"><img src="images\buttoncreate.png" alt"" border="0" /></a>
                </div>
            </h3>
            <h4 class="presenter">Presenter(s):&nbsp;<span>${extractContent(description, "#presenter")}</span></h4>
            <div class="description">{{html extractContent(description, "#abstract")}}</div>
            <div class="presenters"><div class="bio"><blockquote id="speakerbio">{{html extractContent(description, "#bio")}}</blockquote></div></div>
        </div>
    </script>
    
    <script  id="errorTemplate" type="text/x-jquery-tmpl">
        <div style="text-align: center;">
            <h3>whoops!</h3>
            <p>looks like we could not find any upcoming events,<br/>or less likely, we're having a problem fetching the meeting details</p>
            <p style="font-size:8px;">${error_message}</p>
        </div>
    </script>

    <script type="text/javascript">
    <!--
        $(function () {
            var ebUri = 
                        "scripts/SimpleJsonProxy.ashx?m=eb&u=" +
                        $.URLEncode("http://www.eventbrite.com/json/event_search?app_key=ZWE5NmQxOTMxZDc5&date=Future&organizer=njdotnet&sort_by=date");

            $.ajax({
                url: ebUri,
                success: function (result) {

                    if (result.events.length < 2) {
                        handleEventDisplayError(result.error);
                        return;
                    }

                    var nextmeeting = result.events[1];
                    var futuremeeting = result.events[2];

                    if (nextmeeting != undefined && nextmeeting != null) {
                        var content = $("#eventTemplate").tmpl(nextmeeting.event);
                        content.appendTo("#next-meeting-container .event-container");
                        $(".wait-container, .event-container", "#next-meeting-container").toggle();
                    }
                    else {
                        $(".wait-container, .error-container", "#next-meeting-container").toggle();

//                        $("#next-meeting-container .wait-container").css("display", "none");
//                        $("#next-meeting-container .error-container").css("display", "");
                    }

                    if (futuremeeting != undefined && futuremeeting != null) {
                        var content = $("#eventTemplate").tmpl(nextmeeting.event);
                        content.appendTo("#future-meeting-container .event-container");
                        $(".wait-container, .event-container", "#future-meeting-container").toggle();
//                        $("#future-meeting-container .wait-container").css("display", "none");
//                        $("#future-meeting-container .event-container").css("display", "");
                    }
                    else {
                        $(".wait-container, .nodata-container", "#future-meeting-container").toggle();
//                        $("#future-meeting-container .wait-container").css("display", "none");
//                        $("#future-meeting-container #future-nodata-container").css("display", "");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    handleEventDisplayError(errorThrown);
                }
            });
        });

        function handleEventDisplayError(error) {

            var content = $("#errorTemplate").tmpl(error);
            content.appendTo("#next-meeting-container .error-container, #future-meeting-container .error-container");

            $(".wait-container, .error-container").toggle();
        }

        function extractContent(content, id) {
            var element = $(id + ":first", $(content))[0];
            if (element != undefined && element != null)
            { return element.innerHTML; }
            else 
            { return ""; }
        }

    // -->
    </script>

</head>
<body >
    <div style="width: 956px; margin-left: auto; margin-right: auto;">
        <div style="background-color: #ffffff; border-top: solid 6px #bbde79;">

            <!-- #include file="includes/banner.inc" -->
            <!-- #include file="includes/navigation.inc" -->

            <div>
                <!-- main content table -->
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>

                        <!-- padding pane -->
                        <td style="width: 10px" valign="top"></td>

                        <!-- main content pane -->
                        <td valign="top" width="100%">
                            <div id="main-content">
                                
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <div style="background-color: #ffffff; margin: 4px; padding: 0px 10px 10px 10px;border: solid; border-width: 1px; border-color: #ffffff; text-align: left;">

                                                <div id="next-meeting-container">
                                                    <h2>Next User Group Meeting</h2><hr />
                                                    <div class="wait-container" style="text-align: center"><p><img alt="" src="images/wait22.gif" /></p><p>fetching the meeting details...</p></div>
                                                    <div class="event-container" style="display:none"></div>
                                                    <div class="error-container" style="display:none;"></div>
                                                </div>

                                                <table cellpadding="7">
                                                    <tr>
                                                        <td style="width: 50%; vertical-align: top">
                                                            <h4 class="CommonSidebarHeader">
                                                                Meeting Location</h4>
                                                            <div style="padding: 3px;">
                                                                Infragistics<br />
                                                                2 Commerce Drive<br />
                                                                Cranbury, NJ 08512<br />
                                                                <a href="/directions.aspx">Directions &amp; Maps</a>
                                                            </div>
                                                        </td>
                                                        <td style="width: 50%; vertical-align: top">
                                                            <h4 class="CommonSidebarHeader">
                                                                Contact Us</h4>
                                                            <div style="padding: 3px;">
                                                                Feel free to contact 
                                                                <a href="mailto:jess@njdotnet.org">Jess Chadwick</a>, 
                                                                <a href="mailto:todd@njdotnet.org">Todd Snyder</a>, or
                                                                <a href="mailto:devin@njdotnet.org">Devin Rader</a>, 
                                                                with questions about the user group, meeting information, sponsorships, speakers, etc. E-mail <a
                                                                    href="mailto:info@njdotnet.org?subject=%5BNJ.NET%5D%20Contact%20from%20Website">
                                                                    Information - NJDOTNET</a> for more information.
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                    
                                                <fieldset class="homepage-footer-banner">
                                                    <legend>NJDOTNET is brought to you by...</legend>
                    
                                                    <a href="http://www.ineta.org" style="text-decoration: none;">
                                                        <img alt="" style="vertical-align: middle; padding-left: 10px; padding-right: 10px;"
                                                            border="0" src="images/ineta.jpg" /></a> 
                                                    <a href="http://www.infragistics.com" style="text-decoration: none;">
                                                        <img alt="" style="vertical-align: middle; padding-left: 10px; padding-right: 10px;"
                                                            border="0" src="images/infragistics.png" width="163" /></a>
                                                    <a href="http://www.eventbrite.com" style="text-decoration: none;">
                                                        <img alt="" style="vertical-align: middle; padding-left: 10px; padding-right: 10px;"
                                                            border="0" src="images/eventbrite.gif" width="163" />
                                                    </a>
                                                </fieldset>

                                                <div id="future-meeting-container">
                                                    <h2>Future User Group Meeting</h2>
                                                    <div class="wait-container" style="text-align: center"><p><img alt="" src="images/wait22.gif" /></p><p>fetching the meeting details...</p></div>
                                                    <div class="event-container" style="display:none"></div>
                                                    <div class="nodata-container" style="display:none;">
                                                        <table cellpadding="3">
                                                            <tr>
                                                                <td><img alt="" src="images/shadow.jpg" style="height: 76px; width: 56px" /></td>
                                                                <td valign="top">
                                                                    <h3 style="color: #CCCCCC;">[your name here]</h3>
                                                                    <p>Looks like we are still looking for someone to present at this meeting.  If you are interested, shoot an email to speakers@njdotnet.org</p>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="error-container" style="display:none;"></div>
                                                </div>

                                            </div>
                                        </td>
                                    </tr>
                                </table>
 
                            </div>
                        </td>

                        <!-- right content -->
                        <td style="background-color: #eff7e0; padding-bottom: 22px; vertical-align: top">
                            <div style="padding: 0px; margin-left: 18px; margin-right: 18px;">
   
                                <!-- #include file="includes/social.inc" -->
                                <!-- #include file="includes/megaphone.inc" -->
 
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        
            <!-- #include file="includes/footer.inc" -->

        </div>
    </div>
</body>

</html>