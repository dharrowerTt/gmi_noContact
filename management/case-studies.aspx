<%@ Page Title="Case Studies" Language="vb" MasterPageFile="~/management/MasterPage.master" AutoEventWireup="false" CodeBehind="case-studies.aspx.vb" Inherits="M2M_Redesign.case_studies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Case Studies
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <style>
    .card-header{
        font-weight:bold;
    }
</style>
    <div class="container-fluid">
        <!-- Section where selected case study details will be displayed -->
        <div class="row mb-3">
            <div class="col-md-12">
                <div id="caseStudyDetails" class="card text-dark bg-light mb-3">
                    <div class="card-header text-center">
                        <% If selectedCaseStudy IsNot Nothing Then %><a href="docresults.htm">docresults.htm</a>
                            <strong style="font-size: 1.5em; font-family: Arial, sans-serif;">
                                <%= selectedCaseStudy("proposedTitle") %>
                            </strong>
                        <% Else %>
                            Selected Case Study
                        <% End If %>
                    </div>
                    <div class="card-body">
                        <% If selectedCaseStudy IsNot Nothing Then %>
                            <p><strong>Organization:</strong> <%= selectedCaseStudy("submitterOrg") %></p>
                            <p><strong>Submitter:</strong> <%= selectedCaseStudy("submitterName") %></p>
                            <p><strong>Email:</strong> <a href="mailto:<%= selectedCaseStudy("submitterEmail") %>"><%= selectedCaseStudy("submitterEmail") %></a></p>
                            <p><strong>Stakeholder Type:</strong> <%= FormatStakeholderType(selectedCaseStudy("stakeholderType")) %></p>
                            <p><strong>Lead Organization:</strong> <%= selectedCaseStudy("leadOrg") %></p>
                            <p><strong>Partner Organizations:</strong> <%= selectedCaseStudy("partnerOrg") %></p>
                            <p><strong>Location:</strong> <%= selectedCaseStudy("location") %></p>
                            <p><strong>Published:</strong> <%= If(selectedCaseStudy("online") = "Yes", "Yes (Published on " & selectedCaseStudy("whenpublished") & ")", "No") %></p>
                            <p><strong>URL:</strong> <a href="<%= selectedCaseStudy("url") %>" target="_blank"><%= selectedCaseStudy("url") %></a></p>
                            <p><strong>Description:</strong> <%= selectedCaseStudy("description") %></p>
                            <p><strong>Date Submitted:</strong> <%= DateTime.Parse(selectedCaseStudy("DateSubmitted")).ToString("MM/dd/yyyy") %></p>
                        <% Else %>
                            <p>Select a case study from the table below to view details here.</p>
                        <% End If %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Export button for selected case study (hidden if no case study is selected) -->
        <% If selectedCaseStudy IsNot Nothing Then %>
        <div class="row mb-3">
            <div class="col-md-12 text-center">
                <button id="exportButton" class="btn btn-secondary" onclick="exportToWord()">
                    Export to Word
                </button>
            </div>
        </div>
        <% End If %>

        <!-- Table of case studies -->
        <div class="row">
            <div class="col-md-12">
                <div class="card text-dark bg-light mb-3">
                    <div class="card-header text-center">
                        Case Studies List
                    </div>
                    <div class="card-body">
                        <div class="alert alert-primary" role="alert">
                        <p><strong>Instructions: </strong>Update the <strong>Submission Status</strong> field. Setting the Submission Status to <i>Waitlisted</i> will automatically set the <strong>Development Status</strong> to <i>On Hold</i>. Similarly, setting it to <i>Declined</i> will set the <strong>Development Status</strong> to <i>Declined</i>.</p>
                        <p>Setting the <strong>Submission Status</strong> to <i>Accepted</i> will unlock the <strong>Development Status</strong> dropdown, which can be set separately. Use the button in the <strong>Details</strong> column to add a link to the <strong>Working Folder</strong>, <strong>Final Word File</strong>, or any additional <strong>Notes </strong>for each Case Study. If a case study has a link in Working Folder and/or Final Word File, the table will display a link to those in the <strong>Actions</strong> column.</p>
<br /><p>Click <strong>View</strong> to load that Case Study onto the page, which will give you a button that will download the Case Study as <i>Word Document</i>.</p>                          
                            </div>
                        <table class="table table-striped" id="caseStudiesTable">
