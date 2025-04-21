<%@ Page ValidateRequest="false" Language="vb" AutoEventWireup="false" CodeBehind="event_create.aspx.vb" Inherits="M2M_Redesign.event_create" %>

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<html>

<head runat="server">
    <title>Admin | Event Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <script language="JavaScript" type="text/javascript" src="date.js"></script>
    <script type="text/javascript" language="JavaScript">
        <!--
    //var cal = new CalendarPopup();
    function validateDataEntry() {
        return true;
    }

    function validateFieldValue() {
        if (validateDataEntry()) {
            return true;
        } else {
            return false;
        }
    }
    -->
    </script>

    <style>
        body{
            background:#D2E9EE;
        }
        .container{
            background:#fafafa;
        }
        .row{
            border-bottom:2px solid #cacaca;
            padding-bottom:20px;
            margin-bottom:20px;
        }
            .radiostyle {
      height: auto;
    }

    .radiostyle label {
        margin-left: 3px !important;
        margin-right: 10px !important;
    }
    </style>
</head>

<body onload="checkCookie()">

    <div class="container">
         <!-- #include virtual="nav.html" -->
        <form id="eventCreateform" runat="server">
            <div id="maincontentarea">
                <h1>Event Form</h1>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="formLayout">
                    <h3>Event Information</h3>
                    <div class="row">
                        <div class="col-md-8">
                            <label for="status" style="font-weight: bold;">Status:</label>
                            <asp:RadioButtonList ID="rblStatus" runat="server" CssClass="radiostyle" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Draft" Value="Draft" />
                                <asp:ListItem Text="Edit" Value="Revised" />
                                <asp:ListItem Text="Final" Value="Final" />
                            </asp:RadioButtonList>
                        </div>
                        <div class="col-md-4">
                            <strong>Draft</strong>: Event will not appear in event listings<br />
                            <strong>Final</strong>: Event will appear in event listings
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <label for="name" style="font-weight: bold;">Event Name:</label>
                            <asp:Panel ID="pnlNameInfo" runat="server" Visible="true" CssClass="forminfo">
                                Maximum length: 255 characters, including spaces.
                            </asp:Panel>
                            <asp:TextBox ID="name" runat="server" MaxLength="255" CssClass="form-control" Columns="60">
                            </asp:TextBox>


                            <asp:RequiredFieldValidator ID="RQname" runat="server" ErrorMessage="* Required"
                                ControlToValidate="name">
                            </asp:RequiredFieldValidator><br />
                        </div>
                        <div class="col-md-4">
                            <i>Required Field</i><br />
                        </div>
                    </div>
                          <div class="row">
                        <div class="col-md-8">
                    <label for="libSectors" style="font-weight:bold;">Sector:</label>
                    <asp:Panel ID="Panel1" runat="server" Visible="true" CssClass="forminfo">
                        Select the applicable sector or technical group.
                    </asp:Panel>
                    <!-- Removed - SelectionMode="Multiple" - for now -->
                    <asp:ListBox ID="libSectors" runat="server" Rows="7" SelectionMode="Multiple"
                        CssClass="text-bottom form-select"></asp:ListBox>
                    <asp:RequiredFieldValidator ID="RQsector" runat="server" ErrorMessage="* Required"
                        ControlToValidate="libSectors">
                    </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-4">
                    <i>Required Field</i><br />
                        Use Ctrl+Click to select multiple sectors
                    </div>
                    </div>
                          <div class="row">
                        <div class="col-md-8">
                    <label for="gmiSponsored" style="font-weight:bold;">GMI Role:</label>


                    <asp:RadioButtonList ID="gmiSponsored" runat="server" CssClass="radiostyle">
                        <asp:ListItem Text="Sponsored" Value="rbsponsoredYes" />
                        <asp:ListItem Text="Subcommittee" Value="rbSubcommitteeYes" />
                        <asp:ListItem Text="GMI Related" Value="rbRelatedYes" />
                    </asp:RadioButtonList>
                        </div>
                              <div class="col-md-4">
                                  <i>Required Field</i><br />
                                  Single Select
                              </div>
                              </div>
                                  <div class="row">
                        <div class="col-md-8">
                    <label for="event_url" style="font-weight:bold;">Event Website:</label><br />
                    <asp:TextBox ID="event_URL" runat="server" MaxLength="255" placeholder="Optional"
                        Columns="60" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                Optional Field<br />
                                Provide a link to a website with additional event details.
                            </div>
                            </div>
                                            <div class="row">
                        <div class="col-md-8">
                               <label for="featured_photo" style="font-weight:bold;">Upload a Featured Photo:</label><br />
                    <asp:PlaceHolder ID="phFeaturedPhoto" runat="server" Visible="true">
                        <asp:Image ID="imgPhoto" runat="server" style="max-width:80%;"/>
                        <asp:Panel ID="existingPhoto" runat="server" Visible="true">
                        </asp:Panel>

                        <asp:Panel ID="newphoto" runat="server" Visible="true">
                            <asp:FileUpload ID="featured_photo" runat="server" /><br />
                            <asp:Label ID="feature_photo_response" runat="server"></asp:Label><br />
                            <asp:TextBox ID="txtfeatured_photo" runat="server" Visible="false" /><br />
                             <asp:Button ID="btnDeletephoto" runat="server" CommandName="DeletePhoto" Text="Delete Featured Photo">
                            </asp:Button>
                        </asp:Panel>
                        </div>
                         <div class="col-md-4">
                             Please keep your image name as specific to your event as possible.
                             <ul>
                                 <li>Include your event start date in the filename to avoid overwriting existing images. e.g., <i>EventName20213103.png</i></li>
                                 <li>Images should as closly as possible use a 13:7 aspect ratio. You can save the below image as a template
                                 </li>
                                 <img src="http://via.placeholder.com/1300x700/96BDC6/FFFFFF?text=GMI+Event+Template" style="max-width:100%" />
                             </ul>
                         </div>
                        </div>




                    </asp:PlaceHolder>

                    <h3>Event Details</h3>
                    <div class="row">
                        <div class="col-md-8">
                    <label for="event_description" style="font-weight:bold;">Description:</label>

                    <asp:Panel ID="Panel2" runat="server" Visible="true" CssClass="forminfo">
                    </asp:Panel>


                    <!-- old textbox -->
                    <div>
                        <FTB:FreeTextBox Width="100%" ID="txtDetails" runat="server" DesignModeCss="test.css"
                            ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;SymbolsMenu|InsertRule,InsertDate,InsertTime;InsertTable|NetSpell" />
                    </div>
                    <!-- end old textbox -->

                    <asp:RequiredFieldValidator ID="RQtxtDetails" runat="server" ErrorMessage="* Required"
                        ControlToValidate="txtDetails">
                    </asp:RequiredFieldValidator>
       </div>
                        <div class="col-md-4">
                            <i>Required Field</i><br />
                            Enter a brief description that will be displayed for this event.<br />
                            <strong>Pasting content from MS Word will add disruptive code. Please paste from Word into Notepad and then into the wesbite to remove that code.</strong>
                        </div>
                        </div>
                    <div class="row">
                        <div class="col-md-8">
                    <h3>Event Location</h3>
                    <label for="ddlPartnerCountries">Country:</label>
                    <asp:ListBox ID="libPartnerCountries" runat="server" Rows="1" SelectionMode="Single"
                        CssClass="text-bottom form-select"></asp:ListBox>
                    <asp:RequiredFieldValidator ID="RQcountry" runat="server" ErrorMessage="* Required"
                        ControlToValidate="libPartnerCountries">
                    </asp:RequiredFieldValidator><br />

                    <label for="location_city">City:</label>
                    <asp:TextBox ID="city" runat="server" MaxLength="200" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RQcity" runat="server" ErrorMessage="* Required"
                        ControlToValidate="city">
                    </asp:RequiredFieldValidator><br />

                    <label for="state">State/Province:</label>
                    <asp:TextBox ID="state" runat="server" MaxLength="200" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">


                    </div>
                    </div>
                                        <div class="row">
                        <div class="col-md-8">
                    <h3>Event Dates</h3>
                    <label for="startDate">Start:</label>
                    <asp:TextBox ID="startDate" runat="server" Style="width: 40%;"  CssClass="form-control" autocomplete="off" />
                    <ajaxToolkit:CalendarExtender ID="startDate_CalendarExtender" runat="server"
                        BehaviorID="startDate_CalendarExtender" TargetControlID="startDate" />
                    <asp:RequiredFieldValidator ID="RQstartDate" runat="server" ErrorMessage="* Required"
                        ControlToValidate="startDate">
                    </asp:RequiredFieldValidator>
                    <br />

                    <label for="endDate">End:&nbsp;</label>

                    <asp:TextBox ID="endDate" runat="server" MaxLength="200" Style="width: 40%;" CssClass="form-control" autocomplete="off"/>
                    <ajaxToolkit:CalendarExtender ID="enddate_CalendarExtender" runat="server"
                        BehaviorID="enddate_CalendarExtender" TargetControlID="enddate" />
                    <asp:RequiredFieldValidator ID="RQendDate" runat="server" ErrorMessage="* Required"
                        ControlToValidate="endDate">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="endDate"
                        ControlToCompare="startDate" Display="Dynamic" Text="End date must be greater than start date!"
                        Operator="GreaterThanEqual" Type="Date" runat="Server" />
                                  </div>
                    <div class="col-md-4">

                    </div>
                    </div>



                    <div class="clear"></div>

                    <div class="row">
                        <div class="col-md-8">
                                          <h3>Organization and Point of Contact</h3>
                    <label for="organizer_name">Organization Name:</label>
                    <asp:TextBox ID="organizer_name" runat="server" MaxLength="200" CssClass="form-control"></asp:TextBox>
                    <br />
                    <label for="poc_name">POC Name:</label>
                    <asp:TextBox ID="poc_name" runat="server" MaxLength="200" CssClass="form-control"></asp:TextBox>
                    <br />
                    <label for="poc_email">Email:</label>
                    <asp:TextBox ID="poc_email" runat="server" MaxLength="200" CssClass="form-control"></asp:TextBox>
                    <br />
                    <label for="poc_phone">Phone:</label>
                    <asp:TextBox ID="poc_phone" runat="server" MaxLength="200" CssClass="form-control"></asp:TextBox>
                    <br />
                    <label for="organizer_url">Organization Website:</label>
                    <asp:TextBox ID="organizer_url" runat="server" MaxLength="200" CssClass="form-control"></asp:TextBox>
                    <br />
                        </div>
                        <div class="col-md-4">

                        </div>
                    </div>
      


                    <%--
                                    
                                <label for="related_document">Upload a Related Document:</Label><br />
                                <asp:FileUpload id="related_document" runat="server" /><br />
                                
                                <label for="libResourceCategory">Resource Category:</label>
										<asp:ListBox ID="lbResourceCategory" runat="server"  Rows="5" SelectionMode="Single" CssClass="text-bottom"></asp:ListBox><br />
                                                                <asp:textbox id="txtresourceLink" runat="server" visible="false" /><br />
                                                                <label for="txtREsourcePages">Number of Pages</label>
                                <asp:textbox ID="txtresourcePages" runat="server" /><br />
                                <asp:textbox ID="txtresourceSize" runat="server" Visible="false" /><br />
                                <asp:TextBox ID="txtresourceFiledate" runat="server" Visible="false" /><br />

                                <asp:Label id="related_document_response" runat="server" ></asp:label><br />
                                <asp:Button ID="btnResourceUpload" runat="server" Text="Upload" />
                                    
                    --%>
                    <br />
                    


                    <asp:PlaceHolder ID="ph1" runat="server">
                        <asp:Button ID="btnSave1" runat="server" CommandName="SaveEvent1" Text="Save"></asp:Button>

                        &nbsp;&nbsp;
                        <%--<asp:Button id="btnSave4" runat="server"   
							CommandName="SaveEvent4" Text="Save and Preview">
							</asp:Button>
							
							&nbsp;&nbsp;--%>
                        <asp:Button ID="btnCancel1" runat="server" CommandName="CancelEvent1" Text="Cancel">
                        </asp:Button>
                    </asp:PlaceHolder>
           
                    <asp:PlaceHolder ID="ph2" runat="server">
                        <asp:Button ID="btnSave2" runat="server" CommandName="SaveEvent2" Text="Save"></asp:Button>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnSave3" runat="server" CommandName="SaveEvent3" Text="Save and Preview">
                        </asp:Button>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCancel2" runat="server" CommandName="CancelEvent2" Text="Cancel">
                        </asp:Button>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnDelete2" runat="server" CommandName="DeleteEvent2" Text="Delete">
                        </asp:Button>

                    </asp:PlaceHolder>
                    <div class="resourcelist">
                        <asp:PlaceHolder ID="phResources" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
                         <br />
                    <br /><br />
                    <br />
            </div>
            <!--end maincontentarea div-->
            <div id="rightcontentarea">




            </div>

        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
    </script>
    <script>
            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = "username" + "=" + cvalue + ";" + expires + ";path=/";
            }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            var user = getCookie("username");
            if (user != "") {
                document.getElementById("cover").style.display = "none";
            } else {
                window.location.href = "/gmi-admin/index.aspx";
            }
        }

        function deleteCookie() {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "/gmi-admin/index.aspx";
        }
    </script>



</body>

</html>