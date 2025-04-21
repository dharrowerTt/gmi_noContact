<%@ Page Title="Edit Case Study" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="csEdit.aspx.vb" Inherits="M2M_Redesign.csEdit1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Edit Case Study
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="py-5 bg-light">
        <style>
    /* Ensure all labels stay above the fields */
    .form-group, .col-md-4, .col-md-6 {
        display: flex;
        flex-direction: column;
    }

    /* Adjust label styling for better alignment */
    label {
        margin-bottom: 0.5rem;
   
    }

    /* Maintain alignment of Select2 fields */
    .select2-container {
        width: 100% !important;
    }
</style>

        <div class="container">
            <h2>Edit Case Study</h2>
            <p class="text-muted">
                Use this form to create or edit a case study. Fields marked with <span class="text-danger">*</span> are required.
            </p>
            <form id="caseStudyForm" runat="server" enctype="multipart/form-data">
                <!-- Submitter Information -->
                <fieldset class="border p-3 mb-4">
                    <legend class="w-auto">Submitter Information</legend>
                    <div class="row">
                        <div class="col-md-4">
                            <label for="submitterName">Name <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtSubmitterName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label for="submitterEmail">Email <span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtSubmitterEmail" runat="server" CssClass="form-control" TextMode="Email" />
                        </div>
                        <div class="col-md-4">
                            <label for="submitterOrg">Organization</label>
                            <asp:TextBox ID="txtSubmitterOrg" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                </fieldset>

                <!-- Case Study Details -->
                <fieldset class="border p-3 mb-4">
                    <legend class="w-auto">Case Study Details</legend>
                    <div class="form-group">
                        <label for="csTitle">Title <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtCSTitle" runat="server" CssClass="form-control" />
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label for="csLocation">Location</label>
                            <asp:TextBox ID="txtCSLocation" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label for="partners">Partners</label>
                            <asp:TextBox ID="txtPartners" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label for="topics">Topics</label>
                            <asp:DropDownList ID="ddlTopics" runat="server" CssClass="form-control select2" Multiple="true"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="csPubDate">Publication Date</label>
                        <asp:TextBox ID="txtCSPubDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="form-group">
                        <label for="briefSummary">Brief Summary</label>
                        <asp:TextBox ID="txtBriefSummary" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                    </div>
                </fieldset>

                <!-- More Information -->
                <fieldset class="border p-3 mb-4">
                    <legend class="w-auto">More Information</legend>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="gmiSectors">GMI Sectors</label>
                            <asp:DropDownList ID="ddlGMISectors" runat="server" CssClass="form-control select2" Multiple="true"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label for="countryApplicability">Country Applicability</label>
                            <asp:DropDownList ID="ddlCountryApplicability" runat="server" CssClass="form-control select2" Multiple="true"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:CheckBox ID="chkAvailableOnline" runat="server" Text="Available Online" CssClass="form-check-input" />
                            <label for="url">URL</label>
                            <asp:TextBox ID="txtURL" runat="server" CssClass="form-control" TextMode="Url" Enabled="false" />
                        </div>
                        <div class="col-md-6">
                            <label for="learnMoreURL">Learn More URL</label>
                            <asp:TextBox ID="txtLearnMoreURL" runat="server" CssClass="form-control" TextMode="Url" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="csType">Case Study Type</label>
                        <asp:DropDownList ID="ddlCSType" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Poster">Poster</asp:ListItem>
                            <asp:ListItem Value="Case Study">Case Study</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="thumbnail">Thumbnail Image</label>
                        <asp:FileUpload ID="fileThumbnail" runat="server" CssClass="form-control-file" />
                    </div>
                </fieldset>

                <!-- Actions -->
                <div class="form-group text-right">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Save Case Study" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-secondary" Text="Cancel" OnClientClick="history.back(); return false;" />
                </div>
            </form>
        </div>
    </section>

    <!-- Include jQuery and Select2 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Initialize Select2 for all multi-select dropdowns
            $('.select2').select2();

            // Enable/Disable URL field based on checkbox
            document.getElementById('<%= chkAvailableOnline.ClientID %>').addEventListener('change', function () {
                document.getElementById('<%= txtURL.ClientID %>').disabled = !this.checked;
            });
        });
    </script>
</asp:Content>
