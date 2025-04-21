<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit-user.aspx.vb" Inherits="M2M_Redesign.edit_user" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User Profile | Project Network Members App</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
        body {
            background-color: #E9E6EE;
        }
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }
        .dashboard-header h1 {
            font-size: 1.5rem;
        }
        hr {
            border: 1px solid #333;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: #746a93;
            border-color: #746a93;
        }
        .btn-primary:hover {
            background-color: #5a4d9c;
        }
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server">
        <section class="py-5 bg-white" style="background:#E9E6EE!important">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- Dashboard Header -->
                        <div class="dashboard-header">
                            <h1>Project Network Members App</h1>
                            <!-- Wrap Literal in span for styling -->
                            <span class="text-right">
                                <asp:Literal ID="litUserNameOrg" runat="server"></asp:Literal>
                            </span>
                        </div>
                        <hr />
                        <!-- Error message display -->
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger"></asp:Label>
                        <!-- Form Section for User Profile -->
                        <h2>Edit Profile for <asp:Label ID="lblUserName" runat="server"></asp:Label></h2>

                        <div class="form-group">
                            <label for="salutation">Salutation</label>
                            <asp:TextBox ID="txtSalutation" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="suffix">Suffix</label>
                            <asp:TextBox ID="txtSuffix" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="title">Title</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                        </div>

                        <asp:Button ID="btnUpdateProfile" runat="server" CssClass="btn btn-primary" Text="Update Profile" OnClick="btnUpdateProfile_Click" />
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
