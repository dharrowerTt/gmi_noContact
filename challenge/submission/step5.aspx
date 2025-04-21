<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="step5.aspx.vb" Inherits="M2M_Redesign.step5" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="assets/fontawesome/all.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>GMC Submission Form</title>
        <style>
        table img, .uploadImage{
            width:150px;
            height:auto;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row" style="margin-top:20px; margin-bottom:20px;">
            <div class="col-md-6">
                <img src="https://globalmethane.org/challenge/images/gmclogo.svg" style="width:100%;">
            </div>
            <div class="col-md-6" style="text-align:right;">
                <img src="https://globalmethane.org/challenge/images/gmilogo.svg" style="width:50%;">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h1>Global Methane Challenge Submission Form</h1>
            </div>
        </div>
        <ul class="progressbar">
            <li class="active">Step 1</li>
            <li class="active">Step 2</li>
            <li class="active">Step 3</li>
            <li class="active">Step 4</li>
            <li class="active last">Step 5</li>
        </ul>
        <div class="row">
            <div class="col-md-12 order-md-1">
                <h4 class="mb-3" style="margin-top: 15px;">Step 5: Review your submission and confirm permission for GMI
                    to use this information on the GMI website and in emails and social media.</h4>
                <form id="form1" runat="server" class="needs-validation" novalidate>

                    <div class="mb-3">
                        <label for="organizationname">Organization Name</label>
                        <div class="input-group">
                            <asp:TextBox  class="form-control" ID="organizationname" runat="server" ReadOnly="true"></asp:TextBox>

                            <div class="invalid-feedback" style="width: 100%;">
                                Your Organization Name is required.
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="location">Location (Country)</label>
                        <asp:TextBox class="form-control" ID="location" runat="server" ReadOnly="true"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label for="organizationwebsite">Organization Website</label>
                        <div class="input-group">
                            <asp:TextBox class="form-control" ID="organizationwebsite" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="pocname">Point of Contact Name</label>
                            <asp:TextBox ID="pocname" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            <div class="invalid-feedback">
                                Valid Point of Contact Name is required.
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="phonenumber">Phone Number</label>
                            <asp:TextBox ID="phonenumber" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="emailaddress">Email address</label>
                        <div class="input-group">
                            <asp:TextBox ID="emailaddress" class="form-control" runat="server" runat="server" ReadOnly="true"></asp:TextBox>
                            <div class="invalid-feedback" style="width: 100%;">
                                Your Email address is required.
                            </div>
                        </div>
                    </div>

                    <!-- Step 2 -->
                    <div class="row">
                        <div class="col-md-12 order-md-1">
                            <h4 class="mb-3" style="margin-top: 15px;"></h4>
                           

                                <div class="mb-3">
                                    <label for="actiontitle">Title of action/activity</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="actiontitle" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

          <div class="mb-3">
            <label>Applicable GMI sectors (check all that apply)</label>
            <div class="form-check">
             <asp:CheckBox ID="BioGasCheck" runat="server" class="form-check-input" />
              <label class="form-check-label" for="BioGasCheck">
                Biogas
              </label>
            </div>
            <div class="form-check">
             <asp:CheckBox ID="CoalMinesCheck" runat="server" class="form-check-input"/>
              <label class="form-check-label" for="CoalMinesCheck">
                Coal Mines
              </label>
            </div>
            <div class="form-check">
            <asp:CheckBox ID="OilGasCheck" runat="server" class="form-check-input" />
              <label class="form-check-label" for="OilGasCheck">
                Oil & Gas
              </label>
            </div>
          </div>

                                <div class="mb-3">
                                    <label for="activitylocation">Location(s) of activities (countries)</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="activitylocation" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="partners">Partnering organizations</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="partners" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="form-group">
                                        <label for="activityinfo">Description of activity</label>
                                        <asp:TextBox runat="server" class="form-control textarea" id="activityinfo" maxlength="4000" placeholder="" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
                          
                                        <div class="invalid-feedback" style="width: 100%;">
                                            A description of your activity is required.
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="form-group">
                                        <label for="nextsteps">Outcomes and results of your action</label>
                                       <asp:TextBox runat="server" class="form-control textarea" id="resultsinfo" maxlength="4000" placeholder="" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
                                        <div class="invalid-feedback" style="width: 100%;">
                                            A description of outcomes and results is required.
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="form-group">
                                        <label for="resultsinfo">Next steps/future actions</label>
                                        <asp:TextBox runat="server" class="form-control textarea" id="nextsteps" maxlength="4000" placeholder="" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
                                        <div class="invalid-feedback" style="width: 100%;">
                                            A description of outcomes and results is required.
                                        </div>
                                    </div>
                                </div>


                                <!-- Step 3 -->

                                <div class="row">
                                    <div class="col-md-12 order-md-1">
                                        <h4 class="mb-3" style="margin-top: 15px;"></h4>
                                   

                                            <div class="mb-3">
                                                <label for="urls">Links (list)</label>
                                                <div class="input-group">
                                                    <div id="urlForm" style="width: 100%;">
                                                        <asp:TextBox ID="urlList" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Step 4 -->

                                            <div class="row">
                                                <div class="col-md-12 order-md-1">
                                                    <h4 class="mb-3" style="margin-top: 15px;"></h4>
                                                 

                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label for="exampleFormControlFile1">Images uploaded
                                                                    (list)</label>
                                                                <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:ImageField DataImageUrlField="Path" HeaderText="Image" HeaderStyle-CssClass="uploadImage" />
    </Columns>
</asp:GridView>
                                                            </div>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="videos">Videos (list)</label>
                                                            <div class="input-group">
                                                              <asp:TextBox ID="videoList" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <!-- permission to use content -->

                                                        <div class="mb-3">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input"
                                                                    id="customCheck1" required>
                                                                <br>
                                                                <label class="custom-control-label" for="customCheck1">I
                                                                    grant permission to the Global Methane Initiative
                                                                    Secretariat to post this
                                                                    content.</label>
                                                            </div>
                                                        </div>
                                                        <hr class="mb-4 linebreak">

                                                        <div>
                                                 
                                                            <asp:Button ID="Button1" disabled="true" class="btn btn-primary btn-lg" runat="server" style="float:right;" Text="Submit Action" />
                                                        <a class="btn btn-primary btn-lg" href="step4.aspx"
                                                            type="submit">Previous Step</a>
                                                            <br>
                                                            <br>
                                                        </div>

                                                </div>

                                        </form>
                                    </div>
                                </div>
                                <!-- Optional JavaScript -->
                                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                                <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                                    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                                    crossorigin="anonymous">
                                </script>
                                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                                    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                                    crossorigin="anonymous">
                                </script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                                    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                                    crossorigin="anonymous">
                                </script>

            <script>

                $('input[type=checkbox]').change(
    function () {
        if (this.checked) {
            document.getElementById("Button1").disabled = false;
        } else {
            document.getElementById("Button1").disabled = true;
        }
    });
    </script>
</body>

</html>