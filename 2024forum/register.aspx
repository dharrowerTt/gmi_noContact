<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="register.aspx.vb" Inherits="M2M_Redesign.register2" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Methane Forum 2024 | Global Methane Initiative</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || []; w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            }); var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
                    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-WM2LZW5');</script>
    <!-- End Google Tag Manager -->
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-46JVDVGWQS"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-46JVDVGWQS');
    </script>
    <style>
        html,
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #fafafa;
            background-image: url(img/bg.png), url(img/2024.png);
            background-attachment: fixed;
            background-size: cover, contain;
            background-position: center, bottom;
            background-repeat: no-repeat, no-repeat;
            height: 100%;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

            .nav-scroller .nav {
                display: flex;
                flex-wrap: nowrap;
                padding-bottom: 1rem;
                margin-top: -1px;
                overflow-x: auto;
                text-align: center;
                white-space: nowrap;
                -webkit-overflow-scrolling: touch;
            }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bg-gmi {
            background: #3198c8 !important;
            color: white;
        }



        .jumboSide {
            background-image: url(img/triangles.svg);
            background-size: cover;
        }

        video {
            width: 100%;
            border-radius: 0.5rem;
            z-index: 2;
        }

        .jumbotron h1,
        .jumbotron h2 {
            z-index: 1;
        }

        .cardimage {
            width: auto;
            border-radius: 10px;
            float: right;
            margin-left: 12px;
        }

        @media screen and (max-width:1000px) {
            .cardimage {
                width: 45%;
                border-radius: 10px;
                float: right;
                margin-left: 12px;
            }
        }

        @media screen and (max-width: 768px) {
            .cardimage {
                width: 100%;
                border-radius: 10px;
                margin-left: 0;
            }
        }

        .nobr {
            white-space: nowrap;
        }

        .smedia {
            padding: .5rem;
            color: white;
        }

        #optOutBox input {
            margin-right: 0.8rem;
        }

        #posterResponse input {
            margin-right: 0.8rem;
        }

        #areaOfInterest td input {
            margin-right: 0.8rem;
        }

        #attendanceType td input {
            margin-right: 0.8rem;
        }

        #aoiProjects td input {
            margin-right: 0.8rem;
        }

        #inper input {
            margin-right: 0.8rem;
        }

        #inpersonOptions td input {
            margin-right: 0.8rem;
        }

        #inpersonReceptions td input {
            margin-right: 0.8rem;
        }

        #virtualOptions td input {
            margin-right: 0.8rem;
        }

        #inpersonQs {
            display: none;
        }

        #virtualQs {
            display: none;
        }

        .attendanceHolder {
            display: block;
        }

            .attendanceHolder input {
                margin-right: 0.8rem;
            }

        label span {
            color: red;
        }

        .info span {
            color: red;
        }

        #posterPicker td input {
            margin-right: 0.8rem;
        }
    </style>
    <script src="https://kit.fontawesome.com/15da2e6088.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <nav class="navbar navbar-expand-lg navbar-dark bg-gmi">
            <div class="container">
                <a href="/" class="d-flex align-items-center text-dark text-decoration-none">
                    <img src="img/trad logo white.svg" width="60">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                            <a class="nav-link" href="index.html">Home</a>
                        </li>
                      <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Register</a>
                        </li>
                      <li class="nav-item">
                            <a class="nav-link" href="agenda.html">Agenda</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                    </ul>
                   <div class="d-flex"><a href="https://www.linkedin.com/company/global-methane-initiative-gmi-/" target="_blank" class="smedia"><i class="fa fa-brands fa-linkedin "></i></a>
                        <a href="https://www.facebook.com/globalmethane" target="_blank" class="smedia"><i class="fa fa-brands fa-facebook"></i></a>
                        <a href="https://twitter.com/globalmethane?lang=en" target="_blank" class="smedia"><i class="fa fa-brands fa-x-twitter"></i></a>
                        
                        <a href="https://globalmethane.us19.list-manage.com/subscribe?u=da591cea9e010abd0437239de&id=a3abe26702" target="_blank" class="smedia"><i class="fa fa-solid fa-envelope"></i></a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container py-4">

            <div class="col-md-12">

                <!--<img src="forum24logo__.svg" style="width:100%;padding:5px;"> -->

                <h2 style="font-weight: bold;">2024 Global Methane Forum</h2>

                <h4 style="font-weight: bold;">Mobilizing Methane Action</h4>
                <h6>18-21 March 2024 • Geneva, Switzerland</h6>
                <hr>
            </div>
            <div class="col-8">
                <form id="form1" runat="server" class="row g-3">
                    <div class="col-12 info">
                        <span>*</span> denotes required field.
                    </div>
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">First Name <span>*</span></label>
                        <asp:TextBox ID="firstName" type="text" class="form-control" placeholder="" runat="server" required="true"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Last Name <span>*</span></label>
                        <asp:TextBox ID="lastName" type="text" class="form-control" placeholder="" runat="server" required="true"></asp:TextBox>
                    </div>
                    <div class="col-8">
                        <label for="email" class="form-label">Email Address <span>*</span></label>
                        <asp:TextBox ID="email" type="email" class="form-control" placeholder="" runat="server" required="true"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label for="jobTitle" class="form-label">Job Title</label>
                        <asp:TextBox ID="jobTitle" type="text" class="form-control" placeholder="" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="organization" class="form-label">Organization <span>*</span></label>
                        <asp:TextBox ID="organization" type="text" class="form-control" placeholder="" runat="server" required="true"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="orgType" class="form-label">Organization Type</label>
                        <asp:DropDownList ID="orgType" runat="server" class="form-control">
                            <asp:ListItem Value="" disabled="disabled" Selected="True">-- Select --</asp:ListItem>
                            <asp:ListItem Value="Acadamia/Think Tanks">Academia/Think tanks</asp:ListItem>
                            <asp:ListItem Value="Financial institution">Financial institution</asp:ListItem>
                            <asp:ListItem Value="Local, regional, or other government">Local, regional, or other government</asp:ListItem>
                            <asp:ListItem Value="Multilateral organization">Multilateral organization</asp:ListItem>
                            <asp:ListItem Value="National government">National government</asp:ListItem>
                            <asp:ListItem Value="Non-government organization">Non-government organization</asp:ListItem>
                            <asp:ListItem Value="Press/media">Press/media</asp:ListItem>
                            <asp:ListItem Value="Private sector">Private sector</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-12">
                        <label for="country">Country <span>*</span></label>
                        <asp:DropDownList class="form-control" name="country" ID="country" required="true" runat="server">
                            <asp:ListItem Value="" disabled="disabled" Selected="True">-- Select --</asp:ListItem>
                            <asp:ListItem Value="Afghanistan">Afghanistan</asp:ListItem>
                            <asp:ListItem Value="Åland Islands">Åland Islands</asp:ListItem>
                            <asp:ListItem Value="Albania">Albania</asp:ListItem>
                            <asp:ListItem Value="Algeria">Algeria</asp:ListItem>
                            <asp:ListItem Value="American Samoa">American Samoa</asp:ListItem>
                            <asp:ListItem Value="Andorra">Andorra</asp:ListItem>
                            <asp:ListItem Value="Angola">Angola</asp:ListItem>
                            <asp:ListItem Value="Anguilla">Anguilla</asp:ListItem>
                            <asp:ListItem Value="Antarctica">Antarctica</asp:ListItem>
                            <asp:ListItem Value="Antigua and Barbuda">Antigua and Barbuda</asp:ListItem>
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
                            <asp:ListItem Value="Plurinational State of Bolivia">Bolivia, Plurinational State of</asp:ListItem>
                            <asp:ListItem Value="Bonaire Sint Eustatius and Saba">Bonaire, Sint Eustatius and Saba</asp:ListItem>
                            <asp:ListItem Value="Bosnia and Herzegovina">Bosnia and Herzegovina</asp:ListItem>
                            <asp:ListItem Value="Botswana">Botswana</asp:ListItem>
                            <asp:ListItem Value="Bouvet Island">Bouvet Island</asp:ListItem>
                            <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                            <asp:ListItem Value="British Indian Ocean Territory">British Indian Ocean Territory</asp:ListItem>
                            <asp:ListItem Value="Brunei Darussalam">Brunei Darussalam</asp:ListItem>
                            <asp:ListItem Value="Bulgaria">Bulgaria</asp:ListItem>
                            <asp:ListItem Value="Burkina Faso">Burkina Faso</asp:ListItem>
                            <asp:ListItem Value="Burundi">Burundi</asp:ListItem>
                            <asp:ListItem Value="Cambodia">Cambodia</asp:ListItem>
                            <asp:ListItem Value="Cameroon">Cameroon</asp:ListItem>
                            <asp:ListItem Value="Canada">Canada</asp:ListItem>
                            <asp:ListItem Value="Cape Verde">Cape Verde</asp:ListItem>
                            <asp:ListItem Value="Cayman Islands">Cayman Islands</asp:ListItem>
                            <asp:ListItem Value="Central African Republic">Central African Republic</asp:ListItem>
                            <asp:ListItem Value="Chad">Chad</asp:ListItem>
                            <asp:ListItem Value="Chile">Chile</asp:ListItem>
                            <asp:ListItem Value="China">China</asp:ListItem>
                            <asp:ListItem Value="Christmas Island">Christmas Island</asp:ListItem>
                            <asp:ListItem Value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</asp:ListItem>
                            <asp:ListItem Value="Colombia">Colombia</asp:ListItem>
                            <asp:ListItem Value="Comoros">Comoros</asp:ListItem>
                            <asp:ListItem Value="Congo">Congo</asp:ListItem>
                            <asp:ListItem Value="the Democratic Republic of the Congo">Congo, the Democratic Republic of the</asp:ListItem>
                            <asp:ListItem Value="Cook Islands">Cook Islands</asp:ListItem>
                            <asp:ListItem Value="Costa Rica">Costa Rica</asp:ListItem>
                            <asp:ListItem Value="Côte d'Ivoire">Côte d'Ivoire</asp:ListItem>
                            <asp:ListItem Value="Croatia">Croatia</asp:ListItem>
                            <asp:ListItem Value="Cuba">Cuba</asp:ListItem>
                            <asp:ListItem Value="Curaçao">Curaçao</asp:ListItem>
                            <asp:ListItem Value="Cyprus">Cyprus</asp:ListItem>
                            <asp:ListItem Value="Czech Republic">Czech Republic</asp:ListItem>
                            <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                            <asp:ListItem Value="Djibouti">Djibouti</asp:ListItem>
                            <asp:ListItem Value="Dominica">Dominica</asp:ListItem>
                            <asp:ListItem Value="Dominican Republic">Dominican Republic</asp:ListItem>
                            <asp:ListItem Value="Ecuador">Ecuador</asp:ListItem>
                            <asp:ListItem Value="Egypt">Egypt</asp:ListItem>
                            <asp:ListItem Value="El Salvador">El Salvador</asp:ListItem>
                            <asp:ListItem Value="Equatorial Guinea">Equatorial Guinea</asp:ListItem>
                            <asp:ListItem Value="Eritrea">Eritrea</asp:ListItem>
                            <asp:ListItem Value="Estonia">Estonia</asp:ListItem>
                            <asp:ListItem Value="Ethiopia">Ethiopia</asp:ListItem>
                            <asp:ListItem Value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</asp:ListItem>
                            <asp:ListItem Value="Faroe Islands">Faroe Islands</asp:ListItem>
                            <asp:ListItem Value="Fiji">Fiji</asp:ListItem>
                            <asp:ListItem Value="Finland">Finland</asp:ListItem>
                            <asp:ListItem Value="France">France</asp:ListItem>
                            <asp:ListItem Value="rench Guiana">French Guiana</asp:ListItem>
                            <asp:ListItem Value="French Polynesia">French Polynesia</asp:ListItem>
                            <asp:ListItem Value="French Southern Territories">French Southern Territories</asp:ListItem>
                            <asp:ListItem Value="Gabon">Gabon</asp:ListItem>
                            <asp:ListItem Value="Gambia">Gambia</asp:ListItem>
                            <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                            <asp:ListItem Value="Germany">Germany</asp:ListItem>
                            <asp:ListItem Value="Ghana">Ghana</asp:ListItem>
                            <asp:ListItem Value="Gibraltar">Gibraltar</asp:ListItem>
                            <asp:ListItem Value="Greece">Greece</asp:ListItem>
                            <asp:ListItem Value="Greenland">Greenland</asp:ListItem>
                            <asp:ListItem Value="Grenada">Grenada</asp:ListItem>
                            <asp:ListItem Value="Guadeloupe">Guadeloupe</asp:ListItem>
                            <asp:ListItem Value="Guam">Guam</asp:ListItem>
                            <asp:ListItem Value="Guatemala">Guatemala</asp:ListItem>
                            <asp:ListItem Value="Guernsey">Guernsey</asp:ListItem>
                            <asp:ListItem Value="Guinea">Guinea</asp:ListItem>
                            <asp:ListItem Value="Guinea-Bissau">Guinea-Bissau</asp:ListItem>
                            <asp:ListItem Value="Guyana">Guyana</asp:ListItem>
                            <asp:ListItem Value="Haiti">Haiti</asp:ListItem>
                            <asp:ListItem Value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</asp:ListItem>
                            <asp:ListItem Value="Holy See (Vatican City State)">Holy See (Vatican City State)</asp:ListItem>
                            <asp:ListItem Value="Honduras">Honduras</asp:ListItem>
                            <asp:ListItem Value="Hong Kong">Hong Kong</asp:ListItem>
                            <asp:ListItem Value="Hungary">Hungary</asp:ListItem>
                            <asp:ListItem Value="Iceland">Iceland</asp:ListItem>
                            <asp:ListItem Value="India">India</asp:ListItem>
                            <asp:ListItem Value="Indonesia">Indonesia</asp:ListItem>
                            <asp:ListItem Value="Islamic Republic of Iran">Iran, Islamic Republic of</asp:ListItem>
                            <asp:ListItem Value="Iraq">Iraq</asp:ListItem>
                            <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                            <asp:ListItem Value="Isle of Man">Isle of Man</asp:ListItem>
                            <asp:ListItem Value="Israel">Israel</asp:ListItem>
                            <asp:ListItem Value="Italy">Italy</asp:ListItem>
                            <asp:ListItem Value="Jamaica">Jamaica</asp:ListItem>
                            <asp:ListItem Value="Japan">Japan</asp:ListItem>
                            <asp:ListItem Value="Jersey">Jersey</asp:ListItem>
                            <asp:ListItem Value="Jordan">Jordan</asp:ListItem>
                            <asp:ListItem Value="Kazakhstan">Kazakhstan</asp:ListItem>
                            <asp:ListItem Value="Kenya">Kenya</asp:ListItem>
                            <asp:ListItem Value="Kiribati">Kiribati</asp:ListItem>
                            <asp:ListItem Value="Democratic People's Republic of Korea">Korea, Democratic People's Republic of</asp:ListItem>
                            <asp:ListItem Value="Republic of Korea">Korea, Republic of</asp:ListItem>
                            <asp:ListItem Value="Kuwait">Kuwait</asp:ListItem>
                            <asp:ListItem Value="Kyrgyzstan">Kyrgyzstan</asp:ListItem>
                            <asp:ListItem Value="Lao People's Democratic Republic">Lao People's Democratic Republic</asp:ListItem>
                            <asp:ListItem Value="Latvia">Latvia</asp:ListItem>
                            <asp:ListItem Value="Lebanon">Lebanon</asp:ListItem>
                            <asp:ListItem Value="Lesotho">Lesotho</asp:ListItem>
                            <asp:ListItem Value="Liberia">Liberia</asp:ListItem>
                            <asp:ListItem Value="Libya">Libya</asp:ListItem>
                            <asp:ListItem Value="Liechtenstein">Liechtenstein</asp:ListItem>
                            <asp:ListItem Value="Lithuania">Lithuania</asp:ListItem>
                            <asp:ListItem Value="Luxembourg">Luxembourg</asp:ListItem>
                            <asp:ListItem Value="Macao">Macao</asp:ListItem>
                            <asp:ListItem Value="the former Yugoslav Republic of Macedonia">Macedonia, the former Yugoslav Republic of</asp:ListItem>
                            <asp:ListItem Value="Madagascar">Madagascar</asp:ListItem>
                            <asp:ListItem Value="Malawi">Malawi</asp:ListItem>
                            <asp:ListItem Value="Malaysia">Malaysia</asp:ListItem>
                            <asp:ListItem Value="Maldives">Maldives</asp:ListItem>
                            <asp:ListItem Value="Mali">Mali</asp:ListItem>
                            <asp:ListItem Value="Malta">Malta</asp:ListItem>
                            <asp:ListItem Value="Marshall Islands">Marshall Islands</asp:ListItem>
                            <asp:ListItem Value="Martinique">Martinique</asp:ListItem>
                            <asp:ListItem Value="Mauritania">Mauritania</asp:ListItem>
                            <asp:ListItem Value="Mauritius">Mauritius</asp:ListItem>
                            <asp:ListItem Value="Mayotte">Mayotte</asp:ListItem>
                            <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                            <asp:ListItem Value="Federated States of Micronesia">Micronesia, Federated States of</asp:ListItem>
                            <asp:ListItem Value="Republic of Moldova">Moldova, Republic of</asp:ListItem>
                            <asp:ListItem Value="Monaco">Monaco</asp:ListItem>
                            <asp:ListItem Value="Mongolia">Mongolia</asp:ListItem>
                            <asp:ListItem Value="Montenegro">Montenegro</asp:ListItem>
                            <asp:ListItem Value="Montserrat">Montserrat</asp:ListItem>
                            <asp:ListItem Value="Morocco">Morocco</asp:ListItem>
                            <asp:ListItem Value="Mozambique">Mozambique</asp:ListItem>
                            <asp:ListItem Value="Myanmar">Myanmar</asp:ListItem>
                            <asp:ListItem Value="Namibia">Namibia</asp:ListItem>
                            <asp:ListItem Value="Nauru">Nauru</asp:ListItem>
                            <asp:ListItem Value="Nepal">Nepal</asp:ListItem>
                            <asp:ListItem Value="Netherlands">Netherlands</asp:ListItem>
                            <asp:ListItem Value="New Caledonia">New Caledonia</asp:ListItem>
                            <asp:ListItem Value="New Zealand">New Zealand</asp:ListItem>
                            <asp:ListItem Value="Nicaragua">Nicaragua</asp:ListItem>
                            <asp:ListItem Value="Niger">Niger</asp:ListItem>
                            <asp:ListItem Value="Nigeria">Nigeria</asp:ListItem>
                            <asp:ListItem Value="Niue">Niue</asp:ListItem>
                            <asp:ListItem Value="Norfolk Island">Norfolk Island</asp:ListItem>
                            <asp:ListItem Value="Northern Mariana Islands">Northern Mariana Islands</asp:ListItem>
                            <asp:ListItem Value="Norway">Norway</asp:ListItem>
                            <asp:ListItem Value="Oman">Oman</asp:ListItem>
                            <asp:ListItem Value="Pakistan">Pakistan</asp:ListItem>
                            <asp:ListItem Value="Palau">Palau</asp:ListItem>
                            <asp:ListItem Value="Occupied Palestinian Territory">Palestinian Territory, Occupied</asp:ListItem>
                            <asp:ListItem Value="Panama">Panama</asp:ListItem>
                            <asp:ListItem Value="Papua New Guinea">Papua New Guinea</asp:ListItem>
                            <asp:ListItem Value="Paraguay">Paraguay</asp:ListItem>
                            <asp:ListItem Value="Peru">Peru</asp:ListItem>
                            <asp:ListItem Value="Philippines">Philippines</asp:ListItem>
                            <asp:ListItem Value="Pitcairn">Pitcairn</asp:ListItem>
                            <asp:ListItem Value="Poland">Poland</asp:ListItem>
                            <asp:ListItem Value="Portugal">Portugal</asp:ListItem>
                            <asp:ListItem Value="Puerto Rico">Puerto Rico</asp:ListItem>
                            <asp:ListItem Value="Qatar">Qatar</asp:ListItem>
                            <asp:ListItem Value="Réunion">Réunion</asp:ListItem>
                            <asp:ListItem Value="Romania">Romania</asp:ListItem>
                            <asp:ListItem Value="Russian Federation">Russian Federation</asp:ListItem>
                            <asp:ListItem Value="Rwanda">Rwanda</asp:ListItem>
                            <asp:ListItem Value="Saint Barthélemy">Saint Barthélemy</asp:ListItem>
                            <asp:ListItem Value="Saint Helena Ascension and Tristan da Cunha">Saint Helena, Ascension and Tristan da Cunha</asp:ListItem>
                            <asp:ListItem Value="Saint Kitts and Nevis">Saint Kitts and Nevis</asp:ListItem>
                            <asp:ListItem Value="Saint Lucia">Saint Lucia</asp:ListItem>
                            <asp:ListItem Value="Saint Martin (French part)">Saint Martin (French part)</asp:ListItem>
                            <asp:ListItem Value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</asp:ListItem>
                            <asp:ListItem Value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</asp:ListItem>
                            <asp:ListItem Value="Samoa">Samoa</asp:ListItem>
                            <asp:ListItem Value="San Marino">San Marino</asp:ListItem>
                            <asp:ListItem Value="Sao Tome and Principe">Sao Tome and Principe</asp:ListItem>
                            <asp:ListItem Value="Saudi Arabia">Saudi Arabia</asp:ListItem>
                            <asp:ListItem Value="Senegal">Senegal</asp:ListItem>
                            <asp:ListItem Value="Serbia">Serbia</asp:ListItem>
                            <asp:ListItem Value="Seychelles">Seychelles</asp:ListItem>
                            <asp:ListItem Value="Sierra Leone">Sierra Leone</asp:ListItem>
                            <asp:ListItem Value="Singapore">Singapore</asp:ListItem>
                            <asp:ListItem Value="Sint Maarten (Dutch part)">Sint Maarten (Dutch part)</asp:ListItem>
                            <asp:ListItem Value="Slovakia">Slovakia</asp:ListItem>
                            <asp:ListItem Value="Slovenia">Slovenia</asp:ListItem>
                            <asp:ListItem Value="Solomon Islands">Solomon Islands</asp:ListItem>
                            <asp:ListItem Value="Somalia">Somalia</asp:ListItem>
                            <asp:ListItem Value="South Africa">South Africa</asp:ListItem>
                            <asp:ListItem Value="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</asp:ListItem>
                            <asp:ListItem Value="South Sudan">South Sudan</asp:ListItem>
                            <asp:ListItem Value="Spain">Spain</asp:ListItem>
                            <asp:ListItem Value="Sri Lanka">Sri Lanka</asp:ListItem>
                            <asp:ListItem Value="Sudan">Sudan</asp:ListItem>
                            <asp:ListItem Value="Suriname">Suriname</asp:ListItem>
                            <asp:ListItem Value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</asp:ListItem>
                            <asp:ListItem Value="Swaziland">Swaziland</asp:ListItem>
                            <asp:ListItem Value="Sweden">Sweden</asp:ListItem>
                            <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                            <asp:ListItem Value="Syrian Arab Republic">Syrian Arab Republic</asp:ListItem>
                            <asp:ListItem Value="Province of China Taiwan">Taiwan, Province of China</asp:ListItem>
                            <asp:ListItem Value="Tajikistan">Tajikistan</asp:ListItem>
                            <asp:ListItem Value="United Republic of Tanzania">Tanzania, United Republic of</asp:ListItem>
                            <asp:ListItem Value="Thailand">Thailand</asp:ListItem>
                            <asp:ListItem Value="Timor-Leste">Timor-Leste</asp:ListItem>
                            <asp:ListItem Value="Togo">Togo</asp:ListItem>
                            <asp:ListItem Value="Tokelau">Tokelau</asp:ListItem>
                            <asp:ListItem Value="Tonga">Tonga</asp:ListItem>
                            <asp:ListItem Value="Trinidad and Tobago">Trinidad and Tobago</asp:ListItem>
                            <asp:ListItem Value="Tunisia">Tunisia</asp:ListItem>
                            <asp:ListItem Value="Turkey">Turkey</asp:ListItem>
                            <asp:ListItem Value="Turkmenistan">Turkmenistan</asp:ListItem>
                            <asp:ListItem Value="Turks and Caicos Islands">Turks and Caicos Islands</asp:ListItem>
                            <asp:ListItem Value="Tuvalu">Tuvalu</asp:ListItem>
                            <asp:ListItem Value="Uganda">Uganda</asp:ListItem>
                            <asp:ListItem Value="Ukraine">Ukraine</asp:ListItem>
                            <asp:ListItem Value="United Arab Emirates">United Arab Emirates</asp:ListItem>
                            <asp:ListItem Value="United Kingdom">United Kingdom</asp:ListItem>
                            <asp:ListItem Value="United States">United States</asp:ListItem>
                            <asp:ListItem Value="United States Minor Outlying Islands">United States Minor Outlying Islands</asp:ListItem>
                            <asp:ListItem Value="Uruguay">Uruguay</asp:ListItem>
                            <asp:ListItem Value="Uzbekistan">Uzbekistan</asp:ListItem>
                            <asp:ListItem Value="Vanuatu">Vanuatu</asp:ListItem>
                            <asp:ListItem Value="Bolivarian Republic of Venezuela">Venezuela, Bolivarian Republic of</asp:ListItem>
                            <asp:ListItem Value="Viet Nam">Viet Nam</asp:ListItem>
                            <asp:ListItem Value="Virgin Islands- British">Virgin Islands, British</asp:ListItem>
                            <asp:ListItem Value="Virgin Islands- U.S.">Virgin Islands, U.S.</asp:ListItem>
                            <asp:ListItem Value="Wallis and Futuna">Wallis and Futuna</asp:ListItem>
                            <asp:ListItem Value="Western Sahara">Western Sahara</asp:ListItem>
                            <asp:ListItem Value="Yemen">Yemen</asp:ListItem>
                            <asp:ListItem Value="Zambia">Zambia</asp:ListItem>
                            <asp:ListItem Value="Zimbabwe">Zimbabwe</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-8">
                        <h4>Technical Area(s) of Interest</h4>
                        <label for="areaOfInterest" class="form-label">
                            What are your areas of interest or expertise?<br />
                            <small>This information will be used to facilitate networking during the event.</small></label>
                        <asp:CheckBoxList ID="areaOfInterest" runat="server" SelectionMode="Multiple" class="form-control areaList">
                            <asp:ListItem Value="Agriculture">Agriculture</asp:ListItem>
                            <asp:ListItem Value="Municipal Solid Waste">Municipal Solid Waste</asp:ListItem>
                            <asp:ListItem Value="Wastewater">Wastewater</asp:ListItem>
                            <asp:ListItem Value="Coal Mines">Coal Mines</asp:ListItem>
                            <asp:ListItem Value="Oil and Gas">Oil and Gas</asp:ListItem>
                            <asp:ListItem Value="Other">Other (please specify)</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                    <div class="col-md-8 otherBox" id="otherBox">
                        <label for="otherAOI" class="form-label">Other</label>
                        <asp:TextBox ID="other" type="text" class="form-control" placeholder="Please specify other areas of interest" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-8">
                          <h4>Showcase Opportunity</h4>
                        <label for="posterQ" class="form-label">Does your country or organization have a methane policy or project in any of the technical areas of interest below that can be showcased at the Forum networking sessions (e.g., a small poster that GMI would create or other visual representations)?</label>
                        <asp:RadioButtonList ID="posterPicker" runat="server">
                            <asp:ListItem Value="yes">Yes, I am interested.</asp:ListItem>
                            <asp:ListItem Value="not sure">Not sure, I need more information.</asp:ListItem>
                            <asp:ListItem Value="no">I am not interested at this time.</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                                        <div class="col-md-8">
                        <asp:CheckBoxList ID="aoiProjects" runat="server" SelectionMode="Multiple" class="form-control areaList">
                            <asp:ListItem Value="Agriculture">Agriculture</asp:ListItem>
                            <asp:ListItem Value="Municipal Solid Waste">Municipal Solid Waste</asp:ListItem>
                            <asp:ListItem Value="Wastewater">Wastewater</asp:ListItem>
                            <asp:ListItem Value="Coal Mines">Coal Mines</asp:ListItem>
                            <asp:ListItem Value="Oil and Gas">Oil and Gas</asp:ListItem>
                            <asp:ListItem Value="Other">Other (please specify)</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                    <div class="col-md-8 otherBox" id="otherOtherBox">
                        <label for="otherAOI" class="form-label">Other</label>
                        <asp:TextBox ID="aoiProjectsOther" type="text" class="form-control" placeholder="Please specify" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <h4>Participation</h4>
                        <label for="attendanceType" class="form-label">Please indicate how you plan to participate in the 2024 Forum: <span>*</span></label>
                        <asp:RadioButtonList ID="attendanceType" runat="server" required="true">
                            <asp:ListItem Value="In person">In-person</asp:ListItem>
                            <asp:ListItem Value="Virtually">Virtually</asp:ListItem>
                            <asp:ListItem Value="Both">Both</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Please select an attendance type.<br />"
                            ControlToValidate="attendanceType" runat="server" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div id="inpersonQs">
                        <hr />
                        <div class="col-md-12">
                            <h4>In-person Attendance</h4>
                            <label for="inpersonOptions" class="form-label">Please indicate which <a href="https://www.globalmethane.org/2024forum/agenda.html" target="_blank">sessions</a> you plan to attend:</label>
                            <div class="attendanceHolder">
                                <asp:CheckBox ID="IPmondayUNECE" runat="server" />Monday: UNECE Group of Experts on Coal Mine Methane and Just Transition<br />
                                <asp:CheckBox ID="IPmondayBiogas" runat="server" />Monday: Biogas Technical Sessions<br />
                                <asp:CheckBox ID="IPmondayCoal" runat="server" />Monday: Coal Technical Sessions<br />
                                <asp:CheckBox ID="IPmondayGMI" runat="server" />Monday: GMI Steering Committee Meeting (invite only)<br />
                                <asp:CheckBox ID="IPtuesdayPlenary" runat="server" />Tuesday: High-Level Plenary Sessions (all sectors)<br />
                                <asp:CheckBox ID="IPwednesdayCoal" runat="server" />Wednesday: Coal Technical Sessions<br />
                                <asp:CheckBox ID="IPwednesdayBiogas" runat="server" />Wednesday: Biogas Technical Sessions<br />
                                <asp:CheckBox ID="IPwednesdayOilGas" runat="server" />Wednesday: Oil & Gas Technical Sessions<br />
                                <asp:CheckBox ID="IPthursdayUNECE" runat="server" />Thursday: 11th Session of the UNECE Group of Experts on Gas - <em> This UNECE session will be focused on the role of gases in building a resilient energy system and activities of the Hydrogen Task Force; methane will not be explicitly addressed. All are welcome to attend.</em><br />
                            </div>
                            <br />
                            <label for="inpersonReceptions" class="form-label">Please indicate if you plan to attend one of the event receptions:</label>
                            <div class="attendanceHolder">
                                <asp:CheckBox ID="IPmondayReception" runat="server" />Monday evening reception (to be confirmed)<br />
                                <asp:CheckBox ID="IPtuesdayReception" runat="server" />Tuesday evening networking reception and exhibit (to be confirmed)<br />
                            </div>
                        </div>
                    </div>
                    <div id="virtualQs">
                        <hr />
                        <div class="col-md-12">
                            <h4>Virtual Attendance</h4>
                            <label for="virtualOptions" class="form-label">
                                Please indicate which virtual <a href="https://www.globalmethane.org/2024forum/agenda.html" target="_blank">sessions</a> you plan to attend:<br />
                                <small>Note that only select 2024 Forum sessions will be available for livestreaming</small></label>
                            <div class="attendanceHolder">
                                <asp:CheckBox ID="VmondaySteering" runat="server" />Monday: Steering Committee (invite only)<br />
                                <asp:CheckBox ID="VmondayBiogas" runat="server" />Monday: Biogas Technical Sessions<br />
                                <asp:CheckBox ID="VtuesdayPlenary" runat="server" />Tuesday: High-Level Plenary Sessions (all sectors)<br />
                                <asp:CheckBox ID="VwednesdayBiogas" runat="server" />Wednesday: Biogas Technical Sessions<br />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="alert alert-warning" role="alert">
                        To encourage future collaboration, GMI plans to share with all attendees, including those participating in-person and virtually, contact information for Forum attendees.
                    <label for="optOutCheck" id="optOutBox" class="form-label">
                        <asp:CheckBox ID="optOutCheck" runat="server" />
                        Do <strong>not</strong> share my contact information with other attendees.</label>

                    </div>
                    <div class="col-12">
                        <asp:Button class="btn btn-primary btn-lg" ID="submit" runat="server" Style="float: left;" Text="Submit" />
                    </div>
                </form>
            </div>

            <footer class="pt-3 mt-4 text-body-secondary border-top">
                <a href="https://www.globalmethane.org/" target="_blank">Global Methane Initiative (GMI)</a> | Leading
                methane action since 2004
            </footer>
        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>

    <script>
        $("#attendanceType_0").click(function () {
            $("#inpersonQs").show(1000);
            $("#virtualQs").hide(1000);
        });
        $("#attendanceType_1").click(function () {
            $("#inpersonQs").hide(1000);
            $("#virtualQs").show(1000);
        });
        $("#attendanceType_2").click(function () {
            $("#inpersonQs").show(1000);
            $("#virtualQs").show(1000);
        });
    </script>
</body>
</html>
