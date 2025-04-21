<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="delegateNomination.aspx.vb" Inherits="M2M_Redesign.delegateNomination" %>

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
      <div class="py-5"><img src="_logo_tagline.svg" style="width:200px;" />
        <h2 style="color:#2688cf">Delegate Nomination Form for Partner Countries</h2>
        <p><strong>About GMI Subcommittees.</strong> The Global Methane Initiative’s (GMI) three Subcommittees provide international leadership, collaboration opportunities, capacity-building support, and technical assistance to advance the abatement, recovery, and use of methane in the <a href="https://www.globalmethane.org/biogas">biogas</a>, <a href="https://www.globalmethane.org/coal">coal mines</a>, and <a href="https://www.globalmethane.org/oil-gas">oil and gas</a> sectors. Per GMI’s <a href="https://www.globalmethane.org/terms/index.aspx">Terms of Reference</a>, Subcommittees are comprised of representatives from interested Partners, non-governmental organizations, and Project Network members.  </p>
          <div class="row">
          <div class="col-md-6"><p><strong>Delegates to the Subcommittees</strong><br /> 
          Each Partner Country may identify up to three delegates to participate on each Subcommittee (Biogas, Coal Mines, and Oil & Gas). Partner Country delegates are required to represent government organizations. For each delegate, please provide the following information:</p></div>
          <div class="col-md-6"><strong>Administrative Liaison</strong><br />Please identify one individual to serve as the Partner Country’s principal point of contact to the Secretariat. The Secretariat will work with the Administrative Liaison to ensure an adequate flow of information between GMI and individual Partner Countries.   </div>
        </div>
                    <p><strong>Next Steps </strong><br />
Once the delegate information has been submitted, the Secretariat will review the information, update our records, and send a welcome letter to each delegate which will provide details about how to engage actively in GMI activities and interact with fellow delegates. The names of the Subcommittee delegates, without email addresses, will be publicly provided on the GMI website.  </p>

 

<p>Thank you! The Secretariat looks forward to working with your country’s delegates. If you have questions or assistance, please reach out to the Secretariat at <a href="mailto:secretariat@globalmethane.org">secretariat@globalmethane.org</a>.</p>


                 <div class="row">
           <div class="col-md-12 order-md-1">
          <h4 class="mb-3"><%= countryName  %> Nomination Form</h4>
               <p><em> Enter data in the fields below and click the Submit button. Once you click Submit, you'll be directed back to a blank Nomination Form to add the next delegate.</em></p>
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

                  
                                <span id="biogasCNT"></span>
                                <span id="coalCNT"></span>
                                <span id="oilgasCNT"></span>
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

          <asp:PlaceHolder ID="PlaceHolder1" runat="server" />


        
    </form>

    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <script src="//cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {

    


            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }

          //  var ct = getQueryVariable("ct");
          //  var usr = getQueryVariable("usr");



            $('#nominees').DataTable(
                {
                    paging: false,
                    ordering: false,
                    searching: false,
                    bInfo: false,
                    columnDefs: [
                        {
                            render: function (data, type, row) {
                                if (data.length > 2) {
                                    return '<a href="delete.aspx?id=' + data + '" class="del"> Delete</a>';
                                    //| <a href="edit.aspx?id=' + data + '" class="edi">Edit</a>'
                                } else {
                                    return 'no data to display';
                                }
                            },
                            targets: 0,
                        },
                        {
                            render: function (data, type, row) {
                                return data + ' ' + row[2];
                            },
                            targets: 1,
                        },
                        { visible: false, targets: [2] },
                    ],
                    fnInitComplete: function () {
                        if ($(this).find('tbody tr').length < 1) {
                            $(this).parent().hide();
                        }
                    }
                });
        });



    </script>
</body>
</html>
