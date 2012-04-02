﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>NJDOTNET - Meetings</title>

    <!-- #include file="includes/head.inc" -->

    <script  id="eventTemplate" type="text/x-jquery-tmpl">
        <div>
            <h3><span>${Date.parse(event.start_date).toString("dddd, MMMM d, h:mm tt")}</span>:&nbsp;<span>${extractContent(event.description, "#topic")}</span></h3>
            <h4 class="presenter">Presenter(s):&nbsp;<span>${extractContent(event.description, "#presenter")}</span></h4>
            <div class="description">{{html extractContent(event.description, "#abstract")}}</div>
            <div class="presenters"><div class="bio"><blockquote id="speakerbio">{{html extractContent(event.description, "#bio")}}</blockquote></div></div>
        </div>
    </script>

    <script type="text/javascript">
    <!--
        $(function () {
            var ebUri = "scripts/SimpleJsonProxy.ashx?u=" +
                        $.URLEncode("http://www.eventbrite.com/json/organizer_list_events?app_key=ZWE5NmQxOTMxZDc5&id=346667");

            $.ajax({
                url: ebUri,
                success: function (result) {

                    if (result.events.length < 2) {
                        return;
                    }

                    result.events = result.events.reverse();
                    $("#eventTemplate").tmpl(result.events).appendTo("#past-meeting-container");

                    $("#wait-container").css("display", "none");
                    $("#past-meeting-container").css("display", "");                
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        });

        function extractContent(content, id) {
            var element = $(id + ":first", $(content))[0];
            if (element != undefined && element != null)
            { return element.innerHTML; }
            else { return ""; }
        }
    //-->
    </script>

</head>
<body>
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

                                                <div id="historic-meeting-container">
                                                    <h2>Past Meetings</h2><hr />
                                                    <div id="wait-container" style="text-align: center"><p><img alt="" src="images/wait22.gif" /></p><p>fetching past meeting details...</p></div>
                                                    <div id="nodata-container" style="display:none; text-align: center"><h3>whoops!</h3><p>we seem to be hanving a problem fetching the meeting details</p></div>
                                                    <div id="past-meeting-container" style="display:none"></div>
                                                </div>

                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>

                         <!-- right content pane -->
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

