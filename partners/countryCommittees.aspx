<%@ Page Title="" Language="VB" MasterPageFile="~/includes/MasterPage.master"  AutoEventWireup="false" CodeBehind="countryCommittees.aspx.vb" Inherits="M2M_Redesign.countryCommittees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceholder" Runat="Server">
    <div id="breadcrumbs">
        <a href="../index.aspx">Home</a> &raquo; 
        <a href="index.aspx">Partner Countries</a> &raquo; 
        <span id="breadcrumb"><asp:Literal id="litCountryBreadCrumb" runat="server"></asp:Literal></span>
        <span id="lastcrumb"><asp:Literal id="litBreadcrumb" runat="server"></asp:Literal></span>
    </div>
    <h1><asp:Literal id="litPageTitle" runat="server"></asp:Literal></h1>
    <asp:Literal id="litStuff" runat="server"></asp:Literal>	
</asp:Content>