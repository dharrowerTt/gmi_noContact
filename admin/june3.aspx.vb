Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class june3
    Inherits System.Web.UI.Page
    Public Shared CountryData As String = ""
    Public Shared CountryCount As String = ""
    Public Shared CountryFilter As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CountryCount = ""
        CountryData = ""
        CountryFilter = ""
        Dim query As String = "SELECT        fName, lName, organization, orgType, country FROM dbo.ctaEvent order by regID desc"

        Using con As New SqlConnection(Common.GetConnString())
            Using cmd As New SqlCommand(query)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        gvComms.DataSource = ds.Tables(0)

                        gvComms.DataBind()
                        gvComms.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

        Dim queryCountry As String = "SELECT  country, f2, COUNT(email) AS Expr1 FROM dbo.ctaEvent left join dbo.countryLookup on ctaEvent.country = countryLookUp.F1 where not country = 'N/A' GROUP BY country, f2 ORDER BY Expr1 DESC"

        Using con2 As New SqlConnection(Common.GetConnString())
            Using cmd2 As New SqlCommand(queryCountry)
                Using sda2 As New SqlDataAdapter()
                    cmd2.Connection = con2
                    sda2.SelectCommand = cmd2
                    Using ds2 As New DataSet()
                        sda2.Fill(ds2)
                        Dim dc As DataColumn
                        Dim dr As DataRow

                        For Each dr In ds2.Tables(0).Rows

                            CountryData += "{'id': '" & dr(1).ToString & "','name': '" & dr(0).ToString & "','Popvalue': '" & dr(0).ToString & ": " & dr(2).ToString & "','fill': am4core.color('#82589F')},"

                            CountryFilter += "<option>" & dr(0).ToString & "</option>"

                        Next
                        CountryData += "{'id': 'ZZ','name': 'zz','Popvalue': 0,'fill': am4core.color('#5C5CFF')}"

                    End Using
                End Using
            End Using
        End Using



        Dim queryCountryRoundUp As String = "SELECT country, COUNT(email) AS Expr1 FROM dbo.ctaEvent GROUP BY country ORDER BY Expr1 desc, country asc"

        Using con3 As New SqlConnection(Common.GetConnString())
            Using cmd3 As New SqlCommand(queryCountryRoundUp)
                Using sda3 As New SqlDataAdapter()
                    cmd3.Connection = con3
                    sda3.SelectCommand = cmd3
                    Using ds3 As New DataSet()
                        sda3.Fill(ds3)
                        Dim dc3 As DataColumn
                        Dim dr3 As DataRow

                        For Each dr3 In ds3.Tables(0).Rows

                            CountryCount += dr3(0).ToString() & "... <strong>" & dr3(1).ToString() & "</strong><br>"


                        Next

                    End Using
                End Using
            End Using
        End Using


        Dim queryQuestions As String = "SELECT question, email, panelist, status FROM dbo.ctaQuestions"

        Using conQuestions As New SqlConnection(Common.GetConnString())
            Using cmdQuestions As New SqlCommand(queryQuestions)
                Using sdaQuestions As New SqlDataAdapter()
                    cmdQuestions.Connection = conQuestions
                    sdaQuestions.SelectCommand = cmdQuestions
                    Using dsQuestions As New DataSet()
                        sdaQuestions.Fill(dsQuestions)
                        gvCommsQuestions.DataSource = dsQuestions.Tables(0)

                        gvCommsQuestions.DataBind()
                        gvCommsQuestions.HeaderRow.TableSection = TableRowSection.TableHeader
                    End Using
                End Using
            End Using
        End Using

    End Sub



    Public Sub CountryConvert(CountryName As String)
        Dim Codes As New Dictionary(Of String, String) From {
            {"Afghanistan", "AF"},
{"Albania", "AL"},
{"Algeria", "DZ"},
{"American Samoa", "AS"},
{"Andorra", "AD"},
{"Angola", "AO"},
{"Anguilla", "AI"},
{"Antarctica", "AQ"},
{"Antigua and Barbuda", "AG"},
{"Argentina", "AR"},
{"Armenia", "AM"},
{"Aruba", "AW"},
{"Australia", "AU"},
{"Austria", "AT"},
{"Azerbaijan", "AZ"},
{"Bahamas (the)", "BS"},
{"Bahrain", "BH"},
{"Bangladesh", "BD"},
{"Barbados", "BB"},
{"Belarus", "BY"},
{"Belgium", "BE"},
{"Belize", "BZ"},
{"Benin", "BJ"},
{"Bermuda", "BM"},
{"Bhutan", "BT"},
{"Bolivia (Plurinational State of)", "BO"},
{"Bonaire, Sint Eustatius and Saba", "BQ"},
{"Bosnia and Herzegovina", "BA"},
{"Botswana", "BW"},
{"Bouvet Island", "BV"},
{"Brazil", "BR"},
{"British Indian Ocean Territory (the)", "IO"},
{"Brunei Darussalam", "BN"},
{"Bulgaria", "BG"},
{"Burkina Faso", "BF"},
{"Burundi", "BI"},
{"Cabo Verde", "CV"},
{"Cambodia", "KH"},
{"Cameroon", "CM"},
{"Canada", "CA"},
{"Cayman Islands (the)", "KY"},
{"Central African Republic (the)", "CF"},
{"Chad", "TD"},
{"Chile", "CL"},
{"China", "CN"},
{"Christmas Island", "CX"},
{"Cocos (Keeling) Islands (the)", "CC"},
{"Colombia", "CO"},
{"Comoros (the)", "KM"},
{"Congo (the Democratic Republic of the)", "CD"},
{"Congo (the)", "CG"},
{"Cook Islands (the)", "CK"},
{"Costa Rica", "CR"},
{"Croatia", "HR"},
{"Cuba", "CU"},
{"Curaçao", "CW"},
{"Cyprus", "CY"},
{"Czechia", "CZ"},
{"Côte d'Ivoire", "CI"},
{"Denmark", "DK"},
{"Djibouti", "DJ"},
{"Dominica", "DM"},
{"Dominican Republic (the)", "DO"},
{"Ecuador", "EC"},
{"Egypt", "EG"},
{"El Salvador", "SV"},
{"Equatorial Guinea", "GQ"},
{"Eritrea", "ER"},
{"Estonia", "EE"},
{"Eswatini", "SZ"},
{"Ethiopia", "ET"},
{"Falkland Islands (the) [Malvinas]", "FK"},
{"Faroe Islands (the)", "FO"},
{"Fiji", "FJ"},
{"Finland", "FI"},
{"France", "FR"},
{"French Guiana", "GF"},
{"French Polynesia", "PF"},
{"French Southern Territories (the)", "TF"},
{"Gabon", "GA"},
{"Gambia (the)", "GM"},
{"Georgia", "GE"},
{"Germany", "DE"},
{"Ghana", "GH"},
{"Gibraltar", "GI"},
{"Greece", "GR"},
{"Greenland", "GL"},
{"Grenada", "GD"},
{"Guadeloupe", "GP"},
{"Guam", "GU"},
{"Guatemala", "GT"},
{"Guernsey", "GG"},
{"Guinea", "GN"},
{"Guinea-Bissau", "GW"},
{"Guyana", "GY"},
{"Haiti", "HT"},
{"Heard Island and McDonald Islands", "HM"},
{"Holy See (the)", "VA"},
{"Honduras", "HN"},
{"Hong Kong", "HK"},
{"Hungary", "HU"},
{"Iceland", "IS"},
{"India", "IN"},
{"Indonesia", "ID"},
{"Iran (Islamic Republic of)", "IR"},
{"Iraq", "IQ"},
{"Ireland", "IE"},
{"Isle of Man", "IM"},
{"Israel", "IL"},
{"Italy", "IT"},
{"Jamaica", "JM"},
{"Japan", "JP"},
{"Jersey", "JE"},
{"Jordan", "JO"},
{"Kazakhstan", "KZ"},
{"Kenya", "KE"},
{"Kiribati", "KI"},
{"Korea (the Democratic People's Republic of)", "KP"},
{"Korea (the Republic of)", "KR"},
{"Kuwait", "KW"},
{"Kyrgyzstan", "KG"},
{"Lao People's Democratic Republic (the)", "LA"},
{"Latvia", "LV"},
{"Lebanon", "LB"},
{"Lesotho", "LS"},
{"Liberia", "LR"},
{"Libya", "LY"},
{"Liechtenstein", "LI"},
{"Lithuania", "LT"},
{"Luxembourg", "LU"},
{"Macao", "MO"},
{"Madagascar", "MG"},
{"Malawi", "MW"},
{"Malaysia", "MY"},
{"Maldives", "MV"},
{"Mali", "ML"},
{"Malta", "MT"},
{"Marshall Islands (the)", "MH"},
{"Martinique", "MQ"},
{"Mauritania", "MR"},
{"Mauritius", "MU"},
{"Mayotte", "YT"},
{"Mexico", "MX"},
{"Micronesia (Federated States of)", "FM"},
{"Moldova (the Republic of)", "MD"},
{"Monaco", "MC"},
{"Mongolia", "MN"},
{"Montenegro", "ME"},
{"Montserrat", "MS"},
{"Morocco", "MA"},
{"Mozambique", "MZ"},
{"Myanmar", "MM"},
{"Namibia", "NA"},
{"Nauru", "NR"},
{"Nepal", "NP"},
{"Netherlands (the)", "NL"},
{"New Caledonia", "NC"},
{"New Zealand", "NZ"},
{"Nicaragua", "NI"},
{"Niger (the)", "NE"},
{"Nigeria", "NG"},
{"Niue", "NU"},
{"Norfolk Island", "NF"},
{"Northern Mariana Islands (the)", "MP"},
{"Norway", "NO"},
{"Oman", "OM"},
{"Pakistan", "PK"},
{"Palau", "PW"},
{"Palestine, State of", "PS"},
{"Panama", "PA"},
{"Papua New Guinea", "PG"},
{"Paraguay", "PY"},
{"Peru", "PE"},
{"Philippines (the)", "PH"},
{"Pitcairn", "PN"},
{"Poland", "PL"},
{"Portugal", "PT"},
{"Puerto Rico", "PR"},
{"Qatar", "QA"},
{"Republic of North Macedonia", "MK"},
{"Romania", "RO"},
{"Russian Federation (the)", "RU"},
{"Rwanda", "RW"},
{"Réunion", "RE"},
{"Saint Barthélemy", "BL"},
{"Saint Helena, Ascension and Tristan da Cunha", "SH"},
{"Saint Kitts and Nevis", "KN"},
{"Saint Lucia", "LC"},
{"Saint Martin (French part)", "MF"},
{"Saint Pierre and Miquelon", "PM"},
{"Saint Vincent and the Grenadines", "VC"},
{"Samoa", "WS"},
{"San Marino", "SM"},
{"Sao Tome and Principe", "ST"},
{"Saudi Arabia", "SA"},
{"Senegal", "SN"},
{"Serbia", "RS"},
{"Seychelles", "SC"},
{"Sierra Leone", "SL"},
{"Singapore", "SG"},
{"Sint Maarten (Dutch part)", "SX"},
{"Slovakia", "SK"},
{"Slovenia", "SI"},
{"Solomon Islands", "SB"},
{"Somalia", "SO"},
{"South Africa", "ZA"},
{"South Georgia and the South Sandwich Islands", "GS"},
{"South Sudan", "SS"},
{"Spain", "ES"},
{"Sri Lanka", "LK"},
{"Sudan (the)", "SD"},
{"Suriname", "SR"},
{"Svalbard and Jan Mayen", "SJ"},
{"Sweden", "SE"},
{"Switzerland", "CH"},
{"Syrian Arab Republic", "SY"},
{"Taiwan (Province of China)", "TW"},
{"Tajikistan", "TJ"},
{"Tanzania, United Republic of", "TZ"},
{"Thailand", "TH"},
{"Timor-Leste", "TL"},
{"Togo", "TG"},
{"Tokelau", "TK"},
{"Tonga", "TO"},
{"Trinidad and Tobago", "TT"},
{"Tunisia", "TN"},
{"Turkey", "TR"},
{"Turkmenistan", "TM"},
{"Turks and Caicos Islands (the)", "TC"},
{"Tuvalu", "TV"},
{"Uganda", "UG"},
{"Ukraine", "UA"},
{"United Arab Emirates (the)", "AE"},
{"United Kingdom of Great Britain and Northern Ireland (the)", "GB"},
{"United States Minor Outlying Islands (the)", "UM"},
{"United States of America (the)", "US"},
{"Uruguay", "UY"},
{"Uzbekistan", "UZ"},
{"Vanuatu", "VU"},
{"Venezuela (Bolivarian Republic of)", "VE"},
{"Viet Nam", "VN"},
{"Virgin Islands (British)", "VG"},
{"Virgin Islands (U.S.)", "VI"},
{"Wallis and Futuna", "WF"},
{"Western Sahara", "EH"},
{"Yemen", "YE"},
{"Zambia", "ZM"},
{"Zimbabwe", "ZW"},
{"Åland Islands", "AX"}}
    End Sub
End Class