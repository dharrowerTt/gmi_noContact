<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="member-reminder.aspx.vb" Inherits="M2M_Redesign.member_reminder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Network Password Reminder | GMI</title>
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server">
        <section class="py-5 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <h2>Forgot Password?</h2>
                        <p>If you forgot your password, enter your email below to receive a reset link.</p>

                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                        <asp:Button ID="btnReset" runat="server" Text="Send Reset Link" CssClass="btn btn-primary" OnClick="btnReset_Click" />
                        
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
