<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="organization.aspx.vb" Inherits="M2M_Redesign.organization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Project Network Organization | Global Methane Initiative</title>
    <!-- Include the header -->
    <!-- #include virtual="/includes/include_head.html" -->

    <style>
        body {
            background-color: #fff; /* White page background */
        }

        .breadcrumb-box {
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
            margin-bottom: 20px;
        }

        .breadcrumb a {
            text-decoration: none;
            color: #007bff;
        }

            .breadcrumb a:hover {
                text-decoration: underline;
            }

        .org-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
        }

            .org-header h1 {
                font-size: 1.5rem;
            }

        hr {
            border: 1px solid #333;
        }

        .content-section {
            margin-top: 20px;
        }

        .table-content {
            width: 100%;
            border-collapse: collapse;
        }

            .table-content td {
                padding: 10px;
                border-bottom: 1px solid #ccc;
                vertical-align: top;
            }

                .table-content td:first-child {
                    
                    width: 50%;
                }

        .contact-section a {
            color: #007bff;
            text-decoration: none;
        }

            .contact-section a:hover {
                text-decoration: underline;
            }

        .sectionHeader {
            font-weight: bold;
            color: #746a93;
            margin-top:20px;
        }

        .content-section{
            border-bottom:1px solid #746a93;
        }

        th{
            padding:10px;
        }

                /* Adjusting width for specific columns */
        .table-content th:first-child,
        .table-content td:first-child {
            width: 20%; /* Activity or Country column */
        }

        .table-content th:nth-child(2),
        .table-content td:nth-child(2) {
            width: 15%; /* Years column */
        }

        .table-content th:last-child,
        .table-content td:last-child {
            width: 65%; /* Highlights column - main focus */
        }

        #lnkWebsite{
            font-size: 12px; background: white; border-radius: 12px; padding: 4px; margin-left: 6px;
        }
    </style>

</head>

<body style="background: white!important">
    <!-- #include virtual="/includes/header.html" -->

    <form id="form1" runat="server">
        <!-- Breadcrumb Navigation -->
        <div class="container" style="background: white!important;">
            <div class="alert alert-primary d-flex align-items-center"
                style="background: #B9B1D8; border: #746a93; margin-top: 1rem; display: flex;">
                <img src="https://globalmethane.org/assets/images/gmipn2.svg" style="width: 100px; height: auto; margin-right: 1rem;">
                <h1 style="margin: 0;">Project Network Member</h1>
            </div>

            <nav aria-label="breadcrumb" style="display:none;">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/project-network/find-an-expert.aspx">Find An Expert</a></li>
                    <li class="breadcrumb-item active" aria-current="page">
                        <asp:Label ID="lblOrgNameBreadcrumb" runat="server" />
                    </li>
                </ol>
            </nav>
        </div>

             <!-- Main Content Container -->
        <div class="container" style="background: white!important;">
            <div class="alert" style="background: #E9E6EE!important; border: #746a93;">
                <div class="org-header">
                    <h1>
                        <asp:Label ID="lblOrgName" runat="server" />
                        <span>
                            <asp:HyperLink ID="lnkWebsite" runat="server" Target="_blank"></asp:HyperLink>
                        </span>
                    </h1>
                    <div>
                        Location:
                        <asp:Label ID="lblHeadquarters" runat="server" />
                        <span>| </span>Last Updated:
                        <asp:Label ID="lblLastUpdated" runat="server" />
                    </div>
                </div>
                <hr />

            <!-- Introduction Section -->
                <div class="content-section">
                    <h3 class="sectionHeader" id="introTag">Introduction</h3>
                    <div class="row">
                        <div class="col-md-8">
                            <p><asp:Label ID="lblDescription" runat="server" /></p>
                        </div>
                        <div class="col-md-4 mb-4">
                            <div class="border border-secondary bg-white px-0">
                                <div class="py-1 text-center bg-dark text-white"><strong>On This Page</strong></div>
                                <ul class="list-group py-2" id="onThisPageList">
                                    <li class="list-group-item noborder nobackground py-1" id="sectorLink" runat="server"><a href="#sectorTag">Sectors</a></li>
                                    <li class="list-group-item noborder nobackground py-1" id="activityLink" runat="server"><a href="#activityTag">Activities</a></li>
                                    <li class="list-group-item noborder nobackground py-1" id="countryLink" runat="server"><a href="#countryTag">Countries</a></li>
                                    <li class="list-group-item noborder nobackground py-1" id="contactLink" runat="server"><a href="#contactTag">Contacts</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sectors Section -->
                <asp:Panel ID="pnlSectors" runat="server">
                    <div class="content-section">
                        <h3 class="sectionHeader" id="sectorTag">Sectors</h3>
                        <asp:Literal ID="litSectors" runat="server"></asp:Literal>
                    </div>
                </asp:Panel>

                <!-- Activities Section -->
                <asp:Panel ID="pnlActivities" runat="server">
                    <div class="content-section">
                        <h3 class="sectionHeader" id="activityTag">Activities</h3>
                        <asp:Literal ID="litActivities" runat="server"></asp:Literal>
                    </div>
                </asp:Panel>


                <!-- Countries Section -->
                <asp:Panel ID="pnlCountries" runat="server">
                    <div class="content-section">
                        <h3 class="sectionHeader" id="countryTag">Countries</h3>
                        <asp:Literal ID="litCountries" runat="server"></asp:Literal>
                    </div>
                </asp:Panel>


                <!-- Contacts Section -->
                <asp:Panel ID="pnlContacts" runat="server">
                    <div class="content-section contact-section">
                        <h3 class="sectionHeader" id="contactTag">Contacts</h3>
                        <p>For more information about this Project Network member, reach out to the following point(s) of contact.</p>
                        <asp:Label ID="lblNoContacts" runat="server" Text="No contacts available." Visible="False" CssClass="text-danger" />

                        <!-- Contact List for fewer than 6 -->
                        <asp:PlaceHolder ID="contactListContainer" runat="server" Visible="False">
                        </asp:PlaceHolder>

                        <!-- DataTable for Contacts (visible only if 6 or more contacts) -->
                        <asp:Panel ID="pnlContactsTable" runat="server" Visible="False">
                            <table id="contactsTable" class="display" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Title</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Literal ID="litContactsTable" runat="server"></asp:Literal>
                                </tbody>
                            </table>
                        </asp:Panel>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Include jQuery and DataTables JS and CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#contactsTable').DataTable({
                searching: true,
                paging: true,
                ordering: true,
                columnDefs: [
                    { targets: [0, 1], searchable: true }  // Enable search for Name and Title columns
                ]
            });
        });
    </script>

    <!-- Include the footer -->
    <!-- #include virtual="/includes/footer.html" -->

</body>

</html>
