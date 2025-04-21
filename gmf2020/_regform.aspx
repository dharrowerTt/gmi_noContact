<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="regform.aspx.vb" Inherits="M2M_Redesign.regform110" EnableEventValidation="false" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

           <!--#include file="../_register/googleAnalytics.html"-->
      <!--#include file="include/metaproperties.html"-->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

    <title>Global Methane Forum 2020</title>
    <link rel="stylesheet" type="text/css" href="../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../_register/css/formstyles.css">
    <link rel="stylesheet" type="text/css" href="eventcss/eventstyles.css">
    <script src="https://use.fontawesome.com/f40f14ac2c.js"></script>
      <style>
          .hidden{
              display:none;
          }
      </style>
</head>
<body>
     <div id="page-container">
   <div id="content-wrap">
    <!--#include file="include/header.html"-->

            <script>
                function getParam(name) {
                    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
                    var regexS = "[\\?&]" + name + "=([^&#]*)";
                    var regex = new RegExp(regexS);
                    var results = regex.exec(window.location.href);
                    if (results == null)
                        return "";
                    else
                        return results[1];
                }

               

                function edited()
                {

                    var emailAddress = getParam("ID");

                  Swal.fire({
                      title: 'Signed Up!',
                      html: 'Thank you for registering! Remember to sign up with UNECE too!',
                      type: 'success',
                      confirmButtonText: 'Got it!'
                  }).then(function () {
                      window.location.href = "success.aspx?ID=" + emailAddress;
                  });
              }
  </script>
<div class="container" style="margin-top:3.5rem;">
          <!-- Example row of columns -->
          <div class="row">
            <div class="col-md-12">
