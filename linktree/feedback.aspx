<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="feedback.aspx.vb" Inherits="M2M_Redesign.feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Link Tree - Agenda | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <script>
        function setCookie(cname, cvalue, exdays) {
            const d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            let expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        function getCookie(cname) {
            let name = cname + "=";
            let decodedCookie = decodeURIComponent(document.cookie);
            let ca = decodedCookie.split(';');
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            let user = getCookie("userid");
            if (user != "") {
                console.log("Welcome again " + user);
            } else {

                function getQueryVariable(variable) {
                    var query = window.location.search.substring(1);
                    var vars = query.split("&");
                    for (var i = 0; i < vars.length; i++) {
                        var pair = vars[i].split("=");
                        if (pair[0] == variable) { return pair[1]; }
                    }
                    return (false);
                }

                user = getQueryVariable("id");

                if (user != "" && user != null) {
                    setCookie("userid", user, 30);
                } else {
                    window.location.href = "http://www.globalmethane.org/2024forum";
                }
            }
        }
    </script>
    <style>
        body {
            padding-top: 5rem;
        }

        svg {
            width: 20px;
            text-align: center;
        }

        table td:first-child {
            text-align: center;
        }

        ​
    </style>
    <script src="../2024forum/js/daypilot/daypilot-all.min.js"></script>
</head>
<body onload="checkCookie()">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.aspx">Home</a>
            <a class="navbar-toggler" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </a>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">

                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="agenda.aspx">Review Agenda</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="connections.aspx">Make Connections</a>
                    </li>
                    <li class="nav-item active ">
                        <a class="nav-link" href="feedback.aspx">Session Feedback  <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="photos.aspx">Submit Photos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://forms.office.com/Pages/DesignPageV2.aspx?subpage=design&token=2463cbdf7b1c4c55a4fb65a4a68bd841&wdlor=cD8B70A01-E6F5-4F61-BC54-8F3163DAE134&id=uuQPpMer_kiHkrQ4iZNkAOHm6AdDWoNOmsvV4WobLu9UOU9DWVE0M0ZJQlpVVlNBU09FVEVBREdHRy4u&topview=Preview" target="_blank">Evaluate the Forum</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-9">
                        <h2>Submit Feedback</h2>
                        <p>Select a session from the dropdown menu and fill in the feedback section.</p>
                    </div>
                    <div class="col-md-9" style="display: none;">
                        <div class="form-group">
                            <label for="user">User</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="user"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <label for="session">Session List<span style="color: red;">*</span></label>
                        <div style="color: red;"><%= SessionNote  %> </div>
                        <asp:DropDownList class="form-control" name="ddlItems" ID="ddlCategories" required="true" runat="server">
                            <asp:ListItem Value="">--Select a Session--</asp:ListItem>
                            <asp:ListItem Value="">Monday, 18 March 2024</asp:ListItem>
                            <asp:ListItem Value="">&nbsp;&nbsp;Biogas Technical Sessions</asp:ListItem>
                            <asp:ListItem Value="Welcome and Opening of the Session">&nbsp;&nbsp;&nbsp;&nbsp;Welcome and Opening of the Session</asp:ListItem>
                            <asp:ListItem Value="Regional Methane Action Showcase: Southeast Europe">&nbsp;&nbsp;&nbsp;&nbsp;Regional Methane Action Showcase: Southeast Europe</asp:ListItem>
                            <asp:ListItem Value="Discussion: Lessons Learned from Methane Reduction Projects in Southeast Europe">&nbsp;&nbsp;&nbsp;&nbsp;Discussion: Lessons Learned from Methane Reduction Projects in Southeast Europe</asp:ListItem>
                            <asp:ListItem Value="Regional Methane Action Showcase: Latin America">&nbsp;&nbsp;&nbsp;&nbsp;Regional Methane Action Showcase: Latin America</asp:ListItem>
                            <asp:ListItem Value="">&nbsp;&nbsp;Coal Technical Sessions</asp:ListItem>
                            <asp:ListItem Value="GMI Coal Mines Subcommittee and Sector Updates">&nbsp;&nbsp;&nbsp;&nbsp;GMI Coal Mines Subcommittee and Sector Updates</asp:ListItem>
                            <asp:ListItem Value="Stakeholder Updates">&nbsp;&nbsp;&nbsp;&nbsp;Stakeholder Updates </asp:ListItem>
                            <asp:ListItem Value="Updates on Capabilities to Mitigate Ventilation Air Methane (VAM)">&nbsp;&nbsp;&nbsp;&nbsp;Updates on Capabilities to Mitigate Ventilation Air Methane (VAM)</asp:ListItem>
                            <asp:ListItem Value="">Tuesday, 19 March 2024</asp:ListItem>
                            <asp:ListItem Value="Keynote Session: A Global Call to Mobilize Methane Action">&nbsp;&nbsp;&nbsp;&nbsp;Keynote Session: A Global Call to Mobilize Methane Action</asp:ListItem>
                            <asp:ListItem Value="Governments as Vital Drivers to Mobilize Methane Action">&nbsp;&nbsp;&nbsp;&nbsp;Governments as Vital Drivers to Mobilize Methane Action</asp:ListItem>
                            <asp:ListItem Value="The Importance of Industry to Mobilizing Methane Action">&nbsp;&nbsp;&nbsp;&nbsp;The Importance of Industry to Mobilizing Methane Action</asp:ListItem>
                            <asp:ListItem Value="The Value of Data as a Driver to Mobilize Methane Action">&nbsp;&nbsp;&nbsp;&nbsp;The Value of Data as a Driver to Mobilize Methane Action</asp:ListItem>
                            <asp:ListItem Value="Catalyzing Finance to Mobilize Methane Action">&nbsp;&nbsp;&nbsp;&nbsp;Catalyzing Finance to Mobilize Methane Action</asp:ListItem>
                            <asp:ListItem Value="Succeeding Locally to Mobilize Methane Action">&nbsp;&nbsp;&nbsp;&nbsp;Succeeding Locally to Mobilize Methane Action</asp:ListItem>
                            <asp:ListItem Value="">Wednesday, 20 March 2024</asp:ListItem>
                            <asp:ListItem Value="">&nbsp;&nbsp;Biogas Technical Sessions</asp:ListItem>
                            <asp:ListItem Value="Implementing Biogas Policies in Germany and the Outlook for the European Union">&nbsp;&nbsp;&nbsp;&nbsp;Implementing Biogas Policies in Germany and the Outlook for the European Union</asp:ListItem>
                            <asp:ListItem Value="The Importance of Data Collection and Monitoring, Reporting, and Verification (MRV) to Financing Projects in the Biogas Sector">&nbsp;&nbsp;&nbsp;&nbsp;The Importance of Data Collection and Monitoring, Reporting, and Verification (MRV) to Financing Projects in the Biogas Sector</asp:ListItem>
                            <asp:ListItem Value="Regional Biogas Methane Action Showcase: India">&nbsp;&nbsp;&nbsp;&nbsp;Regional Biogas Methane Action Showcase: India</asp:ListItem>
                            <asp:ListItem Value="Environmental Justice Considerations for the Implementation of Methane Reduction Projects">&nbsp;&nbsp;&nbsp;&nbsp;Environmental Justice Considerations for the Implementation of Methane Reduction Projects</asp:ListItem>
                            <asp:ListItem Value="">Coal Joint Technical Sessions</asp:ListItem>
                            <asp:ListItem Value="Measurement, Reporting, Verification and Reconciling Estimates">&nbsp;&nbsp;&nbsp;&nbsp;Measurement, Reporting, Verification and Reconciling Estimates</asp:ListItem>
                            <asp:ListItem Value="Data Needs for Project Development, Carbon Markets, and Policy">&nbsp;&nbsp;&nbsp;&nbsp;Data Needs for Project Development, Carbon Markets, and Policy</asp:ListItem>
                            <asp:ListItem Value="Transforming Energy Sector Infrastructure">&nbsp;&nbsp;&nbsp;&nbsp;Transforming Energy Sector Infrastructure</asp:ListItem>
                            <asp:ListItem Value="">&nbsp;&nbsp;Oil & Gas Joint Technical Sessions</asp:ListItem>
                            <asp:ListItem Value="The Role of Monitoring, Reporting, and Verification (MRV) in Addressing Methane Emissions">&nbsp;&nbsp;&nbsp;&nbsp;The Role of Monitoring, Reporting, and Verification (MRV) in Addressing Methane Emissions</asp:ListItem>
                            <asp:ListItem Value="The Role of Technologies in Improving Measurements and Enhancing Inventories to Enable Faster Action">&nbsp;&nbsp;&nbsp;&nbsp;The Role of Technologies in Improving Measurements and Enhancing Inventories to Enable Faster Action</asp:ListItem>
                            <asp:ListItem Value="Resources for Government Ministries to Support Development of Effective Methane Policy and Regulation">&nbsp;&nbsp;&nbsp;&nbsp;Resources for Government Ministries to Support Development of Effective Methane Policy and Regulation</asp:ListItem>
                            <asp:ListItem Value="Available Tools for Quantifying Emissions">&nbsp;&nbsp;&nbsp;&nbsp;Available Tools for Quantifying Emissions</asp:ListItem>
                            <asp:ListItem Value="Overcoming Challenges for Methane Management to Mobilize Action in the Oil & Gas Sector">&nbsp;&nbsp;&nbsp;&nbsp;Overcoming Challenges for Methane Management to Mobilize Action in the Oil & Gas Sector</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-9">
                        <div class="form-group">
                            <label for="noteArea">Note</label>
                            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="feedback" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-9" id="alertBox" style="display: none;">
                        <div class="alert alert-success" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Thank you!</strong> Feedback received, feel free to leave feedback on another session.
                        </div>
                    </div>
                    <div class="col-md-9">
                        <asp:LinkButton runat="server" ID="addFeedback" CssClass="btn btn-primary">Submit</asp:LinkButton>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- -->
                            <div id="myFeedbackSection" runat="server">
                                <h2>My Submitted Feedback</h2>
                                <asp:GridView ID="feedList" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="feedbackid" HeaderText="feedbackID" />
                                        <asp:BoundField DataField="session" HeaderText="Session" />
                                        <asp:BoundField DataField="feedback" HeaderText="Feedback" />


                                    </Columns>
                                </asp:GridView>

                                <hr />
                            </div>
                            <!-- -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />


    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery.cookie@1.4.1/jquery.cookie.min.js"></script>
    <script type="text/javascript">

        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) { return pair[1]; }
            }
            return (false);
        }

        user = getQueryVariable("s");

        if (user.length > 4) {
            document.getElementById("alertBox").style.display = "block";


            window.setTimeout(function () {
                $(".alert").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 4000);

        }

        $(document).ready(function () {
            var Commstable = $('#feedList').DataTable({
                orderCellsTop: true,
                "order": [[1, "desc"]],
                columnDefs: [
                    {
                        "render": function (data, type, row) {
                            return '<a href="removeFeedback.aspx?id=' + row[0] + '"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#A0153E"  style="fill: #A0153E" d="M432 256c0 17.7-14.3 32-32 32L48 288c-17.7 0-32-14.3-32-32s14.3-32 32-32l352 0c17.7 0 32 14.3 32 32z"/></svg> </a>';
                        },
                        "title": "Delete",
                        "targets": [0]
                    }]
            });

        });



    </script>

    <script>
        window.onload = function () {
            function populateFormFields() {

                const idValue = getCookie("userid");


                document.getElementById('user').value = idValue || '';

            }

            populateFormFields(); // Call the function when the window is fully loaded
        };
    </script>

</body>
</html>
