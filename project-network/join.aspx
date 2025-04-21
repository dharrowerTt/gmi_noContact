<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.project_network_join" CodeBehind="join.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Join the Project Network | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="pn_index_form" runat="server">
        <div>
            <!-- Page Content -->
            <section class="py-5 gmi-light-blue">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 text-center">
                            <img class="logoimg" src="/assets/images/gmipnNew.png" style="min-width: 150px; max-width: 250px; width: 95%; margin-bottom: 25px;">
                        </div>
                        <div class="col-sm-8">
                            <h1>Join GMI's Project Network</h1>
                           <p>This form has been temporarily disabled while GMI updates its contact procedures. If you wish to express interest in joining, please check back soon or email the Secretariat at <a href="mailto:secretariat@globalmethane.org">secretariat@globalmethane.org</a>.</p>
    
						<p><span class="required">*</span> Indicates a required field</p>
                            <div id="cookiealert"></div>
                            <asp:Literal ID="diverror" runat="server"></asp:Literal>
                            <asp:Label ID="lblTopErrorMsg" runat="server" ForeColor="Red" Visible="False">Please check that valid information has been provided for all required fields.</asp:Label>
                            <asp:Label ID="lblErrorVC" runat="server" Width="80px" Height="8px" Visible="False" ForeColor="Red">* Required</asp:Label>
                        </div>
                    </div>
                </div>
            </section>

         <!--

            <section class="py-5 bg-white">
                <div class="container">

                    <h3>Contact Information:</h3>

                    <div class="form-group">
                        <label for="name">
                            Organization Name:
                                <span class="required">*</span>
                        </label>
                        <asp:TextBox ID="name" runat="server" MaxLength="80" CssClass="textfield" Style="width: 100%;">
                        </asp:TextBox>
                        <asp:Label ID="lblErrorOrg" runat="server" Width="150px" Height="8px" Visible="False" ForeColor="Red">* Required</asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="website" style="">
                            Web site:
                        </label>
                        <asp:TextBox ID="website" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                        </asp:TextBox>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="date_entered">
                            Date Entered:
                                <span class="required">*</span>
                        </label>
                        <asp:Label ID="DateEntered" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                        </asp:Label>
                        (dd/mm/yyyy)
                    </div>
                    <div class="row">
                        <div class="col-sm-6 vertSplitter">
                            <div class="form-group">
                                <label for="firstName" style="">
                                    First Name:
                                        <span class="required">*</span>
                                </label>

                                <asp:TextBox ID="firstName" runat="server" MaxLength="50" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                                <asp:Label ID="lblErrorFirstName" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-6 vertSplitter">
                            <label for="lastName" style="">
                                Last Name:
                                      <span class="required">*</span>
                            </label>
                            <asp:TextBox ID="lastName" runat="server" MaxLength="50" CssClass="textfield" Style="width: 100%;">
                            </asp:TextBox>
                            <asp:Label ID="lblErrorLastName" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 vertSplitter">
                            <div class="form-group">
                                <label for="titlex">
                                    Title:</label>
                                <asp:TextBox ID="titlex" runat="server" MaxLength="50" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-6 vertSplitter">
                            <label for="email">
                                Email:
                                <span class="required">*</span>
                            </label>
                            <asp:TextBox ID="email" runat="server" MaxLength="50" CssClass="textfield" Style="width: 100%;">
                            </asp:TextBox>
                            <asp:Label ID="lblErrorEmail" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-4 vertSplitter">
                            <div class="form-group">
                                <label for="telephone">
                                    Telephone:
                                        <span class="required">*</span>
                                </label>
                                <asp:TextBox ID="telephone" runat="server" MaxLength="20" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                                <asp:Label ID="lblErrorTelephone" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
      -->

    <!--

            <section class="py-5">
                <div class="container">

                    <h3>Organization Address:</h3>
                    <div class="form-group">
                        <label for="mailAddress1">
                            Organization Address:
                                <span class="required">*</span>
                        </label>
                        <asp:TextBox ID="mailAddress1" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                        </asp:TextBox>
                        <asp:Label ID="lblErrorMailAddress1" runat="server" Style="width: 150px; height: 8px;" Visible="False"
                            ForeColor="Red">* Required</asp:Label>
                    </div>
                    <div class="form-group">
                        <label>
                            Address Line 2</label>
                        <asp:TextBox ID="mailAddress2" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                        </asp:TextBox>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 vertSplitter">
                            <div class="form-group">
                                <label for="city">
                                    City:
                	                    <span class="required">*</span>
                                </label>
                                <asp:TextBox ID="city" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                                <asp:Label ID="lblErrorCity" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-4 vertSplitter">
                            <div class="form-group">
                                <label for="statpro">
                                    State/Province:</label>
                                <span class="required"></span>
                                <asp:TextBox ID="state" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-4 vertSplitter">
                            <div class="form-group">
                                <label for="postal">
                                    Postal Code:
                                        <span class="required">*</span>
                                </label>
                                <asp:TextBox ID="postalCode" runat="server" MaxLength="20" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                                <asp:Label ID="lblErrorPostalCode" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <label for="ddlCountry">
                                Country:
                                      <span class="required">*</span>
                            </label>
                            <asp:DropDownList ID="ddlCountry" runat="server" Style="width: 100%;">
                            </asp:DropDownList>
                            <asp:Label ID="lblErrorCountry" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                        </div>

                    </div>




                </div>
            </section>

            <section class="py-5 bg-white">
                <div class="container">

                    <h3>Contact Address:</h3>
                    <div class="form-group">
                        <asp:CheckBox ID="cbxSameAsAbove" Text="&nbsp;Same as organization" runat="server" AutoPostBack="true" />

                    </div>

                    <div class="form-group">
                        <label for="mailAddress3">
                            Contact Address</label>
                        <asp:TextBox ID="mailAddress3" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                        </asp:TextBox>
                        <asp:Label ID="lblErrorMailAddress3" runat="server" Style="width: 150px; height: 8px;" Visible="False"
                            ForeColor="Red">* Required</asp:Label>

                    </div>
                    <div class="form-group">
                        <label for="mailAddress4">
                            Contact Address Line 2</label>
                        <asp:TextBox ID="mailAddress4" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                        </asp:TextBox>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 vertSplitter">
                            <div class="form-group">
                                <label for="city_c">
                                    City:
                                        <span class="required">*</span>
                                </label>
                                <asp:TextBox ID="city_c" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                                <asp:Label ID="lblErrorCity_c" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-4 vertSplitter">
                            <div class="form-group">
                                <label for="statpro_c">
                                    State/Province:</label>
                                <span class="required"></span>
                                <asp:TextBox ID="state_c" runat="server" MaxLength="100" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                                <asp:Label ID="lblErrorState_c" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                            </div>
                        </div>
                        <div class="col-sm-4 vertSplitter">
                            <div class="form-group">
                                <label for="postal_c">
                                    Postal Code:
                                        <span class="required">*</span>
                                </label>
                                <asp:TextBox ID="postal_c" runat="server" MaxLength="20" CssClass="textfield" Style="width: 100%;">
                                </asp:TextBox>
                                <asp:Label ID="lblErrorPostal_c" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ddlCountry_c">
                            Country:
                                <span class="required">*</span>
                        </label>
                        <asp:DropDownList ID="ddlCountry_c" runat="server" Style="width: 100%;">
                        </asp:DropDownList>
                        <asp:Label ID="lblErrorCountry_c" runat="server" Style="width: 150px; height: 8px;" Visible="False" ForeColor="Red">* Required</asp:Label>

                    </div>
                </div>





            </section>



            <section class="py-5">
                <div class="container">

                    <h3>Type of Organization:</h3>
                    <p>
                        Select the category that closely defines your organization:
                    </p>
                    <p>
                        <asp:RadioButton ID="orgType1" runat="server" GroupName="orgType"></asp:RadioButton>&nbsp;&nbsp;
                            <strong>Private Sector</strong>:
                    </p>
                    <ul style="margin-left: 35px;">
                        <li>
                            <em>Companies that provide technical, financial, engineering,
                                    consulting services, or equipment to help implement methane abatement, recovery, and
                                    use projects.</em>
                        </li>
                        <li>
                            <em>Energy End Users. Organizations such as power providers, marketers, and energy end users
                                    who use the energy created from methane recovery projects.</em>
                        </li>
                    </ul>
                    <p>
                        <asp:RadioButton ID="orgType2" runat="server" GroupName="orgType"></asp:RadioButton>&nbsp;
                            <strong>Local, regional, or other governmental organization:</strong>
                        <em>Local governments involved in developing and implementing methane projects.</em>
                    </p>

                    <p>
                        <asp:RadioButton ID="orgType3" runat="server" GroupName="orgType"></asp:RadioButton>&nbsp;
                            <strong>Researcher organization:</strong>
                        <em>Researchers who have developed or are interested in developing technologies for methane projects.</em>
                    </p>

                    <p>
                        <asp:RadioButton ID="orgType4" runat="server" GroupName="orgType"></asp:RadioButton>&nbsp;
                            <strong>Non-governmental organization:</strong>
                        <em>Non-profit organizations interested in coordinating with GMI to promote and implement methane 
                                mitigation projects.</em>
                    </p>

                    <p>
                        <asp:RadioButton ID="orgType5" runat="server" GroupName="orgType"></asp:RadioButton>&nbsp;
                            <strong>Financial Institution:</strong>
                        <em>Organizations that provide financing for methane mitigation projects.</em>
                    </p>
                </div>
            </section>


            <section class="py-5 gmi-light-blue">
                <div class="container">

                    <h3>Submit:</h3>

                    <p>
                        <asp:CheckBox ID="cbVC" runat="server"></asp:CheckBox>
                        <asp:Label ID="lblErrorTC" runat="server" ForeColor="Red" Visible="False" Height="8px"
                            Width="80px">* Required</asp:Label>

                        By checking this box and clicking "Submit," you agree to GMI's
                        <a href="/terms/index.aspx" target="_blank">Terms and Conditions</a>.
                    </p>

                    <div id="cookiealert2"></div>

                    <p class="text-center">
                        <asp:Literal ID="diverror2" runat="server"></asp:Literal>
                        <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-primary">Submit</asp:LinkButton>
                        <!--  <asp:LinkButton ID="btnReset" cssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to reset the form? All information will be deleted.');" runat="server">Reset
                        </asp:LinkButton> -->
                    </p>
                    <br>
                    <br>
                    <br>
                </div>
            </section>
            <asp:Label runat="server" ID="lblMemo" Visible="false"></asp:Label>
    </form>



    <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i>Top</button>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element');
        }
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
    </script>
    <script>
        $('.translateText').click(function () {
            $("#languageWidget").css("display", "block");
            $(".hider").slideToggle();
        });
    </script>



    <script>
        //Get the button
        var mybtnToTop = document.getElementById("btnToTop");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () { scrollFunction() };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybtnToTop.style.display = "block";
            } else {
                mybtnToTop.style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>

    <!-- #include virtual="/includes/footer.html" -->


</body>

</html>
