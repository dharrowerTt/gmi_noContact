<%@ Page Title="Project Network Dashboard" Language="vb" MasterPageFile="~/management/MasterPage.master" AutoEventWireup="false" CodeBehind="dashboard.aspx.vb" Inherits="M2M_Redesign.dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Project Network Dashboard
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    .card-header{
        font-weight:bold;
    }
</style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <a href="addPNorg.aspx" class="btn btn-primary mb-3">Add New Member Organization</a>
            </div>
            <div class="col-md-3">
                  <a href="addPNuser.aspx" class="btn btn-primary mb-3">Add New Member Representative</a>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <!-- First Row (Donut Charts and Scrollable List) -->
        <div class="row">
            <!-- Registered People Chart -->
            <div class="col-md-4">
                <div class="card text-dark" style="background-color: #B0C4DE; margin-bottom: 20px; height: 340px;">
                    <div class="card-header text-center">Registered People</div>
                    <div class="card-body d-flex flex-column justify-content-center align-items-center">
                        <div class="chart-container" style="position: relative; height: 200px; width: 200px;">
                            <canvas id="peopleChart"></canvas>
                        </div>
                        <h5 class="mt-3 text-center">Registered: <%= registeredContacts %> (<%= Math.Round((registeredContacts / totalContacts) * 100, 2) %>%)</h5>
                    </div>
                </div>
            </div>

            <!-- Registered Organizations Chart -->
            <div class="col-md-4">
                <div class="card text-dark" style="background-color: #90EE90; margin-bottom: 20px; height: 340px;">
                    <div class="card-header text-center">Registered Organizations</div>
                    <div class="card-body d-flex flex-column justify-content-center align-items-center">
                        <div class="chart-container" style="position: relative; height: 200px; width: 200px;">
                            <canvas id="orgChart"></canvas>
                        </div>
                        <h5 class="mt-3 text-center">Registered: <%= registeredOrganizations %> (<%= Math.Round((registeredOrganizations / totalOrganizations) * 100, 2) %>%)</h5>
                    </div>
                </div>
            </div>

            <!-- Scrollable Organization List -->
            <div class="col-md-4">
                <div class="card text-dark bg-light mb-3" style="height: 340px;">
                    <div class="card-header text-center">Organizations with Registered Users</div>
                    <div class="card-body" style="overflow-y: auto;">
                        <ul class="list-group">
                            <% 
                                For Each org As KeyValuePair(Of String, String) In orgList 
                            %>
                            <li class="list-group-item">
                                <a href="https://globalmethane.org/project-network/organization.aspx?id=<%= org.Value %>" target="_blank">
                                    <%= org.Key %>
                                </a>
                            </li>
                            <% Next %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Second Row (Bar Chart for Activities and Sector List) -->
        <div class="row">
            <!-- Activity Participation and Years (8 columns) -->
            <div class="col-md-8">
                <div class="card text-dark bg-light mb-3">
                    <div class="card-header text-center">Activity Participation and Years</div>
                    <div class="card-body">
                        <div class="chart-container" style="position: relative; height: 400px;">
                            <canvas id="activityChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sector List (4 columns) -->
            <div class="col-md-4">
                <div class="card text-dark bg-light mb-3">
                    <div class="card-header text-center">Sectors and Organization Count</div>
                    <div class="card-body">
                        <ul class="list-group" style="height: 400px; overflow-y: auto;">
                            <% 
                                Dim currentSector As String = ""
                                For Each sector In sectorList
                                    If currentSector <> sector("gmiSector") Then
                                        If currentSector <> "" Then
                                            Response.Write("</ul>")
                                        End If
                                        currentSector = sector("gmiSector")
                                        Response.Write("<h5>" & currentSector & "</h5><ul class='list-group'>")
                                    End If
                            %>
                            <li class="list-group-item">
                                <%= sector("pnSubsector") %>:<strong> <%= sector("orgCount") %></strong>
                            </li>
                            <% Next 
                            Response.Write("</ul>") %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Third Row (World Map) -->
