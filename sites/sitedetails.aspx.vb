
Partial Class site_details
    Inherits System.Web.UI.Page

    Private myObjId As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        myObjId = Server.HtmlEncode(Request.QueryString("myObjID")) 'siteID


        If Not IsNothing(myObjId) Then

            getSitebyId(myObjId)
            getActivitiesbySiteID(myObjId)
            siteInfo.Visible = True


        End If

    End Sub



    Private Function getSitebyId(ByVal myObjID As String) As Boolean
        Dim siteID As String = myObjID
        Dim data As New DAL() ' call DAL class
        Dim dt As DataTable = data.GetSiteByID(siteID)

        'siteDetailstab.Visible = True
        't1.Visible = True

        If dt Is Nothing Then
            msg.Text = "Site information for this location is not currently available. Please check back at a later time."
            msg.Visible = True
        Else
            Dim strOrganizationInfo As String = ""
            For Each Site As DataRow In dt.Rows
                Dim myRow As Literal
                myRow = New Literal
                Dim siteInfoHTML As String = ""
                Dim siteTitleHTML As String = ""
                mysitename.Text = Common.removeLeadingCharUnderscore(Site("Name"))
                siteTitleHTML = Common.removeLeadingCharUnderscore(Site("Name"))

                'objTitle.Text = Common.removeLeadingCharUnderscore(Site("Name"))




                '            <table id = "sitesummary" Class="table table-sm">
                '                    <tbody>
                '<tr>
                '<th Class="text-right">Sector:</th>
                '                          <td> Biogas; MSW</td>
                '                      </tr>
                '                      <tr>
                '    <th Class="text-right">Type:</th>
                '                          <td> Landfill</td>
                '                      </tr>
                '                      <tr>
                '        <th Class="text-right">Location:</th>
                '                          <td> Santo Domingo, Dominican Republic</td>
                '                      </tr>
                '                      <tr>
                '            <th Class="text-right">GMI Site?</th>
                '                          <td> No</td>
                '                      </tr>
                '                      <tr>
                '                <th Class="text-right">&nbsp;</th>
                '                          <td> <a href = "details.aspx" role="button" Class="btn btn-primary">View Site Details <i Class="fa fa-arrow-circle-down"></i></a></td>
                '                      </tr>
                '		</tbody>
                '	</table>

                'siteInfoHTML += "<div class='imgContainer'><img src=""/images/flag_" & getCountryAbbrName(Site("CountryName").ToString) & "_big.gif"" alt=""country flag"" class='imgOverlay' />"
                'siteInfoHTML += "<img src=""/images/event_feature_" & getSectorEventURL(Site("sector").ToString) & "1.JPG"" alt=""" & Site("sector").ToString & """ title=""Featured Image for " & Site("sector").ToString + """ class='imgbackground' />"
                siteInfoHTML += "<table id = 'sitesummary' Class='table table-sm'> <tbody>"

                If Len(Site("name").ToString) > 0 Or Len(Site("sector").ToString) > 0 Then
                    'name.Text = Common.removeLeadingCharUnderscore(Site("Name"))
                    'siteTitleHTML += "<h1><span style='font-size:0.5em;color:black;'>Site:</span><br>" & Common.removeLeadingCharUnderscore(Site("Name")) & "</h1>"

                    'sector.Text = Site("sector").ToString
                    If Not Site("sector").ToString = "General" Then
                        siteInfoHTML += "<tr><th Class='text-right'>Sector:</th><td> " & Site("sector").ToString & "</td></tr>"
                    Else
                        siteInfoHTML += "<tr><th Class='text-right'>Sector:</th><td> Multiple</td></tr>"
                    End If
                    'If Site("sector").ToString = "Oil & Gas" Then
                    '    OGsectorResults.Visible = True
                    'End If
                    'dl5.Visible = True
                End If
                'If Len(Site("Site_Description").ToString) > 0 Then
                '    site_description.Text = Site("Site_Description").ToString
                '    dl1.Visible = True
                'End If
                siteInfoHTML += "<tr><th Class='text-right'>Type:</th><td>" & Site("type_of_site").ToString
                If Not IsDBNull(Site("Farm_Type")) Then
                    siteInfoHTML += ", " & Site("farm_type").ToString
                End If
                If Not IsDBNull(Site("Type_of_Coal")) Then
                    siteInfoHTML += ", " & Site("Type_of_Coal").ToString
                End If
                siteInfoHTML += "</td></tr>"

                'farm_type.Text = Site("Farm_Type").ToString




                Session("Sitename") = Site("Name").ToString
                Session("SiteID") = siteID
                'dl15

                'dl14
                siteInfoHTML += "<tr><th Class='text-right'>Location:</th><td>"
                If Len(Site("State_Province").ToString) > 0 Or Len(Site("City").ToString) > 0 Then
                    siteInfoHTML += Site("City").ToString
                    If Not IsDBNull(Site("state_province")) And Len(Site("state_province").ToString) > 0 Then
                        siteInfoHTML += ", " & Site("state_province").ToString
                        If Not IsDBNull(Site("CountryName")) And Len(Site("countryname").ToString) > 0 Then
                            siteInfoHTML += ", " & Site("CountryName").ToString
                        End If
                    End If
                ElseIf Not IsDBNull(Site("state_province")) And Len(Site("state_province").ToString) > 0 Then
                    siteInfoHTML += Site("state_province").ToString
                    If Not IsDBNull(Site("CountryName")) And Len(Site("countryname").ToString) > 0 Then
                        siteInfoHTML += ", " & Site("CountryName").ToString
                    End If
                ElseIf Len(Site("Region").ToString) > 0 Then
                    siteInfoHTML += Site("Region").ToString
                    If Not IsDBNull(Site("CountryName")) And Len(Site("countryname").ToString) > 0 Then
                        siteInfoHTML += ", " & Site("CountryName").ToString
                    End If
                ElseIf Not IsDBNull(Site("CountryName")) And Len(Site("countryname").ToString) > 0 Then
                    siteInfoHTML += Site("CountryName").ToString
                End If

                siteInfoHTML += "</td></tr>"

                siteInfoHTML += "<tr><th Class='text-right'>GMI Site?</th><td>"
                If Len(Site("gmi_site").ToString) > 0 Or Len(Site("type_of_site").ToString) > 0 Then
                    If Site("gmi_site") = True Then
                        'gmisite.Text = "<img src='/images/greencheckmark.gif' alt='check' />"
                        siteInfoHTML += "<img src='/assets/images/greencheckmark.gif' alt='check' /></td>"
                    Else
                        siteInfoHTML += "<input type='checkbox' disabled='disabled' /></td></tr>"
                    End If

                End If
                siteInfoHTML += "<tr><th Class='text-right'>&nbsp;</th><td> <a href = '#details' role='button' Class='btn btn-primary'>View Site Details <i Class='fa fa-arrow-circle-down'></i></a></td></tr></tbody></table>"
                siteInfo.Text = siteInfoHTML
                siteTitle.Text = siteTitleHTML
                'objTitle.Text = " <dl>" & siteInfoHTML & "</dl>"
                ' dl12 
                'If Len(Site("Postal_Code").ToString) > 0 Or Len(Site("District").ToString) > 0 Then
                '    postal_code.Text = Site("Postal_Code").ToString
                '    district.Text = Site("District").ToString
                '    dl12.Visible = True
                'End If


                Dim reductionsHTML As String = ""
                If Len(Site("Potential_Annual_Reductions_MT_CO2e").ToString) > 0 Or Len(Site("Actual_Annual_Reductions_MT_CO2e").ToString) > 0 Then
                    reductionsHTML += "<h3 Class='py-3'>Emissions Reductions</h3><table id='detail1'  class='table'><tbody>"
                    reductionsHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Actual Annual Reductions (MTCO<sub>2</sub>e):</td>"
                    reductionsHTML += "<td>" & Site("Actual_Annual_Reductions_MT_CO2e").ToString & "</td></tr>"
                    reductionsHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Potential Annual Reductions (MTCO<sub>2</sub>e):</td>"
                    reductionsHTML += "<td>" & Site("Potential_Annual_Reductions_MT_CO2e").ToString & "</td></tr></tbody></table>"

                End If


                '            <table id = "detail1" Class="table">
                '                    <tbody>
                '<tr>
                '<td Class="gmi-light-blue-cell text-right w-25">Actual Annual Reductions (Of MTCO<sub>2</sub>e):</td>
                '                          <td>0</td>
                '                      </tr>
                '                      <tr>
                '    <td Class="gmi-light-blue-cell text-right w-25">Potential Annual Reductions (Of MTCO<sub>2</sub>e):</td>
                '                          <td>0</td>
                '                      </tr>
                '		</tbody>
                '	</table>
                reductions.Text = reductionsHTML


                '///////////////////////////// OWNER OPERATOR /////////////////////////////
                '            <table id = "detail2" Class="table">
                '                    <tbody>
                '<tr>
                '<td Class="gmi-light-blue-cell text-right w-25">Owner:</td>
                '                          <td> Max Da Silva<br>Lajun Corporation SA</td>
                '                      </tr>
                '		</tbody>
                '	</table>
                Dim ownerHTML As String = ""
                If Len(Site("Owner_Organization").ToString) > 0 Then
                    ownerHTML += "<h3 class='py-3'>Owner/Operator</h3><table id='table2' class='table'><tbody>"
                    ownerHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Owner:</td>"
                    If Len(Site("Owner_FirstName").ToString) > 0 And Len(Site("Owner_LastName").ToString) > 0 Then

                        ownerHTML += "<td>" & Site("Owner_FirstName").ToString & " " & Site("Owner_LastName").ToString & "<br>"

                    Else
                        ownerHTML += "<td>"
                    End If
                    ownerHTML += Site("Owner_Organization").ToString & "</td></tr>"

                End If


                If Len(Site("Operator_Organization").ToString) > 0 Then
                    ownerHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Operator:</td><td>"
                    If Len(Site("Operator_FirstName").ToString) > 0 And Len(Site("Operator_LastName").ToString) = 0 Then




                        ownerHTML += Site("Operator_FirstName").ToString & " " & Site("Operator_LastName").ToString & "<br>"

                    End If

                    ownerHTML += Site("Operator_Organization").ToString & "</td></tr>"
                End If



                If Len(Site("Primary_FirstName").ToString) > 0 And Len(Site("Primary_LastName").ToString) > 0 Then

                    ownerHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Primary Point of Contact:</td>"

                    'ownerHTML += "<td><a href='actOrgContactDetailsByContactId.aspx?myObjId=" + Site("Primary_ContactID").ToString + "'>"

                    ownerHTML += "<td>" & Site("Primary_FirstName").ToString & " " & Site("Primary_LastName").ToString + "</td></tr>"
                End If
                ownership.Text = ownerHTML


                '// LANDFILL DATA
                If Site("sector").ToString = "MSW" Then
                    Dim landfilldata As New DAL()
                    Dim MSWdt As DataTable = data.getSiteLandfillDataByID(siteID)
                    If MSWdt Is Nothing Then
                        msg.Text = "The site landfill information is not available."
                        msg.Visible = True

                    Else
                        For Each msw As DataRow In MSWdt.Rows

                            '///////////////////// PHYSICAL INFO /////////////////////////


                            '                        <table id = "detail3" Class="table">
                            '                    <tbody>
                            '<tr>
                            '<td Class="gmi-light-blue-cell text-right w-25">Landfill Type:</td>
                            '                          <td> Controlled Landfill</td>
                            '                      </tr>
                            '                      <tr>
                            '    <td Class="gmi-light-blue-cell text-right w-25">Landfill Size (Of Designed, Hectares) : </td>
                            '                          <td>125.00</td>
                            '                      </tr>
                            '                      <tr>
                            '        <td Class="gmi-light-blue-cell text-right w-25">Waste in Place:</td>
                            '                          <td>5,427,267.00 Tonnes</td>
                            '                      </tr>
                            '                      <tr>
                            '            <td Class="gmi-light-blue-cell text-right w-25">Waste Accepted Annually:</td>
                            '                          <td>1241063 Tonnes</td>
                            '                      </tr>
                            '                      <tr>
                            '                <td Class="gmi-light-blue-cell text-right w-25">Filling Dates:</td>
                            '                          <td>1996 - </td>
                            '                      </tr>
                            '                      <tr>
                            '                    <td Class="gmi-light-blue-cell text-right w-25">Evidence of Fires:</td>
                            '                          <td> <input type ='checkbox' disabled='disabled' /></td>
                            '                      </tr>
                            '                        <tr>
                            '                        <td Class="gmi-light-blue-cell text-right w-25">Annual Rainfall (Of cm) : </td>
                            '                          <td>138.4</td>
                            '                      </tr>
                            '                      <tr>
                            '                            <td Class="gmi-light-blue-cell text-right w-25">Average Temperature (Of Celsius) : </td>
                            '                          <td>25.8</td>
                            '		  </tr>
                            '		</tbody>
                            '	</table>


                            Dim physicalInfoHTML As String = ""
                            physicalInfoHTML += "<h3 class='py-3'>Physical Data</h3><table id='table3' class='table'><tbody>"

                            If Not IsDBNull(msw("Landfill_Type")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Landfill Type:</th>"
                                physicalInfoHTML += "<td>" & msw("Landfill_Type").ToString & "</td></tr>"
                            End If

                            If Not IsDBNull(msw("Landfill_Size_Designed")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Landfill Size (Designed, Hectares):</td>"
                                physicalInfoHTML += "<td>" & FormatNumber(msw("Landfill_Size_Designed"), 2, , , TriState.True) & "</td></tr>"
                            End If
                            If Not IsDBNull(msw("Landfill_Size_Current")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Landfill Size (Current, Hectares):</td>"
                                physicalInfoHTML += "<td>" & FormatNumber(msw("Landfill_Size_Current"), 2, , , TriState.True) & "</td></tr>"
                            End If
                            If Not IsDBNull(msw("Waste_in_Place")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Waste in Place:</td>"
                                physicalInfoHTML += "<td>" & FormatNumber(msw("Waste_in_Place"), 2, , , TriState.True) & " " & msw("Waste_in_Place_Units").ToString & "</td></tr>"
                            End If
                            'physicalInfoHTML += "<td Class='gmi-light-blue-cell text-right w-25'>Waste in Place Units:</td>"
                            'physicalInfoHTML += "<td>" & msw("Waste_in_Place_Units").ToString & "</td>"
                            If Not IsDBNull(msw("Designed_Capacity")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Designed Capacity:</td>"
                                physicalInfoHTML += "<td>" & msw("Designed_Capacity").ToString & " " & msw("Designed_Capacity_Units").ToString & "</td></tr>"
                            End If
                            'physicalInfoHTML += "<td Class='gmi-light-blue-cell text-right w-25'>Designed Capacity Units:</td>"
                            'physicalInfoHTML += "<td>" & msw("Designed_Capacity_Units").ToString & "</td>"
                            If Not IsDBNull(msw("Waste_Accepted_Annually")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Waste Accepted Annually:</td>"
                                physicalInfoHTML += "<td>" & msw("Waste_Accepted_Annually").ToString & " " & msw("Waste_Accepted_Annually_Units").ToString & "</td></tr>"
                            End If
                            'physicalInfoHTML += "<td Class='gmi-light-blue-cell text-right w-25'>Waste Accepted Annually Units:</td>"
                            'physicalInfoHTML += "<td>" & msw("Waste_Accepted_Annually_Units").ToString & "</td>"

                            If Not IsDBNull(msw("Waste_Depth")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Waste Depth (Meters):</td>"
                                physicalInfoHTML += "<td>" & msw("Waste_Depth").ToString & "</td></tr>"
                            End If
                            If Not IsDBNull(msw("Filling_Begin_Year")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Filling Dates:</td>"
                                physicalInfoHTML += "<td>" & msw("Filling_Begin_Year").ToString & " - " & msw("Filling_End_Year").ToString & "</td></tr>"
                            End If

                            'physicalInfoHTML += "<td Class='gmi-light-blue-cell text-right w-25'>Filling End Year:</td>"
                            'physicalInfoHTML += "</td>"



                            '.rgba-primary-0 { color: rgba( 48,145,192,1) }	/* Main Primary color */
                            '.rgba-primary-1 { color: rgba(125,192,224,1) }
                            '.rgba-primary-2 { color: rgba( 81,166,207,1) }
                            '.rgba-primary-3 { color: rgba( 14,126,180,1) }
                            '.rgba-primary-4 { color: rgba(  6, 94,136,1) }


                            If Not IsDBNull(msw("Percent_Industrial")) And Not IsDBNull(msw("Percent_Unknown_Source")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Waste Sources:</td>"
                                physicalInfoHTML += "<td><canvas id='physicalData' style='width:100%;'></canvas></td>"
                                physicalInfoHTML += "<script>"
                                physicalInfoHTML += "new Chart(document.getElementById('physicalData'), {type: 'pie', data: {"
                                physicalInfoHTML += "labels: ['Municipal', 'Industrial', 'Inert', 'Unknown']"
                                physicalInfoHTML += ", datasets: [{ data: ["
                                physicalInfoHTML += msw("Percent_Municipal").ToString & "," & msw("Percent_Industrial").ToString & "," & msw("Percent_Inert").ToString & "," & msw("Percent_Unknown_Source").ToString & "]"
                                physicalInfoHTML += ", label: 'Waste Source (Percentage, of " & msw("Waste_Source_Percentage_Basis").ToString & "', fill: true, borderColor: '#666666',backgroundColor: [  'rgba( 48,145,192,1)',  'rgba(125,192,224,1)',  'rgba( 81,166,207,1)',  'rgba( 14,126,180,1)']}"
                                physicalInfoHTML += "]},options: {title: {display:true, text: 'Waste Source (Percentage, of " & msw("Waste_Source_Percentage_Basis").ToString & ")'} }"
                                physicalInfoHTML += "});"
                                physicalInfoHTML += "</script></tr>"
                            End If
                            If Not IsDBNull(msw("Evidence_of_Fires")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Evidence of Fires:</td>"
                                physicalInfoHTML += "<td>" & Common.getImageForCheckbox(msw("Evidence_of_Fires").ToString) & "</td></tr>"
                            End If
                            If Not IsDBNull(msw("Annual_Rainfall")) Then
                                physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Annual Rainfall (cm):</td>"
                                physicalInfoHTML += "<td>" & msw("Annual_Rainfall").ToString & "</td></tr>"
                            End If

                            physicalInfoHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Average Temperature (Celsius):</td>"
                            physicalInfoHTML += "<td>" & msw("Average_Temperature").ToString & "</td></tr></tbody></table>"

                            If Len(physicalInfoHTML) > 292 Then
                                physicalInfo.Text = physicalInfoHTML
                                physicalInfo.Visible = True
                            Else
                                physicalInfo.Visible = False
                            End If
                            '//////////////// WASTE CHARACTERISTICS /////////////////////
                            '<table id="detail5" class="table">
                            '<tbody>
                            '<tr>
                            '<td Class="gmi-light-blue-cell text-right w-25">Waste Characteristics:</td>
                            '                          <td> <canvas id ='wasteData' style='height:300px;width:60%;'></canvas></td>
                            '                      </tr>
                            '    <tr>
                            '    <td Class="gmi-light-blue-cell text-right w-25">Leachate Accumulating:</td>
                            '                          <td> <input type ='checkbox' disabled='disabled' /></td>
                            '                      </tr>
                            '        <tr>
                            '        <td Class="gmi-light-blue-cell text-right w-25">Leachate Drained:</td>
                            '                          <td> <input type ='checkbox' disabled='disabled' /></td>
                            '                      </tr>
                            '            						</tbody>
                            '	</table>

                            '////////////////////// GAS COLLECTION DETAILS
                            '                <table id = "detail4" Class="table">
                            '                    <tbody>
                            '<tr>
                            '<td Class="gmi-light-blue-cell text-right w-25">Gas Collection System:</td>
                            '                          <td> <img src ='/assets/images/activity_checkmark.gif' alt='check' /></td>
                            '                      </tr>
                            '    <tr>
                            '    <td Class="gmi-light-blue-cell text-right w-25">Type of Venting:</td>
                            '                          <td> Active</td>
                            '                      </tr>
                            '                      <tr>
                            '        <td Class="gmi-light-blue-cell text-right w-25">Number (and Description) of Wells:</td>
                            '                          <td></td>
                            '		  </tr>
                            '		</tbody>
                            '	</table>

                            Dim gascollectionHTML As String = ""
                            If Not IsDBNull(msw("Gas_Collection_System")) Then
                                gascollectionHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Gas Collection System:</td>"
                                gascollectionHTML += "<td>" & Common.getImageForCheckbox(msw("Gas_Collection_System").ToString) & "</td></tr>"
                                gascollectionHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Type of Venting:</td>"
                                gascollectionHTML += "<td>" & msw("Type_of_Venting").ToString & "</td></tr>"
                                gascollectionHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Number (and Description) of Wells:</td>"
                                gascollectionHTML += "<td>" & msw("Number_of_Wells").ToString & "</td></tr>"
                            End If
                            If Not IsDBNull(msw("Average_Depth_of_Wells")) Then
                                gascollectionHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Average Depth of Wells (Meters):</td>"
                                gascollectionHTML += "<td>" & FormatNumber(msw("Average_Depth_of_Wells"), 2, , , TriState.True) & "</td></tr>"
                            End If
                            If Not IsDBNull(msw("Gas_Flow_Rate_Measured")) Then
                                gascollectionHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Gas Flow Rate Measured:</td>"
                                gascollectionHTML += "<td>" & FormatNumber(msw("Gas_Flow_Rate_Measured"), 2, , , TriState.True) & "" & msw("Gas_Flow_Rate_Units").ToString & "</td></tr>"
                            End If
                            If Not IsDBNull(msw("Methane_Content_Measured")) Then
                                gascollectionHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Methane Content Measured:</td>"
                                gascollectionHTML += "<td>" & FormatNumber(msw("Methane_Content_Measured"), 2, , , TriState.True) & "%</td></tr>"
                            End If
                            If Len(gascollectionHTML) > 171 Then
                                gasCollectionInfo.Text = "<h3 class='py-3'>Gas Collection System Data</h3><table id='table5' class='table'><tbody>" & gascollectionHTML & "</tbody></table>"
                                gasCollectionInfo.Visible = True
                            Else
                                gasCollectionInfo.Visible = False
                            End If



                            Dim wastecharacteristicsHTML As String = ""
                            Dim datalabels As String = ""
                            Dim datastr As String = ""
                            Dim colorstr As String = ""

                            If Not IsDBNull(msw("Percent_Food_Waste")) Then
                                datalabels += "'Food Waste', "
                                datastr += msw("Percent_Food_Waste") & ", "
                                colorstr += "'rgba( 48,145,192,1)',"
                            End If


                            If Not IsDBNull(msw("Percent_Garden_Waste")) Then
                                datalabels += "'Garden Waste', "
                                datastr += msw("Percent_Garden_Waste") & ", "
                                colorstr += "  'rgba(125,192,224,1)',"
                            End If


                            If Not IsDBNull(msw("Percent_Wood")) Then
                                datalabels += "'Wood Waste', "
                                datastr += msw("Percent_Wood") & ", "
                                colorstr += "  'rgba( 81,166,207,1)',"

                            End If


                            If Not IsDBNull(msw("Percent_Paper_and_Textiles")) Then
                                datalabels += "'Paper/Textile Waste', "
                                datastr += msw("Percent_Paper_and_Textiles") & ", "
                                colorstr += "  'rgba( 14,126,180,1)', "

                            End If

                            If Not IsDBNull(msw("Percent_Inert_Waste")) Then
                                datalabels += "'Inert Waste', "
                                datastr += msw("Percent_Inert_Waste") & ", "
                                colorstr += "'rgba(  6, 94,136,1)',"
                            End If


                            If Not IsDBNull(msw("Percent_Unknown_Characteristic")) Then
                                datalabels += "'Unknown' "
                                datastr += msw("Percent_Unknown_Characteristic") & ", "
                                colorstr += " 'rgba( 48,145,192,.5)'"



                            End If

                            If Len(datalabels) > 10 Then
                                wastecharacteristicsHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Waste Characteristics:</td>"
                                wastecharacteristicsHTML += "<td><canvas id='wasteData' style='width:100%;'></canvas></td>"
                                wastecharacteristicsHTML += "<script>"
                                wastecharacteristicsHTML += "new Chart(document.getElementById('wasteData'), {type: 'pie', data: {"
                                wastecharacteristicsHTML += "labels: [" & datalabels & "]"
                                wastecharacteristicsHTML += ", datasets: [{ data: ["
                                wastecharacteristicsHTML += datastr & "]"
                                wastecharacteristicsHTML += ", label: 'Waste Characteristics (Percentage, of " & msw("Waste_Characteristics_Percentage_Basis").ToString & "', fill: true, borderColor: '#666666',backgroundColor: [ " & colorstr & "]}"
                                wastecharacteristicsHTML += "]},options: {title: {display:true, text: 'Waste Characteristics (Percentage, of " & msw("Waste_Characteristics_Percentage_Basis").ToString & ")'} }"
                                wastecharacteristicsHTML += "});"
                                wastecharacteristicsHTML += "</script></tr>"
                            End If

                            If Not IsDBNull(msw("Leachate_Collected")) Then
                                wastecharacteristicsHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Leachate Collected:</td>"
                                wastecharacteristicsHTML += "<td>" & FormatNumber(msw("Leachate_Collected"), 2, , , TriState.True) & "</td></tr>"
                            End If
                            wastecharacteristicsHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Leachate Accumulating:</td>"
                            wastecharacteristicsHTML += "<td>" & Common.getImageForCheckbox(msw("Leachate_Accumulating").ToString) & "</td></tr>"
                            wastecharacteristicsHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Leachate Drained:</td>"
                            wastecharacteristicsHTML += "<td>" & Common.getImageForCheckbox(msw("Leachate_Drained").ToString) & "</td></tr>"

                            If Len(wastecharacteristicsHTML) > 225 Then
                                wastecharacteristicsHTML = "<h3 class='py-3'>Waste Characteristics</h3><table><tbody>" + wastecharacteristicsHTML + "</tbody></table>"
                                wastecharacteristicsInfo.Text = wastecharacteristicsHTML
                                wastecharacteristicsInfo.Visible = True
                            Else
                                wastecharacteristicsInfo.Visible = False
                            End If







                            Dim additionalHTML As String = ""

                            If Not IsNothing(msw("Date_of_Data_Collection")) Then
                                additionalHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Date of Data Collection:</td>"
                                additionalHTML += "<td>" & msw("Date_of_Data_Collection").ToString & "</td></tr>"
                            End If
                            'additionalHTML += "<td Class='gmi-light-blue-cell text-right w-25'>Form Completed By:</td>"
                            'additionalHTML += "<td>" & Site("Form_Completed_By").ToString & "<br>"
                            additionalHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Organization:</td><td>" & msw("Organization").ToString & "</td></tr>"
                            If Not IsDBNull(msw("Additional_Comments")) Then
                                additionalHTML += "<tr><td Class='gmi-light-blue-cell text-right w-25'>Additional Comments:</td>"
                                additionalHTML += "<td>" & msw("Additional_Comments").ToString & "</td></tr>"
                            End If
                            If Len(additionalHTML) > 10 Then
                                additionalHTML = "<h3 class='py-3'>Additional Information</h3><table id='table6' class='table'><tbody>" + additionalHTML + "</tbody></table>"
                                additionalInfo.Text = additionalHTML
                                additionalInfo.Visible = True

                            Else
                                additionalInfo.Visible = False
                            End If














                        Next

                        'landfillDetails.Visible = True
                    End If
                ElseIf Site("sector").ToString = "Coal Mines" Then




                ElseIf Site("sector").ToString = "Agriculture" Then

                ElseIf Site("sector").ToString = "AgSTAR Domestic" Then
                    '// Placeholder
                ElseIf Site("sector").ToString = "Oil & Gas" Then
                    '// Placeholder



                ElseIf Site("sector").ToString = "Wastewater" Then
                    '// Placeholder
                End If
            Next
        End If



        ''attachment
        'Dim qr2 As sforce.QueryResult
        'Dim strQuery2 As String = ""
        'Dim attachmentStr As String
        'attachmentStr = ""

        'strQuery2 = "select id, name, parentid  from attachment " & _
        '            " WHERE parentid ='" & myObjId & "' order by name"

        ''Response.Write(strQuery2)
        'qr2 = binding.query(strQuery2)

        'If qr2.records Is Nothing Then
        'Else
        '    For i As Integer = 0 To qr2.records.GetUpperBound(0)
        '        Dim myObj2 As sforce.Attachment = CType(qr2.records(i), sforce.Attachment)

        '        Dim fileUrl As String
        '        fileUrl = "<a href='attachmentDownload.aspx?myObjId=" + myObj2.Id + "'>" + myObj2.Name + "</a>"
        '        attachmentStr = attachmentStr + fileUrl + "<br/>"
        '    Next
        'End If

        ''new 2013
        ''large attachments
        'strQuery2 = "Select c.Id, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c, c.Title  From ContentVersion c " & _
        '            " WHERE c.Site__c ='" & myObjId & "' order by c.Title"

        'qr2 = binding.query(strQuery2)

        'If qr2.records Is Nothing Then
        '    'Response.Write("I am here Records is Nothing.")
        'Else
        '    For i As Integer = 0 To qr2.records.GetUpperBound(0)
        '        '    'If i = 0 Then  'getting the first file
        '        Dim myObj2 As sforce.ContentVersion = CType(qr2.records(i), sforce.ContentVersion)

        '        Dim myId As String
        '        myId = myObj2.Id

        '        If (activitiesFileAttachments.Contains(myId)) Then
        '        Else
        '            Dim fileUrl As String
        '            fileUrl = "<a href=""docDownload.aspx?myObjId=" & myId & """>" & myObj2.Title & "</a>"
        '            attachmentStr = attachmentStr + fileUrl + "<br/>"
        '        End If
        '    Next

        'End If
        ''end of large attachments 

        ''If site is not country, then include attachments under activities as well
        'If (name.Text.ToLower().Equals(country.Text.ToLower())) Then
        '    attachmentStr = attachmentStr
        'Else
        '    attachmentStr = attachmentStr + activitiesFileAttachments
        'End If

        'Attachment.Text = attachmentStr

        'Return True
    End Function


    Private Function getActivitiesbySiteID(ByVal siteID As String) As Boolean
        Dim data As New DAL() ' call DAL class
        Dim dt As DataTable = data.GetActivitiesBySiteID(siteID)
        'hiddenSiteID.Value = siteID



        Dim stringValue As String = ""

        Dim myRowText As String = ""
        Dim activityListHTML As String = ""
        If dt Is Nothing Then
            'myRowText = "There are no activities at this site."

        Else
            'activityListtab.Visible = True
            't2.Visible = True


            For Each Activity As DataRow In dt.Rows
                myRowText += "<tr>"
                myRowText += "<td  class='namecol'>" & Activity("Name").ToString & "</td>"
                myRowText += "<td>" & Activity("recordtype").ToString & "</td>"
                myRowText += "<td  class='linkcol'><a href='activity_details.aspx?a=" + Activity("ID").ToString + "' role='button' Class='btn btn-primary'>Details <i Class='fa fa-arrow-circle-down'></i></a></td>"
                myRowText += "</tr>"
            Next



        End If
        If Len(myRowText) > 10 Then
            activityListHTML += "<p><strong>Site Activities</strong></p><table id = 'listofactivities' Class='table table-sm' >"
            activityListHTML += "<thead><tr><th class='namecol'>Name</th><th>Type</th><th   class='linkcol'>&nbsp;</th></tr></thead><tbody>" + myRowText
            activityListHTML += "</tbody></table>"
            litActivitiesOnSite.Text = activityListHTML
            litActivitiesOnSite.Visible = True
        Else
            litActivitiesOnSite.Visible = False
        End If





        '        'attachments
        '        Dim qr2 As sforce.QueryResult
        '        Dim strQuery2 As String = ""
        '        Dim attachmentStr As String
        '        attachmentStr = ""

        '        strQuery2 = "Select id, name, parentid  from attachment " & _
        '                    " WHERE parentid ='" & myDispId & "' order by name"

        '        'Response.Write(strQuery2)


        '        If qr2.records Is Nothing Then
        '        Else
        '            For m As Integer = 0 To qr2.records.GetUpperBound(0)
        '                Dim myObj2 As sforce.Attachment = CType(qr2.records(m), sforce.Attachment)

        '                Dim fileUrl As String
        '                fileUrl = "<a href='attachmentDownload.aspx?myObjId=" + myObj2.Id + "'>" + myObj2.Name + "</a>"
        '                attachmentStr = attachmentStr + fileUrl + "<br/>"
        '                activitiesFileAttachments = activitiesFileAttachments + fileUrl + "<br/>"
        '            Next
        '        End If


        '        'new 2012
        '        'large attachments
        '        strQuery2 = "Select c.Id, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c, c.Title  From ContentVersion c " & _
        '                    " WHERE c.Activity__c ='" & myDispId & "' order by c.Title"



        '        If qr2.records Is Nothing Then
        '            'Response.Write("I am here Records is Nothing.")
        '        Else
        '            For m As Integer = 0 To qr2.records.GetUpperBound(0)
        '                '    'If i = 0 Then  'getting the first file
        '                Dim myObj2 As sforce.ContentVersion = CType(qr2.records(m), sforce.ContentVersion)

        '                Dim myId As String
        '                myId = myObj2.Id
        '                Dim fileUrl As String
        '                fileUrl = "<a href=""docDownload.aspx?myObjId=" & myId & """>" & myObj2.Title & "</a>"
        '                attachmentStr = attachmentStr + fileUrl + "<br/>"
        '                activitiesFileAttachments = activitiesFileAttachments + fileUrl + "<br/>"
        '            Next

        '        End If
        '        'end of large attachments 


        '        myRowText = myRowText + "<td>" + attachmentStr + "</td>"

        '        myLitText = myLitText + myRowText
        '    Next

        'End If
        ''litActivitiesOnSite.Text = myLitText

        'Return True
    End Function

End Class
