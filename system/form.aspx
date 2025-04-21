<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="form.aspx.vb" Inherits="M2M_Redesign.form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Webform to Update Information</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="//cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" rel="stylesheet" />
<style>
    .edi {
        text-decoration: none;
    }

    .del {
        text-decoration: none;
        color: red;
    }

    table.dataTable thead th {
        background-color: #ADD7F6
    }

    .add {
        text-decoration: none;
        font-weight: bold;
        color: #1A1B41;
    }
    input[type="text"], textarea {

  background-color : #d7eff2; 

}
    input[type=radio] {
    float: left;
    margin-top:7px;
}

label {
    margin-left: 30px;
    display: block;
}

</style>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="../assets/images/gmi.svg" style="width: 100%" />
                </div>
                <div class="col-md-8">
                    <h1>Webform to Renew Membership on the Steering Committee | Edit Representative </h1>


                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                        <asp:TextBox ID="FirstName" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                        <asp:TextBox ID="LastName" runat="server" class="form-control"></asp:TextBox>
                    </div>
                  <div class="form-group">
                        <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
                        <asp:TextBox ID="TitleField" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblOrg" runat="server" Text="Organization"></asp:Label>
                        <asp:TextBox ID="Org" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email Address"></asp:Label>
                        <asp:TextBox ID="Email" runat="server" class="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
                        <div class="form-check">
                            <asp:RadioButton GroupName="roleQuestion" runat="server" ID="roleChair" Enabled="false" />
                            <label class="form-check-label" for="flexRadioDefault2">
                                Chair
                            </label>
                        </div>
                                                <div class="form-check">
                            <asp:RadioButton GroupName="roleQuestion" runat="server" ID="roleViceChair" Enabled="false" />
                            <label class="form-check-label" for="flexRadioDefault2">
                                Vice Chair
                            </label>
                        </div>
                        <div class="form-check">
                            <asp:RadioButton GroupName="roleQuestion" runat="server" ID="roleDelegate" />
                            <label class="form-check-label" for="flexRadioDefault2">
                                Delegate: <em>Individual who serves as a country representative on the Steering Committee. Up to 2 delegates per country. </em>
                            </label>
                        </div>
                        <div class="form-check">
                            <asp:RadioButton GroupName="roleQuestion" runat="server" ID="roleAlternate" />
                            <label class="form-check-label" for="flexRadioDefault2">
                                Alternate Delegate: <em>Individuals who assist active delegates or serve as an alternative contact should the active delegate be unavailable. Up to 2 alternate delegates per country. </em> 
                            </label>
                        </div>
                           <div class="form-check">
                            <asp:RadioButton GroupName="roleQuestion" runat="server" ID="roleInactivated" />
                            <label class="form-check-label" for="flexRadioDefault2">
                                Inactive (Mark as inactive) 
                            </label>
                        </div>
                            </div>
                     <div class="form-group">
                               Is this representative also an Administrative Liaison?
                            <em>One individual who serves as the Partner Country’s principal point of contact to the Secretariat. </em>
                        <div class="form-check">
                  
                            <div class="col-md-2">
                            <asp:RadioButton GroupName="roleALQuestion" runat="server" ID="alNO" />
                            <label class="form-check-label" for="flexRadioDefault2">
                                No
                            </label>
                            </div>
                            <div class="col-md-2">
                            <asp:RadioButton GroupName="roleALQuestion" runat="server" ID="alYes" />
                            <label class="form-check-label" for="flexRadioDefault2">
                                Yes
                            </label>
                            </div>
                        </div>
                        <asp:TextBox ID="namefield" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="profilefield" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="useridfield" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="geofield" runat="server" Visible="false"></asp:TextBox>

                        <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" />

                    </div>
                </div>
            </div>
        </div>
    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
</body>
</html>
