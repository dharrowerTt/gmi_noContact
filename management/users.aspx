<%@ Page Title="User Management" Language="vb"  MasterPageFile="~/management/MasterPage.master" AutoEventWireup="false" CodeBehind="users.aspx.vb" Inherits="M2M_Redesign.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    User Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <h1>User Management</h1>
        <p>Use the form below to activate and deactivate accounts, add and remove admin status, and view user activity. You can also <a href="role-management.aspx">assign roles</a> to users.</p>
   <asp:GridView ID="usersTable" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="created_at" HeaderText="Date Created" DataFormatString="{0:MMMM dd, yyyy}" />

            
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <div class="button-group">
                        <asp:Button ID="btnActivate" runat="server" Text='<%# If(Convert.ToBoolean(Eval("is_active")), "Deactivate", "Activate") %>'
                                    OnClick="ToggleActivation" CommandArgument='<%# Eval("user_id") %>' CssClass="action-button" />

                        <asp:Button ID="btnToggleAdmin" runat="server" Text='<%# If(Convert.ToBoolean(Eval("is_admin")), "Remove Admin", "Make Admin") %>'
                                    OnClick="ToggleAdmin" CommandArgument='<%# Eval("user_id") %>' CssClass="action-button" />

                        <asp:Button ID="btnViewActivity" runat="server" Text="View Activity" 
                                    OnClick="ViewActivity" CommandArgument='<%# Eval("user_id") %>' CssClass="action-button" />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </form>
<style>
    .userRow {
        background-color: #e0f8e0; /* Light green for active users */
    }

    .altRow {
        background-color: #f0e0f8; /* Light purple for admins */
    }

    .action-button {
        background-color: #b3d9ff; /* Pastel blue */
        color: #000; /* Black text */
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-align: center;
        display: inline-block;
        font-size: 14px;
    }

    .action-button:hover {
        background-color: #99c2ff; /* Slightly darker on hover */
    }

    /* Ensures that each button cell is centered */
    .table td {

    }

        .adminRow { background-color: #f0e6ff; }   /* Light purple for admin */
    .activeRow { background-color: #e6fff0; }  /* Light green for active users */
    .action-button {
        margin: 0 5px;
        background-color: #add8e6; /* Pastel blue */
        color: black;
        border: none;
        padding: 5px 10px;
        text-align: center;
        display: inline-block;
    }

       .adminRow { background-color: #f0e6ff; }   /* Light purple for admin */
    .activeRow { background-color: #e6fff0; }  /* Light green for active users */
    .action-button {
        background-color: #add8e6; /* Pastel blue */
        color: black;
        border: none;
        width: 100%;
        margin: 3px 0;
        padding: 5px;
        text-align: center;
    }
    .button-group {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
</style>

</asp:Content>
