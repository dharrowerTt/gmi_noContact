<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit-activities.aspx.vb" Inherits="M2M_Redesign.edit_activities" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Network Members App | Edit Activities</title>
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

        label {
            font-weight: normal;
            display: block;
        }

        .form-group {
            margin-bottom: 20px;
        }

        #btnSaveActivities {
            background-color: #746a93;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        #btnSaveActivities:hover {
            background-color: #5e5884;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }

        .success-message {
            color: green;
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
                <asp:Label ID="lblSuccessMessage" runat="server" CssClass="success-message" Visible="False"></asp:Label>

                <h2><asp:Label ID="lblOrgName" runat="server"></asp:Label></h2>

                <div class="content-section">
                    <h3>Select Activity Experience</h3>
                    <p>Select activities for which your organization offers expertise or experience. You can also identify the years of experience per activity and add project highlights.</p>
                    <div class="form-group">
                        <label for="ddlActivity">Activity</label>
                        <asp:DropDownList ID="ddlActivity" runat="server" CssClass="form-control" AutoPostBack="False"></asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="txtYearsExperience">Years of Experience</label>
                        <asp:TextBox ID="txtYearsExperience" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtHighlights">Highlights</label>
                        <asp:TextBox ID="txtHighlights" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSaveActivities" runat="server" Text="Save Activity Experience" OnClick="btnSaveActivities_Click" />
                    </div>
                </div>
            </div>
        </section>
    </form>

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function() {
        $('#<%= ddlActivity.ClientID %>').select2({
            placeholder: 'Select an activity',
            allowClear: true
        });
    });
    </script>

    <!-- #include virtual="/includes/footer.html" -->
</body>
</html>
