<%@ Page ValidateRequest="false" Language="vb" AutoEventWireup="false" CodeBehind="resource_create.aspx.vb"
    Inherits="M2M_Redesign.resource_create" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>.
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<html>
<head runat="server">
    <title>Admin | New Resource</title>
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
        body {
            background: #D2E9EE;
        }

        .container {
            background: #fafafa;
        }

        .row {
            border-bottom: 2px solid #cacaca;
            padding-bottom: 20px;
            margin-bottom: 20px;
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
    <div id="cover"></div>
    <div class="container">
         <!-- #include virtual="nav.html" -->
        <form id="resourceCreateform" runat="server">
            <div id="maincontentarea">
                <h1>Resource Form</h1>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <div class="formLayout">
 

                    <div class="col-md-12">
                        <h3>Resource Information</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-6">


                            <label for="status" style="font-weight: bold;">
                                Status:</label>
                            <asp:RadioButtonList ID="rblStatus" runat="server" CssClass="formItemIndent radiostyle">
                                <asp:ListItem Text="Draft" Value="Draft" />
                                <asp:ListItem Text="Final" Value="Final" />
                            </asp:RadioButtonList>
                        </div>
                        <div class="col-md-6">
                            Indicates whether this tool or resource is "public" and findable on the GMI.org website. Choose "<i>Final</i>" for any resource that should be made public. All others should be "<i>Draft</i>".
                        </div>
                    </div>

                    <asp:Panel ID="pnlParentResource" runat="server" Visible="false">
                        <br />
                        <label for="name">
                            Parent Resource:</label>
                        <asp:TextBox ID="txtresourceParentName" runat="server" MaxLength="255" Wrap="true" ReadOnly="true" Style="height: 45px;"></asp:TextBox>
                        <asp:Panel ID="pnlParentNameInfo" runat="server" Visible="true" CssClass="forminfo">
                            This is name of the tool or resource this file is related to. Read only. Click below to edit the parent tool or resource.
                        </asp:Panel>
                        <asp:HiddenField ID="txtResourceParentID" runat="server" />
                        <a href="/admin/resource_create.aspx?mode=e&resourceid=/admin/resource_create.aspx?mode=e&resourceid=<%# Eval("resourceid")%>">Edit</a><br />
                    </asp:Panel>
       
                    <div class="row">
                        <div class="col-md-8">
                            <label for="name" style="font-weight: bold;">
                                Resource Name:</label>
                            <asp:Panel ID="pnlNameInfo" runat="server" Visible="true" CssClass="forminfo">
                                Maximum length: 255 characters, including spaces.
                            </asp:Panel>
                            <asp:TextBox ID="name" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RQname" runat="server" ErrorMessage="* Required"
                                ControlToValidate="name">
                            </asp:RequiredFieldValidator><br />

                            <!-- start edits 1/4/18  -->
                            <label for="author" style="font-weight: bold;">
                                Author:</label>
                            <asp:Panel ID="pnlAuthorInfo" runat="server" Visible="true" CssClass="forminfo">
                                The name of the author or agency. Maximum length: 255 characters, including spaces.
                            </asp:Panel>
                            <asp:TextBox ID="author" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
                            <br />
                            <label for="shortname" style="font-weight: bold;">
                                Short Name:</label>
                            <asp:Panel ID="pnlShortNameInfo" runat="server" Visible="true" CssClass="forminfo">
                                Used on Event and Proceedings pages when a short title, such as "Agenda", will be well understood from the context. Maximum length: 255 characters, including spaces.
                            </asp:Panel>
                            <asp:TextBox ID="shortname" runat="server" CssClass="form-control" MaxLength="255"></asp:TextBox>
                            <br />
                            <label for="grouping" style="font-weight: bold;">
                                Resource Grouping:</label>
                            <asp:Panel ID="pnlGroupingInfo" runat="server" Visible="true" CssClass="forminfo">
                                Used on Event and Proceedings pages when a group of resources should be kept together under a subtitle, such as a breakout session name. Maximum length: 30 characters, including spaces.
                            </asp:Panel>
                            <asp:TextBox ID="grouping" runat="server" CssClass="form-control" MaxLength="30"></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="background:#eaeaea;">
                                            <div class="formlayout">
                    <asp:HyperLink ID="resourceFileLink" runat="server">Click to Download the File</asp:HyperLink>

                    <iframe runat="server" id="resourceFileFrame" style="height: 350px; width: 100%;"></iframe>
                                       <asp:Button ID="HideNotes1" runat="server" Text="Hide"
                        ToolTip="Hide directions and notes" CssClass="UploadBtnStyle" style="float:right;"/>

                    <asp:Button ID="Show1" runat="server" Text="Show" Visible="false"
                        ToolTip="Show directions and notes for each field." CssClass="UploadBtnStyle" />
                </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- end edits 1/4/18 -->
                            <label for="libSectors" style="font-weight: bold;">
                                Sector or Technical Group:</label>
                            <asp:Panel ID="pnlSector" runat="server" Visible="true" CssClass="forminfo">
                                Select the applicable sectors and/or technical group. Enables search for resources
                by sector and inclusion of this resource on the related sector page.
                            </asp:Panel>
                            <asp:ListBox SelectionMode="Multiple" ID="libSectors" runat="server" Rows="7" AutoPostBack="true" OnSelectedIndexChanged="libSectors_SelectedIndexChanged"
                                CssClass="formItemIndent form-select"></asp:ListBox>

                            <br />
                            <asp:RequiredFieldValidator ID="RQsector" runat="server" ErrorMessage="* Required"
                                ControlToValidate="libSectors" SetFocusOnError="True"></asp:RequiredFieldValidator>

                            <br />
                            <label for="ddlPartnerCountries" style="font-weight: bold;">
                                Associated Country:</label>
                            <asp:Panel ID="pnlCountry" runat="server" Visible="true" CssClass="forminfo">
                                Select all applicable countries. Enables search for resources by country and inclusion
                of this resource on the related country page.
                            </asp:Panel>
                            <asp:ListBox ID="libPartnerCountries" runat="server" Rows="5" SelectionMode="Multiple"
                                CssClass="formItemIndent form-select"></asp:ListBox>

                            <br />
                            <br />
                            <label for="libLanguage" style="font-weight: bold;">
                                Language:</label>
                            <asp:Panel ID="pnlLanguages" runat="server" Visible="true" CssClass="forminfo">
                                Select primary language for this resource. Enables search for resources by language
                and inclusion of this resource on the related language page.
                            </asp:Panel>
                            <asp:ListBox ID="libLanguage" runat="server" Rows="5" CssClass="formItemIndent form-select"></asp:ListBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h3>Event</h3>
                        </div>
                        <div class="col-md-8">


                            <asp:Panel ID="pnlEvents" runat="server" Visible="true" CssClass="forminfo">
                            </asp:Panel>
                            <asp:ListBox ID="libEvents" runat="server" AutoPostBack="true" Rows="5" SelectionMode="Single" CssClass="text-bottom formItemIndent form-select"></asp:ListBox>
                        </div>
                        <div class="col-md-4">
                            Populates based on sector choice. <b>Select only one</b>. Enables search for resources by event and inclusion of this resource on the related event page.
                        </div>
                    </div>

                    <h3>File Information</h3>
                    <div class="row">
                        <div class="col-md-8">
                            <label for="resourcePages" style="font-weight:bold;">
                                Page Count:</label>
                            <asp:Panel ID="infoPages" runat="server" Visible="true" CssClass="forminfo">
                                For written documents, enter the total number of pages. Leave blank for web pages,
                    videos, images, or other non-written material.
                            </asp:Panel>
                            <asp:TextBox ID="resourcePages" CssClass="form-control" runat="server"></asp:TextBox>

                            <br />
                            <label for="libDocumentType" style="font-weight:bold;">
                                Document Type:</label>
                            <asp:Panel ID="infoDocType" runat="server" Visible="true" CssClass="forminfo">
                                Choose the option that best describes the content of this resource.
                            </asp:Panel>
                            <asp:ListBox ID="libDocumentType" runat="server" Rows="5" SelectionMode="Multiple"
                                CssClass="text-bottom formItemIndent form-select"></asp:ListBox>
                        </div>
                    </div>
                    
                    <h3>Topic</h3>
                    <div class="row">
                        <div class="col-md-8">
                    
                    <label for="Keywords" style="font-weight:bold;">
                        Description:</label>
                    <asp:Panel ID="infotopic" runat="server" Visible="true" CssClass="forminfo">
                        Provide keywords or a brief summary about the file to enable searching by keyword.
                    </asp:Panel>
                                                <div>
                        <FTB:FreeTextBox Width="100%" ID="txtresourceTopic" runat="server" DesignModeCss="test.css"
                            ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;SymbolsMenu|InsertRule,InsertDate,InsertTime;InsertTable|NetSpell" />
                    </div>
     
                   
                    <asp:RequiredFieldValidator ID="RQtxtresourceTopic" runat="server" ErrorMessage="* Required"
                        ControlToValidate="txtresourceTopic">
                    </asp:RequiredFieldValidator>
                    <br />
                    <label for="ddlTopics" style="font-weight:bold;">
                        Assigned Topic Tags:</label>
                    <asp:Panel ID="pnlTopics" runat="server" Visible="true" CssClass="forminfo">
                        Select all applicable topics.
                    </asp:Panel>
                    <asp:ListBox ID="libTopics" runat="server" Rows="5" SelectionMode="Multiple"
                        CssClass="formItemIndent form-select"></asp:ListBox>

                    <h3>Resource Type</h3>
                            <label for="resourceType">What kind of resource is this?</label>
                            <asp:RadioButtonList ID="ResourceType" runat="server">
                                 <asp:ListItem Enabled="True" Selected="True"  Value="fileUpload">&nbsp;File Upload</asp:ListItem>
                                <asp:ListItem Value="urlInclude">&nbsp;URL (Video, Website, etc.)</asp:ListItem>
                            </asp:RadioButtonList>




                        <asp:Panel ID="plnResourceUpload" runat="server">

                            <h3>File</h3>
                            <!-- Upload Picker and Upload Button // Hidden if a File Is Already Selected-->
                            <label for="URLinclude">Add URL here (be sure to include the full path, e.g., <i>HTTPS://</i>)</label>
                            <asp:TextBox ID="urlPath" runat="server"  CssClass="form-control"></asp:TextBox>
                            <label for="FilePicker">
                                Please select the file to be uploaded:</label>
                            <asp:FileUpload ID="resourceLink" CssClass="btn" runat="server" /><br>
                            <label for="resourceImage">
                                Please select a thumbnail image:</label>
                            <asp:FileUpload ID="resourceImage" CssClass="btn" runat="server" />
                            <hr />
                            <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" CssClass="btn btn-primary" />
                     
                        </asp:Panel>


                        <!--Upload response message // hidden under normal circumstances -->
                        <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
                        <br />
                        <!--File Information // Hidden if no File is Selected-->
                        <asp:Panel ID="pnlResourceDetails" runat="server" Visible="true">

                            <div runat="server" style="background: #edf2f4; border: #8d99ae solid 2px; border-radius:10px;padding:10px; margin-bottom:20px;">
                                <p><strong>The following information is required for this type of file: </strong></p>
                                <label for="txtResourceSize" class="form-label" >
                                    File Size:</label><asp:TextBox ID="txtResourceSize" runat="server" CssClass="form-control"></asp:TextBox>
                
                                <label for="libFileType" class="form-label">
                                    FileType:</label>
                                <asp:ListBox ID="libFileType" runat="server" Rows="1" SelectionMode="Single" CssClass="form-select"></asp:ListBox>
   
                                    <label for="startDate" class="form-label">
                                        File Date:</label>
                                    <asp:TextBox ID="resourceFiledate" runat="server" cssClass="form-control"/>
                                    <br />
                                </br>

                            </div>
                        </asp:Panel>
                        <!-- not used -->
                        <asp:Panel ID="pnlResourceInfo" runat="server">
                            <label for="txtResourceLink">
                                File path:</label><asp:TextBox ID="txtResourceLink" runat="server" ReadOnly="true"></asp:TextBox>
                            <label for="txtResourceImage">
                                File image:</label><asp:TextBox ID="txtResourceImage" runat="server" ReadOnly="true"></asp:TextBox>
                            <asp:Image ID="imgresourceImage" runat="server" />
                            <br></br>
                            <asp:Button ID="btnDeleteFile" Text="Choose a Different FIle" runat="server" OnClick="DeleteFile" CssClass="UploadBtnStyle" Visible="false" />&nbsp;
                    <asp:Button ID="btnUpdateInfo" Text="Update File Information" runat="server" OnClick="UpdateInfo" CssClass="UploadBtnStyle" Visible="false" />
                        </asp:Panel>



                        <asp:PlaceHolder ID="phresourceLink" runat="server" Visible="true"></asp:PlaceHolder>

                        <!--Grid to show related resources // Button to upload related resources-->
                        <h2>Related Resources</h2>

                        <asp:Panel ID="infoRelRes" runat="server" Visible="true" CssClass="forminfo">
                            <p>
                                Additional resources can be added that are related to this file or document. Some examples of related resources:
            <ul>
                <li>A user's guide for a tool or calculator (add the tool/calculator as the main resource)</li>
                <li>Appendices (add the main body of the report or document first as the main resource)</li>
                <li>Ancillary materials or information </li>
            </ul>
                                In each case, please add the main or primary document or file as a resource, then click "Save and Add Related Resources" to add a Related Resource.
                            </p>
                        </asp:Panel>


                        <%--<asp:Button ID="btnAddRelatedResource" runat="server" Text="Add Related Resource"
                OnClick="btnAddRelatedResource_Click" />--%>
                        <asp:GridView ID="gvRelatedResource" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                            EmptyDataText="There are no related resources."
                            CssClass="grid" Visible="false">
                            <Columns>
                                <asp:TemplateField HeaderText="" ItemStyle-Width="4%">
                                    <ItemTemplate>
                                        <a href='/admin/resource_create.aspx?mode=e&resourceid=<%# Eval("resourceid")%>' alt='Edit'
                                            target='_top'>Edit</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" SortExpression="resourcename" ItemStyle-Width="40%">
                                    <ItemTemplate>
                                        <a href='<%# Eval("resourcelink")%>' alt='View' target='_blank'>
                                            <%# Eval("resourcename")%></a>
                                        <%# Eval("fileinfostring") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="resourceyear" HeaderText="Year" SortExpression="resourceyear" ItemStyle-Width="15%" />
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" ItemStyle-Width="15%" />
                            </Columns>
                        </asp:GridView>
                    </br>




                    <!-- Save and cancel button for New Resources (New mode)-->
                    <asp:PlaceHolder ID="ph1" runat="server">
                        <div>
                            <asp:Button ID="btnSave1" runat="server" CommandName="Saveresource1" Text="Save and Exit"></asp:Button>
                            &nbsp;&nbsp;
                <asp:Button ID="btnSave4" runat="server" CommandName="Saveresource4" Text="Save and Add Another"></asp:Button>
                            &nbsp;&nbsp;
                <asp:Button ID="btnCancel1" runat="server" CommandName="Cancelresource1" Text="Cancel"></asp:Button>
                        </div>
                    </asp:PlaceHolder>
                    <!-- save, cancel, and delete buttons for Existing Resources (Edit Mode)-->
                    <asp:PlaceHolder ID="ph2" runat="server">

                        <asp:Button ID="btnSave2" runat="server" CommandName="Saveresource2" Text="Save and Exit"></asp:Button>
                        &nbsp;&nbsp;
                <asp:Button ID="btnSave6" runat="server" CommandName="Saveresource6" Text="Save and Add Another"></asp:Button>
                        &nbsp;&nbsp;
                <asp:Button ID="btnSave3" runat="server" CommandName="Saveresource3" Text="Save and Add a Related Resource"></asp:Button>
                        &nbsp;&nbsp;
                <asp:Button ID="btnCancel2" runat="server" CommandName="Cancelresource2" Text="Cancel"></asp:Button>
                        &nbsp;&nbsp;
                <asp:Button ID="btnDelete2" runat="server" CommandName="Deleteresource2" Text="Delete"></asp:Button>
                    </asp:PlaceHolder>

                               <br />
                    <br /><br />
                    <br />
                        </div>
                        <div class="col-md-4">
                            <h4>File Tips</h4>
                            <ul>
                                <li>Please keep file names as unique as possible. Avoid using spaces and use CapitalLetters to separate words.</li>
                                <li>Try to use the same filename for thumbnail images</li>
                                 <li>Thumbnails for resources viewed in landscape (PowerPoint slides saved as PPTs or PDFs) should as closly as possible use a 13:7 aspect ratio. You can save the below image as a template
                                 </li>
                                 <img src="http://via.placeholder.com/260x140/96BDC6/FFFFFF?text=GMI+Resource+Template" style="max-width:100%" />
                                <li>Thumbnails for resources viewed in portrait (PDF documents) should as closely as possible use a 24:31 aspect ratio. You can save the below image as a template</li>
                                 <img src="http://via.placeholder.com/240x310/96BDC6/FFFFFF?text=GMI+Resource+Template" style="max-width:100%" />
                            </ul>

                        </div>
                </div>
                <!-- end of formlayout-->
            </div>
            <!--end of maincontentarea-->
            <!--end maincontentarea div-->
            <div id="rightcontentarea">
            </div>
        </form>
          
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
