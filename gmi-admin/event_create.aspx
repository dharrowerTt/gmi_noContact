<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="event_create.aspx.vb" Inherits="M2M_Redesign.event_create1" debug="true"  validateRequest="false"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>GMI&nbsp;&nbsp;|&nbsp;&nbsp;Admin&nbsp;&nbsp;|&nbsp;&nbsp;Events</title>

    <link rel="stylesheet" type="text/css" href="../../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../../_register/css/formstyles.css">
    <link rel="stylesheet" type="text/css" href="css/controlpanel.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="/scripts/yadcf-master/jquery.datatables.yadcf.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" type="text/css" />
</head>
<body onload="checkCookie()">
    <div id="cover"></div>
    <!--#include file="include/header.html"-->

    <div class="container">




        <form id="form1" runat="server">

            <div id="breadcrumbs"><a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">Administration Module</a> &raquo; <a href="events.aspx">Event List</a> &raquo; Event Information </div>
            <h1>Event Information</h1>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="row">
                <div class="col-md-12 order-md-1">
                    <div class="mb-3">

                        <label for="name">Event Name:</label>
                        <small id="eventNamehelp" class="form-text text-muted">Maximum length: 255 characters, including spaces.</small>

                        <asp:TextBox ID="name" runat="server" MaxLength="255" class="form-control" TextMode="MultiLine" Columns="60" Rows="3" Style="height: 45px;"></asp:TextBox>


                        <asp:RequiredFieldValidator ID="RQname" runat="server"
                            ErrorMessage="* Required" ControlToValidate="name">
                        </asp:RequiredFieldValidator>
                    </div>
                    
                     <div class="mb-3">
                        <label for="status">Status</label>
                        <small id="statusHelp" class="form-text text-muted">Indicate the status of this event.</small>
                        <div class="input-group">
                            <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Draft" Value="Draft" />
                                <asp:ListItem Text="Edit" Value="Revised" />
                                <asp:ListItem Text="Final" Value="Final" />
                            </asp:RadioButtonList>
                        </div>
                    </div>
                   
                 <div class="row">
               <div class="col-md-4 mb-3">
                    <label for="libSectors">Sector:</label>
                   <small id="sectorhelp" class="form-text text-muted">Select the applicable sector or technical group.</small>

                     
                    <asp:dropdownlist ID="libSectors" runat="server" SelectionMode="Multiple" CssClass="text-bottom"></asp:dropdownlist><br />
                    <asp:RequiredFieldValidator ID="RQsector" runat="server"
                        ErrorMessage="* Required" ControlToValidate="libSectors">
                    </asp:RequiredFieldValidator>
                </div>
                
            <div class="col-md-4 mb-3">
                    <label for="gmiSponsored">GMI Role at this Event:</label>

                    <div class="input-group">
                    <asp:RadioButtonList ID="gmiSponsored" runat="server" CssClass="radiolist">
                        <asp:ListItem Text="Sponsored" Value="rbsponsoredYes" />
                        <asp:ListItem Text="Subcommittee" Value="rbSubcommitteeYes" />
                        <asp:ListItem Text="GMI Related" Value="rbRelatedYes" />
                    </asp:RadioButtonList>
                        </div>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="event_type">Event Type:</label>

                    <div class="input-group">
                    <asp:RadioButtonList ID="event_type" runat="server" CssClass="radiolist">
                        <asp:ListItem Text="Webinar" Value="webinar" />
                        <asp:ListItem Text="Virtual Meeting" Value="virtual meeting" />
                        <asp:ListItem Text="In-Person" Value="in person" />
                    </asp:RadioButtonList>
                        </div>
                </div>
                     </div>
                <div class="mb-3">
                    <label for="event_url">Event Website:</label>
                    <small id="pnlevent_url" class="form-text text-muted">Provide a link to a website with additional event details.</small>
                    <asp:TextBox ID="event_URL" runat="server" MaxLength="255" class="form-control" placeholder="Optional" TextMode="MultiLine" Columns="60" Rows="3" Style="height: 45px;"></asp:TextBox>
                </div>
                <div class="mb-3">

                    <h3>Event Details</h3>
                    <label for="event_description">Description:</label>
                     <small id="pnl_details" class="form-text text-muted"> Enter a brief description that will be displayed for this event.</small>

                    

                    <!-- old textbox -->
                    <div>
                        <FTB:FreeTextBox Width="100%" ID="txtDetails" runat="server" DesignModeCss="test.css" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;SymbolsMenu|InsertRule,InsertDate,InsertTime;InsertTable|NetSpell" />
                    </div>
                    <!-- end old textbox -->

                    <asp:RequiredFieldValidator ID="RQtxtDetails" runat="server"
                        ErrorMessage="* Required" ControlToValidate="txtDetails">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <h3>Event Location</h3>
                    <label for="ddlPartnerCountries">Country:</label>
                    
                    <asp:ListBox ID="libPartnerCountries" runat="server" Rows="1" SelectionMode="Single" class="form-control" ></asp:ListBox>
                    <asp:RequiredFieldValidator ID="RQcountry" runat="server"
                        ErrorMessage="* Required" ControlToValidate="libPartnerCountries">
                    </asp:RequiredFieldValidator><br />
                </div>
                      <div class="row">
               <div class="col-md-6 mb-3">
               
                    <label for="location_city">City:</label>
                    <asp:TextBox ID="city" runat="server" class="form-control" MaxLength="200"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RQcity" runat="server"
                        ErrorMessage="* Required" ControlToValidate="city">
                    </asp:RequiredFieldValidator>
                </div>
               <div class="col-md-6 mb-3">

                    <label for="state">State/Province:</label>
                    <asp:TextBox ID="state" runat="server" class="form-control" MaxLength="200"></asp:TextBox>
                </div>
                </div>
                    <h3>Event Dates</h3>
                     <div class="row">
               <div class="col-md-6 mb-3">
                    <label for="startDate">Start:</label>
                    <asp:TextBox ID="startDate" runat="server" class="form-control" />
                    <ajaxToolkit:CalendarExtender ID="startDate_CalendarExtender"
                        runat="server" BehaviorID="startDate_CalendarExtender"
                        TargetControlID="startDate" />
                    <asp:RequiredFieldValidator ID="RQstartDate" runat="server"
                        ErrorMessage="* Required" ControlToValidate="startDate">
                    </asp:RequiredFieldValidator>
                    </div>
                         <div class="col-md-6 mb-3">
                    <label for="endDate">End:</label>

                    <asp:TextBox ID="endDate" runat="server" class="form-control"  />
                    <ajaxToolkit:CalendarExtender ID="enddate_CalendarExtender" runat="server" BehaviorID="enddate_CalendarExtender" TargetControlID="enddate" />
                    <asp:RequiredFieldValidator ID="RQendDate" runat="server"
                        ErrorMessage="* Required" ControlToValidate="endDate">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1"
                        ControlToValidate="endDate"
                        ControlToCompare="startDate"
                        Display="Dynamic"
                        Text="End date must be greater than start date!"
                        Operator="GreaterThanEqual"
                        Type="Date"
                        runat="Server" />
                </div>
                         </div>




               
                     <h3>Organization and Point of Contact</h3>
                <div class="mb-3">
                   
                    <label for="organizer_name">Organization Name:</label>
                    <asp:TextBox ID="organizer_name" runat="server"  class="form-control" MaxLength="200"></asp:TextBox>
                </div>
                   
                <div class="mb-3">
                    <label for="poc_name">POC Name:</label>
                    <asp:TextBox ID="poc_name" runat="server"  class="form-control" MaxLength="200"></asp:TextBox>
                </div>
                     <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="poc_email">Email:</label>
                    <asp:TextBox ID="poc_email" runat="server"  class="form-control" MaxLength="200"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="poc_phone">Phone:</label>
                    <asp:TextBox ID="poc_phone" runat="server" class="form-control"  MaxLength="200"></asp:TextBox>
                </div>
                         </div>
                <div class="mb-3">
                    <label for="organizer_url">Organization Website:</label>
                    <asp:TextBox ID="organizer_url" runat="server"  class="form-control" MaxLength="200"></asp:TextBox>
                </div>
                    <asp:PlaceHolder ID="phFeaturedPhoto" runat="server" Visible="false">
 <div class="row">
                <div class="col-md-4 mb-3">


                    <br />
                    <br />
                    <br />

                    
                        <asp:Image ID="imgPhoto" runat="server" />
                        <asp:Panel ID="existingPhoto" runat="server" Visible="true">


                            <asp:Button ID="btnDeletephoto" runat="server" CommandName="DeletePhoto" Text="Delete"></asp:Button>
                        </asp:Panel>
                </div>
                 <div class="col-md-4 mb-3">
                    <asp:Panel ID="newphoto" runat="server" Visible="true">
                        <label for="featured_photo">Upload a Featured Photo:</label>
                </div>
                <div class="col-md-4 mb-3">
                    <asp:FileUpload ID="featured_photo" runat="server" /><br />
                    <asp:Label ID="feature_photo_response" runat="server"></asp:Label><br />
                    <asp:TextBox ID="txtfeatured_photo" runat="server" Visible="false" /><br />

                    </asp:Panel>
                </div>
     </div>
                    </asp:PlaceHolder> 
                <div class="mb-3">
                    
							<asp:PlaceHolder ID="ph1" runat="server">
                                <asp:Button ID="btnSave1" runat="server"
                                    CommandName="SaveEvent1" Text="Save"></asp:Button>

                                &nbsp;&nbsp;
                           
							<asp:Button ID="btnCancel1" runat="server"
                                CommandName="CancelEvent1" Text="Cancel"></asp:Button>
                            </asp:PlaceHolder>

                    <asp:PlaceHolder ID="ph2" runat="server">
                        <asp:Button ID="btnSave2" runat="server"
                            CommandName="SaveEvent2" Text="Save"></asp:Button>
                        &nbsp;&nbsp;
                             <asp:Button ID="btnSave3" runat="server"
                                 CommandName="SaveEvent3" Text="Save and Preview"></asp:Button>
                        &nbsp;&nbsp;
							<asp:Button ID="btnCancel2" runat="server"
                                CommandName="CancelEvent2" Text="Cancel"></asp:Button>
                        &nbsp;&nbsp;
							<asp:Button ID="btnDelete2" runat="server"
                                CommandName="DeleteEvent2" Text="Delete"></asp:Button>

                    </asp:PlaceHolder>
                    </div>
                    <div class="row">
                   
                        <asp:PlaceHolder ID="phResources" runat="server"></asp:PlaceHolder>
                   
                    </div>
                    
        </form>
</body>
</html>