<!------
    ---->

    <h2>Registration</h2>

              <p>Please complete the form below to register with GMI. Once you are registered, you must also visit the <a href="https://www.unece.org/index.php?id=52506" target="_blank">UNECE event page</a> and register with UNECE To obtain access to the Forum</p>
                


                <div id="speakerdiv" runat="server" class="alert alert-success hidden"><strong>Please Note:</strong>&nbsp;You are registering as a speaker for the Global Methane Forum. After you register, you will be asked to complete your speaker profile.</div> 
                
                 <form id="form1" runat="server">
                
                <fieldset>
                 <asp:TextBox ID = "contactID" name="contactID" type="hidden" runat = "server" required/>
                  <legend class="blue">Contact Information</legend>
  
                  <div class="formgrid">
                      <asp:TextBox ID = "fName" name="firstname" runat = "server" required/>
                        <label for="firstname">First Name</label>
  
                        <asp:TextBox ID = "lName" name="lastname" runat = "server" required/>
                        <label for="lastname">Last Name</label>

                       <asp:TextBox ID = "emailAddress" name="emailAddress" ReadOnly  value="" runat = "server" required/>
                        <label for="emailAddress">Email Address</label>
  
                        <asp:TextBox ID = "jobTitle" name="jobTitle" runat = "server" required/>
                        <label for="jobtitle">Job Title</label>
  
                     <asp:TextBox ID = "organization" name="organization" runat = "server" required/>
                        <label for="organization">Organization</label>
  
                        <asp:dropdownlist name="country" id="country" required runat="server">
                            <asp:listitem disabled="true" selected="true" value="">-- Select --</asp:listitem>
                            <asp:listitem value="AF">Afghanistan</asp:listitem>
                            <asp:listitem value="AX">Åland Islands</asp:listitem>
                            <asp:listitem value="AL">Albania</asp:listitem>
                            <asp:listitem value="DZ">Algeria</asp:listitem>
                            <asp:listitem value="AS">American Samoa</asp:listitem>
                            <asp:listitem value="AD">Andorra</asp:listitem>
                            <asp:listitem value="AO">Angola</asp:listitem>
                            <asp:listitem value="AI">Anguilla</asp:listitem>
                            <asp:listitem value="AQ">Antarctica</asp:listitem>
                            <asp:listitem value="AG">Antigua and Barbuda</asp:listitem>
                            <asp:listitem value="AR">Argentina</asp:listitem>
                            <asp:listitem value="AM">Armenia</asp:listitem>
                            <asp:listitem value="AW">Aruba</asp:listitem>
                            <asp:listitem value="AU">Australia</asp:listitem>
                            <asp:listitem value="AT">Austria</asp:listitem>
                            <asp:listitem value="AZ">Azerbaijan</asp:listitem>
                            <asp:listitem value="BS">Bahamas</asp:listitem>
                            <asp:listitem value="BH">Bahrain</asp:listitem>
                            <asp:listitem value="BD">Bangladesh</asp:listitem>
                            <asp:listitem value="BB">Barbados</asp:listitem>
                            <asp:listitem value="BY">Belarus</asp:listitem>
                            <asp:listitem value="BE">Belgium</asp:listitem>
                            <asp:listitem value="BZ">Belize</asp:listitem>
                            <asp:listitem value="BJ">Benin</asp:listitem>
                            <asp:listitem value="BM">Bermuda</asp:listitem>
                            <asp:listitem value="BT">Bhutan</asp:listitem>
                            <asp:listitem value="BO">Bolivia, Plurinational State of</asp:listitem>
                            <asp:listitem value="BQ">Bonaire, Sint Eustatius and Saba</asp:listitem>
                            <asp:listitem value="BA">Bosnia and Herzegovina</asp:listitem>
                            <asp:listitem value="BW">Botswana</asp:listitem>
                            <asp:listitem value="BV">Bouvet Island</asp:listitem>
                            <asp:listitem value="BR">Brazil</asp:listitem>
                            <asp:listitem value="IO">British Indian Ocean Territory</asp:listitem>
                            <asp:listitem value="BN">Brunei Darussalam</asp:listitem>
                            <asp:listitem value="BG">Bulgaria</asp:listitem>
                            <asp:listitem value="BF">Burkina Faso</asp:listitem>
                            <asp:listitem value="BI">Burundi</asp:listitem>
                            <asp:listitem value="KH">Cambodia</asp:listitem>
                            <asp:listitem value="CM">Cameroon</asp:listitem>
                            <asp:listitem value="CA">Canada</asp:listitem>
                            <asp:listitem value="CV">Cape Verde</asp:listitem>
                            <asp:listitem value="KY">Cayman Islands</asp:listitem>
                            <asp:listitem value="CF">Central African Republic</asp:listitem>
                            <asp:listitem value="TD">Chad</asp:listitem>
                            <asp:listitem value="CL">Chile</asp:listitem>
                            <asp:listitem value="CN">China</asp:listitem>
                            <asp:listitem value="CX">Christmas Island</asp:listitem>
                            <asp:listitem value="CC">Cocos (Keeling) Islands</asp:listitem>
                            <asp:listitem value="CO">Colombia</asp:listitem>
                            <asp:listitem value="KM">Comoros</asp:listitem>
                            <asp:listitem value="CG">Congo</asp:listitem>
                            <asp:listitem value="CD">Congo, the Democratic Republic of the</asp:listitem>
                            <asp:listitem value="CK">Cook Islands</asp:listitem>
                            <asp:listitem value="CR">Costa Rica</asp:listitem>
                            <asp:listitem value="CI">Côte d'Ivoire</asp:listitem>
                            <asp:listitem value="HR">Croatia</asp:listitem>
                            <asp:listitem value="CU">Cuba</asp:listitem>
                            <asp:listitem value="CW">Curaçao</asp:listitem>
                            <asp:listitem value="CY">Cyprus</asp:listitem>
                            <asp:listitem value="CZ">Czech Republic</asp:listitem>
                            <asp:listitem value="DK">Denmark</asp:listitem>
                            <asp:listitem value="DJ">Djibouti</asp:listitem>
                            <asp:listitem value="DM">Dominica</asp:listitem>
                            <asp:listitem value="DO">Dominican Republic</asp:listitem>
                            <asp:listitem value="EC">Ecuador</asp:listitem>
                            <asp:listitem value="EG">Egypt</asp:listitem>
                            <asp:listitem value="SV">El Salvador</asp:listitem>
                            <asp:listitem value="GQ">Equatorial Guinea</asp:listitem>
                            <asp:listitem value="ER">Eritrea</asp:listitem>
                            <asp:listitem value="EE">Estonia</asp:listitem>
                            <asp:listitem value="ET">Ethiopia</asp:listitem>
                            <asp:listitem value="FK">Falkland Islands (Malvinas)</asp:listitem>
                            <asp:listitem value="FO">Faroe Islands</asp:listitem>
                            <asp:listitem value="FJ">Fiji</asp:listitem>
                            <asp:listitem value="FI">Finland</asp:listitem>
                            <asp:listitem value="FR">France</asp:listitem>
                            <asp:listitem value="GF">French Guiana</asp:listitem>
                            <asp:listitem value="PF">French Polynesia</asp:listitem>
                            <asp:listitem value="TF">French Southern Territories</asp:listitem>
                            <asp:listitem value="GA">Gabon</asp:listitem>
                            <asp:listitem value="GM">Gambia</asp:listitem>
                            <asp:listitem value="GE">Georgia</asp:listitem>
                            <asp:listitem value="DE">Germany</asp:listitem>
                            <asp:listitem value="GH">Ghana</asp:listitem>
                            <asp:listitem value="GI">Gibraltar</asp:listitem>
                            <asp:listitem value="GR">Greece</asp:listitem>
                            <asp:listitem value="GL">Greenland</asp:listitem>
                            <asp:listitem value="GD">Grenada</asp:listitem>
                            <asp:listitem value="GP">Guadeloupe</asp:listitem>
                            <asp:listitem value="GU">Guam</asp:listitem>
                            <asp:listitem value="GT">Guatemala</asp:listitem>
                            <asp:listitem value="GG">Guernsey</asp:listitem>
                            <asp:listitem value="GN">Guinea</asp:listitem>
                            <asp:listitem value="GW">Guinea-Bissau</asp:listitem>
                            <asp:listitem value="GY">Guyana</asp:listitem>
                            <asp:listitem value="HT">Haiti</asp:listitem>
                            <asp:listitem value="HM">Heard Island and McDonald Islands</asp:listitem>
                            <asp:listitem value="VA">Holy See (Vatican City State)</asp:listitem>
                            <asp:listitem value="HN">Honduras</asp:listitem>
                            <asp:listitem value="HK">Hong Kong</asp:listitem>
                            <asp:listitem value="HU">Hungary</asp:listitem>
                            <asp:listitem value="IS">Iceland</asp:listitem>
                            <asp:listitem value="IN">India</asp:listitem>
                            <asp:listitem value="ID">Indonesia</asp:listitem>
                            <asp:listitem value="IR">Iran, Islamic Republic of</asp:listitem>
                            <asp:listitem value="IQ">Iraq</asp:listitem>
                            <asp:listitem value="IE">Ireland</asp:listitem>
                            <asp:listitem value="IM">Isle of Man</asp:listitem>
                            <asp:listitem value="IL">Israel</asp:listitem>
                            <asp:listitem value="IT">Italy</asp:listitem>
                            <asp:listitem value="JM">Jamaica</asp:listitem>
                            <asp:listitem value="JP">Japan</asp:listitem>
                            <asp:listitem value="JE">Jersey</asp:listitem>
                            <asp:listitem value="JO">Jordan</asp:listitem>
                            <asp:listitem value="KZ">Kazakhstan</asp:listitem>
                            <asp:listitem value="KE">Kenya</asp:listitem>
                            <asp:listitem value="KI">Kiribati</asp:listitem>
                            <asp:listitem value="KP">Korea, Democratic People's Republic of</asp:listitem>
                            <asp:listitem value="KR">Korea, Republic of</asp:listitem>
                            <asp:listitem value="KW">Kuwait</asp:listitem>
                            <asp:listitem value="KG">Kyrgyzstan</asp:listitem>
                            <asp:listitem value="LA">Lao People's Democratic Republic</asp:listitem>
                            <asp:listitem value="LV">Latvia</asp:listitem>
                            <asp:listitem value="LB">Lebanon</asp:listitem>
                            <asp:listitem value="LS">Lesotho</asp:listitem>
                            <asp:listitem value="LR">Liberia</asp:listitem>
                            <asp:listitem value="LY">Libya</asp:listitem>
                            <asp:listitem value="LI">Liechtenstein</asp:listitem>
                            <asp:listitem value="LT">Lithuania</asp:listitem>
                            <asp:listitem value="LU">Luxembourg</asp:listitem>
                            <asp:listitem value="MO">Macao</asp:listitem>
                            <asp:listitem value="MK">Macedonia, the former Yugoslav Republic of</asp:listitem>
                            <asp:listitem value="MG">Madagascar</asp:listitem>
                            <asp:listitem value="MW">Malawi</asp:listitem>
                            <asp:listitem value="MY">Malaysia</asp:listitem>
                            <asp:listitem value="MV">Maldives</asp:listitem>
                            <asp:listitem value="ML">Mali</asp:listitem>
                            <asp:listitem value="MT">Malta</asp:listitem>
                            <asp:listitem value="MH">Marshall Islands</asp:listitem>
                            <asp:listitem value="MQ">Martinique</asp:listitem>
                            <asp:listitem value="MR">Mauritania</asp:listitem>
                            <asp:listitem value="MU">Mauritius</asp:listitem>
                            <asp:listitem value="YT">Mayotte</asp:listitem>
                            <asp:listitem value="MX">Mexico</asp:listitem>
                            <asp:listitem value="FM">Micronesia, Federated States of</asp:listitem>
                            <asp:listitem value="MD">Moldova, Republic of</asp:listitem>
                            <asp:listitem value="MC">Monaco</asp:listitem>
                            <asp:listitem value="MN">Mongolia</asp:listitem>
                            <asp:listitem value="ME">Montenegro</asp:listitem>
                            <asp:listitem value="MS">Montserrat</asp:listitem>
                            <asp:listitem value="MA">Morocco</asp:listitem>
                            <asp:listitem value="MZ">Mozambique</asp:listitem>
                            <asp:listitem value="MM">Myanmar</asp:listitem>
                            <asp:listitem value="NA">Namibia</asp:listitem>
                            <asp:listitem value="NR">Nauru</asp:listitem>
                            <asp:listitem value="NP">Nepal</asp:listitem>
                            <asp:listitem value="NL">Netherlands</asp:listitem>
                            <asp:listitem value="NC">New Caledonia</asp:listitem>
                            <asp:listitem value="NZ">New Zealand</asp:listitem>
                            <asp:listitem value="NI">Nicaragua</asp:listitem>
                            <asp:listitem value="NE">Niger</asp:listitem>
                            <asp:listitem value="NG">Nigeria</asp:listitem>
                            <asp:listitem value="NU">Niue</asp:listitem>
                            <asp:listitem value="NF">Norfolk Island</asp:listitem>
                            <asp:listitem value="MP">Northern Mariana Islands</asp:listitem>
                            <asp:listitem value="NO">Norway</asp:listitem>
                            <asp:listitem value="OM">Oman</asp:listitem>
                            <asp:listitem value="PK">Pakistan</asp:listitem>
                            <asp:listitem value="PW">Palau</asp:listitem>
                            <asp:listitem value="PS">Palestinian Territory, Occupied</asp:listitem>
                            <asp:listitem value="PA">Panama</asp:listitem>
                            <asp:listitem value="PG">Papua New Guinea</asp:listitem>
                            <asp:listitem value="PY">Paraguay</asp:listitem>
                            <asp:listitem value="PE">Peru</asp:listitem>
                            <asp:listitem value="PH">Philippines</asp:listitem>
                            <asp:listitem value="PN">Pitcairn</asp:listitem>
                            <asp:listitem value="PL">Poland</asp:listitem>
                            <asp:listitem value="PT">Portugal</asp:listitem>
                            <asp:listitem value="PR">Puerto Rico</asp:listitem>
                            <asp:listitem value="QA">Qatar</asp:listitem>
                            <asp:listitem value="RE">Réunion</asp:listitem>
                            <asp:listitem value="RO">Romania</asp:listitem>
                            <asp:listitem value="RU">Russian Federation</asp:listitem>
                            <asp:listitem value="RW">Rwanda</asp:listitem>
                            <asp:listitem value="BL">Saint Barthélemy</asp:listitem>
                            <asp:listitem value="SH">Saint Helena, Ascension and Tristan da Cunha</asp:listitem>
                            <asp:listitem value="KN">Saint Kitts and Nevis</asp:listitem>
                            <asp:listitem value="LC">Saint Lucia</asp:listitem>
                            <asp:listitem value="MF">Saint Martin (French part)</asp:listitem>
                            <asp:listitem value="PM">Saint Pierre and Miquelon</asp:listitem>
                            <asp:listitem value="VC">Saint Vincent and the Grenadines</asp:listitem>
                            <asp:listitem value="WS">Samoa</asp:listitem>
                            <asp:listitem value="SM">San Marino</asp:listitem>
                            <asp:listitem value="ST">Sao Tome and Principe</asp:listitem>
                            <asp:listitem value="SA">Saudi Arabia</asp:listitem>
                            <asp:listitem value="SN">Senegal</asp:listitem>
                            <asp:listitem value="RS">Serbia</asp:listitem>
                            <asp:listitem value="SC">Seychelles</asp:listitem>
                            <asp:listitem value="SL">Sierra Leone</asp:listitem>
                            <asp:listitem value="SG">Singapore</asp:listitem>
                            <asp:listitem value="SX">Sint Maarten (Dutch part)</asp:listitem>
                            <asp:listitem value="SK">Slovakia</asp:listitem>
                            <asp:listitem value="SI">Slovenia</asp:listitem>
                            <asp:listitem value="SB">Solomon Islands</asp:listitem>
                            <asp:listitem value="SO">Somalia</asp:listitem>
                            <asp:listitem value="ZA">South Africa</asp:listitem>
                            <asp:listitem value="GS">South Georgia and the South Sandwich Islands</asp:listitem>
                            <asp:listitem value="SS">South Sudan</asp:listitem>
                            <asp:listitem value="ES">Spain</asp:listitem>
                            <asp:listitem value="LK">Sri Lanka</asp:listitem>
                            <asp:listitem value="SD">Sudan</asp:listitem>
                            <asp:listitem value="SR">Suriname</asp:listitem>
                            <asp:listitem value="SJ">Svalbard and Jan Mayen</asp:listitem>
                            <asp:listitem value="SZ">Swaziland</asp:listitem>
                            <asp:listitem value="SE">Sweden</asp:listitem>
                            <asp:listitem value="CH">Switzerland</asp:listitem>
                            <asp:listitem value="SY">Syrian Arab Republic</asp:listitem>
                            <asp:listitem value="TW">Taiwan, Province of China</asp:listitem>
                            <asp:listitem value="TJ">Tajikistan</asp:listitem>
                            <asp:listitem value="TZ">Tanzania, United Republic of</asp:listitem>
                            <asp:listitem value="TH">Thailand</asp:listitem>
                            <asp:listitem value="TL">Timor-Leste</asp:listitem>
                            <asp:listitem value="TG">Togo</asp:listitem>
                            <asp:listitem value="TK">Tokelau</asp:listitem>
                            <asp:listitem value="TO">Tonga</asp:listitem>
                            <asp:listitem value="TT">Trinidad and Tobago</asp:listitem>
                            <asp:listitem value="TN">Tunisia</asp:listitem>
                            <asp:listitem value="TR">Turkey</asp:listitem>
                            <asp:listitem value="TM">Turkmenistan</asp:listitem>
                            <asp:listitem value="TC">Turks and Caicos Islands</asp:listitem>
                            <asp:listitem value="TV">Tuvalu</asp:listitem>
                            <asp:listitem value="UG">Uganda</asp:listitem>
                            <asp:listitem value="UA">Ukraine</asp:listitem>
                            <asp:listitem value="AE">United Arab Emirates</asp:listitem>
                            <asp:listitem value="GB">United Kingdom</asp:listitem>
                            <asp:listitem value="US">United States</asp:listitem>
                            <asp:listitem value="UM">United States Minor Outlying Islands</asp:listitem>
                            <asp:listitem value="UY">Uruguay</asp:listitem>
                            <asp:listitem value="UZ">Uzbekistan</asp:listitem>
                            <asp:listitem value="VU">Vanuatu</asp:listitem>
                            <asp:listitem value="VE">Venezuela, Bolivarian Republic of</asp:listitem>
                            <asp:listitem value="VN">Viet Nam</asp:listitem>
                            <asp:listitem value="VG">Virgin Islands, British</asp:listitem>
                            <asp:listitem value="VI">Virgin Islands, U.S.</asp:listitem>
                            <asp:listitem value="WF">Wallis and Futuna</asp:listitem>
                            <asp:listitem value="EH">Western Sahara</asp:listitem>
                            <asp:listitem value="YE">Yemen</asp:listitem>
                            <asp:listitem value="ZM">Zambia</asp:listitem>
                            <asp:listitem value="ZW">Zimbabwe</asp:listitem>
                      </asp:dropdownlist>
                        <label for="country">Country</label>
  
                        <asp:TextBox ID = "phone" name="phone" runat = "server" required/>
                        <label for="phone">Phone</label>

                        <asp:TextBox ID = "internationalPhone" name="internationalPhone" runat = "server"/>
                        <label for="internationalPhone">International Phone</label>

                       
                        <asp:TextBox ID = "dietaryRequirements" name="dietaryRequirements" TextMode="MultiLine" runat = "server"/>
                        <label for="dietaryRequirements" style="padding-left:0;">Dietary Requirements</label>

                      <asp:TextBox ID = "specialNeeds" name="specialNeeds" TextMode="MultiLine" runat = "server"/>
                        <label for="specialNeeds" style="padding-left:0;">Let us know if you need special accommodations to participate.<br />You will be contacted by someone from our staff to discuss your specific needs. </label>
                
                  </div>
  
              </fieldset>
              <br>
  
                <fieldset id="participationfields">
                  <legend class="blue">Participant Information</legend>
                  <p>Please provide the following information.</p>
  
                  <div class="formgrid">
                      <asp:ListBox name="sector" id="sector"  SelectionMode="multiple" required runat="server">
                           <asp:listitem value="Biogas">Biogas</asp:listitem>
                            <asp:listitem value="Coal">Coal Mines</asp:listitem>
                           <asp:listitem value="Oil&Gas">Oil & Gas</asp:listitem>
                             <asp:listitem value="Steering">Steering</asp:listitem>
                      </asp:ListBox>

                        <label for="country">Sector (Select multiple sectors using Ctrl+Click)</label>
                </div>
                    <br />
                      <p>What dates will you be attending the Global Methane Forum 2020?</p>
                  <div class="formgrid">
                      <asp:CheckBox id="attend23" runat="server" Text="Monday, 23 March" TextAlign="Right"/>
                      <asp:CheckBox id="attend24" runat="server" Text="Tuesday, 24 March" TextAlign="Right"/>
                      <asp:CheckBox id="attend25" runat="server" Text="Wednesday, 25 March" TextAlign="Right"/>
                      <asp:CheckBox id="attend26" runat="server" Text="Thursday, 26 March" TextAlign="Right"/>
                      <asp:CheckBox id="attend27" runat="server" Text="Friday, 27 March" TextAlign="Right"/>

                                 <asp:dropdownlist name="awareness" id="awareness" required runat="server">
                            <asp:listitem value="">-- Select --</asp:listitem>
                            <asp:listitem value="GlobalMethane.org">GlobalMethane.org</asp:listitem>
                            <asp:listitem value="Email Newsletter">Email Newsletter</asp:listitem>
                           <asp:listitem value="Social Media">Social Media</asp:listitem>
                                     <asp:listitem value="UNECE Website">UNECE Website</asp:listitem>
                                     <asp:listitem value="Other">Other</asp:listitem>
                      </asp:dropdownlist>
                        <label for="awareness">How did you hear about the GMF?</label>
  

                      
                      <br />

                  </div>
                    <div style="border:1px solid #856404;" class="alert alert-warning" role="alert"><i class="fa fa-warning"></i> <b>Important: </b> You <strong>must also</strong> register with <a href="https://www.unece.org/index.php?id=52506" target="_blank">UNECE</a> to attend the Global Methane Forum 2020. </div>
  </fieldset>
             
                      <div id="speakerreg" runat="server" class="hidden">
                           <div class="centerbutton">
                              <asp:Button ID="Button2" runat="server" Text="Save and Continue to Speaker Profile Page" class="alert alert-success"  style="font-weight:bold;"/>
                            </div>


                      </div> 
                     <div id="regreg" runat="server" class="hidden" >
              <div class="centerbutton">
                              <asp:Button ID="Button1" runat="server" Text="Register" />
              </div>
                         </div>
                     
            </form>


<!------
    ---->


 
              
            </div>
          </div>
  
        </div> <!-- /container -->
  
       </div>
    <!--#include file="include/footer.html"-->
         </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
          </body>
</html>