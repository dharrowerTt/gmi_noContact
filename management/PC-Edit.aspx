<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<%@ Page Title="Edit HTML Files" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="PC-Edit.aspx.vb" Inherits="M2M_Redesign.PC_Edit" ValidateRequest="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Edit Partner Country Pages
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    /* General Styling */
    body {
        font-family: Arial, sans-serif;
    }

    /* Breadcrumb */
    #lblCurrentPath {
        font-size: 1.2em;
        font-weight: bold;
        color: #555;
        margin-bottom: 10px;
        display: block;
    }

    /* Buttons */
    .styled-button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1em;
        margin-right: 5px;
    }

    .styled-button:hover {
        background-color: #45a049;
    }

    /* GridView/Table */
    #gvFiles {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    #gvFiles th, #gvFiles td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    #gvFiles th {
        background-color: #f2f2f2;
        color: #333;
    }

    #gvFiles tr:hover {
        background-color: #f5f5f5;
    }

    /* Editor Panel */
    #pnlEditor {
        margin-top: 20px;
        border: 1px solid #ddd;
        padding: 15px;
        border-radius: 5px;
        background-color: #fafafa;
    }
</style>
    <div class="">
    <h1>Edit Partner Country Data</h1>

<p><strong>Instructions and Warnings:</strong></p>
<ul>
    <li><strong>Navigation:</strong> Partner Country details are organized by <strong>section</strong>, then by <strong>country</strong>. Navigate to the desired section, select the country, and open the <code>final.html</code> file to edit its content.</li>
    <li><strong>Avoid Copy-Pasting from Word:</strong> Do not paste directly from Word into the editor—it introduces unwanted code. Instead:
        <ol>
            <li>Paste text into <strong>Notepad</strong> first to strip formatting.</li>
            <li>Or, for bold users, use <a href="https://wordhtml.com/" target="_blank">Word to HTML Converter</a> and paste the clean HTML into the editor.</li>
        </ol>
    </li>
    <li><strong>Images:</strong> To add or replace images, contact <strong>Dougie</strong>, <strong>Victoria</strong>, or <strong>Chris</strong> to upload the image to the directory.</li>
</ul>
    <hr />
    <form runat="server">
    <asp:Label ID="lblCurrentPath" runat="server" Text=""></asp:Label><br />

    <asp:Button ID="btnUp" runat="server" Text="Up One Level" OnClick="btnUp_Click" Visible="False" CssClass="styled-button" />
    
    <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="False" OnRowCommand="gvFiles_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkItem" runat="server" Text='<%# Eval("Name") %>' CommandName='<%# Eval("Type") %>' CommandArgument='<%# Eval("Path") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="pnlEditor" runat="server" Visible="False">
        <FTB:FreeTextBox ID="ftbEditor" runat="server" Width="100%" Height="400px"></FTB:FreeTextBox>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="styled-button" />
       <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="styled-button" />
    </asp:Panel>
        </form>
        </div>
</asp:Content>
