<%@ Page Language="vb" AutoEventWireup="false"  MasterPageFile="~/management/MasterPage.master" CodeBehind="nav-banner-edit.aspx.vb" Inherits="M2M_Redesign.nav_banner_edit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Manage Navbar Banner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <h1>Site-Wide Banner Admin</h1>
    <p>Use the inputs below to post a “site banner” message on every GMI webpage. Once saved, the message will be rendered at the top of all globalmethane.org website pages. This feature can be used to provide a sitewide alert, including a link to direct visitors to another page.  </p>
    <form id="form1" runat="server" method="post">
        <div class="mb-3">
            <label for="bgColor" class="form-label"><strong>Background Color:</strong><br />Click the color bar to edit. Use the slider to select the range of the spectrum to choose from, then use the color-picker to select the color you want to use. Note that the optional button will always be blue. </label>
            <input type="color" id="bgColor" name="bgColor" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="bannerText" class="form-label"><strong>Banner Text:</strong><br />Enter the text to appear at the top of every page on globalmethane.org. Text will be rendered in the default font size. </label>
            <textarea id="bannerText" name="bannerText" class="form-control"></textarea>
        </div>

        <div class="mb-3">
            <label for="buttonText" class="form-label"><strong>Button Text (optional):</strong><br />If the banner message should provide a link to visitors, enter the text to appear on the button. The text should be brief and description (e.g., “Visit the Partners page”). </label>
            <input type="text" id="buttonText" name="buttonText" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="buttonLink" class="form-label"><strong>Button Link (optional):</strong><br />Enter the full URL for the button (e.g., https://www.globalmethane.org/partners/index.aspx). Make sure to test the URL before saving the banner. </label>
            <input type="url" id="buttonLink" name="buttonLink" class="form-control" />
        </div>

        <div class="mb-3">
            <label for="expireTime" class="form-label"><strong>Expiration Date & Time:</strong><br />Use the control to select the date and time for the site banner to expire. The time is Pacific Standard Time. The banner will be removed automatically after the expiration date and time. </label>
            <input type="text" id="expireTime" name="expireTime" class="form-control flatpickr" />
        </div>
        <p>Click the Save Banner button to post the banner on the website. The banner will appear whenever a page is loaded into the browser. Refresh any active pages to see the banner.  Click the clear button to immediately remove an existing banner. </p>
        <asp:Button ID="btnSave" runat="server" Text="Save Banner" CssClass="btn btn-primary" OnClick="btnSave_Click" />
        <asp:Button ID="btnClearBanner" runat="server" Text="Clear Any Existing Banner" CssClass="btn btn-danger" OnClientClick="return confirmClear();" OnClick="btnClearBanner_Click" />

    </form>
    
<hr />
<h3>Current Banner Preview:</h3>
<div id="BannerPreviewDiv" runat="server" class="border p-3"></div>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            flatpickr(".flatpickr", {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                time_24hr: false,
                minDate: "today"
            });
        });
    </script>

    <script>
        function confirmClear() {
            return Swal.fire({
                title: 'Are you sure?',
                text: "This action cannot be undone!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Yes, clear it!'
            }).then((result) => {
                return result.isConfirmed;
            });
        }
    </script>

</asp:Content>