<div class="row">
        <!-- First 4 Columns: Country Data Table -->
        <div class="col-md-4">
            <div class="card text-dark bg-light mb-3" style="height: 100%;">
                <div class="card-header text-center">Country Data</div>
                <div class="card-body" style="overflow-y: auto; height: 500px;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Country Name</th>
                                <th># of Organizations</th>
                                <th>Combined Years of Experience</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                Dim totalOrgs As Integer = 0
                                Dim totalYears As Integer = 0
                                For Each country In countryData
                                    totalOrgs += country("orgCount")
                                    totalYears += country("totalYears")
                            %>
                            <tr>
                                <td><%= country("country") %></td>
                                <td><%= country("orgCount") %></td>
                                <td><%= country("totalYears") %></td>
                            </tr>
                            <% Next %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th><%= totalOrgs %></th>
                                <th><%= totalYears %></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

        <!-- Next 8 Columns: World Map -->
        <div class="col-md-8">
            <div class="card text-dark bg-light mb-3" style="height: 100%;">
                <div class="card-header text-center">Global Presence of Organizations</div>
                <div class="card-body" style="height: 500px;">
                    <div id="map" style="height: 100%;"></div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- Leaflet.js CSS and JS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>

    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // People Chart Data
        var peopleChart = document.getElementById('peopleChart').getContext('2d');
        var peopleChartData = {
            datasets: [{
                data: [<%= registeredContacts %>, <%= totalContacts - registeredContacts %>],
                backgroundColor: ['#007bff', '#e9ecef'],
                hoverBackgroundColor: ['#0056b3', '#ced4da'],
            }],
            labels: ['Registered', 'Not Registered']
        };
        new Chart(peopleChart, {
            type: 'doughnut',
            data: peopleChartData,
            options: {
                cutout: '75%',
                responsive: true,
                maintainAspectRatio: true
            }
        });

        // Organization Chart Data
        var orgChart = document.getElementById('orgChart').getContext('2d');
        var orgChartData = {
            datasets: [{
                data: [<%= registeredOrganizations %>, <%= totalOrganizations - registeredOrganizations %>],
                backgroundColor: ['#28a745', '#e9ecef'],
                hoverBackgroundColor: ['#218838', '#ced4da'],
            }],
            labels: ['Registered', 'Not Registered']
        };
        new Chart(orgChart, {
            type: 'doughnut',
            data: orgChartData,
            options: {
                cutout: '75%',
                responsive: true,
                maintainAspectRatio: true
            }
        });

        // Activity Bar Chart Data
        var activityChart = document.getElementById('activityChart').getContext('2d');
        var activityChartData = {
            labels: [
                <% For Each name As String In activityNames %>
                    '<%= name.Replace("'", "\'") %>',
                <% Next %>
            ],
            datasets: [
                {
                    label: 'Organization Count',
                    data: [
                        <% For Each count As Integer In activityOrgCounts %>
                            <%= count %>,
                        <% Next %>
                    ],
                    backgroundColor: '#007bff',
                    hoverBackgroundColor: '#0056b3'
                },
                {
                    label: 'Total Years',
                    data: [
                        <% For Each years As Integer In activityTotalYears %>
                            <%= years %>,
                        <% Next %>
                    ],
                    backgroundColor: '#28a745',
                    hoverBackgroundColor: '#218838'
                }
            ]
        };
        new Chart(activityChart, {
            type: 'bar',
            data: activityChartData,
            options: {
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Initialize the Leaflet.js Map
        var map = L.map('map').setView([20, 0], 2); // Center at (lat, lng) and zoom level 2

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        // Country data for the map
        var countryData = [
    <% For Each country In countryData %>
    {
        "ISO_A2": "<%= country("iso2").ToString().Trim() %>",
        "ISO_A3": "<%= country("iso3").ToString().Trim() %>",
        "country": "<%= country("country").ToString().Trim() %>",
        "orgCount": <%= country("orgCount") %>,
        "totalYears": <%= country("totalYears") %>
    },
    <% Next %>
        ];


        // Function to get color based on organization count
        function getColor(count) {
            return count > 20 ? '#800026' :
                count > 10 ? '#BD0026' :
                    count > 5 ? '#E31A1C' :
                        count > 2 ? '#FC4E2A' :
                            count > 0 ? '#FD8D3C' :
                                '#FFEDA0';  // Default to very light yellow for countries with no data
        }

        fetch('countries.geojson')
            .then(function (response) {
                return response.json();
            })
            .then(function (geoData) {
                L.geoJson(geoData, {
                    style: function (feature) {
                        // Find the matching country in countryData based on ISO_A2 or ISO_A3
                        var country = countryData.find(c => c.ISO_A2 === feature.properties.ISO_A2 || c.ISO_A3 === feature.properties.ISO_A3);

                        // If a match is found, use the orgCount, otherwise set the count to 0
                        var count = country ? country.orgCount : 0;

                        return {
                            fillColor: getColor(count),  // Use the color range based on orgCount
                            weight: 2,
                            opacity: 1,
                            color: 'white',
                            fillOpacity: country ? 0.7 : 0  // Set fillOpacity to 0 if no data
                        };
                    },
                    onEachFeature: function (feature, layer) {
                        // Find the matching country for popups
                        var country = countryData.find(c => c.ISO_A2 === feature.properties.ISO_A2 || c.ISO_A3 === feature.properties.ISO_A3);

                        if (country) {
                            var popupContent = `<b>${feature.properties.ADMIN}</b><br />Organizations: ${country.orgCount}<br />Total Years: ${country.totalYears}`;
                            layer.bindPopup(popupContent);
                        } else {
                            layer.bindPopup(`<b>${feature.properties.ADMIN}</b><br />No data available.`);
                        }
                    }
                }).addTo(map);
            });






    </script>
</asp:Content>