<thead>
    <tr>
        <th>Organization</th>
        <th>Submitter</th>
        <th>Stakeholder Type</th>
        <th>Submission Status</th>
        <th>Development Status</th>
        <th>Last Updated</th>
        <th>Actions</th>
        <th>Details</th>
    </tr>
</thead>
<tbody>
    <% For Each study In caseStudies %>
    
    <tr>
        <td><%= If(study.ContainsKey("submitterOrg"), study("submitterOrg"), "N/A") %></td>
        <td><%= If(study.ContainsKey("submitterName"), study("submitterName"), "N/A") %></td>
        <td><%= If(study.ContainsKey("stakeholderType"), FormatStakeholderType(study("stakeholderType")), "N/A") %></td>
<td>
<select class="form-control substatus-dropdown" data-id="<%= study("id") %>">
    <option value="" <%= If(Not study.ContainsKey("subStatus") OrElse String.IsNullOrEmpty(study("subStatus")), "selected", "") %>></option>
    <option value="Accepted" <%= If(study.ContainsKey("subStatus") AndAlso study("subStatus") = "Accepted", "selected", "") %>>Accepted</option>
    <option value="Waitlisted" <%= If(study.ContainsKey("subStatus") AndAlso study("subStatus") = "Waitlisted", "selected", "") %>>Waitlisted</option>
    <option value="Declined" <%= If(study.ContainsKey("subStatus") AndAlso study("subStatus") = "Declined", "selected", "") %>>Declined</option>
</select>

</td>

<td>
    <select class="form-control status-dropdown" data-id="<%= study("id") %>" 
        <%= If(Not study.ContainsKey("subStatus") OrElse study("subStatus") = "Waitlisted" OrElse study("subStatus") = "Declined", "disabled", "") %>>
        <option value="Form 2 Sent" <%= If(study("status") = "Form 2 Sent", "selected", "") %>>Form 2 Sent</option>
        <option value="Form 2 for Review" <%= If(study("status") = "Form 2 for Review", "selected", "") %>>Form 2 for Review</option>
        <option value="Draft in Progress" <%= If(study("status") = "Draft in Progress", "selected", "") %>>Draft in Progress</option>
        <option value="Draft in EPA Review" <%= If(study("status") = "Draft in EPA Review", "selected", "") %>>Draft in EPA Review</option>
        <option value="Draft in Submitter Review" <%= If(study("status") = "Draft in Submitter Review", "selected", "") %>>Draft in Submitter Review</option>
        <option value="Queued for Publishing" <%= If(study("status") = "Queued for Publishing", "selected", "") %>>Queued for Publishing</option>
        <option value="Published" <%= If(study("status") = "Published", "selected", "") %>>Published</option>
        <option value="On Hold" <%= If(study("status") = "On Hold", "selected", "") %>>On Hold</option>
        <option value="Declined" <%= If(study("status") = "Declined", "selected", "") %>>Declined</option>
    </select>
</td>

        <td><%= If(Not String.IsNullOrEmpty(study("statusChangeDate")) AndAlso IsDate(study("statusChangeDate")), DateTime.Parse(study("statusChangeDate")).ToString("MM/dd/yyyy"), "N/A") %></td>
<td>
    <!-- View Button -->
    <a href="case-studies.aspx?caseStudyId=<%= study("id") %>" class="btn btn-primary mb-1">View</a>

    <!-- Working Folder Button -->
    <% If study.ContainsKey("workingFolder") AndAlso Not String.IsNullOrEmpty(study("workingFolder")) Then %>
        <a href="<%= study("workingFolder") %>" target="_blank" class="btn btn-info mb-1">Working Folder</a>
    <% End If %>

    <!-- Final Word File Button -->
    <% If study.ContainsKey("finalWordFile") AndAlso Not String.IsNullOrEmpty(study("finalWordFile")) Then %>
        <a href="<%= study("finalWordFile") %>" target="_blank" class="btn btn-success mb-1">Final File</a>
    <% End If %>
</td>
<td>
    <a href="csDetails.aspx?id=<%= study("id") %>" class="btn btn-secondary">...</a>
</td>

    </tr>
    <% Next %>
</tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Correct docx.js from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/docx@7.1.0/build/index.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


       <!-- JavaScript for updating status -->
    <script>
        // Handle subStatus dropdown change
        document.querySelectorAll(".substatus-dropdown").forEach(function (dropdown) {
            dropdown.addEventListener("change", function () {
                const subStatus = this.value;
                const id = this.dataset.id;

                fetch("updateSubStatusCS.aspx", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        id: id,
                        subStatus: subStatus,
                    }),
                })
                    .then((response) => response.json())
                    .then((data) => {
                        if (data.success) {
                            Swal.fire({
                                icon: "success",
                                title: "SubStatus Updated!",
                                text: "The subStatus has been successfully updated.",
                                timer: 2000,
                                showConfirmButton: false,
                            });

                            // Get the status dropdown for this row
                            const statusDropdown = document.querySelector(
                                `.status-dropdown[data-id="${id}"]`
                            );

                            // Adjust status and dropdown behavior based on subStatus
                            if (subStatus === "Waitlisted") {
                                statusDropdown.value = "On Hold"; // Automatically set to On Hold
                                statusDropdown.disabled = true; // Disable status dropdown
                            } else if (subStatus === "Declined") {
                                statusDropdown.value = "Declined"; // Automatically set to Declined
                                statusDropdown.disabled = true; // Disable status dropdown
                            } else if (subStatus === "Accepted") {
                                statusDropdown.disabled = false; // Enable status dropdown
                            } else {
                                // Reset to default behavior for blank or other values
                                statusDropdown.disabled = false;
                            }
                        } else {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                text: data.message || "Failed to update subStatus.",
                            });
                        }
                    })
                    .catch((error) => {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "An unexpected error occurred.",
                        });
                        console.error(error);
                    });
            });
        });

        // Handle status dropdown change (only when subStatus is "Accepted")
        document.querySelectorAll(".status-dropdown").forEach(function (dropdown) {
            dropdown.addEventListener("change", function () {
                const status = this.value;
                const id = this.dataset.id;

                fetch("updateStatusCS.aspx", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        id: id,
                        status: status,
                    }),
                })
                    .then((response) => response.json())
                    .then((data) => {
                        if (data.success) {
                            Swal.fire({
                                icon: "success",
                                title: "Status Updated!",
                                text: "The status has been successfully updated.",
                                timer: 2000,
                                showConfirmButton: false,
                            });
                        } else {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                text: data.message || "Failed to update status.",
                            });
                        }
                    })
                    .catch((error) => {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "An unexpected error occurred.",
                        });
                        console.error(error);
                    });
            });
        });


    </script>


    <!-- JavaScript function to export to Word -->
    <script type="text/javascript">
        // Safely pass the selected case study from VB.NET to JavaScript
        var selectedCaseStudy = <% If selectedCaseStudy IsNot Nothing Then %>
            <%= Newtonsoft.Json.JsonConvert.SerializeObject(selectedCaseStudy) %>
        <% Else %>
            null
        <% End If %>;

        function exportToWord() {
            if (!selectedCaseStudy) {
                alert("No case study selected.");
                return;
            }

            const doc = new docx.Document({
                styles: {
                    paragraphStyles: [
                        {
                            id: "Normal",
                            name: "Normal",
                            run: {
                                font: "Arial", // Set global font to Arial
                            }
                        }
                    ]
                },
                sections: [{
                    properties: {
                        defaultFont: {
                            ascii: "Arial",
                            hAnsi: "Arial",
                        }
                    },
                    children: [
                        new docx.Paragraph({
                            text: selectedCaseStudy.proposedTitle,
                            heading: docx.HeadingLevel.HEADING_1,
                            bold: true,
                            font: "Arial",  // Set title font to Arial
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Organization: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.submitterOrg, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Submitter: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.submitterName, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Email: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.submitterEmail, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Stakeholder Type: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.stakeholderType, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Lead Organization: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.leadOrg, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Partner Organizations: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.partnerOrg, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Location: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.location, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Published: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.online === "Yes" ? "Yes (Published on " + selectedCaseStudy.whenpublished + ")" : "No", font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "URL: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.url, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Description: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.description, font: "Arial" })
                            ]
                        }),
                        new docx.Paragraph({
                            children: [
                                new docx.TextRun({ text: "Date Submitted: ", bold: true, font: "Arial" }),
                                new docx.TextRun({ text: selectedCaseStudy.DateSubmitted, font: "Arial" })
                            ]
                        })
                    ]
                }]
            });

            docx.Packer.toBlob(doc).then(blob => {
                const link = document.createElement("a");
                link.href = URL.createObjectURL(blob);
                link.download = selectedCaseStudy.proposedTitle.replace(/\s+/g, '') + ".docx";
                link.click();
            });
        }
    </script>
</asp:Content>
