<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="submit.aspx.vb" Inherits="M2M_Redesign.csSubmit" MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- #include virtual="/includes/include_head.html" -->
    <title>Case Study Submission Form</title>
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

        label span{
            font-weight:bold;
            color:red;
        }

  
        .form-group .required label:after {
            content: " *";
            color: red;
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

        .region-country-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 15px;
        }

        .region-country-container > div {
            flex: 1;
            min-width: 48%;
        }

        .hidden {
            display: none;
        }

        .tinted-box {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .tooltip-icon {
    margin-left: 5px;
    cursor: pointer;
    color: #007bff;
}

.tooltip-icon:hover {
    color: #0056b3;
}

.tooltip-icon i {
    font-size: 1rem;
}

    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            // When a region is selected, show the corresponding country list
            $('#ddlRegionalApplicability').change(function () {
                $('.country-container').addClass('hidden');
                $('#hiddenSelectedRegions').val($(this).val());

                $('#ddlRegionalApplicability option:selected').each(function () {
                    var region = $(this).val();
                    $('#' + region.replace('/', '') + 'Container').removeClass('hidden');
                });
            });

            // Trigger the change event on page load to handle postback scenarios
            $('#ddlRegionalApplicability').trigger('change');

            // Show or hide the online details section based on the selected radio button
            $('#rblCaseStudyOnline input').change(function () {
                if ($(this).val() === 'Yes') {
                    $('#onlineDetailsBox').removeClass('hidden');
                } else {
                    $('#onlineDetailsBox').addClass('hidden');
                }
            });

            // Trigger the change event on page load to handle postback scenarios
            $('#rblCaseStudyOnline input:checked').trigger('change');
        });
    </script>
</head>
<body>

    <style>
        .form-check input[type="radio"] {
    margin-right: 10px; /* Adjust the value as needed */
}
    </style>

    <!-- #include virtual="/includes/header.html" -->
    
                <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 vertSplitter">
                    <h1>Recommend a Case Study</h1>
                    <p>
                        GMI invites you to recommend a new case study to be included in our <a href="library/index.aspx">library</a>. Use the form to submit a recommendation for a case study that demonstrates innovative and successful projects, policies, technologies, and other activities aimed at mobilizing action and reducing global methane emissions. 
                        <br /><br />
Criteria for consideration in the GMI Case Study Library include:</p>
                        <ul>
                            <li>Case Study idea consists of actions taken or planned by governments, companies, or organizations, not just a description of technologies, and includes actual or projected results, such as methane emissions reductions, with take-aways and lessons learned to share.</li>
<li>Submitter is a member of one of the following GMI Stakeholder groups: GMI Partner Country, including cities, municipalities, or regions within one of these countries; Project Network Member; and/or Strategic Partner.</li>
<li>Submission includes complete information and responds to all required form fields.</li>
<li>Case studies submitted can either be concepts GMI will work with the submitter to produce or complete or readily available case studies that GMI can link to from the library.</li>

                        </ul>
                       <p>Please note that incomplete submissions may not be considered. GMI funding availability for the library and goals for project and geographic diversity will also be factors in whether a case study will be accepted and published in the library. 
                        

                    </p>
                </div>
             <div class="col-sm-4">
                 <h1>&nbsp;</h1>
                                        <div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>Review Process</strong></div>
                              
                                    
                                    <p class="m-3">The GMI Secretariat will review and select case study submissions to be linked to or developed in our case study template and posted on the GMI website on a rolling basis. In selecting case studies for completion, the Secretariat will strive to achieve diversity across sectors and regions. Submitters will receive a response as to the status of their recommendation during these quarterly review cycles. If selected, the Secretariat may follow up to obtain additional details as needed.</p>
                              
					</div>
                </div>
            </div>
        </div>
    </section>
<form id="form1" runat="server" class="container" style="margin-top:20px;">
    <div id="successMessageDiv" runat="server" visible="false">
    <asp:Label ID="lblThankYou" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>
