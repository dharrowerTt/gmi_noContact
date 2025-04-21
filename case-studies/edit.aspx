<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit.aspx.vb" Inherits="M2M_Redesign.csEdit" MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- #include virtual="/includes/include_head.html" -->
    <title>Edit Case Study</title>
    <link rel="stylesheet" href="/css/bootstrap.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            background-color: #f5f5f5;
            background-image: url('background.svg');
            background-size: cover;
            background-position: center;
            color: #333;
        }

        .char-counter {
            font-size: 0.9em;
            color: #555;
            text-align: right;
        }

        .char-counter.warning {
            color: #FFA500;
        }

        .char-counter.danger {
            color: #FF0000;
        }

        .tinted-box {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .version-block {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .version-block .version-number {
            font-size: 1.2em;
        }

        .version-block .navigation-buttons {
            display: flex;
            gap: 10px;
        }

        .version-block .navigation-buttons button {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 3px;
            cursor: pointer;
        }

        .version-block .navigation-buttons button[disabled] {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $('#rblCaseStudyOnline input').change(function () {
                if ($(this).val() === 'Yes') {
                    $('#onlineDetailsBox').removeClass('hidden');
                } else {
                    $('#onlineDetailsBox').addClass('hidden');
                }
            });

            $('#rblCaseStudyOnline input:checked').trigger('change');
        });

        function navigateVersion(direction) {
            const currentVersion = parseInt('<%= lblVersionNumber.Text %>');
            let targetVersion = direction === 'previous' ? currentVersion - 1 : currentVersion + 1;
            window.location.href = 'edit.aspx?id=<%= Request.QueryString("id") %>&version=' + targetVersion;
        }
    </script>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server" class="container">
        <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
        <h2 class="mb-4" style="text-align:center">Edit Case Study</h2>

        <!-- Version Block -->
        <div class="version-block">
            <div class="version-number">
                Version: <asp:Label ID="lblVersionNumber" runat="server" />
            </div>
            <div class="navigation-buttons">
                <asp:Button ID="btnPreviousVersion" runat="server" Text="← Previous" CssClass="btn btn-primary" OnClick="btnPreviousVersion_Click" />
                <asp:Button ID="btnNextVersion" runat="server" Text="Next →" CssClass="btn btn-primary" OnClick="btnNextVersion_Click" />
            </div>
        </div>

        <!-- Contact Information -->
        <h3 style="font-weight: bold">Contact Information</h3>

        <!-- Your Name -->
        <div class="form-group">
            <label for="txtSubmitterName" style="font-weight:bold">Your Name</label>
            <asp:TextBox ID="txtSubmitterName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Your Email -->
        <div class="form-group">
            <label for="txtSubmitterEmail" style="font-weight:bold">Your Email</label>
            <asp:TextBox ID="txtSubmitterEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Point of Contact Information -->
        <div class="form-group">
            <label for="txtPocInfo" style="font-weight:bold">Point of contact information for follow up, other than you</label>
            <asp:TextBox ID="txtPocInfo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>

        <h3 style="font-weight: bold">Basic Information About the Case Study</h3>

        <!-- Lead Organization -->
        <div class="form-group">
            <label for="txtSubmitterOrg" style="font-weight:bold">Lead Organization</label>
            <asp:TextBox ID="txtSubmitterOrg" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Partner Organizations -->
        <div class="form-group">
            <label for="txtPartners" style="font-weight:bold">Partner Organizations (if applicable)</label>
            <asp:TextBox ID="txtPartners" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>

        <!-- Proposed Case Study Title -->
        <div class="form-group">
            <label for="txtCaseStudyTitle" style="font-weight:bold">Proposed Case Study Title</label>
            <asp:TextBox ID="txtCaseStudyTitle" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Case Study Location -->
        <div class="form-group">
            <label for="txtCaseStudyLocation" style="font-weight:bold">Case Study Location
                <br />
                <small>(the location of activities described in the case study, such as the city, state, and country, or other geographic region)</small></label>
            <asp:TextBox ID="txtCaseStudyLocation" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Is the Case Study Available Online? -->
        <div class="form-group">
            <label for="rblCaseStudyOnline" style="font-weight:bold">Is the Case Study Available Online?</label>
            <asp:RadioButtonList ID="rblCaseStudyOnline" runat="server" CssClass="form-check">
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <!-- Conditional Box for Online Case Study -->
        <div id="onlineDetailsBox" class="tinted-box hidden">
            <h4>If the case study is available online:</h4>

            <!-- URL -->
            <div class="form-group">
                <label for="txtCaseStudyUrl" style="font-weight:bold">What is the URL?</label>
                <asp:TextBox ID="txtCaseStudyUrl" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Case Study Publication Date -->
            <div class="form-group">
                <label for="txtCsPubDate" style="font-weight:bold">When was the case study published?</label>
                <asp:TextBox ID="txtCsPubDate" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <!-- Brief Summary -->
        <div class="form-group">
            <label for="txtBriefSummary" style="font-weight:bold">Brief Summary</label>
            <asp:TextBox ID="txtBriefSummary" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            <div id="charCountSummary" class="char-counter">1000 characters remaining</div>
        </div>

        <!-- Keywords -->
        <div class="form-group">
            <label for="txtKeywords" style="font-weight:bold">Keywords</label>
            <asp:TextBox ID="txtKeywords" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            <div id="charCountKeywords" class="char-counter">200 characters remaining</div>
        </div>

        <h3 style="font-weight:bold">Attributes of the Case Study</h3>

        <!-- Topic(s) -->
        <div class="form-group">
            <label for="txtTopics" style="font-weight:bold">Topic(s)</label>
            <asp:TextBox ID="txtTopics" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Start Date -->
        <div class="form-group">
            <label for="txtStartDate" style="font-weight:bold">Start Date</label>
            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- End Date (if applicable) -->
        <div class="form-group">
            <label for="txtEndDate" style="font-weight:bold">End Date (if applicable)</label>
            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- GMI Sector(s) -->
        <div class="form-group">
            <label for="txtGmiSectors" style="font-weight:bold">GMI Sector(s)</label>
            <asp:TextBox ID="txtGmiSectors" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Other Sector(s) -->
        <div class="form-group">
            <label for="txtOtherSectors" style="font-weight:bold">Other Sector(s)</label>
            <asp:TextBox ID="txtOtherSectors" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Regional Applicability -->
        <div class="form-group">
            <label for="txtRegionalApplicability" style="font-weight:bold">Regional Applicability</label>
            <asp:TextBox ID="txtRegionalApplicability" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Country Applicability -->
        <div class="form-group">
            <label for="txtCountryApplicability" style="font-weight:bold">Country Applicability</label>
            <asp:TextBox ID="txtCountryApplicability" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Source -->
        <div class="form-group">
            <label for="txtSource" style="font-weight:bold">Source</label>
            <asp:TextBox ID="txtSource" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- Status -->
        <div class="form-group">
            <label for="ddlStatus" style="font-weight:bold">Status</label>
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                <asp:ListItem Value="submitted">Submitted</asp:ListItem>
                <asp:ListItem Value="awaiting approval">Awaiting Approval</asp:ListItem>
                <asp:ListItem Value="published">Published</asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Submit Button -->
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="Button1_Click" />
        </div>
    </form>
    <!-- #include virtual="/includes/footer.html" -->
</body>
</html>
