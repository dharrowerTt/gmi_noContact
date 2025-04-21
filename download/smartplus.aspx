<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="smartplus.aspx.vb" Inherits="M2M_Redesign.smartplus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Download | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
        .buttons-html5 {
            margin-left: 20px;
        }
.warning{
color:red;
}
    </style>
</head>
<body>

    <!-- #include virtual="/includes/header.html" -->
  
        <section class="py-5 gmi-light-blue">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <h1 id="mainText">file_to_download</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-white">
		<div class="container">
			<div class="row">
				<div id="divCenter" runat="server" class="col-md-9">
                    <h3 id="titleText">Download and sign up for GMI Updates</h3>
                  <p>Complete the form below to receive occasional emails about this resource, including notices about tool updates and new versions. You can also <a target="_blank" href="https://globalmethane.us19.list-manage.com/subscribe?u=da591cea9e010abd0437239de&id=a3abe26702">join GMI’s general mailing list</a>. You may choose not to provide your contact information by selecting “Skip” at the bottom of the form.<br><br>* Denotes a required field </p>
				  <form id="download_form" runat="server">
                <!-- First Name -->
                <p><label for="firstName"><strong>First Name:</strong></label></p>
                <p><asp:TextBox ID="firstName" runat="server" MaxLength="80" CssClass="form-control" style="width: 100%;"></asp:TextBox></p>
               <!-- Last Name -->
                <p><label for="lastName"><strong>Last Name:</strong></label></p>
                <p><asp:TextBox ID="lastName" runat="server" MaxLength="80" CssClass="form-control" style="width: 100%;"></asp:TextBox></p>
               <!-- Email Address -->
                <p><label for="email"><strong>Email Address:</strong></label></p>
                <p><asp:TextBox ID="email" runat="server" MaxLength="80" CssClass="form-control" style="width: 100%;" required></asp:TextBox></p>
                <!-- Organization -->
                <p><label for="organization"><strong>Organization:</strong></label></p>
                <p><asp:TextBox ID="organization" runat="server" MaxLength="80" CssClass="form-control" style="width: 100%;"></asp:TextBox></p>
                <!-- Country -->
                <p><label for="country"><strong>Country: *</strong></label></p>
                <asp:Label ID="label2" runat="server" Text="" CssClass="warning" />
                         <p><asp:dropdownlist   class="form-control" name="country" id="country" runat="server" required>
                            <asp:listitem value="" disabled="disabled" selected="selected">-- Select --</asp:listitem>
                            <asp:listitem value="Afghanistan">Afghanistan</asp:listitem>
                            <asp:listitem value="Åland Islands">Åland Islands</asp:listitem>
                            <asp:listitem value="Albania">Albania</asp:listitem>
                            <asp:listitem value="Algeria">Algeria</asp:listitem>
                            <asp:listitem value="American Samoa">American Samoa</asp:listitem>
                            <asp:listitem value="Andorra">Andorra</asp:listitem>
                            <asp:listitem value="Angola">Angola</asp:listitem>
                            <asp:listitem value="Anguilla">Anguilla</asp:listitem>
                            <asp:listitem value="Antarctica">Antarctica</asp:listitem>
                            <asp:listitem value="Antigua and Barbuda">Antigua and Barbuda</asp:listitem>
                            <asp:listitem value="Argentina">Argentina</asp:listitem>
                            <asp:listitem value="Armenia">Armenia</asp:listitem>
                            <asp:listitem value="Aruba">Aruba</asp:listitem>
                            <asp:listitem value="Australia">Australia</asp:listitem>
                            <asp:listitem value="Austria">Austria</asp:listitem>
                            <asp:listitem value="Azerbaijan">Azerbaijan</asp:listitem>
                            <asp:listitem value="Bahamas">Bahamas</asp:listitem>
                            <asp:listitem value="Bahrain">Bahrain</asp:listitem>
                            <asp:listitem value="Bangladesh">Bangladesh</asp:listitem>
                            <asp:listitem value="Barbados">Barbados</asp:listitem>
                            <asp:listitem value="Belarus">Belarus</asp:listitem>
                            <asp:listitem value="Belgium">Belgium</asp:listitem>
                            <asp:listitem value="Belize">Belize</asp:listitem>
                            <asp:listitem value="Benin">Benin</asp:listitem>
                            <asp:listitem value="Bermuda">Bermuda</asp:listitem>
                            <asp:listitem value="Bhutan">Bhutan</asp:listitem>
                            <asp:listitem value="Bolivia, Plurinational State of">Bolivia, Plurinational State of</asp:listitem>
                            <asp:listitem value="Bonaire, Sint Eustatius and Saba">Bonaire, Sint Eustatius and Saba</asp:listitem>
                            <asp:listitem value="Bosnia and Herzegovina">Bosnia and Herzegovina</asp:listitem>
                            <asp:listitem value="Botswana">Botswana</asp:listitem>
                            <asp:listitem value="Bouvet Island">Bouvet Island</asp:listitem>
                            <asp:listitem value="Brazil">Brazil</asp:listitem>
                            <asp:listitem value="British Indian Ocean Territory">British Indian Ocean Territory</asp:listitem>
                            <asp:listitem value="Brunei Darussalam">Brunei Darussalam</asp:listitem>
                            <asp:listitem value="Bulgaria">Bulgaria</asp:listitem>
                            <asp:listitem value="Burkina Faso">Burkina Faso</asp:listitem>
                            <asp:listitem value="Burundi">Burundi</asp:listitem>
                            <asp:listitem value="Cambodia">Cambodia</asp:listitem>
                            <asp:listitem value="Cameroon">Cameroon</asp:listitem>
                            <asp:listitem value="Canada">Canada</asp:listitem>
                            <asp:listitem value="Cape Verde">Cape Verde</asp:listitem>
                            <asp:listitem value="Cayman Islands">Cayman Islands</asp:listitem>
                            <asp:listitem value="Central African Republic">Central African Republic</asp:listitem>
                            <asp:listitem value="Chad">Chad</asp:listitem>
                            <asp:listitem value="Chile">Chile</asp:listitem>
                            <asp:listitem value="China">China</asp:listitem>
                            <asp:listitem value="Christmas Island">Christmas Island</asp:listitem>
                            <asp:listitem value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</asp:listitem>
                            <asp:listitem value="Colombia">Colombia</asp:listitem>
                            <asp:listitem value="Comoros">Comoros</asp:listitem>
                            <asp:listitem value="Congo">Congo</asp:listitem>
                            <asp:listitem value="Congo, the Democratic Republic of the">Congo, the Democratic Republic of the</asp:listitem>
                            <asp:listitem value="Cook Islands">Cook Islands</asp:listitem>
                            <asp:listitem value="Costa Rica">Costa Rica</asp:listitem>
                            <asp:listitem value="Côte d'Ivoire">Côte d'Ivoire</asp:listitem>
                            <asp:listitem value="Croatia">Croatia</asp:listitem>
                            <asp:listitem value="Cuba">Cuba</asp:listitem>
                            <asp:listitem value="Curaçao">Curaçao</asp:listitem>
                            <asp:listitem value="Cyprus">Cyprus</asp:listitem>
                            <asp:listitem value="Czech Republic">Czech Republic</asp:listitem>
                            <asp:listitem value="Denmark">Denmark</asp:listitem>
                            <asp:listitem value="Djibouti">Djibouti</asp:listitem>
                            <asp:listitem value="Dominica">Dominica</asp:listitem>
                            <asp:listitem value="Dominican Republic">Dominican Republic</asp:listitem>
                            <asp:listitem value="Ecuador">Ecuador</asp:listitem>
                            <asp:listitem value="Egypt">Egypt</asp:listitem>
                            <asp:listitem value="El Salvador">El Salvador</asp:listitem>
                            <asp:listitem value="Equatorial Guinea">Equatorial Guinea</asp:listitem>
                            <asp:listitem value="Eritrea">Eritrea</asp:listitem>
                            <asp:listitem value="Estonia">Estonia</asp:listitem>
                            <asp:listitem value="Ethiopia">Ethiopia</asp:listitem>
                            <asp:listitem value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</asp:listitem>
                            <asp:listitem value="Faroe Islands">Faroe Islands</asp:listitem>
                            <asp:listitem value="Fiji">Fiji</asp:listitem>
                            <asp:listitem value="Finland">Finland</asp:listitem>
                            <asp:listitem value="France">France</asp:listitem>
                            <asp:listitem value="rench Guiana">French Guiana</asp:listitem>
                            <asp:listitem value="French Polynesia">French Polynesia</asp:listitem>
                            <asp:listitem value="French Southern Territories">French Southern Territories</asp:listitem>
                            <asp:listitem value="Gabon">Gabon</asp:listitem>
                            <asp:listitem value="Gambia">Gambia</asp:listitem>
                            <asp:listitem value="Georgia">Georgia</asp:listitem>
                            <asp:listitem value="Germany">Germany</asp:listitem>
                            <asp:listitem value="Ghana">Ghana</asp:listitem>
                            <asp:listitem value="Gibraltar">Gibraltar</asp:listitem>
                            <asp:listitem value="Greece">Greece</asp:listitem>
                            <asp:listitem value="Greenland">Greenland</asp:listitem>
                            <asp:listitem value="Grenada">Grenada</asp:listitem>
                            <asp:listitem value="Guadeloupe">Guadeloupe</asp:listitem>
                            <asp:listitem value="Guam">Guam</asp:listitem>
                            <asp:listitem value="Guatemala">Guatemala</asp:listitem>
                            <asp:listitem value="Guernsey">Guernsey</asp:listitem>
                            <asp:listitem value="Guinea">Guinea</asp:listitem>
                            <asp:listitem value="Guinea-Bissau">Guinea-Bissau</asp:listitem>
                            <asp:listitem value="Guyana">Guyana</asp:listitem>
                            <asp:listitem value="Haiti">Haiti</asp:listitem>
                            <asp:listitem value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</asp:listitem>
                            <asp:listitem value="Holy See (Vatican City State)">Holy See (Vatican City State)</asp:listitem>
                            <asp:listitem value="Honduras">Honduras</asp:listitem>
                            <asp:listitem value="Hong Kong">Hong Kong</asp:listitem>
                            <asp:listitem value="Hungary">Hungary</asp:listitem>
                            <asp:listitem value="Iceland">Iceland</asp:listitem>
                            <asp:listitem value="India">India</asp:listitem>
                            <asp:listitem value="Indonesia">Indonesia</asp:listitem>
                            <asp:listitem value="Iran, Islamic Republic of">Iran, Islamic Republic of</asp:listitem>
                            <asp:listitem value="Iraq">Iraq</asp:listitem>
                            <asp:listitem value="Ireland">Ireland</asp:listitem>
                            <asp:listitem value="Isle of Man">Isle of Man</asp:listitem>
                            <asp:listitem value="Israel">Israel</asp:listitem>
                            <asp:listitem value="Italy">Italy</asp:listitem>
                            <asp:listitem value="Jamaica">Jamaica</asp:listitem>
                            <asp:listitem value="Japan">Japan</asp:listitem>
                            <asp:listitem value="Jersey">Jersey</asp:listitem>
                            <asp:listitem value="Jordan">Jordan</asp:listitem>
                            <asp:listitem value="Kazakhstan">Kazakhstan</asp:listitem>
                            <asp:listitem value="Kenya">Kenya</asp:listitem>
                            <asp:listitem value="Kiribati">Kiribati</asp:listitem>
                            <asp:listitem value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</asp:listitem>
                            <asp:listitem value="Korea, Republic of">Korea, Republic of</asp:listitem>
                            <asp:listitem value="Kuwait">Kuwait</asp:listitem>
                            <asp:listitem value="Kyrgyzstan">Kyrgyzstan</asp:listitem>
                            <asp:listitem value="Lao People's Democratic Republic">Lao People's Democratic Republic</asp:listitem>
                            <asp:listitem value="Latvia">Latvia</asp:listitem>
                            <asp:listitem value="Lebanon">Lebanon</asp:listitem>
                            <asp:listitem value="Lesotho">Lesotho</asp:listitem>
                            <asp:listitem value="Liberia">Liberia</asp:listitem>
                            <asp:listitem value="Libya">Libya</asp:listitem>
                            <asp:listitem value="Liechtenstein">Liechtenstein</asp:listitem>
                            <asp:listitem value="Lithuania">Lithuania</asp:listitem>
                            <asp:listitem value="Luxembourg">Luxembourg</asp:listitem>
                            <asp:listitem value="Macao">Macao</asp:listitem>
                            <asp:listitem value="Madagascar">Madagascar</asp:listitem>
                            <asp:listitem value="Malawi">Malawi</asp:listitem>
                            <asp:listitem value="Malaysia">Malaysia</asp:listitem>
                            <asp:listitem value="Maldives">Maldives</asp:listitem>
                            <asp:listitem value="Mali">Mali</asp:listitem>
                            <asp:listitem value="Malta">Malta</asp:listitem>
                            <asp:listitem value="Marshall Islands">Marshall Islands</asp:listitem>
                            <asp:listitem value="Martinique">Martinique</asp:listitem>
                            <asp:listitem value="Mauritania">Mauritania</asp:listitem>
                            <asp:listitem value="Mauritius">Mauritius</asp:listitem>
                            <asp:listitem value="Mayotte">Mayotte</asp:listitem>
                            <asp:listitem value="Mexico">Mexico</asp:listitem>
                            <asp:listitem value="Micronesia, Federated States of">Micronesia, Federated States of</asp:listitem>
                            <asp:listitem value="Moldova, Republic of">Moldova, Republic of</asp:listitem>
                            <asp:listitem value="Monaco">Monaco</asp:listitem>
                            <asp:listitem value="Mongolia">Mongolia</asp:listitem>
                            <asp:listitem value="Montenegro">Montenegro</asp:listitem>
                            <asp:listitem value="Montserrat">Montserrat</asp:listitem>
                            <asp:listitem value="Morocco">Morocco</asp:listitem>
                            <asp:listitem value="Mozambique">Mozambique</asp:listitem>
                            <asp:listitem value="Myanmar">Myanmar</asp:listitem>
                            <asp:listitem value="Namibia">Namibia</asp:listitem>
                            <asp:listitem value="Nauru">Nauru</asp:listitem>
                            <asp:listitem value="Nepal">Nepal</asp:listitem>
                            <asp:listitem value="Netherlands">Netherlands</asp:listitem>
                            <asp:listitem value="New Caledonia">New Caledonia</asp:listitem>
                            <asp:listitem value="New Zealand">New Zealand</asp:listitem>
                            <asp:listitem value="Nicaragua">Nicaragua</asp:listitem>
                            <asp:listitem value="Niger">Niger</asp:listitem>
                            <asp:listitem value="Nigeria">Nigeria</asp:listitem>
                            <asp:listitem value="Niue">Niue</asp:listitem>
                            <asp:listitem value="Norfolk Island">Norfolk Island</asp:listitem>
                            <asp:listitem value="Northern Mariana Islands">Northern Mariana Islands</asp:listitem>
                            <asp:listitem value="Norway">Norway</asp:listitem>
                            <asp:listitem value="Oman">Oman</asp:listitem>
                            <asp:listitem value="Pakistan">Pakistan</asp:listitem>
                            <asp:listitem value="Palau">Palau</asp:listitem>
                            <asp:listitem value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</asp:listitem>
                            <asp:listitem value="Panama">Panama</asp:listitem>
                            <asp:listitem value="Papua New Guinea">Papua New Guinea</asp:listitem>
                            <asp:listitem value="Paraguay">Paraguay</asp:listitem>
                            <asp:listitem value="Peru">Peru</asp:listitem>
                            <asp:listitem value="Philippines">Philippines</asp:listitem>
                            <asp:listitem value="Pitcairn">Pitcairn</asp:listitem>
                            <asp:listitem value="Poland">Poland</asp:listitem>
                            <asp:listitem value="Portugal">Portugal</asp:listitem>
                            <asp:listitem value="Puerto Rico">Puerto Rico</asp:listitem>
                            <asp:listitem value="Qatar">Qatar</asp:listitem>
                            <asp:listitem value="Réunion">Réunion</asp:listitem>
			                <asp:listitem value="Republic of North Macedonia">Republic of North Macedonia</asp:listitem>
                            <asp:listitem value="Romania">Romania</asp:listitem>
                            <asp:listitem value="Russian Federation">Russian Federation</asp:listitem>
                            <asp:listitem value="Rwanda">Rwanda</asp:listitem>
                            <asp:listitem value="Saint Barthélemy">Saint Barthélemy</asp:listitem>
                            <asp:listitem value="Saint Helena, Ascension and Tristan da Cunha">Saint Helena, Ascension and Tristan da Cunha</asp:listitem>
                            <asp:listitem value="Saint Kitts and Nevis">Saint Kitts and Nevis</asp:listitem>
                            <asp:listitem value="Saint Lucia">Saint Lucia</asp:listitem>
                            <asp:listitem value="Saint Martin (French part)">Saint Martin (French part)</asp:listitem>
                            <asp:listitem value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</asp:listitem>
                            <asp:listitem value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</asp:listitem>
                            <asp:listitem value="Samoa">Samoa</asp:listitem>
                            <asp:listitem value="San Marino">San Marino</asp:listitem>
                            <asp:listitem value="Sao Tome and Principe">Sao Tome and Principe</asp:listitem>
                            <asp:listitem value="Saudi Arabia">Saudi Arabia</asp:listitem>
                            <asp:listitem value="Senegal">Senegal</asp:listitem>
                            <asp:listitem value="Serbia">Serbia</asp:listitem>
                            <asp:listitem value="Seychelles">Seychelles</asp:listitem>
                            <asp:listitem value="Sierra Leone">Sierra Leone</asp:listitem>
                            <asp:listitem value="Singapore">Singapore</asp:listitem>
                            <asp:listitem value="Sint Maarten (Dutch part)">Sint Maarten (Dutch part)</asp:listitem>
                            <asp:listitem value="Slovakia">Slovakia</asp:listitem>
                            <asp:listitem value="Slovenia">Slovenia</asp:listitem>
                            <asp:listitem value="Solomon Islands">Solomon Islands</asp:listitem>
                            <asp:listitem value="Somalia">Somalia</asp:listitem>
                            <asp:listitem value="South Africa">South Africa</asp:listitem>
                            <asp:listitem value="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</asp:listitem>
                            <asp:listitem value="South Sudan">South Sudan</asp:listitem>
                            <asp:listitem value="Spain">Spain</asp:listitem>
                            <asp:listitem value="Sri Lanka">Sri Lanka</asp:listitem>
                            <asp:listitem value="Sudan">Sudan</asp:listitem>
                            <asp:listitem value="Suriname">Suriname</asp:listitem>
                            <asp:listitem value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</asp:listitem>
                            <asp:listitem value="Eswatini">Eswantini</asp:listitem>
                            <asp:listitem value="Sweden">Sweden</asp:listitem>
                            <asp:listitem value="Switzerland">Switzerland</asp:listitem>
                            <asp:listitem value="Syrian Arab Republic">Syrian Arab Republic</asp:listitem>
                            <asp:listitem value="Taiwan, Province of China">Taiwan, Province of China</asp:listitem>
                            <asp:listitem value="Tajikistan">Tajikistan</asp:listitem>
                            <asp:listitem value="Tanzania, United Republic of">Tanzania, United Republic of</asp:listitem>
                            <asp:listitem value="Thailand">Thailand</asp:listitem>
                            <asp:listitem value="Timor-Leste">Timor-Leste</asp:listitem>
                            <asp:listitem value="Togo">Togo</asp:listitem>
                            <asp:listitem value="Tokelau">Tokelau</asp:listitem>
                            <asp:listitem value="Tonga">Tonga</asp:listitem>
                            <asp:listitem value="Trinidad and Tobago">Trinidad and Tobago</asp:listitem>
                            <asp:listitem value="Tunisia">Tunisia</asp:listitem>
                            <asp:listitem value="Turkey">Turkey (Türkiye)</asp:listitem>
                            <asp:listitem value="Turkmenistan">Turkmenistan</asp:listitem>
                            <asp:listitem value="Turks and Caicos Islands">Turks and Caicos Islands</asp:listitem>
                            <asp:listitem value="Tuvalu">Tuvalu</asp:listitem>
                            <asp:listitem value="Uganda">Uganda</asp:listitem>
                            <asp:listitem value="Ukraine">Ukraine</asp:listitem>
                            <asp:listitem value="United Arab Emirates">United Arab Emirates</asp:listitem>
                            <asp:listitem value="United Kingdom">United Kingdom</asp:listitem>
                            <asp:listitem value="United States">United States</asp:listitem>
                            <asp:listitem value="United States Minor Outlying Islands">United States Minor Outlying Islands</asp:listitem>
                            <asp:listitem value="Uruguay">Uruguay</asp:listitem>
                            <asp:listitem value="Uzbekistan">Uzbekistan</asp:listitem>
                            <asp:listitem value="Vanuatu">Vanuatu</asp:listitem>
                            <asp:listitem value="Venezuela, Bolivarian Republic of">Venezuela, Bolivarian Republic of</asp:listitem>
                            <asp:listitem value="Vietnam">Vietnam</asp:listitem>
                            <asp:listitem value="Virgin Islands, British">Virgin Islands, British</asp:listitem>
                            <asp:listitem value="Virgin Islands, U.S.">Virgin Islands, U.S.</asp:listitem>
                            <asp:listitem value="Wallis and Futuna">Wallis and Futuna</asp:listitem>
                            <asp:listitem value="Western Sahara">Western Sahara</asp:listitem>
                            <asp:listitem value="Yemen">Yemen</asp:listitem>
                            <asp:listitem value="Zambia">Zambia</asp:listitem>
                            <asp:listitem value="Zimbabwe">Zimbabwe</asp:listitem>
                      </asp:dropdownlist></p>
                <!-- Intended Use -->
                <p><label for="intendedUse"><strong>Intended Use:</strong></label></p>
                <p><asp:TextBox ID="intendedUse" runat="server" MaxLength="80" TextMode="MultiLine" CssClass="form-control" style="width: 100%;"></asp:TextBox></p>
                    <p><asp:TextBox ID="resource" runat="server" MaxLength="80"  CssClass="form-control" style="display:none;"></asp:TextBox></p>
                    <p><asp:LinkButton ID="btnSubmit" runat="server"  cssClass="btn btn-primary">Submit and download</asp:LinkButton> Send your contact information to GMI and then load the resource.</p>
                    <p><asp:LinkButton ID="btnSkip" runat="server" cssClass="btn btn-secondary">Skip and download</asp:LinkButton> Load the resource without submitting your contact information.</p>

                      <asp:Label ID="Label1" runat="server"  Text="Label" Visible="False"><strong>Thanks for downloading. Please take a look at our <a href="../resources/">other resources</a>. </strong></asp:Label>
                      <a href="javascript:history.back()">Return to resource page</a>.
                    
                        </form>
			</div>
                <div class="col-md-3">
		
				</div>
            </div>
		</div>
	</section>

    <script>

        function MyJSFunction() {
            console.log("hello");
        }
    </script>





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

    <script>
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) { return pair[1]; }
            }
            return (false);
        }

        var Resource = getQueryVariable("id");

        var HeaderArea = document.getElementById("titleText");
        var HeaderImage = document.getElementById("titleImage");
        var mainText = document.getElementById("mainText");

        if (Resource == "1") {
            HeaderArea.textContent = "SMART Plus Facility Template (v1.0)";
            mainText.textContent = "SMART Plus Facility Template (v1.0)";
            document.getElementById("resource").value = "SMART Plus Facility Template (v1.0)";
        }
        if (Resource == "2") {
            HeaderArea.textContent = "SMART Plus Database Application (v1.0)";
            mainText.textContent = "SMART Plus Database Application (v1.0)";
            document.getElementById("resource").value = "SMART Plus Database Application (v1.0)";
        }
        if (Resource == "3") {
            HeaderArea.textContent = "SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)";
            mainText.textContent = "SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)";
            document.getElementById("resource").value = "SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)";
        }
       
        document.title = "Download " + mainText.textContent;

        function myRedirectFunction() {
            setTimeout(myURL, 5000);
        }

        function myURL() {
            window.history.go(-2);
        }
    </script>
</body>
</html>
 