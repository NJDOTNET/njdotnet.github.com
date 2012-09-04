<!-- header -->
<div style="width: 100%;">
    <table border="0" cellpadding="0" cellspacing="0" style="background: black;">
        <tr>
          
            <td>
                <a href="default.aspx"><img alt="" src="images/header-logo.png" style="border-width: 0px;" /></a>
            </td>

            <td style="width: 100%;">&nbsp;</td>

            <td>
                <div style="margin-right: 20px; width:175px;">
                    <div style="color: white; font-size: 8pt; margin-bottom: 3px">
                        Signup for our newsletter:
                    </div>
                    <div id="submitForm" style="vertical-align:middle">
                      <div>
                        <input id="subscribe-email" style="vertical-align:middle" type="text" />&nbsp;
                        <img id="subscribe-submit-icon" style="vertical-align:middle; cursor:pointer;" src="images/arrow.gif" onclick="sendSubscribe($('#subscribe-email').val());" />
                        <img id="subscribe-wait-icon" style="vertical-align: middle; display: none;" src="images/ajax-loader.gif" width="16" height="16" alt="" />
                        <img id="subscribe-success-icon" style="vertical-align: middle; display: none;" src="images/check.png" width="16" height="16" alt="" />
                      </div>
                      <div id="subscribe-result-space" style="font-size: 8pt; margin-top: 5px;">&nbsp;</div>
                      <div id="subscribe-result-formaterror" style="color:white; font-size: 8pt; margin-top: 5px; display: none">whoops.  check your email again</div>
                      <div id="subscribe-result-submitsuccess" style="color: white; font-size: 8pt; margin-top: 5px; display: none">woot!  your email was submitted</div>
                      <div id="subscribe-result-submitfail" style="color: white; font-size: 8pt; margin-top: 5px; display: none">whoops.  something went wrong</div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
