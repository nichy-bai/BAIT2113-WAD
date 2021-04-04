<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BAIT2113_WAD.Register" %>

<%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
    async defer></script>
<script type="text/javascript">
    var onloadCallback = function () {
        grecaptcha.render('dvCaptcha', {
            'sitekey': '<%=ReCaptcha_Key %>',
            'callback': function (response) {
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/VerifyCaptcha",
                    data: "{response: '" + response + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var captchaResponse = jQuery.parseJSON(r.d);
                        if (captchaResponse.success) {
                            $("[id*=txtCaptcha]").val(captchaResponse.success);
                            $("[id*=rfvCaptcha]").hide();
                        } else {
                            $("[id*=txtCaptcha]").val("");
                            $("[id*=rfvCaptcha]").show();
                            var error = captchaResponse["error-codes"][0];
                            $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                        }
                    }
                });
            }
        });
    };
</script>--%>


<!DOCTYPE html>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>


<body>
    <form id="form1" runat="server">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
            async defer></script>
        <script type="text/javascript">
            var onloadCallback = function () {
                grecaptcha.render('dvCaptcha', {
                    'sitekey': '<%=ReCaptcha_Key %>',
            'callback': function (response) {
                $.ajax({
                    type: "POST",
                    url: "Register.aspx/VerifyCaptcha",
                    data: "{response: '" + response + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var captchaResponse = jQuery.parseJSON(r.d);
                        if (captchaResponse.success) {
                            $("[id*=txtCaptcha]").val(captchaResponse.success);
                            $("[id*=rfvCaptcha]").hide();
                        } else {
                            $("[id*=txtCaptcha]").val("");
                            $("[id*=rfvCaptcha]").show();
                            var error = captchaResponse["error-codes"][0];
                            $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                        }
                    }
                });
            }
        });
            };
        </script>
        <div class="register-box">
            <div>
                <a href="Homepage.aspx" id="avatarBtn">
                    <img src="images/icon.png" class="avatar" title="Back to homepage" />

                    <%--<recaptcha:RecaptchaControl ID="recaptcha" runat="server"
                    PublicKey="6LdWepkaAAAAAFnu4apC9Bt-3Qd6Du_HKrvPrqTh"
                    PrivateKey="6LdWepkaAAAAAG_Lc50He3XXd98hj7BZ688suh-2" BorderStyle="Dotted"
                   />--%></a>
            </div>
            <recaptcha:RecaptchaControl ID="recaptcha" runat="server"
                PublicKey="6LdWepkaAAAAAFnu4apC9Bt-3Qd6Du_HKrvPrqTh"
                PrivateKey="6LdWepkaAAAAAG_Lc50He3XXd98hj7BZ688suh-2" BorderStyle="Dotted" class="g-recaptcha" />

            <%--<h1>gallerion</h1>--%>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">User ID</div>
                    <asp:TextBox ID="txtid" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtid" ErrorMessage="UserID is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="register-single">
                    <div class="register-question">Full Name</div>
                    <asp:TextBox ID="txtname" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="register-single">
                    <div class="register-question">Email</div>
                    <asp:TextBox ID="txtemail" TextMode="Email" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Email Invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Password</div>
                    <asp:TextBox ID="txtpassword" TextMode="Password"  runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Re-enter Password</div>
                    <asp:TextBox ID="txt4" TextMode="Password"  runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtpassword" ControlToValidate="txt4" ErrorMessage="Password Incorrect" ForeColor="Red"></asp:CompareValidator>
                </div>
                <div class="register-single">
                    <div class="register-question">Phone Number</div>
                    <asp:TextBox ID="txtphone" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone" ErrorMessage="Phone Number Invalid" ForeColor="Red" ValidationExpression="\d{3}-\d{7}"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="register-singlerow" style="padding-bottom:18px;">
                <div class="register-single">
                    <div class="register-question">Street</div>
                    <asp:TextBox ID="txtstreet" runat="server" Height="30px" Width="510px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">City</div>
                    <asp:TextBox ID="txtcity" runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Zip Code</div>
                    <asp:TextBox ID="txtzip" runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">State</div>
                    <asp:TextBox ID="txtstate" runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Date of Birth</div>
                    <asp:TextBox ID="txtdob" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtdob" ErrorMessage="Date Invalid" ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question" style="width: 220px;">Register As</div>
                    <div class="register-singlerow" style="margin-left:25px;">
                        <asp:RadioButton ID="radiobtn1" runat="server" GroupName="userType" Text="Artist" />&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:RadioButton ID="radiobtn2" runat="server" GroupName="userType" Text="Customer" />
                    </div>
                </div>
                <div class="register-single">
                    <div class="register-question" style="width: 220px;padding-bottom: 5px;">Profile Picture</div>
                    <asp:FileUpload ID="FileUpload2" runat="server" onchange="ImagePreview(this);" />
                </div>
            </div>
            <div class="register-singlerow">
            </div>
            <div class="register-singlerow">
                <div class="tnc">
                    <asp:CheckBox ID="checkBox1" runat="server" Text="I agree to the " /><a href="/Help.aspx#terms_and_conditions" target="_blank">&nbsp;<span style="color: black">terms and conditions </span></a>
                </div>
                <div class="register-single" id="dvCaptcha">
                </div>
                <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
            </div>
                <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                    runat="server" ForeColor="Red" Display="Dynamic" />
            <div style="text-align: center">
                <asp:Label ID="lblwarning2" runat="server" Text=" " ForeColor="Red"></asp:Label>
                <asp:Label ID="lblwarning" runat="server" Text=" " ForeColor="Red"></asp:Label>
            </div>
            <br />
            <div class="register-singlerow">
                <div class="register-single">
                    <asp:Button ID="btn2" runat="server" OnClick="btn2_Click" Text="Reset" Width="230px" Height="40px" CssClass="cancel-btn" />
                </div>
                <div class="register-single">
                    <asp:Button ID="btn1" runat="server" OnClick="btn1_Click" Text="Register" Width="230px" Height="40px" CssClass="register-btn" />
                </div>

            </div>

            <a href="Login.aspx" class="return-btn">Already have an account?</a>
        </div>
    </form>
</body>
<%--<script src="https://www.google.com/recaptcha/api.js" async="async" defer="defer"></script>

        <script src="https://www.google.com/recaptcha/api.js?onload=renderRecaptcha&render=explicit" async="async" defer="defer"></script>
    <script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
    var your_site_key = '<%= ConfigurationManager.AppSettings["SiteKey"]%>';
    var renderRecaptcha = function () {
        grecaptcha.render('ReCaptchContainer', {
            'sitekey': your_site_key,
            'callback': reCaptchaCallback,
            theme: 'light', //light or dark
            type: 'image',// image or audio
            size: 'normal'//normal or compact
        });
    };

    var reCaptchaCallback = function (response) {
        if (response !== '') {
            jQuery('#lblMessage').css('color', 'green').html('Success');
        }
    };

    jQuery('button[type="button"]').click(function(e) {
        var message = 'Please checck the checkbox';
        if (typeof (grecaptcha) != 'undefined') {
            var response = grecaptcha.getResponse();
            (response.length === 0) ? (message = 'Captcha verification failed') : (message = 'Success!');
        }
        jQuery('#lblMessage').html(message);
        jQuery('#lblMessage').css('color', (message.toLowerCase() == 'success!') ? "green" : "red");
    });

</script>  --%>
</html>
