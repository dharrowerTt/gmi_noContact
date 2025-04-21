<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reset-password.aspx.vb" Inherits="M2M_Redesign.reset_password" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password | GMI Project Network</title>
    <!-- Include header and styles -->
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- Include navigation header -->
    <!-- #include virtual="/includes/header.html" -->

    <form id="form1" runat="server">
        <section class="py-5 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <h2>Reset Your Password</h2>

                        <!-- Error message label -->
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>

                        <!-- New Password Field -->
                        <div class="form-group">
                            <label for="newPassword">New Password</label>
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        </div>

                        <!-- Confirm Password Field -->
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                        </div>

                        <!-- Submit Button -->
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Reset Password" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </section>

        <!-- Include footer -->
        <!-- #include virtual="/includes/footer.html" -->

    </form>

    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
