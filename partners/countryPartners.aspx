<%@ Page Title="" Language="VB"  AutoEventWireup="false" MasterPageFile="~/includes/MasterPage.master" CodeBehind="countryPartners.aspx.vb" Inherits="M2M_Redesign.countryPartners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceholder" runat="server">
     <div id="breadcrumbs">
        <a href="../index.aspx">Home</a> &raquo; 
        <a href="index.aspx">Partner Countries</a> &raquo; 
        <span id="breadcrumb"><asp:Literal id="litCountryBreadcrumb" runat="server" /></span> 
        <span id="lastcrumb"><asp:Literal id="litBreadcrumb" runat="server" /></span>
     </div>
                    
    <asp:PlaceHolder ID="phPNMs" runat="server">
        <h1><asp:Literal id="litSector" runat="server"></asp:Literal></h1>

        <a class="button gray" href="../project-network/pnmadvancedSearch.aspx">Project Network Member Search »</a>
        <br class="clear" />
        

        <p><asp:Literal id="litNothing" runat="server"></asp:Literal></p>

        <asp:PlaceHolder ID="phTable" runat="server">
            <p>Select column name to sort by Organization Name or Type of Organization. Click any organization name for additional details.</p>
            <div id="projnetsectorlist">
                <table id="projectstable2">
                    <thead>
                        <tr>
                            <th><span class="sorting6">Organization Name</span></th>
			                <th><span class="sorting7">Type of Organization</span></th>
                        </tr>
                    </thead>
                                       
                    <tbody>
                        <asp:Literal id="litStuff" runat="server"></asp:Literal>	
                    </tbody>
                </table>
            </div>	
        </asp:PlaceHolder>
    </asp:PlaceHolder>	
           


</asp:Content>