
Partial Class sites_activity_details
    Inherits System.Web.UI.Page


    Private actID As String
    Private sID As String




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        activitydetailsmsg.Visible = False

        actID = Server.HtmlEncode(Request.QueryString("a")) 'ActivityID

        'If there is an Activity ID, look up the SiteID
        If Not IsNothing(actID) Then

            If IsNothing(sID) Then
                Try
                    Dim Data As New DAL()
                    Dim dt As DataTable = Data.getSiteIDfromActivity(actID)
                    For Each id As DataRow In dt.Rows
                        sID = id("site").ToString
                    Next
                Catch
                    msg.Text = "Site information for this location is not currently available. Please check back at a later time."
                    msg.Visible = True
                End Try
            End If

            GetActivityDetailsById(actID)
            'if there is a specific activity selected, show the activity details tab
        End If

        If Not IsNothing(sID) Then
            If Not IsNothing(actID) Then
                getSitebyId(sID)
                getActivitiesbySiteID(sID)
                siteInfo.Visible = True
            Else
                getSitebyId(sID)
                getActivitiesbySiteID(sID)
                siteInfo.Visible = False
            End If

        End If


    End Sub


    Private Function getSitebyId(ByVal sID As String) As Boolean
        Dim siteID As String = sID
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
                siteTitle.Text = Common.removeLeadingCharUnderscore(Site("Name"))
                litSiteTitle.Text = Common.removeLeadingCharUnderscore(Site("Name"))




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
                siteInfoHTML += "<tr><th Class='text-right'>&nbsp;</th><td> <a href = '/sites/sitedetails.aspx?myObjID=" & Site("id").ToString & "' role='button' Class='btn btn-primary'>View Site Details <i Class='fa fa-arrow-circle-down'></i></a></td></tr></tbody></table>"
                siteInfo.Text = siteInfoHTML
                'siteTitle.Text = siteTitleHTML
                'objTitle.Text = " <dl>" & siteInfoHTML & "</dl>"
                ' dl12 
                'If Len(Site("Postal_Code").ToString) > 0 Or Len(Site("District").ToString) > 0 Then
                '    postal_code.Text = Site("Postal_Code").ToString
                '    district.Text = Site("District").ToString
                '    dl12.Visible = True
                'End If


                'Dim reductionsHTML As String = ""
                'If Len(Site("Potential_Annual_Reductions_MT_CO2e").ToString) > 0 Or Len(Site("Actual_Annual_Reductions_MT_CO2e").ToString) > 0 Then
                '    reductionsHTML += "</dl><h2>Emissions Reductions</h2><dl  class='sitedetail'>"
                '    reductionsHTML += "<dt>Actual Annual Reductions (MTCO<sub>2</sub>e):</dt>"
                '    reductionsHTML += "<dd>" & Site("Actual_Annual_Reductions_MT_CO2e").ToString & "</dd>"
                '    reductionsHTML += "<dt>Potential Annual Reductions (MTCO<sub>2</sub>e):</dt>"
                '    reductionsHTML += "<dd>" & Site("Potential_Annual_Reductions_MT_CO2e").ToString & "</dd>"

                'End If
                'reductions.Text = reductionsHTML
                'Dim ownerHTML As String = ""
                'If Len(Site("Owner_Organization").ToString) > 0 Then
                '    ownerHTML += "</dl><h2>Owner/Operator</h2><dl  class='sitedetail'>"
                '    ownerHTML += "<dt>Owner:</dt>"
                '    If Len(Site("Owner_FirstName").ToString) > 0 And Len(Site("Owner_LastName").ToString) > 0 Then

                '        ownerHTML += "<dd>" & Site("Owner_FirstName").ToString & " " & Site("Owner_LastName").ToString & "<br>"

                '    Else
                '        ownerHTML += "<dd>"
                '    End If
                '    ownerHTML += Site("Owner_Organization").ToString & "</dd>"

                'End If


                'If Len(Site("Operator_Organization").ToString) > 0 Then
                '    ownerHTML += "<dt>Operator:</dt><dd>"
                '    If Len(Site("Operator_FirstName").ToString) > 0 And Len(Site("Operator_LastName").ToString) = 0 Then




                '        ownerHTML += Site("Operator_FirstName").ToString & " " & Site("Operator_LastName").ToString & "<br>"

                '    End If

                '    ownerHTML += Site("Operator_Organization").ToString & "</dd>"
                'End If



                'If Len(Site("Primary_FirstName").ToString) > 0 And Len(Site("Primary_LastName").ToString) > 0 Then

                '    ownerHTML += "<dt>Primary Point of Contact:</dt>"

                '    'ownerHTML += "<dd><a href='actOrgContactDetailsByContactId.aspx?sID=" + Site("Primary_ContactID").ToString + "'>"

                '    ownerHTML += "<dd>" & Site("Primary_FirstName").ToString & " " & Site("Primary_LastName").ToString + "</dd>"
                'End If
                'ownership.Text = ownerHTML


                '// LANDFILL DATA
                '      If Site("sector").ToString = "MSW" Then
                'Dim landfilldata As New DAL()
                'Dim MSWdt As DataTable = data.getSiteLandfillDataByID(siteID)
                'If MSWdt Is Nothing Then
                '    msg.Text = "The site landfill information is not available."
                '    msg.Visible = True

                'Else
                '    For Each msw As DataRow In MSWdt.Rows
                '        Dim landfillinfoHTML As String = ""
                '        If Not IsDBNull(msw("Waste_Generated_Annually")) Then
                '            landfillinfoHTML += "<dt>Waste Generated Annually:</dt>"
                '            landfillinfoHTML += "<dd>" & msw("Waste_Generated_Annually").ToString & msw("Waste_Generated_Annually_Units").ToString & "</dd>"
                '        End If
                '        'landfillInfoHTML += "<dt>Waste Generated Annually Units:</dt>"
                '        'landfillinfoHTML += "<dd>" & msw("Waste_Generated_Annually_Units").ToString & "</dd>"
                '        If Not IsDBNull(msw("Waste_Collected_Daily")) Then
                '            landfillinfoHTML += "<dt>Waste Collected Daily:</dt>"
                '            landfillinfoHTML += "<dd>" & FormatNumber(msw("Waste_Collected_Daily"), 2, , , TriState.True) & " " & msw("Waste_Collected_Daily_Units").ToString & "</dd>"
                '        End If
                '        'If Not IsDBNull(msw("Waste_Collected_Per_Capita")) Then
                '        '    landfillinfoHTML += "<dt>Waste Collected Per Capita:</dt>"
                '        '    landfillinfoHTML += "<dd>" & FormatNumber(msw("Waste_Collected_Per_Capita"), 2, , , TriState.True) & " " & msw("Waste_Collected_Per_Capita_Units").ToString & "</dd>"
                '        'End If
                '        'landfillInfoHTML += "<dt>Waste Collected Daily Units:</dt>"
                '        'landfillinfoHTML += "<dd>"  "</dd>"
                '        If Not IsDBNull(msw("Waste_Generated_Per_Capita")) Then
                '            landfillinfoHTML += "<dt>Waste Generated (kg/person/day):</dt>"
                '            landfillinfoHTML += "<dd>" & msw("Waste_Generated_Per_Capita").ToString & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Local_Agreement")) Then
                '            landfillinfoHTML += "<dt>Local Agreement:</dt>"
                '            landfillinfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Local_Agreement").ToString) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Regulatory_Framework")) Then
                '            landfillinfoHTML += "<dt>Regulatory Framework:</dt>"
                '            landfillinfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Regulatory_Framework").ToString) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Framework_Description")) Then
                '            landfillinfoHTML += "<dt>Framework Description:</dt>"
                '            landfillinfoHTML += "<dd>" & msw("Framework_Description").ToString & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Carbon_Credits")) Then
                '            landfillinfoHTML += "<dt>Carbon Credits Contracted:</dt>"
                '            landfillinfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Carbon_Credits").ToString) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Investor_Cooperation")) Then
                '            landfillinfoHTML += "<dt>Investor Cooperation:</dt>"
                '            landfillinfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Investor_Cooperation").ToString) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Carbon_Credits_Contracted")) Then
                '            landfillinfoHTML += "<dt>Carbon Credits Contracted:</dt>"
                '            landfillinfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Carbon_Credits_Contracted").ToString) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Partnership")) Then
                '            landfillinfoHTML += "<dt>Partnership:</dt>"
                '            landfillinfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Partnership").ToString) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Technical_Assistance")) Then
                '            landfillinfoHTML += "<dt>Technical Assistance:</dt>"
                '            landfillinfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Technical_Assistance").ToString) & "</dd>"
                '        End If
                '        If Len(landfillinfoHTML) > 584 Then
                '            landfillInfo.Text = "</dl><h2>Landfill Information</h2><dl  class='sitedetail'>" & landfillinfoHTML
                '            landfillInfo.Visible = True
                '        Else
                '            landfillInfo.Visible = False
                '        End If

                'Dim physicalInfoHTML As String = ""
                '        physicalInfoHTML += "</dl><h2>Physical Data</h2><dl  class='sitedetail'>"

                '        If Not IsDBNull(msw("Landfill_Type")) Then
                '            physicalInfoHTML += "<dt>Landfill Type:</dt>"
                '            physicalInfoHTML += "<dd>" & msw("Landfill_Type").ToString & "</dd>"
                '        End If

                '        If Not IsDBNull(msw("Landfill_Size_Designed")) Then
                '            physicalInfoHTML += "<dt>Landfill Size (Designed, Hectares):</dt>"
                '            physicalInfoHTML += "<dd>" & FormatNumber(msw("Landfill_Size_Designed"), 2, , , TriState.True) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Landfill_Size_Current")) Then
                '            physicalInfoHTML += "<dt>Landfill Size (Current, Hectares):</dt>"
                '            physicalInfoHTML += "<dd>" & FormatNumber(msw("Landfill_Size_Current"), 2, , , TriState.True) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Waste_in_Place")) Then
                '            physicalInfoHTML += "<dt>Waste in Place:</dt>"
                '            physicalInfoHTML += "<dd>" & FormatNumber(msw("Waste_in_Place"), 2, , , TriState.True) & " " & msw("Waste_in_Place_Units").ToString & "</dd>"
                '        End If
                '        'physicalInfoHTML += "<dt>Waste in Place Units:</dt>"
                '        'physicalInfoHTML += "<dd>" & msw("Waste_in_Place_Units").ToString & "</dd>"
                '        If Not IsDBNull(msw("Designed_Capacity")) Then
                '            physicalInfoHTML += "<dt>Designed Capacity:</dt>"
                '            physicalInfoHTML += "<dd>" & msw("Designed_Capacity").ToString & " " & msw("Designed_Capacity_Units").ToString & "</dd>"
                '        End If
                '        'physicalInfoHTML += "<dt>Designed Capacity Units:</dt>"
                '        'physicalInfoHTML += "<dd>" & msw("Designed_Capacity_Units").ToString & "</dd>"
                '        If Not IsDBNull(msw("Waste_Accepted_Annually")) Then
                '            physicalInfoHTML += "<dt>Waste Accepted Annually:</dt>"
                '            physicalInfoHTML += "<dd>" & msw("Waste_Accepted_Annually").ToString & " " & msw("Waste_Accepted_Annually_Units").ToString & "</dd>"
                '        End If
                '        'physicalInfoHTML += "<dt>Waste Accepted Annually Units:</dt>"
                '        'physicalInfoHTML += "<dd>" & msw("Waste_Accepted_Annually_Units").ToString & "</dd>"

                '        If Not IsDBNull(msw("Waste_Depth")) Then
                '            physicalInfoHTML += "<dt>Waste Depth (Meters):</dt>"
                '            physicalInfoHTML += "<dd>" & msw("Waste_Depth").ToString & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Filling_Begin_Year")) Then
                '            physicalInfoHTML += "<dt>Filling Dates:</dt>"
                '            physicalInfoHTML += "<dd>" & msw("Filling_Begin_Year").ToString & " - " & msw("Filling_End_Year").ToString & "</dd>"
                '        End If

                '        'physicalInfoHTML += "<dt>Filling End Year:</dt>"
                '        'physicalInfoHTML += "</dd>"



                '        '.rgba-primary-0 { color: rgba( 48,145,192,1) }	/* Main Primary color */
                '        '.rgba-primary-1 { color: rgba(125,192,224,1) }
                '        '.rgba-primary-2 { color: rgba( 81,166,207,1) }
                '        '.rgba-primary-3 { color: rgba( 14,126,180,1) }
                '        '.rgba-primary-4 { color: rgba(  6, 94,136,1) }


                'If Not IsDBNull(msw("Percent_Industrial")) And Not IsDBNull(msw("Percent_Unknown_Source")) Then
                '            physicalInfoHTML += "<dt>Waste Sources:</dt>"
                '            physicalInfoHTML += "<dd><canvas id='physicalData' style='height:60%;width:60%;'></canvas></dd>"
                '            physicalInfoHTML += "<script>"
                '            physicalInfoHTML += "new Chart(document.getElementById('physicalData'), {type: 'pie', data: {"
                '            physicalInfoHTML += "labels: ['Municipal', 'Industrial', 'Inert', 'Unknown']"
                '            physicalInfoHTML += ", datasets: [{ data: ["
                '            physicalInfoHTML += msw("Percent_Municipal").ToString & "," & msw("Percent_Industrial").ToString & "," & msw("Percent_Inert").ToString & "," & msw("Percent_Unknown_Source").ToString & "]"
                '            physicalInfoHTML += ", label: 'Waste Source (Percentage, of " & msw("Waste_Source_Percentage_Basis").ToString & "', fill: true, borderColor: '#666666',backgroundColor: [  'rgba( 48,145,192,1)',  'rgba(125,192,224,1)',  'rgba( 81,166,207,1)',  'rgba( 14,126,180,1)']}"
                '            physicalInfoHTML += "]},options: {title: {display:true, text: 'Waste Source (Percentage, of " & msw("Waste_Source_Percentage_Basis").ToString & ")'} }"
                '            physicalInfoHTML += "});"
                '            physicalInfoHTML += "</script>"
                '        End If
                '        If Not IsDBNull(msw("Evidence_of_Fires")) Then
                '            physicalInfoHTML += "<dt>Evidence of Fires:</dt>"
                '            physicalInfoHTML += "<dd>" & Common.getImageForCheckbox(msw("Evidence_of_Fires").ToString) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Annual_Rainfall")) Then
                '            physicalInfoHTML += "<dt>Annual Rainfall (cm):</dt>"
                '            physicalInfoHTML += "<dd>" & msw("Annual_Rainfall").ToString & "</dd>"
                '        End If

                '        physicalInfoHTML += "<dt>Average Temperature (Celsius):</dt>"
                '        physicalInfoHTML += "<dd>" & msw("Average_Temperature").ToString & "</dd>"

                '        If Len(physicalInfoHTML) > 292 Then
                '            physicalInfo.Text = physicalInfoHTML
                '            physicalInfo.Visible = True
                '        Else
                '            physicalInfo.Visible = False
                '        End If

                'Dim gascollectionHTML As String = ""
                '        If Not IsDBNull(msw("Gas_Collection_System")) Then

                '            gascollectionHTML += "<dt>Gas Collection System:</dt>"
                '            gascollectionHTML += "<dd>" & Common.getImageForCheckbox(msw("Gas_Collection_System").ToString) & "</dd>"
                '            gascollectionHTML += "<dt>Type of Venting:</dt>"
                '            gascollectionHTML += "<dd>" & msw("Type_of_Venting").ToString & "</dd>"
                '            gascollectionHTML += "<dt>Number (and Description) of Wells:</dt>"
                '            gascollectionHTML += "<dd>" & msw("Number_of_Wells").ToString & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Average_Depth_of_Wells")) Then
                '            gascollectionHTML += "<dt>Average Depth of Wells (Meters):</dt>"
                '            gascollectionHTML += "<dd>" & FormatNumber(msw("Average_Depth_of_Wells"), 2, , , TriState.True) & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Gas_Flow_Rate_Measured")) Then
                '            gascollectionHTML += "<dt>Gas Flow Rate Measured:</dt>"
                '            gascollectionHTML += "<dd>" & FormatNumber(msw("Gas_Flow_Rate_Measured"), 2, , , TriState.True) & "" & msw("Gas_Flow_Rate_Units").ToString & "</dd>"
                '        End If
                '        If Not IsDBNull(msw("Methane_Content_Measured")) Then
                '            gascollectionHTML += "<dt>Methane Content Measured:</dt>"
                '            gascollectionHTML += "<dd>" & FormatNumber(msw("Methane_Content_Measured"), 2, , , TriState.True) & "%</dd>"
                '        End If
                '        If Len(gascollectionHTML) > 171 Then
                '            gasCollectionInfo.Text = "</dl><h2>Gas Collection System Data</h2><dl  class='sitedetail'>" & gascollectionHTML
                '            gasCollectionInfo.Visible = True
                '        Else
                '            gasCollectionInfo.Visible = False
                '        End If


                'Dim wastecharacteristicsHTML As String = ""
                '        Dim datalabels As String = ""
                '        Dim datastr As String = ""
                '        Dim colorstr As String = ""


                '        If Not IsDBNull(msw("Percent_Food_Waste")) Then
                '            datalabels += "'Food Waste', "
                '            datastr += msw("Percent_Food_Waste") & ", "
                '            colorstr += "'rgba( 48,145,192,1)',"
                '        End If


                '        If Not IsDBNull(msw("Percent_Garden_Waste")) Then
                '            datalabels += "'Garden Waste', "
                '            datastr += msw("Percent_Garden_Waste") & ", "
                '            colorstr += "  'rgba(125,192,224,1)',"
                '        End If


                '        If Not IsDBNull(msw("Percent_Wood")) Then
                '            datalabels += "'Wood Waste', "
                '            datastr += msw("Percent_Wood") & ", "
                '            colorstr += "  'rgba( 81,166,207,1)',"

                '        End If


                '        If Not IsDBNull(msw("Percent_Paper_and_Textiles")) Then
                '            datalabels += "'Paper/Textile Waste', "
                '            datastr += msw("Percent_Paper_and_Textiles") & ", "
                '            colorstr += "  'rgba( 14,126,180,1)', "

                '        End If

                '        If Not IsDBNull(msw("Percent_Inert_Waste")) Then
                '            datalabels += "'Inert Waste', "
                '            datastr += msw("Percent_Inert_Waste") & ", "
                '            colorstr += "'rgba(  6, 94,136,1)',"
                '        End If


                '        If Not IsDBNull(msw("Percent_Unknown_Characteristic")) Then
                '            datalabels += "'Unknown' "
                '            datastr += msw("Percent_Unknown_Characteristic") & ", "
                '            colorstr += " 'rgba( 48,145,192,.5)'"



                '        End If

                '        If Len(datalabels) > 10 Then
                '            wastecharacteristicsHTML += "<dt>Waste Characteristics:</dt>"
                '            wastecharacteristicsHTML += "<dd><canvas id='wasteData' style='height:60%;width:60%;'></canvas></dd>"
                '            wastecharacteristicsHTML += "<script>"
                '            wastecharacteristicsHTML += "new Chart(document.getElementById('wasteData'), {type: 'pie', data: {"
                '            wastecharacteristicsHTML += "labels: [" & datalabels & "]"
                '            wastecharacteristicsHTML += ", datasets: [{ data: ["
                '            wastecharacteristicsHTML += datastr & "]"
                '            wastecharacteristicsHTML += ", label: 'Waste Characteristics (Percentage, of " & msw("Waste_Characteristics_Percentage_Basis").ToString & "', fill: true, borderColor: '#666666',backgroundColor: [ " & colorstr & "]}"
                '            wastecharacteristicsHTML += "]},options: {title: {display:true, text: 'Waste Characteristics (Percentage, of " & msw("Waste_Characteristics_Percentage_Basis").ToString & ")'} }"
                '            wastecharacteristicsHTML += "});"
                '            wastecharacteristicsHTML += "</script>"
                '        End If


                '        If Not IsDBNull(msw("Leachate_Collected")) Then
                '            wastecharacteristicsHTML += "<dt>Leachate Collected:</dt>"
                '            wastecharacteristicsHTML += "<dd>" & FormatNumber(msw("Leachate_Collected"), 2, , , TriState.True) & "</dd>"
                '        End If
                '        wastecharacteristicsHTML += "<dt>Leachate Accumulating:</dt>"
                '        wastecharacteristicsHTML += "<dd>" & Common.getImageForCheckbox(msw("Leachate_Accumulating").ToString) & "</dd>"
                '        wastecharacteristicsHTML += "<dt>Leachate Drained:</dt>"
                '        wastecharacteristicsHTML += "<dd>" & Common.getImageForCheckbox(msw("Leachate_Drained").ToString) & "</dd>"

                '        If Len(wastecharacteristicsHTML) > 225 Then
                '            wastecharacteristicsHTML = "</dl><h2> Waste Characteristics</h2><dl  class='sitedetail'>" + wastecharacteristicsHTML
                '            wastecharacteristicsInfo.Text = wastecharacteristicsHTML
                '            wastecharacteristicsInfo.Visible = True
                '        Else
                '            wastecharacteristicsInfo.Visible = False
                '        End If


                'Dim operationsHTML As String = ""

                '        operationsHTML += "<dt>Daily Cover:</dt>"
                '        operationsHTML += "<dd>" & Common.getImageForCheckbox(msw("Daily_Cover").ToString) & "</dd>"
                '        operationsHTML += "<dt>Capped:</dt>"
                '        operationsHTML += "<dd>" & Common.getImageForCheckbox(msw("Capped").ToString) & "</dd>"
                '        operationsHTML += "<dt>Capped Using:</dt>"
                '        operationsHTML += "<dd>" & msw("Capped_Using").ToString & "</dd>"
                '        operationsHTML += "<dt>Capped Other Details:</dt>"
                '        operationsHTML += "<dd>" & msw("Capped_Other_Details").ToString & "</dd>"
                '        operationsHTML += "<dt>Liner:</dt>"
                '        operationsHTML += "<dd>" & Common.getImageForCheckbox(msw("Liner").ToString) & "</dd>"
                '        operationsHTML += "<dt>Lined Using:</dt>"
                '        operationsHTML += "<dd>" & msw("Lined_Using").ToString & "</dd>"
                '        operationsHTML += "<dt>Lined Other Details:</dt>"
                '        operationsHTML += "<dd>" & msw("Lined_Other_Details").ToString & "</dd>"
                '        operationsHTML += "<dt>Waste Compaction:</dt>"
                '        operationsHTML += "<dd>" & Common.getImageForCheckbox(msw("Waste_Compaction").ToString) & "</dd>"
                '        operationsHTML += "<dt>Filling Process:</dt>"
                '        operationsHTML += "<dd>" & msw("Filling_Process").ToString & "</dd>"
                '        operationsHTML += "<dt>Waste Picking and Recycling Activities:</dt>"
                '        operationsHTML += "<dd>" & msw("Waste_Picking_and_Recycling_Activities").ToString & "</dd>"
                '        operationsHTML += "<dt>Security &amp; Access:</dt>"
                '        operationsHTML += "<dd>" & msw("Security_Access").ToString & "</dd>"

                '        If Len(operationsHTML) > 590 Then
                '            operationsHTML = "</dl><h2>Operations Data</h2><dl  class='sitedetail'>" + operationsHTML
                '            operationsInfo.Text = operationsHTML
                '            operationsInfo.Visible = True
                '        Else
                '            operationsInfo.Visible = False
                '        End If


                'Dim additionalHTML As String = ""

                '        If Not IsNothing(msw("Date_of_Data_Collection")) Then
                '            additionalHTML += "<dt>Date of Data Collection:</dt>"
                '            additionalHTML += "<dd>" & msw("Date_of_Data_Collection").ToString & "</dd>"
                '        End If
                '        'additionalHTML += "<dt>Form Completed By:</dt>"
                '        'additionalHTML += "<dd>" & Site("Form_Completed_By").ToString & "<br>"
                '        additionalHTML += "<dt>Organization:</dt><dd>" & msw("Organization").ToString & "</dd>"
                '        If Not IsDBNull(msw("Additional_Comments")) Then
                '            additionalHTML += "<dt>Additional Comments:</dt>"
                '            additionalHTML += "<dd>" & msw("Additional_Comments").ToString & "</dd>"
                '        End If
                '        If Len(additionalHTML) > 10 Then
                '            additionalHTML = "</dl><h2>Additional Information</h2><dl  class='sitedetail'>" + additionalHTML
                '            additionalInfo.Text = additionalHTML
                '            additionalInfo.Visible = True

                '        Else
                '            additionalInfo.Visible = False
                '        End If














                'Next

                '            'landfillDetails.Visible = True
                '        End If
                '    ElseIf Site("sector").ToString = "Coal Mines" Then
                ''// COAL DATA

                'Dim coalInfoHTML As String = ""

                'If Not IsDBNull(Site("Installed_Drainage_System")) Then
                '    coalInfoHTML += "<dt>Installed Drainage System:</dt><dd>" & Site("Installed_Drainage_System").ToString & "</dd>"
                'End If
                'If Not IsDBNull(Site("Type_of_Coal")) Then
                '    coalInfoHTML += "<dt>Type of Coal:</dt><dd>" & Site("Type_of_Coal").ToString & "</dd>"
                'End If
                'If Not IsDBNull(Site("Mining_Method")) Then
                '    coalInfoHTML += "<dt>Mining Method:</dt><dd>" & Site("Mining_Method").ToString & "</dd>"
                'End If
                'If Len(coalInfoHTML) > 10 Then
                '    coalInfoHTML = "</dl><h2>Coal Mine Characteristics</h2><dl  class='sitedetail'>" + coalInfoHTML
                '    coalInfo.Visible = True
                '    coalInfo.Text = coalInfoHTML
                'Else
                '    coalInfo.Visible = True
                'End If



                'ElseIf Site("sector").ToString = "Agriculture" Then
                '    '// AG DATA
                '    Dim farmInfoHTML As String = ""
                '    If Not IsDBNull(Site("farm_type")) Then
                '        farmInfoHTML += "</dl><h2>Farm Type</h2><dl  class='sitedetail'>"
                '        farmInfoHTML += "<dt>Farm Type:</dt><dd>" & Site("farm_type").ToString & "</dd>"
                '        farmInfo.Text = farmInfoHTML
                '        farmInfo.Visible = True
                '    End If
                'ElseIf Site("sector").ToString = "AgSTAR Domestic" Then
                '    '// Placeholder
                'ElseIf Site("sector").ToString = "Oil & Gas" Then
                '    '// Placeholder
                'ElseIf Site("sector").ToString = "Wastewater" Then
                '    '// Placeholder
                'End If
            Next
        End If



        ''attachment
        'Dim qr2 As sforce.QueryResult
        'Dim strQuery2 As String = ""
        'Dim attachmentStr As String
        'attachmentStr = ""

        'strQuery2 = "select id, name, parentid  from attachment " & _
        '            " WHERE parentid ='" & sID & "' order by name"

        ''Response.Write(strQuery2)
        'qr2 = binding.query(strQuery2)

        'If qr2.records Is Nothing Then
        'Else
        '    For i As Integer = 0 To qr2.records.GetUpperBound(0)
        '        Dim myObj2 As sforce.Attachment = CType(qr2.records(i), sforce.Attachment)

        '        Dim fileUrl As String
        '        fileUrl = "<a href='attachmentDownload.aspx?sID=" + myObj2.Id + "'>" + myObj2.Name + "</a>"
        '        attachmentStr = attachmentStr + fileUrl + "<br/>"
        '    Next
        'End If

        ''new 2013
        ''large attachments
        'strQuery2 = "Select c.Id, c.FileType, c.CreatedDate, c.Activity__r.Name, c.Activity__c, c.Title  From ContentVersion c " & _
        '            " WHERE c.Site__c ='" & sID & "' order by c.Title"

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
        '            fileUrl = "<a href=""docDownload.aspx?sID=" & myId & """>" & myObj2.Title & "</a>"
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
            activityListHTML += "<thead><tr><th class='namecol'>Name</th><th >Type</th><th   class='linkcol'>&nbsp;</th></tr></thead><tbody>" + myRowText
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
        '                fileUrl = "<a href='attachmentDownload.aspx?sID=" + myObj2.Id + "'>" + myObj2.Name + "</a>"
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
        '                fileUrl = "<a href=""docDownload.aspx?sID=" & myId & """>" & myObj2.Title & "</a>"
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

    Friend Function GetActivityDetailsById(ByVal activityID As String) As Boolean
        Dim data As New DAL()
        Dim dt As DataTable = data.GetActivityDetailsByID(activityID)


        'activityDetailstab.Visible = True
        't3.Visible = True

        If Not dt Is Nothing Then
            For Each Activity As DataRow In dt.Rows

                '//////////////////////NEW CODE://////////////////////////////
                objTitle.Text = Common.removeLeadingCharUnderscore(Activity("Name").ToString)
                Session("actname") = Activity("Name").ToString
                Session("actId") = sID

                Dim activityInfoHTML As String = ""




                activityInfoHTML += "<h3 class='py-3'>General Activity Infomation</h3><table id='detail1' class='table'><tbody>"




                activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Sectors:</td><td>" & Activity("sectors").ToString & "</td></tr>"
                activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Activity Type:</td><td>" & Activity("RecordType").ToString & ": "
                If Activity("Sub_Category").ToString = Activity("RecordType").ToString Then
                    activityInfoHTML += Activity("RecordType").ToString & "</td></tr>"
                Else
                    activityInfoHTML += Activity("Sub_Category").ToString & "</td></tr>"
                End If
                activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Status:</td><td>" & Activity("status").ToString & "</td></tr>"
                activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>GMI Funded:</td><td>" & Activity("gmi_funded").ToString & "</td></tr>"
                activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Description:</td><td>" & Activity("description").ToString & "</td></tr>"

                Dim partnerlist As String = ""
                Try
                    Dim activityPartners As New DAL()
                    Dim partnersDT As DataTable = data.getActivityPartnersbyID(actID)

                    If Not partnersDT Is Nothing Then

                        For Each row As DataRow In partnersDT.Rows
                            partnerlist = partnerlist & row("Name").ToString & ", "
                        Next

                        If partnerlist <> "" Then
                            partnerlist = partnerlist.Trim().Remove(partnerlist.Length - 2)
                        End If
                    End If
                Catch
                    partnerlist = "None"

                End Try


                If Len(partnerlist) > 1 Then
                    activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Partners:</td><td>" & partnerlist & "</td></tr>"
                End If
                activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Activity Year(s):</td><td>" & Activity("start_year").ToString
                If Not Activity("start_year").ToString = Activity("end_year").ToString And Not IsNothing(Activity("end_year")) Then
                    activityInfoHTML += "-" & Activity("end_year").ToString & "</td></tr>"
                Else
                    activityInfoHTML += "</td></tr>"
                End If
                If Not Activity("Sectors").Contains("Coal Mines") Then
                    activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Project Lifetime:</td><td>" & Activity("project_lifetime_years").ToString & "</td></tr>"
                End If
                If Not Activity("project_end_use_type").ToString = "" Then
                    activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Project End Use Type:</td><td>" & Activity("project_end_use_type").ToString & "</td></tr>"
                End If
                If Not Activity("project_use_details").ToString = "" Then
                    activityInfoHTML += "<tr><td  class='gmi-light-blue-cell text-right w-25'>Project Use Details:</td><td>" & Activity("project_use_details").ToString & "</td></tr>"
                End If


                If Len(activityInfoHTML) > 10 Then
                    activityInfo.Text = activityInfoHTML
                    activityInfo.Visible = True
                Else
                    activityInfo.Visible = False
                End If






                'Dim GasEnergyHTML As String = ""
                'Dim gascheck As Integer = 0
                'If Not IsDBNull(Activity("Gas_Flow_to_Project")) Then
                '    gascheck += Activity("Gas_Flow_to_Project")
                'End If
                'If Not IsDBNull(Activity("Rated_Capacity")) Then

                '    gascheck += Activity("Rated_Capacity")
                'End If
                'If Not IsDBNull(Activity("Energy_Created_from_Gas")) Then
                '    gascheck += Activity("Energy_Created_from_Gas")
                'End If

                'If gascheck > 0 Then
                '    GasEnergyHTML += "<dt class='title'><h3>Gas &amp; Energy Information</h3></dt>"
                '    If IsNumeric(Activity("Gas_Flow_to_Project")) Then
                '        GasEnergyHTML += "<dt>Gas Flow to Project:</dt><dd>" & FormatNumber(Activity("Gas_Flow_to_Project"), 2, , , TriState.True) & " "
                '    End If
                '    If Activity("gas_flow_units").ToString = "Other" Then
                '        GasEnergyHTML += Activity("gas_flow_units_other").ToString
                '    Else
                '        GasEnergyHTML += Activity("gas_flow_units").ToString
                '    End If
                '    GasEnergyHTML += "</dd>"
                '    If IsNumeric(Activity("Rated_Capacity")) Then
                '        GasEnergyHTML += "<dt>Rated Capacity of Equipment:</dt><dd>" & FormatNumber(Activity("Rated_Capacity"), 2, , , TriState.True)
                '        If Activity("rated_capacity_units").ToString = "Other" Then
                '            GasEnergyHTML += " " & Activity("rated_capacity_units_other").ToString & "</dd>"

                '        Else
                '            GasEnergyHTML += " " & Activity("rated_capacity_units").ToString & "</dd>"
                '        End If
                '    End If

                '    If IsNumeric(Activity("Energy_Created_from_Gas")) Then
                '        GasEnergyHTML += "<dt>Energy Created from Gas:</dt><dd>" & FormatNumber(Activity("Energy_Created_from_Gas"), 2, , , TriState.True) & " "
                '        If Activity("energy_created_units").ToString = "Other" Then
                '            GasEnergyHTML += Activity("energy_created_units_other").ToString & "</dd>"
                '        Else
                '            GasEnergyHTML += Activity("energy_created_units").ToString & "</dd>"
                '        End If
                '    End If
                '    If Len(GasEnergyHTML) > 10 Then
                '        GasEnergyInfo.Text = GasEnergyHTML
                '        GasEnergyInfo.Visible = True
                '    Else
                '        GasEnergyInfo.Visible = False
                '    End If




                'End If 'gascheck
                'If Activity("Sectors").Contains("Agriculture") Then

                '    Dim agdata As New DAL()
                '    Dim agdt As DataTable = data.GetAgActivityDetailsByID(activityID)

                '    If Not agdt Is Nothing Then
                '        For Each agActivity As DataRow In agdt.Rows

                '            Dim Dairy_CattleInfoHTML As String = ""
                '            Dairy_CattleInfoHTML += "<dt>Dairy - Lactating:</dt><dd>" & agActivity("animals_dairy_lactating").ToString & "</dd>"
                '            Dairy_CattleInfoHTML += "<dt>Dairy - Dry:</dt><dd>" & agActivity("animals_dairy_dry").ToString & "</dd>"
                '            Dairy_CattleInfoHTML += "<dt>Dairy - Heifer:</dt><dd>" & agActivity("animals_dairy_heifer").ToString & "</dd>"
                '            Dairy_CattleInfoHTML += "<dt>Cattle:</dt><dd>" & agActivity("animals_cattle").ToString & "</dd>"

                '            If Len(Dairy_CattleInfoHTML) > 150 Then
                '                Dairy_CattleInfoHTML = "<dt class='title'><h3>Agriculture Information</h3><h4>Dairy/Cattle</h4></dt>" + Dairy_CattleInfoHTML
                '                Dairy_CattleInfo.Text = Dairy_CattleInfoHTML
                '                Dairy_CattleInfo.Visible = True
                '            Else
                '                Dairy_CattleInfo.Visible = False
                '            End If


                '            Dim SwineInfoHTML As String = ""

                '            Dim swine_nursery As Integer = 0
                '            If Not IsDBNull(agActivity("Animals_Swine_Wean_to_Feed_Nursery")) Then
                '                swine_nursery += agActivity("Animals_Swine_Wean_to_Feed_Nursery")
                '            End If
                '            If Not IsDBNull(agActivity("Animals_Swine_Farrow_to_Wean")) Then
                '                swine_nursery += agActivity("Animals_Swine_Farrow_to_Wean")
                '            End If
                '            SwineInfoHTML += "<dt>Swine - Nursery Pigs:</dt><dd>" & swine_nursery.ToString & "</dd>"
                '            SwineInfoHTML += "<dt>Swine - Sows:</dt><dd>" & agActivity("Animals_Swine_Sows").ToString & "</dd>"
                '            SwineInfoHTML += "<dt>Swine - Boars:</dt><dd>" & agActivity("animals_swine_boars").ToString & "</dd>"
                '            SwineInfoHTML += "<dt>Swine - Growers:</dt><dd>" & agActivity("Animals_Swine_Feed_to_Finish_Grower").ToString & "</dd>"
                '            SwineInfoHTML += "<dt>Swine - Total:</dt><dd>" & agActivity("Animals_Swine_Total").ToString & "</dd>"
                '            If Len(SwineInfoHTML) > 180 Then
                '                SwineInfoHTML = "<dt class='title'><h4>Swine</h4></dt>" + SwineInfoHTML
                '                SwineInfo.Text = SwineInfoHTML
                '                SwineInfo.Visible = True
                '            Else
                '                SwineInfo.Visible = False
                '            End If


                '            Dim PoultryInfoHTML As String = ""
                '            PoultryInfoHTML += "<dt>Poultry:</dt><dd>" & agActivity("animals_poultry").ToString & "</dd>"
                '            If Len(PoultryInfoHTML) > 40 Then
                '                PoultryInfoHTML = "<dt class='title'><h4>Poultry</h4></dt>" + PoultryInfoHTML
                '                PoultryInfo.Text = PoultryInfoHTML
                '                PoultryInfo.Visible = True
                '            Else
                '                PoultryInfo.Visible = False
                '            End If



                '            Dim OtherInfoHTML As String = ""
                '            If Not IsDBNull(agActivity("animals_other_type")) Then
                '                OtherInfoHTML += "<dt class='title'><h4>" & agActivity("animals_other_type").ToString & "</h4></dt>"
                '                OtherInfoHTML += "<dt>Number:</dt><dd>" & agActivity("animals_other").ToString & "</dd>"
                '            End If

                '            OtherInfoHTML += "<dt class='title'><h3>Additional Information</h3></dt>"
                '            If Not agActivity("Animals_Design_vs_Actual").ToString = "" Then
                '                OtherInfoHTML += "<dt>Animals: Design vs. Actual:</dt><dd>" & agActivity("Animals_Design_vs_Actual").ToString & "</dd>"
                '            End If
                '            If Not agActivity("animals_notes").ToString = "" Then
                '                OtherInfoHTML += "<dt>Notes:</dt><dd>" & agActivity("animals_notes").ToString & "</dd>"
                '            End If

                '            If Len(OtherInfoHTML) > 54 Then

                '                OtherInfo.Text = OtherInfoHTML
                '                OtherInfo.Visible = True
                '            Else
                '                OtherInfo.Visible = False
                '            End If




                '            Dim AdditionalInfoHTML As String = ""


                '            'AdditionalInfoHTML += "<dt>PreDigestionDetails:</dt><dd>" & agActivity("Pre-Digestion Details").ToString & "</dd>"
                '            If Not agActivity("predigestion_baseline_waste_storage_system").ToString = "" Then
                '                AdditionalInfoHTML += "<dt>Baseline Waste Storage System:</dt><dd>" & agActivity("predigestion_baseline_waste_storage_system").ToString & "</dd>"
                '            End If
                '            If Not agActivity("predigestion_manure_collection_process").ToString = "" Then
                '                AdditionalInfoHTML += "<dt>Manure Collection Process:</dt><dd>" & agActivity("predigestion_manure_collection_process").ToString & "</dd>"
                '            End If
                '            If Not agActivity("predigestion_pretreatment_tanks").ToString = "" Then
                '                AdditionalInfoHTML += "<dt>Pretreatment Tanks:</dt><dd>" & agActivity("predigestion_pretreatment_tanks").ToString & "</dd>"
                '            End If
                '            If Not agActivity("predigestion_pretreatment_solids_separation").ToString = "" Then
                '                AdditionalInfoHTML += "<dt>Pretreatment Solids Separation:</dt><dd>" & agActivity("predigestion_pretreatment_solids_separation").ToString & "</dd>"
                '            End If
                '            If Not agActivity("predigestion_pretreatment_solids_separation_method").ToString = "" Then
                '                AdditionalInfoHTML += "<dt>Pretreatment Solids Separation Method:</dt><dd>" & agActivity("predigestion_pretreatment_solids_separation_method").ToString & "</dd>"
                '            End If

                '            If Len(AdditionalInfoHTML) > 112 Then
                '                AdditionalInfoHTML = "<dt class='title'><h3>Predigestion and Pretreatment</h3></dt>" + AdditionalInfoHTML
                '                AdditionalAgInfo.Text = AdditionalInfoHTML
                '                AdditionalAgInfo.Visible = True
                '            Else
                '                AdditionalAgInfo.Visible = False
                '            End If



                '            Dim DigesterInfoHTML As String = ""


                '            DigesterInfoHTML += "<dt>Digester Type:</dt><dd>" & agActivity("digester_type").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Other Type:</dt><dd>" & agActivity("digester_other_type").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>HRT (days):</dt><dd>" & agActivity("digester_hrt_days").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>HRT: Design vs. Actual:</dt><dd>" & agActivity("digester_hrt_design_actual").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>SRT (days):</dt><dd>" & agActivity("digester_srt_days").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>SRT: Design vs. Actual:</dt><dd>" & agActivity("digester_srt_design_actual").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Digester Mix Tank:</dt><dd>" & agActivity("digester_mix_tank").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Digester Operating Volume (m<sup>3</sup>):</dt><dd>" & agActivity("digester_operating_volume").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Post-Treatment Solids Separation:</dt><dd>" & agActivity("digester_post_treatment_solids_separation").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Effluent:</dt><dd>" & agActivity("digester_effluent").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Digester Heating:</dt><dd>" & agActivity("digester_heating").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Digester Materials:</dt><dd>" & agActivity("digester_materials").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Other Material Type:</dt><dd>" & agActivity("digester_other_material_type").ToString & "</dd>"
                '            DigesterInfoHTML += "<dt>Other Gas Storage Type:</dt><dd>" & agActivity("digester_other_gas_storage_type").ToString & "</dd>"
                '            If Len(DigesterInfoHTML) > 550 Then
                '                DigesterInfoHTML = "<dt class='title'><h3>Digester Properties</h3></dt>" & DigesterInfoHTML
                '                DigesterInfo.Text = DigesterInfoHTML
                '                DigesterInfo.Visible = True
                '            Else
                '                DigesterInfo.Visible = False
                '            End If


                '            Dim BiogasInfoHTML As String = ""
                '            BiogasInfoHTML += "<dt>Biogas Production (ft<sup>3</sup>/day):</dt><dd>" & agActivity("biogas_production").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Biogas: Design vs. Actual:</dt><dd>" & agActivity("Biogas_Design_vs_Actual").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Biogas Use:</dt><dd>" & agActivity("biogas_use").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Generator Set Type:</dt><dd>" & agActivity("biogas_generator_set_type").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Generator Set Size (kW):</dt><dd>" & agActivity("biogas_generator_set_size").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Generator Set Output (kW):</dt><dd>" & agActivity("biogas_generator_set_output").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Generator Set Output: Design vs. Actual:</dt><dd>" & agActivity("biogas_generator_set_output_design_actual").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Boiler/Furnace Size (Btu/hr):</dt><dd>" & agActivity("biogas_boiler_furnace_size").ToString & "</dd>"
                '            BiogasInfoHTML += "<dt>Boiler/Furnace Size: Design vs. Actual:</dt><dd>" & agActivity("biogas_boiler_furnace_design_actual").ToString & "</dd>"
                '            If Len(BiogasInfoHTML) > 425 Then
                '                BiogasInfoHTML = "<dt class='title'><h3>Biogas Generation and Use</h3></dt>" & BiogasInfoHTML
                '                BiogasInfo.Text = BiogasInfoHTML
                '                BiogasInfo.Visible = True
                '            Else
                '                BiogasInfo.Visible = False
                '            End If



                '            Dim EnergyInfoHTML As String = ""
                '            EnergyInfoHTML += "<dt>Electricity Generated (kWh/yr):</dt><dd>" & agActivity("energy_electricity").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>Electricity Generated: Design vs. Actual:</dt><dd>" & agActivity("energy_electricity_design_actual").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>Heat Generated (Btu/yr):</dt><dd>" & agActivity("energy_heat").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>Heat Generated: Design vs. Actual:</dt><dd>" & agActivity("energy_heat_design_actual").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>Utility Contract Type:</dt><dd>" & agActivity("energy_utility_contract_type").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>Utility Contract Type: Other:</dt><dd>" & agActivity("energy_utility_contract_type_other").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>Baseline Fuel Replaced:</dt><dd>" & agActivity("energy_baseline_fuel_replaced").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>GHG Credits ($):</dt><dd>" & agActivity("energy_ghg_credits").ToString & "</dd>"
                '            EnergyInfoHTML += "<dt>RECs ($):</dt><dd>" & agActivity("energy_recs").ToString & "</dd>"

                '            If Len(EnergyInfoHTML) > 425 Then
                '                EnergyInfoHTML = "<dt class='title'><h3>Energy-Related Information</h3></dt>" & EnergyInfoHTML
                '                EnergyInfo.Text = EnergyInfoHTML
                '                EnergyInfo.Visible = True
                '            Else
                '                EnergyInfo.Visible = False
                '            End If

            Next


            '    End If
        End If













        'If Activity("Sectors").Contains("ASG") Then
        '    'Placeholder
        'End If
        'If Activity("Sectors").Contains("MSW") Then
        '    'Placeholder
        'End If
        'If Activity("Sectors").Contains("Oil & Gas") Then
        '    'Placeholder
        'End If
        'If Activity("Sectors").Contains("Wastewater") Then
        '    'Placeholder
        'End If
        'If Activity("Sectors").Contains("Biogas") Then
        '    'Placeholder
        'End If

        'Dim attaDT As DataTable = data.GetAttachmentByActID(activityID) 'Attachments

        '        Dim attachmentActStr As String = ""
        '        If attaDT Is Nothing Then

        '        Else
        '            For Each doc As DataRow In attaDT.Rows
        '                Dim fileUrl As String
        '                fileUrl = "<a href='/attachments/" + doc("Name").ToString + "' target='blank' title='View Attachment'>" + doc("Name").ToString + "</a>"
        '                attachmentActStr += fileUrl + "<br/>"
        '            Next
        '        End If



        'Dim attaLgDt As DataTable = data.GetLgAttachmentsByActID(activityID) 'Large Attachments

        '        If attaLgDt Is Nothing Then
        '            'Response.Write("There are no large attachments.")
        '        Else
        '            For Each doc As DataRow In attaLgDt.Rows

        '                Dim fileUrl As String = ""
        '                'Dim fileUrlx As String = ""
        '                Dim curFile As String = Server.MapPath("/attachments/" + doc("filename").ToString)
        '                'Dim curFileMod As String = Server.MapPath("/attachments/" + doc("Name_mod").ToString)
        '                If System.IO.File.Exists(curFile) = True Then
        '                    'fileUrlx = doc("Title").ToString + "    (" + doc("year").ToString + ")"
        '                    'ElseIf System.IO.File.Exists(curFileMod) = True Then
        '                    '   fileUrlx = doc("Name_mod").ToString + "   (" + doc("year").ToString + ")"

        '                    fileUrl = "<a href=""/attachments/" + doc("filename").ToString + """ target='blank' title='View Content'>" & doc("Title").ToString & "</a>"
        '                Else
        '                    fileUrl = "<a href='docDownload.aspx?sID=" + doc("ID").ToString + "' target='blank' title='Download Content'>" + doc("Title").ToString + "</a>    (" + doc("year").ToString + ")"
        '                End If
        '                attachmentActStr += fileUrl + "<br/>"
        '                'If Len(fileUrl) > 0 Then
        '                '    attachmentActStr = attachmentActStr + fileUrl + "<br/>"
        '                'End If
        '                'If Len(fileUrlx) > 0 Then
        '                '    attachmentActStr = attachmentActStr + fileUrlx + "<br/>"
        '                'End If

        '                'Dim myId As String
        '                'myId = doc("Id").ToString
        '                'Dim fileUrl As String
        '                'fileUrl = "<a href=""../attachments/" + doc("Title").ToString + """ target='blank'>" & doc("Title").ToString & "</a>"
        '                'attachmentActStr = attachmentActStr + fileUrl + "<br/>"
        '            Next

        '        End If
        ''end of large attachments 
        'If Len(attachmentActStr) > 10 Then
        '            attachmentActStr += "</dd>"
        '            attachmentAct.Text = "<dt>Attachments:</dt><dd>" & attachmentActStr
        '            attachmentAct.Visible = True
        '        Else
        '            attachmentAct.Visible = False
        '        End If

        'Next
        'Else
        '    'An error occured. don't show any of the information.
        '    activitydetailsmsg.Visible = True
        '    'actPartners.Visible = False
        '    'agdetailsInfo.Visible = False
        '    'notcoal.Visible = False
        '    'EnergyRelatedInformation.Visible = False
        '    'BiogasGenerationandUse.Visible = False
        '    'DigesterProperties.Visible = False
        '    'PreDigestionDetails.Visible = False
        '    'GeneralInformation.Visible = False
        '    'GasandEnergyInformation.Visible = False
        'End If


    End Function


End Class
