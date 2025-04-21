<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="member-setup.aspx.vb" Inherits="M2M_Redesign.member_setup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set up Account | GMI Project Network</title>
    <style>
        .text-success{
            font-weight:bold;
            font-size:20px;
            color:darkgreen;
        }
    </style>
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
        /* Add styles for password strength meter and criteria */
        .password-strength { font-weight: bold; }
        .password-criteria { list-style-type: none; padding: 0; }
        .password-criteria li { color: red; }
        .password-criteria li.valid { color: green; }
    </style>
    <script>
        function validatePassword() {
            var password = document.getElementById("txtPassword").value;
            var lengthValid = password.length >= 8;
            var upperValid = /[A-Z]/.test(password);
            var lowerValid = /[a-z]/.test(password);
            var numberValid = /\d/.test(password);
            var specialValid = /[!@#$%^&*]/.test(password);

            document.getElementById("length").classList.toggle("valid", lengthValid);
            document.getElementById("upper").classList.toggle("valid", upperValid);
            document.getElementById("lower").classList.toggle("valid", lowerValid);
            document.getElementById("number").classList.toggle("valid", numberValid);
            document.getElementById("special").classList.toggle("valid", specialValid);

            // Enable submit button only when all criteria are met
            var isValid = lengthValid && upperValid && lowerValid && numberValid && specialValid;
            document.getElementById("btnSubmit").disabled = !isValid;
        }
    </script>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server">
        <section class="py-5 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <h2>Create Your Project Network Password</h2>
                        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label>
                        <p>Enter your email and create a strong password using the criteria below:</p>

                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Password" OnKeyUp="validatePassword()" />

                        <ul class="password-criteria">
                            <li id="length">At least 8 characters</li>
                            <li id="upper">At least one uppercase letter (A-Z)</li>
                            <li id="lower">At least one lowercase letter (a-z)</li>
                            <li id="number">At least one number (0-9)</li>
                            <li id="special">At least one special character (!@#$%^&*)</li>
                        </ul>

                        <asp:Button ID="btnSubmit" runat="server" Text="Create Password" CssClass="btn btn-primary" OnClick="btnSubmit_Click" Enabled="false" />

                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </section>
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- #include virtual="/includes/footer.html" -->
    </form>
</body>
</html>
