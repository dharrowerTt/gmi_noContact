<%@ Page Title="Add Social Media Data" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="sm-add.aspx.vb" Inherits="M2M_Redesign.sm_add1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Add Social Media Data
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <h2 class="my-4">Add Social Media Data</h2>
        <div class="mb-4">
    <a href="social-media.aspx" class="btn btn-secondary">
        Back to Social Media Dashboard
    </a>
</div>
        <form id="smForm" runat="server">
            <div class="mb-3">
                <label for="dateInput" class="form-label">Select Month and Year</label>
                <asp:TextBox ID="dateInput" runat="server" CssClass="form-control" Placeholder="Select month and year" ReadOnly="True"></asp:TextBox>
                <small class="form-text text-muted">Select the month and year you are submitting data for.</small>
            </div>
<!-- LinkedIn Inputs -->
<h4>LinkedIn</h4>
<div class="row mb-3">
    <div class="col-md-6">
        <label for="linkedinFollowers" class="form-label">Followers</label>
        <asp:TextBox ID="linkedinFollowers" runat="server" CssClass="form-control" TextMode="Number" required="required"></asp:TextBox>
    </div>
    <div class="col-md-6">
        <label for="linkedinPosts" class="form-label">Posts</label>
        <asp:TextBox ID="linkedinPosts" runat="server" CssClass="form-control" TextMode="Number" required="required"></asp:TextBox>
    </div>
</div>

<!-- Facebook Inputs -->
<h4>Facebook</h4>
<div class="row mb-3">
    <div class="col-md-6">
        <label for="facebookFollowers" class="form-label">Followers</label>
        <asp:TextBox ID="facebookFollowers" runat="server" CssClass="form-control" TextMode="Number" required="required"></asp:TextBox>
    </div>
    <div class="col-md-6">
        <label for="facebookPosts" class="form-label">Posts</label>
        <asp:TextBox ID="facebookPosts" runat="server" CssClass="form-control" TextMode="Number" required="required"></asp:TextBox>
    </div>
</div>

<!-- X Inputs -->
<h4>X</h4>
<div class="row mb-3">
    <div class="col-md-6">
        <label for="xFollowers" class="form-label">Followers</label>
        <asp:TextBox ID="xFollowers" runat="server" CssClass="form-control" TextMode="Number" required="required"></asp:TextBox>
    </div>
    <div class="col-md-6">
        <label for="xPosts" class="form-label">Posts</label>
        <asp:TextBox ID="xPosts" runat="server" CssClass="form-control" TextMode="Number" required="required"></asp:TextBox>
    </div>
</div>

            <button type="submit" class="btn btn-primary" onserverclick="SubmitData_Click" runat="server">Submit</button>
        </form>
    

<script>
    // Custom Month-Year Picker
    document.addEventListener("DOMContentLoaded", function () {
        const dateInput = document.getElementById("<%= dateInput.ClientID %>");

        dateInput.addEventListener("click", function (event) {
            // Remove any existing picker
            document.querySelectorAll(".month-year-picker").forEach(picker => picker.remove());

            // Create the picker container
            const picker = document.createElement("div");
            picker.classList.add("month-year-picker");

            // Generate the current and minimum years
            const currentYear = new Date().getFullYear();
            const minYear = 2000; // Set a reasonable minimum year

            // Generate month selector
            let pickerHTML = "<select id='monthSelect' class='form-select'>";
            for (let i = 0; i < 12; i++) {
                pickerHTML += `<option value="${i + 1}">${new Date(0, i).toLocaleString("default", { month: "long" })}</option>`;
            }
            pickerHTML += "</select>";

            // Generate year selector
            pickerHTML += "<select id='yearSelect' class='form-select mt-2'>";
            for (let y = currentYear; y >= minYear; y--) {
                pickerHTML += `<option value="${y}">${y}</option>`;
            }
            pickerHTML += "</select>";

            // Add buttons
            pickerHTML += `
                <div class="mt-3">
                    <button id="applyDate" class="btn btn-sm btn-primary me-2">Apply</button>
                    <button id="cancelDate" class="btn btn-sm btn-secondary">Cancel</button>
                </div>
            `;

            picker.innerHTML = pickerHTML;

            // Position picker directly below the input
            const rect = dateInput.getBoundingClientRect();
            picker.style.position = "absolute";
            picker.style.top = `${rect.bottom + window.scrollY}px`;
            picker.style.left = `${rect.left + window.scrollX}px`;
            picker.style.zIndex = "1000";
            picker.style.backgroundColor = "white";
            picker.style.border = "1px solid #ccc";
            picker.style.boxShadow = "0 0 10px rgba(0, 0, 0, 0.1)";
            picker.style.padding = "10px";
            picker.style.borderRadius = "5px";

            document.body.appendChild(picker);

            // Handle Apply button
            document.getElementById("applyDate").addEventListener("click", function () {
                const month = document.getElementById("monthSelect").value.padStart(2, "0");
                const year = document.getElementById("yearSelect").value;
                dateInput.value = `${year}-${month}`;
                document.body.removeChild(picker);
            });

            // Handle Cancel button
            document.getElementById("cancelDate").addEventListener("click", function () {
                document.body.removeChild(picker);
            });

            // Dismiss picker if clicking outside
            document.addEventListener(
                "click",
                function closePicker(event) {
                    if (!picker.contains(event.target) && event.target !== dateInput) {
                        picker.remove();
                        document.removeEventListener("click", closePicker);
                    }
                },
                { once: true }
            );

            // Prevent the event from propagating further (avoids dismissing on click inside picker)
            event.stopPropagation();
        });
    });
</script>


    <style>
        .month-year-picker {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            border: 1px solid #ccc;
            padding: 15px;
            z-index: 1000;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .month-year-picker select {
            margin: 5px;
            padding: 5px;
        }
        .month-year-picker button {
            margin-top: 10px;
        }
    </style>
</asp:Content>