</div>
    <!-- Contact Information -->
    <h3 style="font-weight: bold">Contact Information</h3>
    <p>Please provide the following information so we can follow up with you about your recommendation.</p>

    <!-- Your Name -->
    <div class="form-group required">
        <label for="txtSubmitterName" style="font-weight:bold">Your Name <span>*</span></label>
        <asp:TextBox ID="txtSubmitterName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSubmitterName" runat="server" ControlToValidate="txtSubmitterName"
            ErrorMessage="Your Name is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm"></asp:RequiredFieldValidator>
    </div>

    <!-- Your Organization -->
    <div class="form-group required">
        <label for="txtSubmitterOrg" style="font-weight:bold">Your Organization <span>*</span></label>
        <asp:TextBox ID="txtSubmitterOrg" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSubmitterOrg" runat="server" ControlToValidate="txtSubmitterOrg"
            ErrorMessage="Your Organization is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm"></asp:RequiredFieldValidator>
    </div>

    <!-- Your Email -->
    <div class="form-group required">
        <label for="txtSubmitterEmail" style="font-weight:bold">Your Email <span>*</span></label>
        <asp:TextBox ID="txtSubmitterEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSubmitterEmail" runat="server" ControlToValidate="txtSubmitterEmail"
            ErrorMessage="Your Email is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm"></asp:RequiredFieldValidator>
    </div>

    <!-- GMI Stakeholders Question -->
    <div class="form-group required">
        <label for="rblGmiStakeholders" style="font-weight:bold">
            Which of the following GMI stakeholders are you associated with? <span>*</span>
        </label>
<asp:RadioButtonList ID="rblGmiStakeholders" runat="server" CssClass="form-check" ValidationGroup="SubmitForm">
    <asp:ListItem Value="PartnerCountry">
        GMI Partner Country 
        <span class="tooltip-icon" title="Including city, municipality, or region within a Partner Country">
            <i class="fas fa-info-circle"></i>
        </span>
    </asp:ListItem>

    <asp:ListItem Value="ProjectNetwork">
        Project Network Member <span style="font-size:smaller;color:black;font-weight:normal;">(Not a member?  <a href='https://www.globalmethane.org/project-network' target="_blank">Learn more</a>.)</span>
    </asp:ListItem>

    <asp:ListItem Value="StrategicPartner">
        GMI Strategic Partner 
        <span class="tooltip-icon" title="e.g., United Nations Economic Commission for Europe, Climate and Clean Air Coalition, United Nations Environmental Programme, Global Methane Hub, World Bank">
            <i class="fas fa-info-circle"></i>
        </span>
    </asp:ListItem>
