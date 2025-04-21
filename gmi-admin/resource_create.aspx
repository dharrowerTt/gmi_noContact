<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="resource_create.aspx.vb" Inherits="M2M_Redesign.resource_create1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GMI Admin  |  Resources</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id="breadcrumbs">
            <a href="../index.aspx">Home</a> &raquo; <a href="index.aspx">Administration Module</a>
            &raquo; <a href="resource_list.aspx">Resource List</a> &raquo; Resource Form &raquo;
            <a href="login.aspx">Logout</a></div>
        <h1>
            Resource Form</h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="formlayout" style="width:25%; float:right;">
        <asp:HyperLink ID="resourceFileLink" runat="server" >Click to Download the File</asp:HyperLink>
        
        <iframe runat="server" id="resourceFileFrame" style="height: 350px;width:100%;">
        </iframe>
        </div>
        <div class="formLayout" style="width: 75%; float: right;">
        <asp:Button ID="HideNotes1" runat="server" Text="Hide" 
                    ToolTip="Hide directions and notes"  CssClass="UploadBtnStyle" />
        
            <asp:Button ID="Show1" runat="server" Text="Show" visible="false"
                ToolTip="Show directions and notes for each field."  CssClass="UploadBtnStyle" />
            <h3>
                
                Resource Information</h3>
            <label for="status">
                Status:</label>
            <asp:Panel ID="pnlStatus" runat="server" Visible="true" CssClass="forminfoNew">
                Indicates whether this tool or resource is "public" on the GMI.org website. Choose "Final" for any resource that should be made public. All others should be "Draft."</asp:Panel>
                <asp:RadioButtonList ID="rblStatus" runat="server" CssClass="formItemIndent">
                    <asp:ListItem Text="Draft" Value="Draft" />
                    <asp:ListItem Text="Final" Value="Final" />
                </asp:RadioButtonList>
           
            
            <asp:Panel ID="pnlParentResource" runat="server" Visible="false">
             <br />
            <label for="name">
                Parent Resource:</label>
            <asp:TextBox ID="txtresourceParentName" runat="server" MaxLength="255" Wrap="true" ReadOnly="true" style="Height:45px;" ></asp:TextBox>
            <asp:Panel ID="pnlParentNameInfo" runat="server" Visible="true" CssClass="forminfo">
                This is name of the tool or resource this file is related to. Read only. Click below to edit the parent tool or resource.</asp:Panel>
            <asp:HiddenField ID="txtResourceParentID" runat="server" />
            <a href="/admin/resource_create.aspx?mode=e&resourceid=/admin/resource_create.aspx?mode=e&resourceid=<%# Eval("resourceid")%>">Edit</a><br>
            </asp:Panel>
            <br />
	
            <label for="name">
                Resource Name:</label>
            <asp:Panel ID="pnlNameInfo" runat="server" Visible="true" CssClass="forminfo">
                Maximum length: 255 characters, including spaces.</asp:Panel>    
            <asp:TextBox ID="name" runat="server" CssClass="formItemIndent" MaxLength="255"  textmode="MultiLine" Columns="60" Rows="3" style="height:45px;"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="RQname" runat="server" ErrorMessage="* Required"
                ControlToValidate="name">
            </asp:RequiredFieldValidator><br />
            <br />
            <!-- start edits 1/4/18  -->
            <label for="author">
                Author:</label>
            <asp:Panel ID="pnlAuthorInfo" runat="server" Visible="true" CssClass="forminfo">
                The name of the author or agency. Maximum length: 255 characters, including spaces.</asp:Panel>    
            <asp:TextBox ID="author" runat="server" CssClass="formItemIndent" MaxLength="255" ></asp:TextBox>
            <br />
            <label for="shortname">
                Short Name:</label>
            <asp:Panel ID="pnlShortNameInfo" runat="server" Visible="true" CssClass="forminfo">
                Used on Event and Proceedings pages when a short title, such as "Agenda", will be well understood from the context. Maximum length: 255 characters, including spaces.</asp:Panel>    
            <asp:TextBox ID="shortname" runat="server" CssClass="formItemIndent" MaxLength="255" ></asp:TextBox>
            <br />
            <label for="grouping">
                Resource Grouping:</label>
            <asp:Panel ID="pnlGroupingInfo" runat="server" Visible="true" CssClass="forminfo">
                Used on Event and Proceedings pages when a group of resources should be kept together under a subtitle, such as a breakout session name. Maximum length: 30 characters, including spaces.</asp:Panel>    
            <asp:TextBox ID="grouping" runat="server" CssClass="formItemIndent" MaxLength="30" ></asp:TextBox>
            <br />
            <!-- end edits 1/4/18 -->
            <label for="libSectors">
                Sector or Technical Group:</label>
            <asp:Panel ID="pnlSector" runat="server" Visible="true" CssClass="forminfo">
                Select the applicable sectors and/or technical group. Enables search for resources
                by sector and inclusion of this resource on the related sector page.</asp:Panel>
            <asp:ListBox SelectionMode="Multiple" ID="libSectors" runat="server" Rows="5"  autopostback="true" OnSelectedIndexChanged="libSectors_SelectedIndexChanged"
                 CssClass="formItemIndent"></asp:ListBox>
                
            <br />
            <asp:RequiredFieldValidator ID="RQsector" runat="server" ErrorMessage="* Required"
                ControlToValidate="libSectors" SetFocusOnError="True"></asp:RequiredFieldValidator>
            
            <br />
            <label for="ddlPartnerCountries">
                Associated Country:</label>
            <asp:Panel ID="pnlCountry" runat="server" Visible="true" CssClass="forminfo">
                Select all applicable countries. Enables search for resources by country and inclusion
                of this resource on the related country page.</asp:Panel>
            <asp:ListBox ID="libPartnerCountries" runat="server" Rows="5" SelectionMode="Multiple"
                CssClass="formItemIndent"></asp:ListBox>
            
            <br><br />
            <label for="libLanguage">
                Language:</label>
                <asp:Panel ID="pnlLanguages" runat="server" Visible="true" CssClass="forminfo">
                Select primary language for this resource. Enables search for resources by language
                and inclusion of this resource on the related language page.</asp:Panel>
            <asp:ListBox ID="libLanguage" runat="server" Rows="5" CssClass="formItemIndent">
            </asp:ListBox>
            
            <br />
            <h3>Event</h3>
            <label for="libEvents">Choose one (optional):</label>
                <asp:Panel ID="pnlEvents" runat="server" Visible="true" CssClass="forminfo">
                Please select a sector (above) in order to choose applicable events. Select only one. Enables search for resources by event and inclusion
                of this resource on the related event page.</asp:Panel>
            <asp:ListBox ID="libEvents" runat="server" autopostback="true" Rows="5" SelectionMode="Single" CssClass="text-bottom formItemIndent">
            </asp:ListBox>
            
            <br />
            
                <h3>
                    File Information</h3>
                
                <label for="resourcePages">
                    Page Count:</label>
                <asp:Panel ID="infoPages" runat="server" Visible="true" CssClass="forminfo">
                    For written documents, enter the total number of pages. Leave blank for web pages,
                    videos, images, or other non-written material.</asp:Panel>
                <asp:TextBox ID="resourcePages" CssClass="formItemIndent FitBoxSize" runat="server"></asp:TextBox>
                
            </br>
            <label for="libDocumentType">
                Document Type:</label>
            <asp:Panel ID="infoDocType" runat="server" Visible="true" CssClass="forminfo">
                Choose the option that best describes the content of this resource.</asp:Panel>
            <asp:ListBox ID="libDocumentType" runat="server" Rows="5" SelectionMode="Multiple"
                CssClass="text-bottom formItemIndent"></asp:ListBox>
            
            <h3>
                Topic</h3>
            <label for="Keywords">
                Description:</label>
            <asp:Panel ID="infotopic" runat="server" Visible="true" CssClass="forminfo">
                Provide keywords or a brief summary about the file to enable searching by keyword.</asp:Panel>
            <asp:TextBox ID="txtresourceTopic" runat="server" MaxLength="4000" Rows="5"  CssClass="FitBoxSize formItemIndent" TextMode="MultiLine">								
            </asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RQtxtresourceTopic" runat="server" ErrorMessage="* Required"
                ControlToValidate="txtresourceTopic">
            </asp:RequiredFieldValidator>
            <br />
            <label for="ddlTopics">
                Assigned Topic Tags:</label>
            <asp:Panel ID="pnlTopics" runat="server" Visible="true" CssClass="forminfo">
                Select all applicable topics. </asp:Panel>
            <asp:ListBox ID="libTopics" runat="server" Rows="5" SelectionMode="Multiple"
                CssClass="formItemIndent"></asp:ListBox>
            
            <br /><br />
            
            
            

            <asp:Panel ID="plnResourceUpload" runat="server">
            
            <h3>
                File</h3>
                <p>Recommendations for file naming:<br />
                    <ul><li>File names should be short under 30 characters is best.</li>
                        <li>Remove spaces and special characters. Underscores (_) and dashes (-) are fine.</li>
                        <li>Prefix file names with an abbreviation of the sector:  bio_, coal_, or oilgas_.</li>
                        <li>Thumbnails should be approximately 300x200 pixels. The file name should match the document file name.</li>
                    </ul>
                Once files have been uploaded, review the following pages to ensure they are appearing correctly:<br />
                    <ul><li><a href="../tools-resources/resources.aspx">Resources home page</a> </li>
                        <li><a href="../advancedSearch.aspx">Search</a></li>
                        <li>Sector and country home pages, as needed.</li>
                    </ul>
                </p>
                <!-- Upload Picker and Upload Button // Hidden if a File Is Already Selected-->
            <label for="FilePicker">
                Please select the file to be uploaded:</label>
                <asp:FileUpload ID="resourceLink" runat="server" required /><br />
                <label for="resourceImage">
                Please select a thumbnail image:</label>
                <asp:FileUpload ID="resourceImage" runat="server" required />
                <hr />
                <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" CssClass="UploadBtnStyle" />
                <br />
            </asp:Panel>
            

            <!--Upload response message // hidden under normal circumstances -->
            <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
            <br />
            <!--File Information // Hidden if no File is Selected-->
            <asp:Panel ID="pnlResourceDetails" runat="server" visible="true">

            <div runat="server"  style="background: #e1e1e1;border:blue solid 1px;"><p><strong>The following information is required for this type of file: </strong></p>
                <label for="txtResourceSize">
                    File Size:</label><asp:TextBox ID="txtResourceSize" runat="server" ></asp:TextBox>
                <br></br>
                <br></br>
                <label for="libFileType">
                    FileType:</label>
                <asp:ListBox ID="libFileType" runat="server" Rows="1" SelectionMode="Single" CssClass="text-bottom">
                </asp:ListBox>
                <br>
                <br></br>
                <label for="startDate">
                File Date:</label>
                <asp:TextBox ID="resourceFiledate" runat="server" />
                <br />
                </br>
                
                </div>
            </asp:Panel>
            <!-- not used -->
        <asp:Panel ID="pnlResourceInfo" runat="server">
         <label for="txtResourceLink">
                    File path:</label><asp:TextBox ID="txtResourceLink" runat="server" ReadOnly="true"></asp:TextBox>
                    <label for="txtResourceImage">
                    File image:</label><asp:textbox ID="txtResourceImage" runat="server" ReadOnly="true"></asp:textbox>
                    <asp:Image ID="imgresourceImage" runat="server" />
            <br></br>
                    <asp:Button ID="btnDeleteFile" Text="Choose a Different FIle" runat="server" OnClick="DeleteFile" CssClass="UploadBtnStyle" visible="false"/>&nbsp;
                    <asp:Button ID="btnUpdateInfo" Text="Update File Information" runat="server" OnClick="UpdateInfo" CssClass="UploadBtnStyle" visible="false"/>
        </asp:Panel>
           
           
                    
            <asp:PlaceHolder ID="phresourceLink" runat="server" Visible="true"></asp:PlaceHolder>

            <!--Grid to show related resources // Button to upload related resources-->
            <h2>Related Resources</h2>

            <asp:Panel ID="infoRelRes" runat="server" Visible="true" CssClass="forminfo">
               <p>Additional resources can be added that are related to this file or document. Some examples of related resources:
            <ul>
            <li>A user's guide for a tool or calculator (add the tool/calculator as the main resource)</li>
            <li>Appendices (add the main body of the report or document first as the main resource)</li>
            <li>Ancillary materials or information </li>
            </ul>
            In each case, please add the main or primary document or file as a resource, then click "Save and Add Related Resources" to add a Related Resource.</p></asp:Panel>
            
            
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
                    <asp:BoundField DataField="resourceyear" HeaderText="Year" SortExpression="resourceyear"  ItemStyle-Width="15%"/>
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"  ItemStyle-Width="15%"/>
                </Columns>
            </asp:GridView>
            </br>
            
            
         

            <!-- Save and cancel button for New Resources (New mode)-->
            <asp:PlaceHolder ID="ph1" runat="server">
            <div style="background:#e1e1e1;">
                <asp:Button ID="btnSave1" runat="server" CommandName="Saveresource1" Text="Save and Exit">
                </asp:Button>
                &nbsp;&nbsp;
                <asp:Button ID="btnSave4" runat="server" CommandName="Saveresource4" Text="Save and Add Another">
                </asp:Button>
                &nbsp;&nbsp;
                <asp:Button ID="btnCancel1" runat="server" CommandName="Cancelresource1" Text="Cancel">
                </asp:Button>
                </div>
            </asp:PlaceHolder>
            <!-- save, cancel, and delete buttons for Existing Resources (Edit Mode)-->
            <asp:PlaceHolder ID="ph2" runat="server">
                
                <asp:Button ID="btnSave2" runat="server" CommandName="Saveresource2" Text="Save and Exit">
                </asp:Button>
                &nbsp;&nbsp;
                <asp:Button ID="btnSave6" runat="server" CommandName="Saveresource6" Text="Save and Add Another">
                </asp:Button>
                &nbsp;&nbsp;
                <asp:Button ID="btnSave3" runat="server" CommandName="Saveresource3" Text="Save and Add a Related Resource">
                </asp:Button>
                &nbsp;&nbsp;
                <asp:Button ID="btnCancel2" runat="server" CommandName="Cancelresource2" Text="Cancel">
                </asp:Button>
                &nbsp;&nbsp;
                <asp:Button ID="btnDelete2" runat="server" CommandName="Deleteresource2" Text="Delete">
                </asp:Button>
            </asp:PlaceHolder>
        </div>
    </div>
    </form>
</body>
</html>
