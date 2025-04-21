<%@ Page Title="Role Management" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="role-management.aspx.vb" Inherits="M2M_Redesign.role_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Role Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:PlaceHolder ID="phRoleTable" runat="server"></asp:PlaceHolder>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
            $(document).on('change', 'select', function () {
                var userId = $(this).data('user-id');
                var roleId = $(this).val();

                $.ajax({
                    type: "POST",
                    url: "role-management.aspx/SaveUserRole",
                    data: JSON.stringify({ userId: userId, roleId: roleId }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            console.log("Role updated successfully");
                        } else {
                            console.log("Error updating role");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log("AJAX error:", error);
                    }
                });
            });
        </script>


    </form>
</asp:Content>