</asp:RadioButtonList>

        <asp:RequiredFieldValidator ID="rfvGmiStakeholders" runat="server" ControlToValidate="rblGmiStakeholders"
            InitialValue="" ErrorMessage="Please select a GMI stakeholder" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm"></asp:RequiredFieldValidator>
    </div>
     <h3 style="font-weight: bold">Basic Information About the Case Study</h3>
    <p>Use the following fields to tell us about the case study.</p>
    <!-- Lead Organization -->
    <div class="form-group required">
        <label for="txtLeadOrg" style="font-weight:bold">Lead Organization <span>*</span></label>
        <asp:TextBox ID="txtLeadOrg" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>

    <!-- Partner Organizations -->
    <div class="form-group">
        <label for="txtPartnerOrg" style="font-weight:bold">Partner Organizations (if applicable)</label>
        <asp:TextBox ID="txtPartnerOrg" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

        <!-- Proposed Title -->
    <div class="form-group required">
        <label for="proposedTitle" style="font-weight:bold">Proposed Case Study Title <span>*</span></label>
        <asp:TextBox ID="proposedTitle" runat="server" CssClass="form-control" required></asp:TextBox>
    </div>

    <!-- Case Study Location -->
    <div class="form-group required">
        <label for="txtLocation" style="font-weight:bold">Case Study Location <span>*</span>
            <br /><small>(City, country, or region where the case study took place)</small>
        </label>
        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation"
            ErrorMessage="Case Study Location is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm"></asp:RequiredFieldValidator>
    </div>

    <!-- Is the Case Study Available Online? -->
    <div class="form-group required">
        <label for="rblCaseStudyOnline" style="font-weight:bold">Is the Case Study Available Online? <span>*</span></label>
        <asp:RadioButtonList ID="rblCaseStudyOnline" runat="server" CssClass="form-check" ValidationGroup="SubmitForm">
            <asp:ListItem Value="Yes">Yes, it is published online</asp:ListItem>
            <asp:ListItem Value="Soon">Not yet, but expected to be published soon</asp:ListItem>
            <asp:ListItem Value="No">No, this will be a new case study</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="rfvCaseStudyOnline" runat="server" ControlToValidate="rblCaseStudyOnline"
            InitialValue="" ErrorMessage="Please indicate if the case study is available online" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm"></asp:RequiredFieldValidator>
    </div>

    <!-- Conditional Box for Online Case Study -->
    <div id="onlineDetailsBox" class="tinted-box hidden">
        <div class="form-group">
            <label for="txtCsPubDate" style="font-weight:bold">When was the case study published?</label>
            <asp:TextBox ID="txtCsPubDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCsPubDate" runat="server" ControlToValidate="txtCsPubDate"
                ErrorMessage="Please provide the publication date" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm" Enabled="false"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtCaseStudyUrl" style="font-weight:bold">Please provide the URL</label>
            <asp:TextBox ID="txtCaseStudyUrl" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCaseStudyUrl" runat="server" ControlToValidate="txtCaseStudyUrl"
                ErrorMessage="Please provide the URL" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm" Enabled="false"></asp:RequiredFieldValidator>
        </div>
    </div>

    <!-- Brief Summary -->
    <h3 style="font-weight: bold">Description of the Proposed Case Study</h3>
    <p>Please provide a short summary that highlights how your case study is relevant to GMI stakeholders.</p>
    <div class="form-group required">
        <label for="txtBriefSummary" style="font-weight:bold">Brief Summary <span>*</span></label>
        <asp:TextBox ID="txtBriefSummary" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvBriefSummary" runat="server" ControlToValidate="txtBriefSummary"
            ErrorMessage="Brief Summary is required" CssClass="text-danger" Display="Dynamic" ValidationGroup="SubmitForm"></asp:RequiredFieldValidator>
    </div>

    <!-- Submit Button -->
    <div class="form-group">
        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Button1_Click" ValidationGroup="SubmitForm" />
    </div>
               <h3 style="font-weight: bold"> Disclaimer</h3>
    <ul style="font-size:smaller">
<li>Selection of a case study submission does not represent an endorsement by GMI or its Partner Countries. Selection of case study submissions will be made solely at the discretion of the GMI Secretariat; submission of a case study in no way guarantees its selection.</li>
<li>By submitting the case study, regardless of whether the case study is selected, the submitter grants a non-exclusive, no-cost, worldwide, transferable, perpetual, irrevocable license to the GMI Secretariat and others acting on its behalf to publish, reproduce, edit, modify, create derivative works, publicly exhibit, display, transmit, broadcast, distribute and otherwise use the case study, including but not limited to its display on the GMI Case Study Library website.</li>
<li>By submitting the case study, the submitter warrants and represents that it is the sole owner of the case study and/or that the submitter has the legal right to enter into and fully perform this license and grant the rights contained herein.</li>
<li>Recommenders, submitters, and their respective organizations, recommend and/or submit case studies for inclusion in the GMI Case Study Library without compensation, without expectation of payment, and waive all claims to compensation.</li>
        </ul>
    
</form>

    <script type="text/javascript">
        function startCountdown() {
            var seconds = 10;
            var countdownDiv = document.getElementById("countdownDiv");
            var countdownTimer = setInterval(function () {
                countdownDiv.innerHTML = "Redirecting in " + seconds + " seconds...";
                seconds--;
                if (seconds < 0) {
                    clearInterval(countdownTimer);
                    window.location.href = "https://globalmethane.org/case-studies/library/index.aspx";
                }
            }, 1000);
        }
    </script>



              <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- #include virtual="/includes/footer.html" -->
</body>
</html>
