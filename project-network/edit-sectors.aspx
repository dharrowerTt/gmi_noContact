<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit-sectors.aspx.vb" Inherits="M2M_Redesign.edit_sectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Project Network Members App | Edit Sectors</title>
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

        .content-section {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
            margin-top: 20px;
        }

        h3 {
            margin-bottom: 10px;
            color: #746a93;
        }

        h4 {
            margin-top: 15px;
            color: #4d4d4d;
        }

        label {
            font-weight: normal;
            display: block;
        }

        .form-group {
            margin-bottom: 20px;
        }

        #btnSaveSectors {
            background-color: #746a93;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        #btnSaveSectors:hover {
            background-color: #5e5884;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

    <!-- #include virtual="/includes/header.html" -->

    <form id="form1" runat="server">
        <section class="py-5 bg-white" style="background:#E9E6EE!important;">
            <div class="container">
                <div class="dashboard-header">
                    <h1>Project Network Members App</h1>
                    <asp:Label ID="lblUserDetails" runat="server" CssClass="text-right"></asp:Label>
                </div>
                <hr />
                 <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="False"></asp:Label>
                <h2><asp:Label ID="lblOrgName" runat="server"></asp:Label></h2>
                
                <div class="content-section">
                    
                    <h3>Select Sector Experience</h3>
                    <p>Check each item for which your organization offers expertise or experience. Your selections will help others find you.</p>
                    <asp:Literal ID="litSectors" runat="server"></asp:Literal>

                   
                </div>

                <div class="form-group">
                    <asp:Button ID="btnSaveSectors" runat="server" Text="Save Sectors" OnClick="btnSaveSectors_Click" />
                </div>
            </div>
        </section>
    </form>

    <!-- #include virtual="/includes/footer.html" -->

</body>

</html>
