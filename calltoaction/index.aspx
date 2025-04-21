<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Methane Initiative | A Call to Action on Methane</title>
    <!-- Primary Meta Tags -->

    <meta name="title" content="Global Methane Initiative | A Call to Action on Methane">
    <meta name="description" content="an international dialogue hosted by the GMI">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://globalmethane.org/calltoaction/">
    <meta property="og:title" content="Global Methane Initiative | A Call to Action on Methane">
    <meta property="og:description" content="an international dialogue hosted by the GMI">
    <meta property="og:image" content="https://globalmethane.org/calltoaction/assets/ctathumb.png">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://globalmethane.org/calltoaction/">
    <meta property="twitter:title" content="Global Methane Initiative | A Call to Action on Methane">
    <meta property="twitter:description" content="an international dialogue hosted by the GMI">
    <meta property="twitter:image" content="https://globalmethane.org/calltoaction/assets/ctathumb.png">
    <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=60636eccae08f90011442b11&product=sop' async='async'></script>
    <!-- #include virtual="/includes/include_head.html" -->

    <style>
        .gmi-light-orange {
            display: none;
        }

        body {
            background: #dcf4fd !important;
        }

        .agenda {
            width: 100%;
            margin: auto;
            margin-bottom: 20px;
        }

            .agenda tr:first-child {
                background: #2980b9;
                white-space: nowrap;
            }

            .agenda th {
                text-align: center;
                color: white;
                padding: 5px;
            }

            .agenda tr:nth-child(2) {
                background: #dcf4fd;
            }

            .agenda tr {
                border-bottom: 1px solid #0abde3;
            }

                .agenda tr td:first-child {
                    padding: 5px;
                    vertical-align: top;
                }


                .agenda tr td:nth-child(2) {
                    padding: 5px;
                    vertical-align: top;
                }

                .agenda tr td:first-child span {
                    font-weight: bold;
                }

                .agenda tr td:first-child ul {
                    list-style-type: none;
                }

        label span {
            color: #d63031;
        }

        .requiredNote {
            color: #d63031;
        }

        .sidebar h2 {
            color: #96def9;
        }

        .caption span {
            color: #d63031;
        }

        .sidebar ul {
            margin: 0.75em 0;
            padding: 0 1em;
            list-style: none;
        }

            .sidebar ul li::before {
                content: "";
                border-color: transparent #96def9;
                border-style: solid;
                border-width: 0.35em 0 0.35em 0.45em;
                display: block;
                height: 0;
                width: 0;
                left: -1em;
                top: 0.9em;
                position: relative;
            }

        .agenda tr:nth-child(2) {
            background: #dcf4fd !important;
            border-bottom: 2px solid #007ac2;
        }

        .agenda tr:last-child {
            background: #dcf4fd !important;
            border-top: 2px solid #007ac2;
        }

        @media (max-width: 768px) {
            .sidebarImg {
                display: none
            }
        }

        .ctanav {
            background: #131131;
            color: #fafcfc;
            text-align: center;
            padding: 8px;
            border-bottom: 2px solid #262261;
        }

            .ctanav ul {
                list-style-type: none;
                margin: 0;
                padding-left: 0px;
                white-space: nowrap;
            }

        @media (max-width: 576px) {
            .ctanav ul {
                font-size: smaller;
            }

            .smbreak {
                margin-bottom: 20px;
            }
        }

        .caption {
            font-size: 12px;
        }

        .ctanav ul li {
            padding: 15px;
            display: inline;
        }

            .ctanav ul li a {
                color: white;
            }


        .mainTitle {
            color: #262261;
            line-height: .8;
            font-size: 1.5rem !important;
            margin-bottom: 0;
        }

        h2 span {
            color: #455445;
            font-weight: normal;
            font-size: 16px;
        }

        h4 {
            margin-bottom: 0 !important;
            font-size: 1.35rem !important;
            font-weight: normal;
        }

        h5 {
            font-weight: normal;
            color: #444444;
            font-size: 16px;
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
<body>
    <!-- #include virtual="/includes/header.html" -->
    <div class="container" style="z-index: 300; background: rgba(255,255,255,.8); padding: 0;">
        <header>

            <div id="headercarouselarea" class="carousel slide carousel-fade" data-ride="carousel" data-interval="10000" style="border-bottom: 2px solid #007ac2;">
                <ol class="carousel-indicators">
                    <li data-target="#headercarouselarea" data-slide-to="0" class="active"></li>
                    <li data-target="#headercarouselarea" data-slide-to="1"></li>

                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" data-interval="12000" style="background-image: linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.5)), url('assets/space.jpg')">
                        <div class="carousel-caption d-none d-md-block" style="color: #fcfcfc!important;">
                            <h1 class="display-5">A Call to Action on Methane:</h1>
                            <h2>an international dialogue hosted by the GMI</h2>
                        </div>
                    </div>
                    <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" data-interval="12000"
                         style="background-image:linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.8)), url('assets/space2.jpg')">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="display-5">Featured Speakers</h2>
                            <p class="lead">
                                View a list of speakers at our event on 3 June.
                            </p>
                            <p><a role="button" class="btn btn-primary btn-sm" href="sepeakers.aspx">View Speakers</a></p>
                        </div>
                    </div>

                    <a class="carousel-control-prev" href="#headercarouselarea" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#headercarouselarea" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>


                </div>

            </div>
        </header>
    </div>
    <div class="container">
        <div class="row ctanav">
            <div class="col-md-12">
                <ul>
                    <li><a href="index.aspx">Register</a></li>
                    <li><a href="agenda.aspx">Agenda</a></li>
                    <li><a href="speakers.aspx">Speakers</a></li>
                    <li><a href="help.aspx">Help</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 sidebar order-12 order-md-1" style="z-index: 300; background: #262261; padding-top: 20px; color: #fcfcfc;">
                <h2>Join Us         </h2>
                <div id="mapdiv" style="max-width: 100%; height: 250px;"></div>
                Currently, <%= CountryCountString  %> individuals from 50 countries are registered to participate.
                <hr>
                <h2>Objectives         </h2>
                <ul>
                    <li>Raise international awareness of critical need to reduce methane emissions.</li>
                    <li>Emphasize opportunities for the Global Methane Initiative (GMI) and strategic partners to take action to reduce methane.</li>
                </ul>
                <hr>
               <!-- <img class="sidebarImg" src="assets/methane.png" style="width: 100%;"> -->
                <h2>Outcome</h2>
                Engaged, empowered partners prepared to act on methane.
        <br />
                <br />
            </div>
            <div class="col-md-8 order-1 order-md-12" style="z-index: 300; background: #fcfcfc; padding-top: 20px; color: #232323;">
                <div class="row">
                    <div class="col-md-9">
                        <h3 class="mainTitle" style="white-space: nowrap;">A Call to Action on Methane:</h3>
                        <h4>an international dialogue hosted by&nbsp;the&nbsp;GMI</h4>
                        <h5>3 June 2021 • 8:00-10:30 am EDT (&zwj;<a href="help.aspx">UTC&nbsp;-&zwj;4</a>&zwj;)</h5>
                    </div>
                    <div class="col-md-3 smbreak">
                        <p style="text-align: right; font-size: 12px; color: #565656; margin-bottom: 3px;">Share this page:</p>
                        <div class="sharethis-inline-share-buttons"></div>
                    </div>
                </div>

                <h2>Registration</h2>
                <p>Registration is now open.</p>

                <!-- form needs unhidden-->
                <form runat="server">
                    <div class="caption"><span>*</span> Denotes a required field</div>
                    <div class="form-group">
                        <label for="emailAddress">Email address <span>*</span></label>
                        <asp:TextBox ID="emailAddress" runat="server" class="form-control" placeholder="Email Address" required type="email"></asp:TextBox>
                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your details with anyone else.</small>-->
                    </div>
                    <div class="row form-group">
                        <div class="col">
                            <label for="firstName">First Name <span>*</span></label>
                            <asp:TextBox ID="fName" runat="server" class="form-control" placeholder="First name" required type="text"></asp:TextBox>

                        </div>
                        <div class="col">
                            <label for="lastName">Last Name (Surname) <span>*</span></label>
                            <asp:TextBox ID="lName" runat="server" class="form-control" placeholder="Last name" required type="text"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col">
                            <label for="Organization">Organization <span>*</span></label>
                            <asp:TextBox ID="organization" runat="server" class="form-control" required placeholder="Organization" type="text"></asp:TextBox>
                        </div>
                        <div class="col">
                            <!--<label for="JobTitle">Job Title</label>
        <asp:TextBox ID="jobTitle" runat="server" class="form-control"  placeholder="Job Title"  type="text"></asp:TextBox>-->
                            <label for="country">Country <span>*</span></label>
                            <asp:DropDownList class="form-control" name="country" ID="country" runat="server" required>
                                <asp:ListItem Value="" disabled Selected>Please Choose Your Country</asp:ListItem>
                                <asp:ListItem Value="Afganistan">Afghanistan</asp:ListItem>
                                <asp:ListItem Value="Albania">Albania</asp:ListItem>
                                <asp:ListItem Value="Algeria">Algeria</asp:ListItem>
                                <asp:ListItem Value="American Samoa">American Samoa</asp:ListItem>
                                <asp:ListItem Value="Andorra">Andorra</asp:ListItem>
                                <asp:ListItem Value="Angola">Angola</asp:ListItem>
                                <asp:ListItem Value="Anguilla">Anguilla</asp:ListItem>
                                <asp:ListItem Value="Antigua & Barbuda">Antigua & Barbuda</asp:ListItem>
                                <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                                <asp:ListItem Value="Armenia">Armenia</asp:ListItem>
                                <asp:ListItem Value="Aruba">Aruba</asp:ListItem>
                                <asp:ListItem Value="Australia">Australia</asp:ListItem>
                                <asp:ListItem Value="Austria">Austria</asp:ListItem>
                                <asp:ListItem Value="Azerbaijan">Azerbaijan</asp:ListItem>
                                <asp:ListItem Value="Bahamas">Bahamas</asp:ListItem>
                                <asp:ListItem Value="Bahrain">Bahrain</asp:ListItem>
                                <asp:ListItem Value="Bangladesh">Bangladesh</asp:ListItem>
                                <asp:ListItem Value="Barbados">Barbados</asp:ListItem>
                                <asp:ListItem Value="Belarus">Belarus</asp:ListItem>
                                <asp:ListItem Value="Belgium">Belgium</asp:ListItem>
                                <asp:ListItem Value="Belize">Belize</asp:ListItem>
                                <asp:ListItem Value="Benin">Benin</asp:ListItem>
                                <asp:ListItem Value="Bermuda">Bermuda</asp:ListItem>
                                <asp:ListItem Value="Bhutan">Bhutan</asp:ListItem>
                                <asp:ListItem Value="Bolivia">Bolivia</asp:ListItem>
                                <asp:ListItem Value="Bonaire">Bonaire</asp:ListItem>
                                <asp:ListItem Value="Bosnia & Herzegovina">Bosnia & Herzegovina</asp:ListItem>
                                <asp:ListItem Value="Botswana">Botswana</asp:ListItem>
                                <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                                <asp:ListItem Value="British Indian Ocean Ter">British Indian Ocean Ter</asp:ListItem>
                                <asp:ListItem Value="Brunei">Brunei</asp:ListItem>
                                <asp:ListItem Value="Bulgaria">Bulgaria</asp:ListItem>
                                <asp:ListItem Value="Burkina Faso">Burkina Faso</asp:ListItem>
                                <asp:ListItem Value="Burundi">Burundi</asp:ListItem>
                                <asp:ListItem Value="Cambodia">Cambodia</asp:ListItem>
                                <asp:ListItem Value="Cameroon">Cameroon</asp:ListItem>
                                <asp:ListItem Value="Canada">Canada</asp:ListItem>
                                <asp:ListItem Value="Canary Islands">Canary Islands</asp:ListItem>
                                <asp:ListItem Value="Cape Verde">Cape Verde</asp:ListItem>
                                <asp:ListItem Value="Cayman Islands">Cayman Islands</asp:ListItem>
                                <asp:ListItem Value="Central African Republic">Central African Republic</asp:ListItem>
                                <asp:ListItem Value="Chad">Chad</asp:ListItem>
                                <asp:ListItem Value="Channel Islands">Channel Islands</asp:ListItem>
                                <asp:ListItem Value="Chile">Chile</asp:ListItem>
                                <asp:ListItem Value="China">China</asp:ListItem>
                                <asp:ListItem Value="Christmas Island">Christmas Island</asp:ListItem>
                                <asp:ListItem Value="Cocos Island">Cocos Island</asp:ListItem>
                                <asp:ListItem Value="Colombia">Colombia</asp:ListItem>
                                <asp:ListItem Value="Comoros">Comoros</asp:ListItem>
                                <asp:ListItem Value="Congo">Congo</asp:ListItem>
                                <asp:ListItem Value="Cook Islands">Cook Islands</asp:ListItem>
                                <asp:ListItem Value="Costa Rica">Costa Rica</asp:ListItem>
                                <asp:ListItem Value="Cote DIvoire">Cote DIvoire</asp:ListItem>
                                <asp:ListItem Value="Croatia">Croatia</asp:ListItem>
                                <asp:ListItem Value="Cuba">Cuba</asp:ListItem>
                                <asp:ListItem Value="Curaco">Curacao</asp:ListItem>
                                <asp:ListItem Value="Cyprus">Cyprus</asp:ListItem>
                                <asp:ListItem Value="Czech Republic">Czech Republic</asp:ListItem>
                                <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                                <asp:ListItem Value="Djibouti">Djibouti</asp:ListItem>
                                <asp:ListItem Value="Dominica">Dominica</asp:ListItem>
                                <asp:ListItem Value="Dominican Republic">Dominican Republic</asp:ListItem>
                                <asp:ListItem Value="East Timor">East Timor</asp:ListItem>
                                <asp:ListItem Value="Ecuador">Ecuador</asp:ListItem>
                                <asp:ListItem Value="Egypt">Egypt</asp:ListItem>
                                <asp:ListItem Value="El Salvador">El Salvador</asp:ListItem>
                                <asp:ListItem Value="Equatorial Guinea">Equatorial Guinea</asp:ListItem>
                                <asp:ListItem Value="Eritrea">Eritrea</asp:ListItem>
                                <asp:ListItem Value="Estonia">Estonia</asp:ListItem>
                                <asp:ListItem Value="Ethiopia">Ethiopia</asp:ListItem>
                                <asp:ListItem Value="Falkland Islands">Falkland Islands</asp:ListItem>
                                <asp:ListItem Value="Faroe Islands">Faroe Islands</asp:ListItem>
                                <asp:ListItem Value="Fiji">Fiji</asp:ListItem>
                                <asp:ListItem Value="Finland">Finland</asp:ListItem>
                                <asp:ListItem Value="France">France</asp:ListItem>
                                <asp:ListItem Value="French Guiana">French Guiana</asp:ListItem>
                                <asp:ListItem Value="French Polynesia">French Polynesia</asp:ListItem>
                                <asp:ListItem Value="French Southern Ter">French Southern Ter</asp:ListItem>
                                <asp:ListItem Value="Gabon">Gabon</asp:ListItem>
                                <asp:ListItem Value="Gambia">Gambia</asp:ListItem>
                                <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                                <asp:ListItem Value="Germany">Germany</asp:ListItem>
                                <asp:ListItem Value="Ghana">Ghana</asp:ListItem>
                                <asp:ListItem Value="Gibraltar">Gibraltar</asp:ListItem>
                                <asp:ListItem Value="Great Britain">Great Britain</asp:ListItem>
                                <asp:ListItem Value="Greece">Greece</asp:ListItem>
                                <asp:ListItem Value="Greenland">Greenland</asp:ListItem>
                                <asp:ListItem Value="Grenada">Grenada</asp:ListItem>
                                <asp:ListItem Value="Guadeloupe">Guadeloupe</asp:ListItem>
                                <asp:ListItem Value="Guam">Guam</asp:ListItem>
                                <asp:ListItem Value="Guatemala">Guatemala</asp:ListItem>
                                <asp:ListItem Value="Guinea">Guinea</asp:ListItem>
                                <asp:ListItem Value="Guyana">Guyana</asp:ListItem>
                                <asp:ListItem Value="Haiti">Haiti</asp:ListItem>
                                <asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
                                <asp:ListItem Value="Honduras">Honduras</asp:ListItem>
                                <asp:ListItem Value="Hong Kong">Hong Kong</asp:ListItem>
                                <asp:ListItem Value="Hungary">Hungary</asp:ListItem>
                                <asp:ListItem Value="Iceland">Iceland</asp:ListItem>
                                <asp:ListItem Value="Indonesia">Indonesia</asp:ListItem>
                                <asp:ListItem Value="India">India</asp:ListItem>
                                <asp:ListItem Value="Iran">Iran</asp:ListItem>
                                <asp:ListItem Value="Iraq">Iraq</asp:ListItem>
                                <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                                <asp:ListItem Value="Isle of Man">Isle of Man</asp:ListItem>
                                <asp:ListItem Value="Israel">Israel</asp:ListItem>
                                <asp:ListItem Value="Italy">Italy</asp:ListItem>
                                <asp:ListItem Value="Jamaica">Jamaica</asp:ListItem>
                                <asp:ListItem Value="Japan">Japan</asp:ListItem>
                                <asp:ListItem Value="Jordan">Jordan</asp:ListItem>
                                <asp:ListItem Value="Kazakhstan">Kazakhstan</asp:ListItem>
                                <asp:ListItem Value="Kenya">Kenya</asp:ListItem>
                                <asp:ListItem Value="Kiribati">Kiribati</asp:ListItem>
                                <asp:ListItem Value="Korea North">Korea North</asp:ListItem>
                                <asp:ListItem Value="Korea Sout">Korea South</asp:ListItem>
                                <asp:ListItem Value="Kuwait">Kuwait</asp:ListItem>
                                <asp:ListItem Value="Kyrgyzstan">Kyrgyzstan</asp:ListItem>
                                <asp:ListItem Value="Laos">Laos</asp:ListItem>
                                <asp:ListItem Value="Latvia">Latvia</asp:ListItem>
                                <asp:ListItem Value="Lebanon">Lebanon</asp:ListItem>
                                <asp:ListItem Value="Lesotho">Lesotho</asp:ListItem>
                                <asp:ListItem Value="Liberia">Liberia</asp:ListItem>
                                <asp:ListItem Value="Libya">Libya</asp:ListItem>
                                <asp:ListItem Value="Liechtenstein">Liechtenstein</asp:ListItem>
                                <asp:ListItem Value="Lithuania">Lithuania</asp:ListItem>
                                <asp:ListItem Value="Luxembourg">Luxembourg</asp:ListItem>
                                <asp:ListItem Value="Macau">Macau</asp:ListItem>
                                <asp:ListItem Value="Macedonia">Macedonia</asp:ListItem>
                                <asp:ListItem Value="Madagascar">Madagascar</asp:ListItem>
                                <asp:ListItem Value="Malaysia">Malaysia</asp:ListItem>
                                <asp:ListItem Value="Malawi">Malawi</asp:ListItem>
                                <asp:ListItem Value="Maldives">Maldives</asp:ListItem>
                                <asp:ListItem Value="Mali">Mali</asp:ListItem>
                                <asp:ListItem Value="Malta">Malta</asp:ListItem>
                                <asp:ListItem Value="Marshall Islands">Marshall Islands</asp:ListItem>
                                <asp:ListItem Value="Martinique">Martinique</asp:ListItem>
                                <asp:ListItem Value="Mauritania">Mauritania</asp:ListItem>
                                <asp:ListItem Value="Mauritius">Mauritius</asp:ListItem>
                                <asp:ListItem Value="Mayotte">Mayotte</asp:ListItem>
                                <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                                <asp:ListItem Value="Midway Islands">Midway Islands</asp:ListItem>
                                <asp:ListItem Value="Moldova">Moldova</asp:ListItem>
                                <asp:ListItem Value="Monaco">Monaco</asp:ListItem>
                                <asp:ListItem Value="Mongolia">Mongolia</asp:ListItem>
                                <asp:ListItem Value="Montserrat">Montserrat</asp:ListItem>
                                <asp:ListItem Value="Morocco">Morocco</asp:ListItem>
                                <asp:ListItem Value="Mozambique">Mozambique</asp:ListItem>
                                <asp:ListItem Value="Myanmar">Myanmar</asp:ListItem>
                                <asp:ListItem Value="Nambia">Nambia</asp:ListItem>
                                <asp:ListItem Value="Nauru">Nauru</asp:ListItem>
                                <asp:ListItem Value="Nepal">Nepal</asp:ListItem>
                                <asp:ListItem Value="Netherland Antilles">Netherland Antilles</asp:ListItem>
                                <asp:ListItem Value="Netherlands">Netherlands (Holland, Europe)</asp:ListItem>
                                <asp:ListItem Value="Nevis">Nevis</asp:ListItem>
                                <asp:ListItem Value="New Caledonia">New Caledonia</asp:ListItem>
                                <asp:ListItem Value="New Zealand">New Zealand</asp:ListItem>
                                <asp:ListItem Value="Nicaragua">Nicaragua</asp:ListItem>
                                <asp:ListItem Value="Niger">Niger</asp:ListItem>
                                <asp:ListItem Value="Nigeria">Nigeria</asp:ListItem>
                                <asp:ListItem Value="Niue">Niue</asp:ListItem>
                                <asp:ListItem Value="Norfolk Island">Norfolk Island</asp:ListItem>
                                <asp:ListItem Value="Norway">Norway</asp:ListItem>
                                <asp:ListItem Value="Oman">Oman</asp:ListItem>
                                <asp:ListItem Value="Pakistan">Pakistan</asp:ListItem>
                                <asp:ListItem Value="Palau Island">Palau Island</asp:ListItem>
                                <asp:ListItem Value="Palestine">Palestine</asp:ListItem>
                                <asp:ListItem Value="Panama">Panama</asp:ListItem>
                                <asp:ListItem Value="Papua New Guinea">Papua New Guinea</asp:ListItem>
                                <asp:ListItem Value="Paraguay">Paraguay</asp:ListItem>
                                <asp:ListItem Value="Peru">Peru</asp:ListItem>
                                <asp:ListItem Value="Phillipines">Philippines</asp:ListItem>
                                <asp:ListItem Value="Pitcairn Island">Pitcairn Island</asp:ListItem>
                                <asp:ListItem Value="Poland">Poland</asp:ListItem>
                                <asp:ListItem Value="Portugal">Portugal</asp:ListItem>
                                <asp:ListItem Value="Puerto Rico">Puerto Rico</asp:ListItem>
                                <asp:ListItem Value="Qatar">Qatar</asp:ListItem>
                                <asp:ListItem Value="Republic of Montenegro">Republic of Montenegro</asp:ListItem>
                                <asp:ListItem Value="Republic of Serbia">Republic of Serbia</asp:ListItem>
                                <asp:ListItem Value="Reunion">Reunion</asp:ListItem>
                                <asp:ListItem Value="Romania">Romania</asp:ListItem>
                                <asp:ListItem Value="Russia">Russia</asp:ListItem>
                                <asp:ListItem Value="Rwanda">Rwanda</asp:ListItem>
                                <asp:ListItem Value="St Barthelemy">St Barthelemy</asp:ListItem>
                                <asp:ListItem Value="St Eustatius">St Eustatius</asp:ListItem>
                                <asp:ListItem Value="St Helena">St Helena</asp:ListItem>
                                <asp:ListItem Value="St Kitts-Nevis">St Kitts-Nevis</asp:ListItem>
                                <asp:ListItem Value="St Lucia">St Lucia</asp:ListItem>
                                <asp:ListItem Value="St Maarten">St Maarten</asp:ListItem>
                                <asp:ListItem Value="St Pierre & Miquelon">St Pierre & Miquelon</asp:ListItem>
                                <asp:ListItem Value="St Vincent & Grenadines">St Vincent & Grenadines</asp:ListItem>
                                <asp:ListItem Value="Saipan">Saipan</asp:ListItem>
                                <asp:ListItem Value="Samoa">Samoa</asp:ListItem>
                                <asp:ListItem Value="Samoa American">Samoa American</asp:ListItem>
                                <asp:ListItem Value="San Marino">San Marino</asp:ListItem>
                                <asp:ListItem Value="Sao Tome & Principe">Sao Tome & Principe</asp:ListItem>
                                <asp:ListItem Value="Saudi Arabia">Saudi Arabia</asp:ListItem>
                                <asp:ListItem Value="Senegal">Senegal</asp:ListItem>
                                <asp:ListItem Value="Seychelles">Seychelles</asp:ListItem>
                                <asp:ListItem Value="Sierra Leone">Sierra Leone</asp:ListItem>
                                <asp:ListItem Value="Singapore">Singapore</asp:ListItem>
                                <asp:ListItem Value="Slovakia">Slovakia</asp:ListItem>
                                <asp:ListItem Value="Slovenia">Slovenia</asp:ListItem>
                                <asp:ListItem Value="Solomon Islands">Solomon Islands</asp:ListItem>
                                <asp:ListItem Value="Somalia">Somalia</asp:ListItem>
                                <asp:ListItem Value="South Africa">South Africa</asp:ListItem>
                                <asp:ListItem Value="Spain">Spain</asp:ListItem>
                                <asp:ListItem Value="Sri Lanka">Sri Lanka</asp:ListItem>
                                <asp:ListItem Value="Sudan">Sudan</asp:ListItem>
                                <asp:ListItem Value="Suriname">Suriname</asp:ListItem>
                                <asp:ListItem Value="Swaziland">Swaziland</asp:ListItem>
                                <asp:ListItem Value="Sweden">Sweden</asp:ListItem>
                                <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                                <asp:ListItem Value="Syria">Syria</asp:ListItem>
                                <asp:ListItem Value="Tahiti">Tahiti</asp:ListItem>
                                <asp:ListItem Value="Taiwan">Taiwan</asp:ListItem>
                                <asp:ListItem Value="Tajikistan">Tajikistan</asp:ListItem>
                                <asp:ListItem Value="Tanzania">Tanzania</asp:ListItem>
                                <asp:ListItem Value="Thailand">Thailand</asp:ListItem>
                                <asp:ListItem Value="Togo">Togo</asp:ListItem>
                                <asp:ListItem Value="Tokelau">Tokelau</asp:ListItem>
                                <asp:ListItem Value="Tonga">Tonga</asp:ListItem>
                                <asp:ListItem Value="Trinidad & Tobago">Trinidad & Tobago</asp:ListItem>
                                <asp:ListItem Value="Tunisia">Tunisia</asp:ListItem>
                                <asp:ListItem Value="Turkey">Turkey</asp:ListItem>
                                <asp:ListItem Value="Turkmenistan">Turkmenistan</asp:ListItem>
                                <asp:ListItem Value="Turks & Caicos Is">Turks & Caicos Is</asp:ListItem>
                                <asp:ListItem Value="Tuvalu">Tuvalu</asp:ListItem>
                                <asp:ListItem Value="Uganda">Uganda</asp:ListItem>
                                <asp:ListItem Value="Ukraine">Ukraine</asp:ListItem>
                                <asp:ListItem Value="United Arab Erimates">United Arab Emirates</asp:ListItem>
                                <asp:ListItem Value="United Kingdom">United Kingdom</asp:ListItem>
                                <asp:ListItem Value="United States of America">United States of America</asp:ListItem>
                                <asp:ListItem Value="Uraguay">Uruguay</asp:ListItem>
                                <asp:ListItem Value="Uzbekistan">Uzbekistan</asp:ListItem>
                                <asp:ListItem Value="Vanuatu">Vanuatu</asp:ListItem>
                                <asp:ListItem Value="Vatican City State">Vatican City State</asp:ListItem>
                                <asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
                                <asp:ListItem Value="Vietnam">Vietnam</asp:ListItem>
                                <asp:ListItem Value="Virgin Islands (Brit)">Virgin Islands (Brit)</asp:ListItem>
                                <asp:ListItem Value="Virgin Islands (USA)">Virgin Islands (USA)</asp:ListItem>
                                <asp:ListItem Value="Wake Island">Wake Island</asp:ListItem>
                                <asp:ListItem Value="Wallis & Futana Is">Wallis & Futana Is</asp:ListItem>
                                <asp:ListItem Value="Yemen">Yemen</asp:ListItem>
                                <asp:ListItem Value="Zaire">Zaire</asp:ListItem>
                                <asp:ListItem Value="Zambia">Zambia</asp:ListItem>
                                <asp:ListItem Value="Zimbabwe">Zimbabwe</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col">
                            <!--  <div class="form-group">

      <label for="country">Country</label>
       <asp:dropdownlist   class="form-control" name="country" id="Removedcountry" required runat="server">
    <asp:listitem value="" selected>Please Choose Your Country</asp:listitem>
   <asp:listitem value="Afganistan">Afghanistan</asp:listitem>
   <asp:listitem value="Albania">Albania</asp:listitem>
   <asp:listitem value="Algeria">Algeria</asp:listitem>
   <asp:listitem value="American Samoa">American Samoa</asp:listitem>
   <asp:listitem value="Andorra">Andorra</asp:listitem>
   <asp:listitem value="Angola">Angola</asp:listitem>
   <asp:listitem value="Anguilla">Anguilla</asp:listitem>
   <asp:listitem value="Antigua & Barbuda">Antigua & Barbuda</asp:listitem>
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
   <asp:listitem value="Bolivia">Bolivia</asp:listitem>
   <asp:listitem value="Bonaire">Bonaire</asp:listitem>
   <asp:listitem value="Bosnia & Herzegovina">Bosnia & Herzegovina</asp:listitem>
   <asp:listitem value="Botswana">Botswana</asp:listitem>
   <asp:listitem value="Brazil">Brazil</asp:listitem>
   <asp:listitem value="British Indian Ocean Ter">British Indian Ocean Ter</asp:listitem>
   <asp:listitem value="Brunei">Brunei</asp:listitem>
   <asp:listitem value="Bulgaria">Bulgaria</asp:listitem>
   <asp:listitem value="Burkina Faso">Burkina Faso</asp:listitem>
   <asp:listitem value="Burundi">Burundi</asp:listitem>
   <asp:listitem value="Cambodia">Cambodia</asp:listitem>
   <asp:listitem value="Cameroon">Cameroon</asp:listitem>
   <asp:listitem value="Canada">Canada</asp:listitem>
   <asp:listitem value="Canary Islands">Canary Islands</asp:listitem>
   <asp:listitem value="Cape Verde">Cape Verde</asp:listitem>
   <asp:listitem value="Cayman Islands">Cayman Islands</asp:listitem>
   <asp:listitem value="Central African Republic">Central African Republic</asp:listitem>
   <asp:listitem value="Chad">Chad</asp:listitem>
   <asp:listitem value="Channel Islands">Channel Islands</asp:listitem>
   <asp:listitem value="Chile">Chile</asp:listitem>
   <asp:listitem value="China">China</asp:listitem>
   <asp:listitem value="Christmas Island">Christmas Island</asp:listitem>
   <asp:listitem value="Cocos Island">Cocos Island</asp:listitem>
   <asp:listitem value="Colombia">Colombia</asp:listitem>
   <asp:listitem value="Comoros">Comoros</asp:listitem>
   <asp:listitem value="Congo">Congo</asp:listitem>
   <asp:listitem value="Cook Islands">Cook Islands</asp:listitem>
   <asp:listitem value="Costa Rica">Costa Rica</asp:listitem>
   <asp:listitem value="Cote DIvoire">Cote DIvoire</asp:listitem>
   <asp:listitem value="Croatia">Croatia</asp:listitem>
   <asp:listitem value="Cuba">Cuba</asp:listitem>
   <asp:listitem value="Curaco">Curacao</asp:listitem>
   <asp:listitem value="Cyprus">Cyprus</asp:listitem>
   <asp:listitem value="Czech Republic">Czech Republic</asp:listitem>
   <asp:listitem value="Denmark">Denmark</asp:listitem>
   <asp:listitem value="Djibouti">Djibouti</asp:listitem>
   <asp:listitem value="Dominica">Dominica</asp:listitem>
   <asp:listitem value="Dominican Republic">Dominican Republic</asp:listitem>
   <asp:listitem value="East Timor">East Timor</asp:listitem>
   <asp:listitem value="Ecuador">Ecuador</asp:listitem>
   <asp:listitem value="Egypt">Egypt</asp:listitem>
   <asp:listitem value="El Salvador">El Salvador</asp:listitem>
   <asp:listitem value="Equatorial Guinea">Equatorial Guinea</asp:listitem>
   <asp:listitem value="Eritrea">Eritrea</asp:listitem>
   <asp:listitem value="Estonia">Estonia</asp:listitem>
   <asp:listitem value="Ethiopia">Ethiopia</asp:listitem>
   <asp:listitem value="Falkland Islands">Falkland Islands</asp:listitem>
   <asp:listitem value="Faroe Islands">Faroe Islands</asp:listitem>
   <asp:listitem value="Fiji">Fiji</asp:listitem>
   <asp:listitem value="Finland">Finland</asp:listitem>
   <asp:listitem value="France">France</asp:listitem>
   <asp:listitem value="French Guiana">French Guiana</asp:listitem>
   <asp:listitem value="French Polynesia">French Polynesia</asp:listitem>
   <asp:listitem value="French Southern Ter">French Southern Ter</asp:listitem>
   <asp:listitem value="Gabon">Gabon</asp:listitem>
   <asp:listitem value="Gambia">Gambia</asp:listitem>
   <asp:listitem value="Georgia">Georgia</asp:listitem>
   <asp:listitem value="Germany">Germany</asp:listitem>
   <asp:listitem value="Ghana">Ghana</asp:listitem>
   <asp:listitem value="Gibraltar">Gibraltar</asp:listitem>
   <asp:listitem value="Great Britain">Great Britain</asp:listitem>
   <asp:listitem value="Greece">Greece</asp:listitem>
   <asp:listitem value="Greenland">Greenland</asp:listitem>
   <asp:listitem value="Grenada">Grenada</asp:listitem>
   <asp:listitem value="Guadeloupe">Guadeloupe</asp:listitem>
   <asp:listitem value="Guam">Guam</asp:listitem>
   <asp:listitem value="Guatemala">Guatemala</asp:listitem>
   <asp:listitem value="Guinea">Guinea</asp:listitem>
   <asp:listitem value="Guyana">Guyana</asp:listitem>
   <asp:listitem value="Haiti">Haiti</asp:listitem>
   <asp:listitem value="Hawaii">Hawaii</asp:listitem>
   <asp:listitem value="Honduras">Honduras</asp:listitem>
   <asp:listitem value="Hong Kong">Hong Kong</asp:listitem>
   <asp:listitem value="Hungary">Hungary</asp:listitem>
   <asp:listitem value="Iceland">Iceland</asp:listitem>
   <asp:listitem value="Indonesia">Indonesia</asp:listitem>
   <asp:listitem value="India">India</asp:listitem>
   <asp:listitem value="Iran">Iran</asp:listitem>
   <asp:listitem value="Iraq">Iraq</asp:listitem>
   <asp:listitem value="Ireland">Ireland</asp:listitem>
   <asp:listitem value="Isle of Man">Isle of Man</asp:listitem>
   <asp:listitem value="Israel">Israel</asp:listitem>
   <asp:listitem value="Italy">Italy</asp:listitem>
   <asp:listitem value="Jamaica">Jamaica</asp:listitem>
   <asp:listitem value="Japan">Japan</asp:listitem>
   <asp:listitem value="Jordan">Jordan</asp:listitem>
   <asp:listitem value="Kazakhstan">Kazakhstan</asp:listitem>
   <asp:listitem value="Kenya">Kenya</asp:listitem>
   <asp:listitem value="Kiribati">Kiribati</asp:listitem>
   <asp:listitem value="Korea North">Korea North</asp:listitem>
   <asp:listitem value="Korea Sout">Korea South</asp:listitem>
   <asp:listitem value="Kuwait">Kuwait</asp:listitem>
   <asp:listitem value="Kyrgyzstan">Kyrgyzstan</asp:listitem>
   <asp:listitem value="Laos">Laos</asp:listitem>
   <asp:listitem value="Latvia">Latvia</asp:listitem>
   <asp:listitem value="Lebanon">Lebanon</asp:listitem>
   <asp:listitem value="Lesotho">Lesotho</asp:listitem>
   <asp:listitem value="Liberia">Liberia</asp:listitem>
   <asp:listitem value="Libya">Libya</asp:listitem>
   <asp:listitem value="Liechtenstein">Liechtenstein</asp:listitem>
   <asp:listitem value="Lithuania">Lithuania</asp:listitem>
   <asp:listitem value="Luxembourg">Luxembourg</asp:listitem>
   <asp:listitem value="Macau">Macau</asp:listitem>
   <asp:listitem value="Macedonia">Macedonia</asp:listitem>
   <asp:listitem value="Madagascar">Madagascar</asp:listitem>
   <asp:listitem value="Malaysia">Malaysia</asp:listitem>
   <asp:listitem value="Malawi">Malawi</asp:listitem>
   <asp:listitem value="Maldives">Maldives</asp:listitem>
   <asp:listitem value="Mali">Mali</asp:listitem>
   <asp:listitem value="Malta">Malta</asp:listitem>
   <asp:listitem value="Marshall Islands">Marshall Islands</asp:listitem>
   <asp:listitem value="Martinique">Martinique</asp:listitem>
   <asp:listitem value="Mauritania">Mauritania</asp:listitem>
   <asp:listitem value="Mauritius">Mauritius</asp:listitem>
   <asp:listitem value="Mayotte">Mayotte</asp:listitem>
   <asp:listitem value="Mexico">Mexico</asp:listitem>
   <asp:listitem value="Midway Islands">Midway Islands</asp:listitem>
   <asp:listitem value="Moldova">Moldova</asp:listitem>
   <asp:listitem value="Monaco">Monaco</asp:listitem>
   <asp:listitem value="Mongolia">Mongolia</asp:listitem>
   <asp:listitem value="Montserrat">Montserrat</asp:listitem>
   <asp:listitem value="Morocco">Morocco</asp:listitem>
   <asp:listitem value="Mozambique">Mozambique</asp:listitem>
   <asp:listitem value="Myanmar">Myanmar</asp:listitem>
   <asp:listitem value="Nambia">Nambia</asp:listitem>
   <asp:listitem value="Nauru">Nauru</asp:listitem>
   <asp:listitem value="Nepal">Nepal</asp:listitem>
   <asp:listitem value="Netherland Antilles">Netherland Antilles</asp:listitem>
   <asp:listitem value="Netherlands">Netherlands (Holland, Europe)</asp:listitem>
   <asp:listitem value="Nevis">Nevis</asp:listitem>
   <asp:listitem value="New Caledonia">New Caledonia</asp:listitem>
   <asp:listitem value="New Zealand">New Zealand</asp:listitem>
   <asp:listitem value="Nicaragua">Nicaragua</asp:listitem>
   <asp:listitem value="Niger">Niger</asp:listitem>
   <asp:listitem value="Nigeria">Nigeria</asp:listitem>
   <asp:listitem value="Niue">Niue</asp:listitem>
   <asp:listitem value="Norfolk Island">Norfolk Island</asp:listitem>
   <asp:listitem value="Norway">Norway</asp:listitem>
   <asp:listitem value="Oman">Oman</asp:listitem>
   <asp:listitem value="Pakistan">Pakistan</asp:listitem>
   <asp:listitem value="Palau Island">Palau Island</asp:listitem>
   <asp:listitem value="Palestine">Palestine</asp:listitem>
   <asp:listitem value="Panama">Panama</asp:listitem>
   <asp:listitem value="Papua New Guinea">Papua New Guinea</asp:listitem>
   <asp:listitem value="Paraguay">Paraguay</asp:listitem>
   <asp:listitem value="Peru">Peru</asp:listitem>
   <asp:listitem value="Phillipines">Philippines</asp:listitem>
   <asp:listitem value="Pitcairn Island">Pitcairn Island</asp:listitem>
   <asp:listitem value="Poland">Poland</asp:listitem>
   <asp:listitem value="Portugal">Portugal</asp:listitem>
   <asp:listitem value="Puerto Rico">Puerto Rico</asp:listitem>
   <asp:listitem value="Qatar">Qatar</asp:listitem>
   <asp:listitem value="Republic of Montenegro">Republic of Montenegro</asp:listitem>
   <asp:listitem value="Republic of Serbia">Republic of Serbia</asp:listitem>
   <asp:listitem value="Reunion">Reunion</asp:listitem>
   <asp:listitem value="Romania">Romania</asp:listitem>
   <asp:listitem value="Russia">Russia</asp:listitem>
   <asp:listitem value="Rwanda">Rwanda</asp:listitem>
   <asp:listitem value="St Barthelemy">St Barthelemy</asp:listitem>
   <asp:listitem value="St Eustatius">St Eustatius</asp:listitem>
   <asp:listitem value="St Helena">St Helena</asp:listitem>
   <asp:listitem value="St Kitts-Nevis">St Kitts-Nevis</asp:listitem>
   <asp:listitem value="St Lucia">St Lucia</asp:listitem>
   <asp:listitem value="St Maarten">St Maarten</asp:listitem>
   <asp:listitem value="St Pierre & Miquelon">St Pierre & Miquelon</asp:listitem>
   <asp:listitem value="St Vincent & Grenadines">St Vincent & Grenadines</asp:listitem>
   <asp:listitem value="Saipan">Saipan</asp:listitem>
   <asp:listitem value="Samoa">Samoa</asp:listitem>
   <asp:listitem value="Samoa American">Samoa American</asp:listitem>
   <asp:listitem value="San Marino">San Marino</asp:listitem>
   <asp:listitem value="Sao Tome & Principe">Sao Tome & Principe</asp:listitem>
   <asp:listitem value="Saudi Arabia">Saudi Arabia</asp:listitem>
   <asp:listitem value="Senegal">Senegal</asp:listitem>
   <asp:listitem value="Seychelles">Seychelles</asp:listitem>
   <asp:listitem value="Sierra Leone">Sierra Leone</asp:listitem>
   <asp:listitem value="Singapore">Singapore</asp:listitem>
   <asp:listitem value="Slovakia">Slovakia</asp:listitem>
   <asp:listitem value="Slovenia">Slovenia</asp:listitem>
   <asp:listitem value="Solomon Islands">Solomon Islands</asp:listitem>
   <asp:listitem value="Somalia">Somalia</asp:listitem>
   <asp:listitem value="South Africa">South Africa</asp:listitem>
   <asp:listitem value="Spain">Spain</asp:listitem>
   <asp:listitem value="Sri Lanka">Sri Lanka</asp:listitem>
   <asp:listitem value="Sudan">Sudan</asp:listitem>
   <asp:listitem value="Suriname">Suriname</asp:listitem>
   <asp:listitem value="Swaziland">Swaziland</asp:listitem>
   <asp:listitem value="Sweden">Sweden</asp:listitem>
   <asp:listitem value="Switzerland">Switzerland</asp:listitem>
   <asp:listitem value="Syria">Syria</asp:listitem>
   <asp:listitem value="Tahiti">Tahiti</asp:listitem>
   <asp:listitem value="Taiwan">Taiwan</asp:listitem>
   <asp:listitem value="Tajikistan">Tajikistan</asp:listitem>
   <asp:listitem value="Tanzania">Tanzania</asp:listitem>
   <asp:listitem value="Thailand">Thailand</asp:listitem>
   <asp:listitem value="Togo">Togo</asp:listitem>
   <asp:listitem value="Tokelau">Tokelau</asp:listitem>
   <asp:listitem value="Tonga">Tonga</asp:listitem>
   <asp:listitem value="Trinidad & Tobago">Trinidad & Tobago</asp:listitem>
   <asp:listitem value="Tunisia">Tunisia</asp:listitem>
   <asp:listitem value="Turkey">Turkey</asp:listitem>
   <asp:listitem value="Turkmenistan">Turkmenistan</asp:listitem>
   <asp:listitem value="Turks & Caicos Is">Turks & Caicos Is</asp:listitem>
   <asp:listitem value="Tuvalu">Tuvalu</asp:listitem>
   <asp:listitem value="Uganda">Uganda</asp:listitem>
      <asp:listitem value="Ukraine">Ukraine</asp:listitem>
   <asp:listitem value="United Arab Erimates">United Arab Emirates</asp:listitem>
                      <asp:listitem value="United Kingdom">United Kingdom</asp:listitem>
   <asp:listitem value="United States of America">United States of America</asp:listitem>
   <asp:listitem value="Uraguay">Uruguay</asp:listitem>
   <asp:listitem value="Uzbekistan">Uzbekistan</asp:listitem>
   <asp:listitem value="Vanuatu">Vanuatu</asp:listitem>
   <asp:listitem value="Vatican City State">Vatican City State</asp:listitem>
   <asp:listitem value="Venezuela">Venezuela</asp:listitem>
   <asp:listitem value="Vietnam">Vietnam</asp:listitem>
   <asp:listitem value="Virgin Islands (Brit)">Virgin Islands (Brit)</asp:listitem>
   <asp:listitem value="Virgin Islands (USA)">Virgin Islands (USA)</asp:listitem>
   <asp:listitem value="Wake Island">Wake Island</asp:listitem>
   <asp:listitem value="Wallis & Futana Is">Wallis & Futana Is</asp:listitem>
   <asp:listitem value="Yemen">Yemen</asp:listitem>
   <asp:listitem value="Zaire">Zaire</asp:listitem>
   <asp:listitem value="Zambia">Zambia</asp:listitem>
   <asp:listitem value="Zimbabwe">Zimbabwe</asp:listitem>
 </asp:dropdownlist>
     
    </div>
        </div>
            <div class="col"> -->
                            <label for="organizationType">Type of Organization <span>*</span></label>

                            <asp:DropDownList class="form-control" name="organizationType" ID="organizationType" runat="server" required>
                                <asp:ListItem Value="" disabled Selected>Please Choose an Organization Type</asp:ListItem>
                                <asp:ListItem Value="nationalGovernment"> National government</asp:ListItem>
                                <asp:ListItem Value="otherGovernment">Local, regional or other government organization</asp:ListItem>
                                <asp:ListItem Value="financialInstitution">Financial institution </asp:ListItem>
                                <asp:ListItem Value="multilateralOrg">Multilateral organization </asp:ListItem>
                                <asp:ListItem Value="nongovernmentOrg">Non-government organization </asp:ListItem>
                                <asp:ListItem Value="pressmedia">Press/Media</asp:ListItem>
                                <asp:ListItem Value="academia">Academia </asp:ListItem>
                                <asp:ListItem Value="privateSector">Private sector </asp:ListItem>
                                <asp:ListItem Value="other">Other</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="col">
                            <label for="referral">How did you hear about our event?</label>
                            <asp:DropDownList CssClass="form-control" name="referral" ID="referral" runat="server" OnSelectedIndexChanged="DropDownList_Changed" AutoPostBack="true">
                                <asp:ListItem Value="">--Select--</asp:ListItem>
                                <asp:ListItem Value="mailingList">GMI Mailing List</asp:ListItem>
                                <asp:ListItem Value="website">GMI Website</asp:ListItem>
                                <asp:ListItem Value="media">Media Outlet</asp:ListItem>
                                <asp:ListItem Value="socialMedia">Social Media</asp:ListItem>
                                <asp:ListItem Value="searchEngine">Search Engine</asp:ListItem>
                                <asp:ListItem Value="wordOfMouth">Word of Mouth</asp:ListItem>
                                <asp:ListItem Value="other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Panel ID="pnlTextBox" runat="server" Visible="false">
                                <asp:TextBox ID="referralOther" runat="server" class="form-control" placeholder="Please elaborate" type="text"></asp:TextBox>
                            </asp:Panel>
                        </div>

                    </div>
                    <div class="row form-group">
                        <div class="col">
                            <label for="experience">Experience</label>
                            <div class="form-group">
                                <asp:RadioButtonList ID="experience" runat="server" CssClass="radiostyle">

                                    <asp:ListItem Value="NewToMethane">New to methane</asp:ListItem>


                                    <asp:ListItem Value="GenerallyAware">Generally aware of methane issues</asp:ListItem>


                                    <asp:ListItem Value="CurrentlyEngaged">Currently engaged in methane-specific programs (non-expert)</asp:ListItem>


                                    <asp:ListItem Value="Expert">Expert in methane mitigation (e.g., policy, science, measurement, projects, etc.)</asp:ListItem>

                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <asp:Button class="btn btn-primary btn-lg" ID="register" runat="server" Style="float: left;" Text="Register" Enabled="True" />
                </form>
                <br />
                <br />
                     <hr style="margin-bottom:30px;"/>
            </div>
        </div>
        <div class="row">

            <div class="col-md-12">

                <br />
                <br />
            </div>
        </div>
    </div>

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


    <script src="//cdn.amcharts.com/lib/4/core.js"></script>
    <script src="//cdn.amcharts.com/lib/4/maps.js"></script>
    <script src="//cdn.amcharts.com/lib/4/geodata/worldLow.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>


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

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script type="text/javascript">
        function confirmSubmission() {
            Swal.fire({
                title: 'Success!',
                text: 'Thanks for registering, check your inbox for the confirmation email.',
                icon: 'success',
                confirmButtonText: 'Close',
                html: `
    <div>Thanks for registering. Check your inbox for the confirmation email.<br>
      <button class="swal2-styled" onclick="location.href='agenda.aspx';" style="margin-top:20px;"W>View The Agenda</button>
      <button class="swal2-styled" onclick="location.href='speakers.aspx';">Meet The Speakers</button>
    </div>`
            })
        }
        function confirmSubmissionAgain() {
            Swal.fire({
                title: 'Success!',
                text: 'It looks like you already registered. We will send a copy of your confirmation message shortly.',
                icon: 'success',
                confirmButtonText: 'Close',
                html: `
    <div>Thanks for registering. Check your inbox for the confirmation email.<br>
      <button class="btn btn-primary" onclick="location.href='agenda.aspx';">View The Agenda</button>
      <button class="btn btn-primary" onclick="location.href='speakers.aspx';">Meet The Speakers</button>
    </div>`
            })
        } function closeEarly() {
            Swal.fire({
                title: 'Error!',
                text: 'An error was detected in the form. Please try again later.',
                icon: 'warning',
                confirmButtonText: 'Close'
            })
        }
    </script>

    <script>
        var chart = am4core.create("mapdiv", am4maps.MapChart);

        // Set map definition
        chart.geodata = am4geodata_worldLow;


        // Set projection
        chart.projection = new am4maps.projections.Orthographic();
        chart.panBehavior = "rotateLongLat";
        chart.deltaLatitude = -20;
        chart.padding(20, 20, 20, 20);


        // limits vertical rotation
        chart.adapter.add("deltaLatitude", function (delatLatitude) {
            return am4core.math.fitToRange(delatLatitude, -90, 90);
        })


        // Create map polygon series
        var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());

        // Make map load polygon (like country names) data from GeoJSON
        polygonSeries.useGeodata = true;

        // Configure series
        var polygonTemplate = polygonSeries.mapPolygons.template;
        polygonTemplate.tooltipText = "{Popvalue}";
        polygonTemplate.fill = am4core.color("#74B266");

        // Create hover state and set alternative fill color
        var hs = polygonTemplate.states.create("hover");
        hs.properties.fill = am4core.color("#367B25");

        // Remove Antarctica
        polygonSeries.exclude = ["AQ"];

        // Add some data
        polygonSeries.data = [<%= CountryData  %>];



        // Bind "fill" property to "fill" key in data
        polygonTemplate.propertyFields.fill = "fill";
        //
        var graticuleSeries = chart.series.push(new am4maps.GraticuleSeries());
        graticuleSeries.mapLines.template.line.stroke = am4core.color("#ffffff");
        graticuleSeries.mapLines.template.line.strokeOpacity = 0.08;
        graticuleSeries.fitExtent = false;


        chart.backgroundSeries.mapPolygons.template.polygon.fillOpacity = 0.5;
        chart.backgroundSeries.mapPolygons.template.polygon.fill = am4core.color("#1B9CFC");

        // Create hover state and set alternative fill color
        var hs = polygonTemplate.states.create("hover");
        hs.properties.fill = chart.colors.getIndex(0).brighten(-0.5);

        let animation;
        setTimeout(function () {
            animation = chart.animate({ property: "deltaLongitude", to: 100000 }, 20000000);
        }, 3000)

        chart.seriesContainer.events.on("down", function () {
            if (animation) {
                animation.stop();
            }
        })



    </script>
</body>

</html>


