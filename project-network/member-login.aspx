<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="member-login.aspx.vb" Inherits="M2M_Redesign.member_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Network Member Login | GMI</title>
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server">
        <section class="py-5 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <img src="https://globalmethane.org/assets/images/gmipn2.svg" alt="GMI Project Network" style="width:50%;margin-bottom:30px" />
                        <h2>Login</h2>
                        <p>Existing Project Network members can log in using the following form. If you are not a member of the Project Network, please <a href="member-register.aspx">join the Project Network</a> today.</p>

                        <!-- Login form -->
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password" />
                        <input type="checkbox" id="togglePassword"> Show Password
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />

                        
                        <!-- Links -->
                        <p><a href="member-register.aspx">Need to create a login?</a></p>
                        <p><a href="member-reminder.aspx">Forgot password?</a></p>
                        
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </section>


            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                const passwordField = document.getElementById('<%= txtPassword.ClientID %>');
        const togglePasswordCheckbox = document.getElementById('togglePassword');

        togglePasswordCheckbox.addEventListener('change', function () {
            // Check if the checkbox is checked
            if (this.checked) {
                passwordField.setAttribute('type', 'text');
            } else {
                passwordField.setAttribute('type', 'password');
            }
        });
    });
</script>

        <!-- #include virtual="/includes/footer.html" -->


    </form>
</body>
</html>
