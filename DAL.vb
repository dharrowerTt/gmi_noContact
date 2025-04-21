Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class DAL
    
    Public Function GetData(ByVal cmd As SqlCommand) As DataTable
        Dim dt As New DataTable
        Dim strConnString As String = ConfigurationManager.AppSettings.Item("GMIdatabase")
        Dim con As New SqlConnection(strConnString)
        Dim sda As New SqlDataAdapter
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        Try
            con.Open()
            sda.SelectCommand = cmd
            sda.Fill(dt)
            Return dt
        Catch ex As Exception
            'Response.Write(ex.Message)
            Return Nothing
        Finally
            con.Close()
            sda.Dispose()
            con.Dispose()
        End Try
    End Function
    Public Function GetCategories() As DataTable
        Dim strQuery As String = "SELECT * FROM Categories ORDER BY Category"
        Dim cmd As New SqlCommand(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetTerms() As DataTable
        Dim strQuery As String = "SELECT Terms.ID, Terms.Term, Terms.CategoryID, Categories.Category FROM Categories INNER JOIN Terms ON Categories.ID = Terms.CategoryID ORDER BY Categories.Category, Terms.Term"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetCurrentCatTerms(ByVal sCategory As String) As DataTable
        Dim strQuery As String = "SELECT Terms.Term, Categories.Category FROM Categories INNER JOIN Terms ON Categories.ID = Terms.CategoryID WHERE (((Categories.Category)=@sCategory)) ORDER BY Terms.Term"
        Dim cmd As New SqlCommand(strQuery)
        cmd.Parameters.AddWithValue("@sCategory", sCategory)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetCurrentTerm(ByVal sCategory As String, ByVal sTerm As String) As DataTable
        Dim strQuery As String = "SELECT Terms.Term, Terms.Definition, Terms.ID, Terms.CategoryID, Categories.Category FROM Categories INNER JOIN Terms ON Categories.ID = Terms.CategoryID WHERE (Terms.Term =@sTerm AND Categories.Category =@sCategory)"
        Dim cmd As New SqlCommand(strQuery)
        cmd.Parameters.AddWithValue("@sTerm", sTerm)
        cmd.Parameters.AddWithValue("@sCategory", sCategory)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetSelected(ByVal sDiagramBlock As String) As DataTable
        Dim strQuery As String = "SELECT FlowElementGlossary.Category, Glossary.Term FROM Glossary INNER JOIN FlowElementGlossary ON Glossary.[GlossaryID] = FlowElementGlossary.[GlossaryID] WHERE (((FlowElementGlossary.FlowElementID) In (SELECT FlowElementID FROM FlowElementGL WHERE FlowElementName=@sDiagramBlock)))"
        Dim cmd As New SqlCommand(strQuery)
        cmd.Parameters.AddWithValue("@sDiagramBlock", sDiagramBlock)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getCityCountries() As DataTable
        Dim strQuery As String = "SELECT distinct MailingCity, MailingCountry FROM sf_Contacts INNER JOIN sf_organizations ON sf_Contacts.Organization = sf_organizations.Id where MailingCity IS NOT NULL And MailingCountry IS NOT NULL"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function GetPartnerDetailsbyID(ByVal thisID As String) As DataTable
        Dim strQuery As String = "			SELECT o.Id, o.Name, o.name_in_native_language, o.Organization_Category, o.Expertise, o.Website, o.Project_Network_Areas_of_Interest, o.Project_Network_Geographic_Interest, " &
   " CASE WHEN C.STATUS = 'Active' and c.post_on_GMI_org = 1 then c.lastname else '' End as lastname, " &
   " CASE WHEN C.STATUS = 'Active' and c.post_on_GMI_org = 1 then c.firstname else '' End as firstname, " &
   " CASE WHEN C.STATUS = 'Active' and c.post_on_GMI_org = 1 then c.Email else '' End as Email, " &
   " CASE WHEN C.STATUS = 'Active' and c.post_on_GMI_org = 1 then c.Phone else '' End as Phone, " &
   " CASE WHEN C.STATUS = 'Active' and c.post_on_GMI_org = 1 then c.Areas_of_Interest else '' End as Areas_of_Interest, " &
   " CASE WHEN C.STATUS = 'Active' and c.post_on_GMI_org = 1 then c.Post_on_GMI_org else '' End as Post_on_GMI_org, " &
   " CASE WHEN C.STATUS = 'Active' and c.post_on_GMI_org = 1 then c.Id else '' End as contactID " &
            " FROM     sf_organizations AS o LEFT OUTER JOIN  " &
            "       sf_Contacts AS c ON c.Organization = o.Id " &
            " WHERE (o.project_network_member = 1) " &
            " AND o.ID = '" & thisID & "' ORDER by o.Name, c.LastName"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function GetPartnerListbySector(ByVal thisSector As String, ByVal thisCountry As String) As DataTable
        Dim strQuery As String = "SELECT o.Id, o.Name, o.Organization_Category, o.Expertise, o.Website, o.Project_Network_Areas_of_Interest, o.Project_Network_Geographic_Interest, o.Project_Network_Member" & _
            " FROM sf_organizations AS o  where o.project_network_member = 1 "
        If thisSector <> "" Then
            strQuery += "AND o.Project_Network_Areas_of_Interest Like '%" & thisSector & "%' "
        End If
        If thisCountry <> "" Then
            strQuery += "AND o.Project_Network_Geographic_Interest LIKE '%" & thisCountry & "%'  "
        End If
        strQuery += " Order by o.Name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function GetPartnerListFiltered(ByVal orgString As String) As DataTable
        'Public Function GetPartnerListFiltered(ByVal orgString As String, ByVal contactString1 As String, ByVal contactString2 As String, ByVal qryOperator As String) As DataTable
        Dim strQuery As String = "Select distinct o.id, o.name, o.Organization_Category FROM     sf_organizations AS o INNER JOIN sf_contacts AS c " & _
            " ON c.Organization = o.Id where o.Name like @orgString  " & _
            "  and o.Project_Network_Member=1 Order by o.Name"
        ' " and (c.lastname like @contactString1 or c.firstname like @contactstring1 or c.lastname like @contactString2 or c.firstname like @contactstring2) " & _

        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        cmd.Parameters.AddWithValue("@orgString", "%" & orgString & "%")
        'cmd.Parameters.AddWithValue("@contactString1", "%" & contactString1 & "%")
        'cmd.Parameters.AddWithValue("@contactString2", "%" & contactString2 & "%")
        'cmd.Parameters.AddWithValue("@qryOperator", qryOperator)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetPartnerListBySearch(ByVal strWhereC As String) As DataTable
        Dim strQuery As String = "SELECT o.Id, o.Name, o.Organization_Category, o.Expertise, o.Website, o.Project_Network_Areas_of_Interest, o.Project_Network_Geographic_Interest, o.Project_Network_Member" & _
            " FROM sf_organizations AS o  " & _
            " WHERE o.Project_Network_Member = 1" & strWhereC & _
            " ORDER BY o.Name "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function GetPartnerListByKeyword(ByVal keyword As String, ByVal filter As String) As DataTable
        Dim strQuery As String = "SELECT o.Id, o.Name, o.Organization_Category, o.Expertise, o.Website, o.Project_Network_Areas_of_Interest, o.Project_Network_Geographic_Interest, o.Project_Network_Member" & _
            " FROM sf_organizations AS o  " & _
            " WHERE (o.name like '%" & keyword & "%' or o.Project_Network_Geographic_Interest like '%" & keyword & "%') and o.project_network_member = 1 AND " & filter & _
            " ORDER BY o.Name "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function GetSiteByID(ByVal siteID As String) As DataTable
        Dim strQuery As String = "SELECT s.Id, s.name, s.sector, s.GMI_Site, s.type_of_site, s.farm_type, s.region, s.city, s.state_province, s.postal_code, s.district, s.Latitude, s.longitude, s.Potential_Annual_Reductions_MT_CO2e , s.Actual_Annual_Reductions_MT_CO2e, s.Site_Description, s.Type_of_Coal, s.Mining_Method, s.Installed_Drainage_System, c.Name AS CountryName, owner.LastName as Owner_LastName, owner.FirstName as Owner_FirstName,  operator.FirstName AS Operator_FirstName, operator.LastName AS Operator_Lastname, owner_org.Name AS Owner_organization, [primary].FirstName AS Primary_FirstName, [primary].LastName AS Primary_LastName, s.Primary_Contact as Primary_ContactID, operator_org.Name AS Operator_organization " & _
                  " FROM sf_sites AS s LEFT OUTER JOIN sf_organizations AS operator_org ON s.Operator_Organization = operator_org.Id LEFT OUTER JOIN sf_contacts AS [primary] ON s.Primary_Contact = [primary].Id LEFT OUTER JOIN sf_organizations AS owner_org ON s.Owner_Organization = owner_org.Id LEFT OUTER JOIN sf_contacts AS owner ON s.Owner_Contact = owner.Id LEFT OUTER JOIN sf_contacts AS operator ON s.Operator_Contact = operator.Id LEFT OUTER JOIN sf_countries AS c ON s.Country = c.Id " & _
                  " WHERE s.id = '" & siteID & "'"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function GetSitesByKeyword(ByVal keyword As String) As DataTable
        Dim strQuery As String = "SELECT s.Id, s.name, s.sector, s.GMI_Site, s.type_of_site, s.farm_type, s.region, s.city, s.state_province, s.postal_code, s.district, s.Latitude, s.longitude, s.Potential_Annual_Reductions_MT_CO2e , s.Actual_Annual_Reductions_MT_CO2e, s.Site_Description, s.Type_of_Coal, s.Mining_Method, s.Installed_Drainage_System, c.Name AS CountryName, owner.LastName as Owner_LastName, owner.FirstName as Owner_FirstName,  operator.FirstName AS Operator_FirstName, operator.LastName AS Operator_Lastname, owner_org.Name AS Owner_organization, [primary].FirstName AS Primary_FirstName, [primary].LastName AS Primary_LastName, s.Primary_Contact as Primary_ContactID, operator_org.Name AS Operator_organization " & _
                  " FROM sf_sites AS s LEFT OUTER JOIN sf_organizations AS operator_org ON s.Operator_Organization = operator_org.Id LEFT OUTER JOIN sf_contacts AS [primary] ON s.Primary_Contact = [primary].Id LEFT OUTER JOIN sf_organizations AS owner_org ON s.Owner_Organization = owner_org.Id LEFT OUTER JOIN sf_contacts AS owner ON s.Owner_Contact = owner.Id LEFT OUTER JOIN sf_contacts AS operator ON s.Operator_Contact = operator.Id LEFT OUTER JOIN sf_countries AS c ON s.Country = c.Id " & _
                  " WHERE s.name like '%" & keyword & "%' or s.sector like '%" & keyword & "%' or countryname like '%" & keyword & "%' order by s.name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Function getSiteContactsByID(ByVal siteID As String) As DataTable
        Dim strQuery As String = "SELECT s.Id, 'Owner' as ContactType, OwC.FirstName, OwC.LastName, OwC.Email, OwC.IsDeleted, OwC.Name, OwC.Post_on_GMI_org, OwC.Status FROM     sf_sites AS s LEFT OUTER JOIN" & _
                  "sf_contacts OwC ON s.Owner_Contact = OwC.Id Where s.ID = '" & siteID & "' and Post_on_GMI_org <> 1 and Status = 'Active' and IsDeleted <> 1" & _
        "UNION" & _
            "SELECT s.Id, 'Operator' as ContactType, OwC.FirstName, OwC.LastName, OwC.Email, OwC.IsDeleted, OwC.Name, OwC.Post_on_GMI_org, OwC.Status FROM sf_sites AS s LEFT OUTER JOIN" & _
                  "sf_contacts OwC ON s.Operator_Contact = OwC.Id Where  s.ID = '" & siteID & "' and Post_on_GMI_org <> 1 and Status = 'Active' and IsDeleted <> 1" & _
        "UNION" & _
            "SELECT s.Id, 'Primary' as ContactType, OwC.FirstName, OwC.LastName, OwC.Email, OwC.IsDeleted, OwC.Name, OwC.Post_on_GMI_org, OwC.Status FR OM     sf_sites AS s LEFT OUTER JOIN" & _
                  "sf_contacts OwC ON s.Primary_Contact = OwC.Id Where  s.ID = '" & siteID & "' and Post_on_GMI_org <> 1 and Status = 'Active' and IsDeleted <> 1"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getSiteOrganizationsByID(ByVal siteID As String) As DataTable
        Dim strQuery As String = "SELECT s.Id, 'Owner' AS ContactType, o.ID as orgID, o.Name, o.Organization_Category, o.Website FROM sf_sites AS s LEFT OUTER JOIN" & _
                  "sf_organizations AS o ON s.Owner_Organization = o.Id WHERE s.ID = '" & siteID & "' and o.IsDeleted <> 1" & _
                "UNION" & _
                    "SELECT s.Id, 'Operator' AS ContactType, o.ID as orgID, o.Name, o.Organization_Category, o.Website FROM sf_sites AS s LEFT OUTER JOIN " & _
                  "sf_organizations AS o ON s.Owner_Organization = o.Id WHERE s.ID = '" & siteID & "' and o.IsDeleted <> 1"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetActivitiesBySiteID(ByVal siteID As String) As DataTable
        Dim strQuery As String = "select a.name, a.ID, start_year, rt.name as recordtype, case when len(a.sectors) > 12 then 'Multiple Sectors' else a.Sectors end as Sector from sf_activities  a left outer join sf_recordType rt  on a.RecordTypeId= rt.ID " &
            " where a.site = '" & siteID & "' and a.Post_on_Website='Yes' and a.isdeleted = 0 order by  a.name, rt.name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getSiteLandfillDataByID(ByVal siteID As String) As DataTable
        Dim strQuery As String = "Select Additional_Comments, " &
        "Annual_Rainfall," &
        "Average_Depth_of_Wells," &
        "Average_Temperature," &
        "Capped, Capped_Other_Details," &
        "Capped_Using," &
        "Carbon_Credits," &
        "Carbon_Credits_Contracted," &
        "Daily_Cover, Date_of_Data_Collection," &
        "Designed_Capacity," &
        "Designed_Capacity_Units," &
        "Evidence_of_Fires," &
        "Filling_Begin_Year, Filling_End_Year," &
        "Filling_Process," &
        "Framework_Description," &
        "Gas_Collection_System, Gas_Flow_Rate_Measured," &
        "Gas_Flow_Rate_Units, ID," &
        "ILD_ID, Investor_Cooperation," &
        "IsDeleted, Landfill_Size_Current, Landfill_Size_Designed," &
        "Landfill_Type," &
        "Leachate_Accumulating," &
        "Leachate_Collected, Leachate_Drained," &
        "Lined_Other_Details," &
        "Lined_Using," &
        "Liner," &
        "Local_Agreement," &
        "Methane_Content_Measured," &
        "name, Number_of_Wells," &
        "Organization_name as Organization," &
        "Partnership," &
        "Percent_Food_Waste," &
        "Percent_Garden_Waste," &
        "Percent_Industrial, Percent_Inert," &
        "Percent_Inert_Waste," &
        "Percent_Municipal," &
        "Percent_Paper_and_Textiles," &
        "Percent_Unknown_Characteristic, Percent_Unknown_Source," &
        "Percent_Wood," &
        "Regulatory_Framework," &
        "Security_Access," &
        "Site," &
        "Technical_Assistance," &
        "Type_of_Venting," &
        "Waste_Accepted_Annually," &
        "Waste_Accepted_Annually_Units, Waste_Characteristics_Percentage_Basis," &
        "Waste_Collected_Daily," &
        "Waste_Collected_Daily_Units," &
        "Waste_Compaction, Waste_Depth," &
        "Waste_Generated_Annually," &
        "Waste_Generated_Annually_Units," &
        "Waste_Generated_Per_Capita," &
        "Waste_in_Place, Waste_in_Place_Units," &
        "Waste_Picking_and_Recycling_Activities," &
        "Waste_Source_Percentage_Basis, Website_for_Supporting_Reports " &
        " From sf_Landfill_Data  where Site='" & siteID & "'"

        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetCommitteeByCountryID(ByVal countryID As String) As DataTable
        Dim countryname As String = getGeoFocus(countryID)
        Dim strQuery As String = "SELECT distinct c.Name AS committeeName, d.Active, d.Alternate, d.Chair, d.Committee, d.Contact, d.Country_Representing, d.Name, poc.Id, poc.AccountId, poc.Email, poc.Areas_of_interest, " & _
                  " poc.Fax, poc.LastName, poc.Name AS contact_name, poc.Phone, poc.Post_on_GMI_org, poc.Status, sf_countries.Name AS country, o.Name AS contact_organization, " & _
                  " poc.MailingAddress, poc.MailingCity, poc.Title as Contact_title, poc.MailingCountry, poc.MailingPostalCode, poc.MailingState, poc.MailingStreet" & _
                  " FROM sf_committee AS c INNER JOIN " & _
                  " sf_Committee_delegate AS d ON c.Id = d.Committee INNER JOIN " & _
                  " sf_contacts AS poc ON d.Contact = poc.Id INNER JOIN " & _
                  " sf_countries ON d.Country_Representing = sf_countries.Id INNER JOIN sf_organizations AS o ON poc.Organization = o.Id" & _
                  " where replace(sf_countries.Name,'''','') = '" & Replace(countryname, "'", "") & "' and active = 1" & " order by c.name, poc.lastname"
        Dim cmd As New SqlCommand(strQuery)
        ' Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function




    Public Function GetCommitteeBySector(ByVal sector As String, ByVal chair As String) As DataTable
        Dim strQuery As String = "SELECT distinct c.Name AS committeeName, d.Active, d.Alternate, d.Chair, d.Committee, d.Contact, d.Country_Representing, d.Name, poc.Id, poc.AccountId, poc.Email, poc.Areas_of_interest, " & _
                  " poc.Fax, poc.LastName, poc.Name AS contact_name, poc.Phone, poc.Post_on_GMI_org, poc.Status, sf_countries.Name AS country, o.Name AS contact_organization, " & _
                  " poc.MailingAddress, poc.MailingCity, poc.Title as Contact_title, poc.MailingCountry, poc.MailingPostalCode, poc.MailingState, poc.MailingStreet" & _
                  " FROM sf_committee AS c INNER JOIN " & _
                  " sf_Committee_delegate AS d ON c.Id = d.Committee INNER JOIN " & _
                  " sf_contacts AS poc ON d.Contact = poc.Id INNER JOIN " & _
                  " sf_countries ON d.Country_Representing = sf_countries.Id INNER JOIN sf_organizations AS o ON poc.Organization = o.Id" & _
                  " where c.Name like '%" & sector & "%' and poc.isDeleted = 0  and active=1  "
        If chair = 1 Then
            strQuery += " and (d.chair = 1 or d.alternate = 1)" & _
                " order by sf_countries.name, poc.lastname, d.chair, d.alternate"
        ElseIf chair = 2 Then
            strQuery += " and (d.chair = 0 and d.alternate = 0)" & _
                " order by sf_countries.name, poc.lastname"
        ElseIf chair = 3 Then
            strQuery += " order by sf_countries.name, poc.lastname"
        End If


        '5/16/2018 -removing this filter >>> and poc.post_on_gmi_org = 1
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function
    Public Function GetAllEvents() As DataTable
        Dim strQuery As String = "SELECT distinct c.Name AS committeeName, d.Active, d.Alternate, d.Chair, d.Committee, d.Contact, d.Country_Representing, d.Name, poc.Id, poc.AccountId, poc.Email, poc.Areas_of_interest, " &
                  " poc.Fax, poc.LastName, poc.Name AS contact_name, poc.Phone, poc.Post_on_GMI_org, poc.Status, sf_countries.Name AS country, o.Name AS contact_organization, " &
                  " poc.MailingAddress, poc.MailingCity, poc.Title as Contact_title, poc.MailingCountry, poc.MailingPostalCode, poc.MailingState, poc.MailingStreet" &
                  " FROM sf_committee AS c INNER JOIN " &
                  " sf_Committee_delegate AS d ON c.Id = d.Committee INNER JOIN " &
                  " sf_contacts AS poc ON d.Contact = poc.Id INNER JOIN " &
                  " sf_countries ON d.Country_Representing = sf_countries.Id INNER JOIN sf_organizations AS o ON poc.Organization = o.Id" &
                  " where active = 1 or alternate = 1" & " order by poc.lastname, sf_countries.name "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetDelegatesByCountry(ByVal countryName As String, Optional ByVal chairsonly As String = "", Optional ByVal sectorid As String = "") As DataTable
        ' Base query for fetching delegates, filtered by country



        If String.Equals(countryName, "Dominicanrepublic", StringComparison.OrdinalIgnoreCase) Then
                countryName = "Dominican Republic"
            End If
        If String.Equals(countryName, "Turkiye", StringComparison.OrdinalIgnoreCase) Then
            countryName = "Turkey"
        End If
        If String.Equals(countryName, "republicofkorea", StringComparison.OrdinalIgnoreCase) Then
            countryName = "Republic of Korea"
        End If

        If String.Equals(countryName, "republicofnorthmacedonia", StringComparison.OrdinalIgnoreCase) Then
            countryName = "Republic of North Macedonia"
        End If

        If String.Equals(countryName, "srilanka", StringComparison.OrdinalIgnoreCase) Then
            countryName = "Sri Lanka"
        End If

        If String.Equals(countryName, "unitedkingdom", StringComparison.OrdinalIgnoreCase) Then
            countryName = "United Kingdom"
        End If

        If String.Equals(countryName, "cotedIvoire", StringComparison.OrdinalIgnoreCase) Then
            countryName = "Cote d'Ivoire"
        End If

        If String.Equals(countryName, "saudiarabia", StringComparison.OrdinalIgnoreCase) Then
            countryName = "Saudi Arabia"
        End If
        If String.Equals(countryName, "unitedstates", StringComparison.OrdinalIgnoreCase) Then
            countryName = "United States"
        End If

        Dim strQuery As String = "SELECT DISTINCT 
    REPLACE(REPLACE(REPLACE(c.Name, 'Agriculture Technical Group', 'Biogas Subcommittee'), 'MSW Technical Group', 'Biogas Subcommittee'), 'Wastewater Technical Group', 'Biogas Subcommittee') AS committeeName,
    poc.Email, 
    poc.LastName, 
    poc.FirstName, 
    poc.Name AS contact_name, 
    poc.Status, 
    sf_countries.Name AS country, 
    o.Name AS contact_organization, 
    poc.Title AS Contact_title 
FROM 
    sf_committee AS c 
    INNER JOIN sf_Committee_delegate AS d ON c.Id = d.Committee 
    INNER JOIN sf_contacts AS poc ON d.Contact = poc.Id 
    INNER JOIN sf_countries ON d.Country_Representing = sf_countries.Id 
    INNER JOIN sf_organizations AS o ON poc.Organization = o.Id 
WHERE 
    (d.Active = 1 OR d.Alternate = 1) 
    AND sf_countries.Name = @CountryName 
    AND poc.Status = 'Active'"

        ' Add optional filters
        If chairsonly = "chairs" Then
            strQuery += " AND d.Chair = 1 "
        End If

        If sectorid <> "" Then
            strQuery += " AND c.Name LIKE @SectorID "
        End If

        ' Final ordering
        strQuery += " ORDER BY 
    committeeName, 
    poc.LastName, 
    poc.FirstName "

        ' Prepare command and parameters
        Dim cmd As New SqlCommand(strQuery)
        cmd.Parameters.AddWithValue("@CountryName", countryName)
        If sectorid <> "" Then
            cmd.Parameters.AddWithValue("@SectorID", "%" & sectorid & "%")
        End If

        ' Fetch data
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function



    Public Function GetAllDelegates(Optional ByVal chairsonly As String = "", Optional ByVal sectorid As String = "") As DataTable


        Dim strQuery As String = "SELECT distinct c.Name AS committeeName, d.Active, d.Alternate, d.Chair, d.Committee, d.Contact, d.Country_Representing, d.Name, poc.Id, poc.AccountId, poc.Email, poc.Areas_of_interest, " &
                 " poc.Fax, poc.LastName, poc.firstname, poc.lastname, poc.Name AS contact_name, poc.Phone, poc.Post_on_GMI_org, poc.Status, sf_countries.Name AS country, o.Name AS contact_organization, " &
                 " poc.MailingAddress, poc.MailingCity, poc.Title as Contact_title, poc.MailingCountry, poc.MailingPostalCode, poc.MailingState, poc.MailingStreet" &
                 " FROM sf_committee AS c INNER JOIN " &
                 " sf_Committee_delegate AS d ON c.Id = d.Committee INNER JOIN " &
                 " sf_contacts AS poc ON d.Contact = poc.Id INNER JOIN " &
                 " sf_countries ON d.Country_Representing = sf_countries.Id INNER JOIN sf_organizations AS o ON poc.Organization = o.Id" &
                 " where (active = 1 or alternate = 1) "
        If chairsonly = "chairs" Then
            strQuery += " And chair = 1 "
        End If
        If sectorid <> "" Then
            strQuery += " And c.Name Like '%" & sectorid & "%' "
        End If
        strQuery += " order by poc.lastname, poc.firstname "


            Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetOrganizationbyID(ByVal orgID As String) As DataTable
        Dim strQuery As String = "Select o.id, o.name, o.Organization_Category, o.city, o.isDeleted, o.Name_in_native_Language, o.Postal_code,o.project_network_member, o.state, o.street_address, o.website, o.expertise from sf_organization o " & _
                            "where o.name='" & orgID & "' or o.id = '" & orgID & "'"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetActivitiesByID(ByVal activityID As String) As DataTable
        Dim strQuery As String = "select a.name, a.ID, start_year, rt.name as recordtype from sf_activities  a left outer join sf_recordType rt  on a.RecordTypeId= rt.ID " & _
            " where a.ID = '" & activityID & "' and a.Post_on_Website='Yes' and a.isdeleted = 0"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetActivitiesByCountry(ByVal countryID As String) As DataTable
        Dim countryname As String = getGeoFocus(countryID)
        Dim strQuery As String = "select a.name, a.ID, start_year, rt.name as recordtype from sf_activities a left outer join sf_recordType rt  on a.RecordTypeId= rt.ID " & _
            " inner join sf_countries c on a.country = c.ID where replace(c.name,'''','') = '" & Replace(countryname, "'", "") & "' and a.Post_on_Website='Yes'"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetActivityDetailsByID(ByVal activityID As String) As DataTable
        Dim strQuery As String = "SELECT a.Name, a.Status, a.GMI_Funded, rt.Name AS recordtype, a.Sub_Category, a.Description, a.Start_Date, a.End_Date, a.Start_Year, a.End_Year, a.Sectors, a.Attendees,  a.Attendees_Female, a.Reason_for_Closure, a.Project_status, a.Project_Use_Details, a.Gas_Flow_to_Project, a.Gas_Flow_Units, a.Site, a.Gas_Flow_Units_Other, a.Parent_Activity,  a.Pictures_Included, a.Project_End_Use_Type, a.Project_Lifetime_years, a.Rated_Capacity, a.Rated_Capacity_Units, a.Rated_Capacity_Units_Other,  a.Energy_Created_from_Gas, a.Energy_Created_Units, a.Energy_Created_Units_Other, a.Additional_Comments" & _
            " FROM sf_activities AS a INNER JOIN sf_recordType AS rt ON a.RecordTypeId = rt.Id" & _
            " WHERE  (a.Post_on_Website = 'Yes') AND  a.ID = '" & activityID & "'"
        Dim cmd As New SqlCommand(strQuery)
        ' Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getActivityPartnersbyID(ByVal activityID As String) As DataTable
        Dim strQuery As String = "SELECT distinct sf_activity_sites_association.Site, sf_sites.name" & _
                " FROM     sf_activity_sites_association INNER JOIN" & _
                  " sf_sites ON sf_activity_sites_association.Site = sf_sites.Id " & _
                " WHERE  (sf_activity_sites_association.Activity = '" & activityID & "') and sf_activity_sites_association.isDeleted = 0"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetAgActivityDetailsByID(ByVal activityID As String) As DataTable
        Dim strQuery As String = "Select distinct Animals_Cattle, Animals_Swine_Wean_to_Feed_Nursery, Animals_Swine_Farrow_to_Wean, Animals_Dairy_Dry, Animals_Swine_Boars, Animals_Swine_Feed_to_Finish_Grower, Animals_Swine_Sows, Animals_Swine_Total, Animals_Dairy_Heifer, Animals_Dairy_Lactating, Animals_Other, Animals_Other_Type, Animals_Poultry, Animals_Design_vs_Actual, Animals_Notes, Baseline_Fuel_Replaced as energy_baseline_fuel_replaced, Baseline_Waste_Storage_System as predigestion_baseline_waste_storage_system, " &
            "Biogas_Design_vs_Actual, Biogas_Production_cu_ft_day as biogas_production, Biogas_Use, Boiler_Furnace_Size as biogas_boiler_furnace_size, Boiler_Furnace_Size_Design_vs_Actual as biogas_boiler_furnace_design_actual, Digester_Heating, Digester_Materials, Digester_Mix_Tank, Digester_O_M, Digester_O_M_Design_vs_Actual, Digester_Operating_Volume, Digester_Other_Gas_Storage_Type, Digester_Other_Material_Type, Digester_Other_Type, Digester_TCI, Digester_TCI_Design_vs_Actual, Digester_Type, Effluent as digester_effluent, Effluent_Storage_O_M, Effluent_Storage_O_M_Design_vs_Actual, Effluent_Storage_TCI, Effluent_Storage_TCI_Design_vs_Actual, " &
            "Electricity_Generated_Design_vs_Actual as energy_electricity_design_actual, Electricity_Generated as energy_electricity, Gas_Use_O_M, Gas_Use_O_M_Design_vs_Actual, Gas_Use_TCI, Gas_Use_TCI_Design_vs_Actual, Generator_Set_Output as biogas_generator_set_output, Generator_Set_Output_Design_vs_Actual as biogas_generator_set_output_design_actual, Generator_Set_Size as biogas_generator_set_size, Generator_Set_Type as biogas_generator_set_type, GHG_Credits as energy_ghg_credits, Grant_Amount_GMI, Grant_Amount_Non_GMI, Heat_Generated as energy_heat, Heat_Generated_Design_vs_Actual as energy_heat_design_actual, HRT_days as digester_hrt_days, HRT_Design_vs_Actual as digester_hrt_design_actual, Manure_Collection_Process as predigestion_manure_collection_process, sf_ag_project_detail.Name as AgDetailName, Post_Treatment_Solids_Separation as digester_post_treatment_solids_separation, " &
            "Pretreatment_Solids_Separation as predigestion_pretreatment_solids_separation, Pretreatment_Solids_Separation_Method as predigestion_pretreatment_solids_separation_method, Pretreatment_Tanks as predigestion_pretreatment_tanks, RECs as energy_recs, SRT_days as digester_srt_days, SRT_Design_vs_Actual as digester_srt_design_actual, Total_O_M, Total_O_M_Design_vs_Actual, Total_TCI, Total_TCI_Design_vs_Actual, Utility_Contract_Type as energy_utility_contract_type, Utility_Contract_Type_Other as energy_utility_contract_type_other  FROM sf_activities as activity  inner join sf_recordType rt on activity.recordtypeid = rt.id" &
            " inner join sf_ag_project_detail on sf_ag_project_detail.activity = activity.id  " &
            " WHERE Activity.Post_on_Website='Yes' and Activity.Id='" & activityID & "'"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetAttachmentByActID(ByVal activityID As String) As DataTable
        Dim strQuery As String = "select id, name, parentid  from sf_attachments " & _
                " WHERE parentid ='" & activityID & "' order by name"
        Dim cmd As New SqlCommand(strQuery)
        Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetAttachments() As DataTable
        Dim strQuery As String = "select id, name, Replace(name, ' ', '_') as name_mod, parentid  from sf_attachments "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetLgAttachmentsByActID(ByVal activityID As String) As DataTable
        Dim strQuery As String = "Select c.Id, c.pathOnClient as filename, year(c.file_creation_date) as year, c.FileType, c.Activity, c.Title  " & _
            "From sf_contentVersion_rev c " & _
            " WHERE c.Activity ='" & activityID & "' order by c.Title"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function GetLgAttachments() As DataTable
        Dim strQuery As String = "Select c.Id, c.pathOnClient as filename, year(c.file_creation_date) as year, c.FileType, c.Activity, c.Title, Replace(c.title, ' ', '_') as title_mod " & _
            "From sf_contentVersion_rev c "
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getOrganizationsByCountry(ByVal countryID As String) As DataTable
        Dim countryname As String = getGeoFocus(countryID)
        Dim strQuery As String = "SELECT o.ID, o.Name, o.Organization_Category " & _
                       " FROM     sf_countries AS c RIGHT OUTER JOIN sf_organizations AS o ON c.Id = o.Country" & _
                       " WHERE  (o.Project_Network_Member = 1) and replace(c.Name,'''','') = '" & Replace(countryname, "'", "") & "'" & _
                       "  group by o.id, o.name, o.Organization_Category order by o.name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getOrganizationsBySector(ByVal sector As String) As DataTable
        If sector = "Oil and Gas" Then
            sector = "Oil & Gas"
        End If
        Dim strQuery As String = "SELECT o.ID, o.Name, o.Organization_Category " & _
                      " FROM     sf_countries AS c RIGHT OUTER JOIN sf_organizations AS o ON c.Id = o.Country" & _
                      " WHERE  (o.Project_Network_Member = 1) and o.Project_Network_Areas_of_interest like '%" & sector & "%'" & _
                      "  group by o.id, o.name, o.Organization_Category order by o.name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetActivitiesByKeyword(ByVal keyword As String, ByVal filter As String) As DataTable
        Dim strQuery As String = "select Replace(Replace(s.name,'_',''),'*','') AS SiteName, s.Id AS siteID, a.Name, a.Id AS activityID, start_year, rt.name as recordtype, c.Name as Country, a.Sectors from sf_activities a left outer join sf_recordType rt  on a.RecordTypeId= rt.ID " & _
            " left outer join sf_countries c on a.country = c.ID right outer join sf_sites as s on a.Site = s.ID " & _
            " where ((a.name like '%" & keyword & "%' or a.sectors like '%" & keyword & "%' or c.name like '%" & keyword & "%') and " & filter & " and a.Post_on_Website='Yes') or (s.name like '%" & keyword & "%' and " & filter & ") order by s.name, a.name"
        Dim cmd As New SqlCommand(strQuery)
        ' Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetActivitiesBySector(ByVal sector As String) As DataTable
        If sector = "Oil and Gas" Then
            sector = "Oil & Gas"
        End If
        Dim strQuery As String = "select Replace(Replace(s.name,'_',''),'*','') AS SiteName, s.Id AS siteID, a.Name, a.Id AS activityID, start_year, rt.name as recordtype, c.Name as Country, a.Sectors from sf_activities a left outer join sf_recordType rt  on a.RecordTypeId= rt.ID " & _
            " inner join sf_countries c on a.country = c.ID right outer join sf_sites as s on a.Site = s.ID where a.sectors like '%" & sector & "%' and a.Post_on_Website='Yes'"
        Dim cmd As New SqlCommand(strQuery)
        Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function getSiteIDfromActivity(ByVal actID As String) As DataTable
        Dim strQuery As String = "select a.site from sf_activities a  where a.ID = '" & actID & "'"
        Dim cmd As New SqlCommand(strQuery)
        Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    'Public Function newFunctionName() As DataTable
    '    Dim strQuery As String = ""
    '    Dim cmd As New SqlCommand(strQuery)
    '    Dim dt As DataTable = GetData(cmd)
    '    Return dt
    'End Function









    Public Function GetPartnerList() As DataTable
        Dim strQuery As String = "select distinct organizationid, name, typeoforganization from vieworgdetail order by name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetProjectList() As DataTable
        Dim strQuery As String = "SELECT distinct ProjectID, Name, Sector, Description, TypeofProject FROM viewProjectDetail ORDER BY Name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetRecentProjectList() As DataTable
        Dim strQuery As String = "SELECT top 15  ProjectID, Name, Sector, Description, TypeofProject FROM (select distinct * from viewProjectDetail) as list ORDER BY lastmodifieddate desc"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function


    Public Function getPageListbyKeyword(ByVal keyword As String, ByVal filter As String) As DataTable
        Dim strQuery As String = "SELECT MenuID, [Page Name] as PageName, URL, ParentMenuID from pagelist " & _
                                "    where (pagelist.[Page Name] like '%" & keyword & "%') and " & filter & " order by [parentmenuID], [preferred order]"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.Print strQuery
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    'Public Function methodname(ByVal resourceID As String) As DataTable
    '    Dim strQuery As String = ""
    '    Dim cmd As New SqlCommand(strQuery)
    '    Dim dt As DataTable = GetData(cmd)
    '    Return dt
    'End Function



    Public Function SiteList() As DataTable
        Dim strQuery As String = "SELECT replace(sf_sites.name,'_','') AS site, sf_countries.Name as Country, sf_sites.sector as Sector, case when sf_sites.gmi_site = 1 then 'Yes' else 'No' end  as GMISite, sf_sites.Latitude as lat, sf_sites.longitude as lng, 'https://www.globalmethane.org/sites/siteDetails.aspx?myObjID=' as URL, sf_sites.Id as SiteID, IsNull(sf_sites.city + ', ','')  + sf_countries.Name as CityCountry" &
                                 " FROM     sf_sites INNER JOIN " &
                                  " sf_countries ON sf_sites.Country = sf_countries.Id where sf_sites.Latitude is not null and sf_sites.longitude is not null AND sector <> 'AgStar Domestic'"
        Dim cmd As New SqlCommand(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function

    Public Function GetData(ByVal StrQuery As String) As DataTable
        Dim cmd As New SqlCommand(StrQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt
    End Function



    Public Function GetPNList() As DataTable
        Dim strQuery As String = "Select distinct o.id, o.name, o.Organization_Category, o.Project_Network_Areas_of_Interest, o.Project_Network_Geographic_Interest FROM     sf_organizations AS o INNER JOIN sf_contacts AS c ON c.Organization = o.Id where o.Project_Network_Member=1 Order by o.Name"
        Dim cmd As New SqlCommand(strQuery)
        'Debug.WriteLine(strQuery)
        Dim dt As DataTable = GetData(cmd)
        Return dt

    End Function

    Public Shared Function GetCommitteeChairList(Optional ByVal sectorid As String = "") As String

        Dim data As New DAL
        Dim dt As DataTable = Nothing
        dt = data.GetAllDelegates("chairs", sectorid)
        Dim myText As String = ""

        Dim thiscountry As String = ""
        If (Not IsNothing(dt)) Then

            For Each CD As DataRow In dt.Rows


                'If Len(Trim(CD("Email").ToString)) > 0 Then
                '    myText += "<p><strong><a href=mailto:" & CD("Email").ToString & ">" & CD("Contact_Name").ToString & "</a>, Co-chair</strong><br />"
                'End If
                If dt.Rows.Count > 1 Then
                    myText += "<p><strong>" & CD("Contact_Name").ToString & ", Co-Chair</strong><br />"
                Else
                    myText += "<p><strong>" & CD("Contact_Name").ToString & ", Chair</strong><br />"
                End If



                If (Not CD("Contact_Organization").ToString = "") Then
                    myText += CD("contact_organization").ToString & ""
                    Dim orgID As String = CD("Contact_organization").ToString

                    Dim orgdt As DataTable = data.GetOrganizationbyID(orgID)
                    If Not IsNothing(orgdt) Then
                        For Each org As DataRow In orgdt.Rows
                            myText += "<br />" & org("Name").ToString
                        Next
                    End If
                    myText += "<br />"
                End If
                If (Not CD("Country").ToString = "") Then

                    myText += CD("Country").ToString & "<br />"

                Else
                    myText += ""
                End If





                myText += "</p>"



            Next

            Return myText
        Else
            myText = "An error has occurred and the subcommittee co-chairs list cannot be displayed at this time. Please check back at a later time."
            Return myText
        End If

    End Function




End Class

