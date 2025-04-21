<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="actDetails.aspx.vb" Inherits="M2M_Redesign.actDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oil and Gas Project Details | Archive  | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <form id="actDetailsform" runat="server">
    <!-- #include virtual="/includes/header.html" -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
                    <h1>Project Detail</h1>
					<h2>
            <asp:Literal ID="litProjName" runat="server"></asp:Literal></h2>
<asp:Literal ID="litBreadcrumb" runat="server"></asp:Literal>
                    <div class="alert alert-danger" role="alert">Please note the websites for these past events are no longer being maintained. These links are provided for reference purposes.</div>

		</div>
	</section>
	<section class="py-5 bg-white">
		<div class="container">
<asp:Literal ID="litErrorInfo" runat="server" Visible="false"> </asp:Literal>
            <asp:GridView id="gvProjectList" runat="server" visible="False" 
            autogeneratecolumns="False"   
            CssClass="grid" > 
                 <Columns>
                    <asp:TemplateField HeaderText="Project">
                        
                        <itemtemplate>
                            <a href="/archive/actDetails.aspx?id=<%# Eval("projectid")%>"><%# Eval("name")%></a> <br />
                            <%# Eval("Description")%>
                        </itemtemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="TypeofProject" HeaderText="Project Type" />
                </Columns>
            </asp:gridview>
        <asp:Literal ID="LitList" runat="server" Visible="false"></asp:Literal>

            <h3 class='py-3'>General Activity Infomation</h3>
 <table class="table" id="projTable" runat="server">
           
                <tbody>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Stage
                    </th>
                    <td>
                        <asp:Literal ID="litStage" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Sector
                    </th>
                    <td>
                        <asp:Literal ID="lblSector" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Geographical Focus
                    </th>
                    <td>
                        <asp:Literal ID="geoFocus" runat="server"></asp:Literal><br />
                        <asp:Literal ID="locationDetail" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Location
                    </th>
                    <td>
                        <asp:Literal ID="litLocation" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Description of Project
                    </th>
                    <td>
                        <asp:Literal ID="Description" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Partner Countries
                    </th>
                    <td>
                        <asp:Literal ID="lblPCo" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                   <th class='gmi-light-blue-cell text-right w-25'>
                        Instrumental Organizations
                    </th>
                    <td>
                        <asp:Literal ID="instrumentalOrgs" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Estimated Project Duration (Years):
                    </th>
                    <td>
                        <asp:Literal ID="ghgYears" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Emission Reductions:<br />
                        (MTCO2E)
                    </th>
                    <td>
                        <asp:Literal ID="ghgasreduction" runat="server"></asp:Literal>
                        <asp:Literal ID="ghgFor" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                   <th class='gmi-light-blue-cell text-right w-25'>
                        Results and Outcomes
                   </th>
                    <td>
                        <asp:Literal ID="litResults" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Additional Documentation
                    </th>
                    <td>
                        <asp:PlaceHolder runat="server" ID="phAttachments"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Points of Contact
                   </th>
                    <td>
                        <asp:Literal ID="lblPC" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                   <th class='gmi-light-blue-cell text-right w-25'>
                        Financial And In-Kind Support (U.S.&nbsp;$)
                    </th>
                    <td>
                        <asp:Literal ID="lblFIK" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Comments
                    </th>
                    <td>
                        <asp:Literal ID="Comments" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <th class='gmi-light-blue-cell text-right w-25'>
                        Expo
                    </th>
                    <td>
                        <asp:Literal ID="litExpo" runat="server"></asp:Literal>
                    </td>
                </tr>
                </tbody>
            </table>

                            	

		</div>
	</section>
        </form>
</body>

</html>
