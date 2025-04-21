<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index18" %>

    <%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

        <!DOCTYPE html>

        <html xmlns="http://www.w3.org/1999/xhtml">

        <head runat="server">
            <title>2024 Forum - Admin</title>
            <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
            <!-- Google Tag Manager -->
            <script>
                (function (w, d, s, l, i) {
                    w[l] = w[l] || [];
                    w[l].push({
                        'gtm.start': new Date().getTime(),
                        event: 'gtm.js'
                    });
                    var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s),
                        dl = l != 'dataLayer' ? '&l=' + l : '';
                    j.async = true;
                    j.src =
                        'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                    f.parentNode.insertBefore(j, f);
                })(window, document, 'script', 'dataLayer', 'GTM-WM2LZW5');
            </script>
            <!-- End Google Tag Manager -->
            <!-- Google tag (gtag.js) -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=G-46JVDVGWQS"></script>
            <script>
                window.dataLayer = window.dataLayer || [];

                function gtag() {
                    dataLayer.push(arguments);
                }
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
                
                body {
                    min-height: 75rem;
                    padding-top: 4.5rem;
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
                
                .cardImg {
                    width: 100%;
                }
                
                .cardImg img {
                    width: 100%!important;
                    height: auto!important;
                }
                
                .kpi {
                    font-size: 3.6rem;
                    text-align: center;
                    font-weight: bold;
                    color: #3121ca;
                }
                
                .kpiDescriptor {
                    text-align: center;
                    font-size: 2rem;
                }
                #attType{
                    width:100%;
                    border:0px solid;
                }
                #top3Country{
                    width:100%;
                    border:0px solid;
                }
                #sums{
                    width:100%;
                }
                 #sums tr td:nth-child(-n+11),  #sums tr th:nth-child(-n +11) {
                     text-align:center;
  background: #A7ABDD;
}
                                  #sums tr td:nth-child(n+12),  #sums tr th:nth-child(n +12) {                                      text-align:center;
  background: #9D8ECC;
}

                                  span .inPerson{
                                      height:20px;
                                      width:20px;
                                      border-radius:100%;
                                      background:#A7ABDD;
                                  }

                                span .virtual{
                                               height:20px;
                                      width:20px;
                                      border-radius:100%;
                                      background:#9D8ECC;
                                }
            </style>
            <script src="https://kit.fontawesome.com/15da2e6088.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <form id="form1" runat="server">
                <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                    <div class="container">
                        <a class="navbar-brand" href="#">2024 Forum Admin</a>

                    </div>
                </nav>

                <main class="container">
                    <div class="bg-light py-5 rounded">
                        <h1>Registrants</h1>

                        <div class="row row-cols-4 g-4">
                            <div class="col">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Registrants</h5>
                         
                                            <h2 class="kpi">
                                                <%= regCount  %>
                                            </h2>
                                            <h5 class="kpiDescriptor">registered attendees</h5>
                                                <asp:GridView ID="attType" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="attendanceType" HeaderText="Attendance Type" />
                                    <asp:BoundField DataField="registrantCount" HeaderText="Count" />
                                </Columns>
                            </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Countries</h5>
                                        
                                            <h2 class="kpi">
                                                <%= countryCount  %>
                                            </h2>
                                            <h5 class="kpiDescriptor">countries represented</h5>
                                                                                        <asp:GridView ID="top3Country" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="country" HeaderText="Country" />
                                    <asp:BoundField DataField="registrantCount" HeaderText="Count" />
                                </Columns>
                            </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Org Types</h5>
                                        <div class="cardImg">
                                            <asp:Chart ID="Chart1" runat="server" ImageType="Jpeg">
                                                <Series>
                                                    <asp:Series Name="Series1"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <div style="width: 100%; height: 100%; position: absolute; top: 0; left: 0"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Areas of Interest</h5>
                                        <div class="cardImg">
                                            <asp:Chart ID="Chart2" runat="server" ImageType="Jpeg" Palette="Berry">
                                                <Series>
                                                    <asp:Series Name="Series1"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                            <div style="width: 100%; height: 100%; position: absolute; top: 0; left: 0"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="col-md-12">
                            <h2>Counts of planned attendance</h2>
                            <table><tr><td><div style="float:left;height:30px;width:30px;border-radius:100%;background:#A7ABDD;margin-right:10px;"></div>In-Person</td><td><div style="float:left;height:30px;width:30px;border-radius:100%;background:#9D8ECC;margin-right:10px;margin-left:40px;"></div>Virtual</div></td></tr></table>
                            <asp:GridView ID="sums" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="IPmonUNECE" HeaderText="Mon. UNECE" />
                                    <asp:BoundField DataField="IPmonBiogas" HeaderText="Mon. Biogas" />
                                    <asp:BoundField DataField="IPmonCoal" HeaderText="Mon. Biogas" />
                                    <asp:BoundField DataField="IPmonGMI" HeaderText="Mon. Biogas" />
                                    <asp:BoundField DataField="IPmonReception" HeaderText="Mon. Reception" />
                                    <asp:BoundField DataField="IPtuePlenary" HeaderText="Tue. Plenary" />
                                    <asp:BoundField DataField="IPtueReception" HeaderText="Tue. Reception" />
                                    <asp:BoundField DataField="IPwedCoal" HeaderText="Wed. Coal" />
                                    <asp:BoundField DataField="IPwedBiogas" HeaderText="Wed. Biogas" />
                                    <asp:BoundField DataField="IPwedOilGas" HeaderText="Wed. Oil & Gas" />
                                    <asp:BoundField DataField="IPthuUNECE" HeaderText="Thu. UNECE" />
                                    <asp:BoundField DataField="VmonSteering" HeaderText="Mon. Steering" />
                                    <asp:BoundField DataField="VmonBiogas" HeaderText="Mon. Biogas" />
                                    <asp:BoundField DataField="VtuePlenary" HeaderText="Tue. Plenary" />
                                    <asp:BoundField DataField="VwedBiogas" HeaderText="Wed. Biogas" />
                                </Columns>
                            </asp:GridView>
                        </div>
                        <hr />
                        <div class="col-md-12">To export a full dataset for registrants, please <a href="export.aspx" target="_blank">click here</a>.</div>
                        <div class="col-md-12">
                            <asp:GridView ID="forumRegs" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID" />
                                    <asp:BoundField DataField="firstName" HeaderText="First Name" />
                                    <asp:BoundField DataField="lastName" HeaderText="Last Name" />
                                    <asp:BoundField DataField="jobTitle" HeaderText="Job title" />
                                    <asp:BoundField DataField="organization" HeaderText="Organization" />
                                    <asp:BoundField DataField="orgType" HeaderText="Organization Type" />
                                    <asp:BoundField DataField="email" HeaderText="Email Address" />
                                    <asp:BoundField DataField="attendanceType" HeaderText="Attendance" />
                                    <asp:BoundField DataField="country" HeaderText="Country" />
                                    <asp:BoundField DataField="areaList" HeaderText="Areas of Interest" />
                                    <asp:BoundField DataField="poster" HeaderText="Poster" />
                                    <asp:BoundField DataField="regDate" HeaderText="Date Registered" />
                                </Columns>
                            </asp:GridView>
                        </div>


                    </div>
                </main>

            </form>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
            <script>
                $(document).ready(function () {
                    $('#forumRegs').DataTable({
                        orderCellsTop: true,
                        "order": [
                            [0, "desc"]
                        ],
                        columnDefs: [{
                            "render": function (data, type, row) {
                                //return '<a href="view.aspx?c=' + row[0] + '">' + row[1] + ' ' + row[2] + ' </a>';
                                return row[1] + ' ' + row[2];
                            },
                            "title": "Name",
                            "targets": [0]
                        }, {
                            "targets": [1,2, 3, 6, 11],
                            "visible": false
                        }, {
                            "targets": [5, 7, 11],
                            "sortable": false
                        }],

                        initComplete: function () {
                            this.api().columns([5, 7, 8, 9]).every(function () {
                                var column = this;
                                var select = $('<br><select><option value=""></option></select>')
                                    .appendTo($(column.header()))
                                    .on('change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                            $(this).val()
                                        );

                                        column
                                            .search(val ? val : '', false, false)
                                            .draw();
                                    });
                                var addedOptions = [];
                                column.data().unique().sort().each(function (d, j) {
                                    var options = d.split(',');

                                    for (x = 0; x < options.length; x++) {
                                        var val = options[x].trim();

                                        if (!addedOptions.includes(val)) {
                                            select.append('<option value="' + val + '">' + val + '</option>');
                                            addedOptions.push(val);
                                        }
                                    }
                                });
                            });
                        }
                    });

                });
            </script>

            <script>
                $(".show-context-menu").each(function () {
                    tippy($(this)[0], {
                        content: $(this).attr("data-value"),
                        trigger: "mouseenter",
                        placement: "bottom-start",
                        allowHTML: true,
                        interactive: true,
                        hideOnClick: true,
                        inertia: true,
                    });
                });
            </script>
        </body>

        </html>