<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit.aspx.vb" Inherits="M2M_Redesign.edit1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Delegate Nomination Form for Partner Countries</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .container {
            max-width: 960px;
        }

        .border-top {
            border-top: 1px solid #e5e5e5;
        }

        .border-bottom {
            border-bottom: 1px solid #e5e5e5;
        }

        .border-top-gray {
            border-top-color: #adb5bd;
        }

        .box-shadow {
            box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
        }

        .lh-condensed {
            line-height: 1.25;
        }
        table{
            width:100%;
        }


            .edi {
        text-decoration: none;
    }

    .del {
        text-decoration: none;
        color: red;
    }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        
      <div class="container">
      <div class="py-5">
        <h2 style="color:#2688cf">Delegate Nomination Form for Partner Countries</h2>


   <div class="row">
           <div class="col-md-12 order-md-1">
          <h4 class="mb-3">Montenegro Nomination Form</h4>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">First Name</label>
                  <asp:TextBox ID="firstName" CssClass="form-control" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Last Name</label>
                  <asp:TextBox ID="lastName" CssClass="form-control" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
        
                      
              <div class="col-md-6 mb-3">
                <label for="title">Title</label>
                  <asp:TextBox ID="title" CssClass="form-control" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                  Valid title is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="organization">Organization</label>
                  <asp:TextBox ID="organization" CssClass="form-control" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                  Valid organization is required.
                </div>
              </div>

                           <div class="col-md-6 mb-3">
                <label for="email">Email Address</label>
                 <asp:TextBox ID="email" CssClass="form-control" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                  Valid email address is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="telephone">Telephone Number</label>
                  <asp:TextBox ID="telephone" CssClass="form-control" runat="server" required></asp:TextBox>
                <div class="invalid-feedback">
                  Valid telephone number is required.
                </div>
              </div>

                            <div class="col-md-12 mb-3">
              <label for="nominate">Nominate for:</label>

                  

                  <asp:DropDownList CssClass="form-control" ID="nominate" runat="server">

<asp:ListItem Enabled="true" Text= "Select Category" Value= "-1"></asp:ListItem>

<asp:ListItem Text= "Biogas Subcommittee" Value="Biogas Subcommittee"></asp:ListItem>

<asp:ListItem Text= "Coal Subcommittee" Value="Coal Subcommittee"></asp:ListItem>

    <asp:ListItem Text= "Oil & Gas Subcommittee" Value="Oil & Gas Subcommittee"></asp:ListItem>
                      <asp:ListItem Text= "Administrative Liaison" Value="Administrative Liaison"></asp:ListItem>

</asp:DropDownList>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>
                <div class="col-md-12 mb-3">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Submit" />
</div>
            </div>
       </div>
           </div>
          </div>
          </div>

        


        
    </form>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
