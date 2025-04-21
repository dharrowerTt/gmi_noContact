<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="profile.aspx.vb" Inherits="M2M_Redesign.profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Country Profile | Global Methane Initiative</title>
    <meta name="robots" content="noindex,nofollow" />
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <style>
        #chartdiv {
            width: 100%;
            height: 400px;
            /*background: rgb(218, 236, 248);*/
            background: white;
            border: 1px solid white;
            margin-top: 15px;
        }
        .BIMGslidediv img, .CIMGslidediv img, .OgIMGslidediv img, .MIMGslidediv img {
            margin: auto;
            width: 200px !important;
        }
        .Bslider, .Cslider, .Ogslider, .Mslider {
            font-size: 16px;
            color: black;
        }
        .Bslider h3, .Cslider h3, .Ogslider h3, .Mslider h3 {
                font-size: 1em;
        }
        .gmctag {
            font-size: 12px;
            color: white;
            border-radius: 4px;
            display: inline-block;
            padding: 6px;
        }
        .gmcogtag {
            background-color: #464379;
        }
        .gmcbiogastag {
            background-color: #2e7e56;
        }
        .gmccoaltag {
            background-color: #f15c54;
        }
        .gmcmultipletag {
            background-color: #f1c40f;
        }
        .alliance {
            color: #F89737;
            margin: 0px;
            padding: 0px;
        }
        #chartdiv {
            width: 100%;
            height: 400px;
            background: white;
            border: 1px solid white;
            margin-top: 15px;
        }       
        h2 {
            color: #007AC2;
        }
        h1 span{font-size:13px;background:#cacaff;color:#232680;font-weight:lighter;padding:2px;border-radius:4px;}
    </style>
    <!-- #include virtual="/includes/header.html" -->

    <!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
        <nav aria-label="breadcrumb">
    <ol class="breadcrumb" style="background:#edfafd; border:1px solid #96CFE0; border-radius:12px;">        
        <li class="breadcrumb-item"><a href="/partners">Back to Partner Countries</a></li>
    </ol>
</nav>
            </div>
        <div class="container" style="background: #fcfafa; border: 1px solid #343456; border-radius: 8px 8px 0 0;">
            <!-- Header Image with Gradient and Country Name -->
            <div class="row">
                <div class="col-12 p-0" style="position: relative; height: 200px; overflow: hidden; border-radius: 8px 8px 0 0;">
                    <!-- Header image with limited height -->
         <img src='../assets/images/countryBanner/<%= strBanner %>' alt="Country Profile Header" style="width: 100%; height: 100%; object-fit: cover;" id="CountryHeader">


                    <!-- Gradient overlay for fade effect -->
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: linear-gradient(to bottom, rgba(255, 255, 255, 0.3) 20%, #fcfafa 100%);">
                    </div>

                    <!-- Country name in bottom left -->
                    <h1 style="position: absolute; bottom: 10px; left: 15px; color: #000000; font-weight: bold;"><img src='/assets/images/<%= strCountryFlag  %>' >&nbsp;<%= strCountryName  %>
                    <span>&nbsp;<asp:PlaceHolder ID="datejoined" runat="server" />&nbsp;</span>
                    </h1>
                    
                </div>
            </div>

            <!-- Introduction Section with Sidebar -->
            <div class="row mt-3">
                <div class="col-sm-8 vertSplitter">                      
                    <asp:Literal ID="litIntroduction" runat="server"></asp:Literal>
                        <p id="sectorbuttons">Finland is currently active on the <a href="https://globalmethane.org/steering/index.aspx">Steering Committee</a> and the <a href="https://globalmethane.org/biogas/index.aspx">Biogas Subcommittee</a>.</p>
                </div>
                <div class="col-sm-4">
                    <div class="border border-secondary bg-white px-0">
                        <div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                        <ul id="methane-links" class="list-group py-2">
                            <li class="list-group-item noborder nobackground py-1"><a href="#introduction">Introduction</a></li>
                            <li class="list-group-item noborder nobackground py-1"><a href="#methane-emissions-summary">Methane Emissions Summary</a></li>
                            <li class="list-group-item noborder nobackground py-1"><a href="#methane-commitments-plans">Methane Commitments and Plans</a></li>
                            <li class="list-group-item noborder nobackground py-1"><a href="#methane-actions">Methane Actions</a></li>
                            <li class="list-group-item noborder nobackground py-1"><a href="#ministries-agencies">Ministries and Agencies Supporting Methane Actions</a></li>
                            <li class="list-group-item noborder nobackground py-1"><a href="#gmi-delegates">GMI Delegates</a></li>
                        </ul>
                        <hr />
                        <p style="text-align:center;font-style:italic;">Last Updated: <asp:Literal ID="updated" runat="server"></asp:Literal></p>
                    </div>
                </div>
            </div>
                <div class="container mt-2">
        <div class="row">

           <!--  <div class="col">
                <a href="https://globalmethane.org/steering/index.aspx" class="btn btn-block" style="background-color: #002233; color: white; font-weight: bold;">Steering<br />Committee</a>
            </div>
            <div class="col">
                <a href="https://globalmethane.org/biogas/index.aspx" class="btn btn-block" style="background-color: #2e7e56; color: white; font-weight: bold;">Biogas<br />Subcommittee</a>
            </div>
           <div class="col">
                <a href="#" class="btn btn-block" style="background-color: #6D071A; color: white; font-weight: bold;">Coal Mines<br />Subcommittee</a>
            </div>
            <div class="col">
                <a href="#" class="btn btn-block" style="background-color: #464379; color: white; font-weight: bold;">Oil & Gas<br />Subcommittee</a>
            </div>
            <div class="col">
                <a href="#" class="btn btn-block" style="background-color: #3198C8; color: white; font-weight: bold;">GMI<br />Secretariat</a>
            </div>-->
        </div>
    </div>
            <hr />
            <!-- Methane Emissions Summary -->
            <div class="row mt-3">
                <div class="col-12">
                    <asp:Literal ID="litMethaneEmissionsSummary" runat="server"></asp:Literal>
                </div>
                <div class="col-12">
                    <div id="emissions" class="row" style="display:none;">
    <div class="col-md-6">

        <p>The table and charts provides estimate for projected methane emissions within the industry sectors targeted by GMI (biogas, coal mines, and oil & gas) from 2020-2050. Data are presented in million metric tonnes carbon dioxide equivalent (MMTCO<sub>2</sub>e).</p>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", { packages: ["corechart"] });
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var options = {
                    colors: ['#2e7e56', '#f15c54', '#464379', '#696969'],
                    height: 400,
                    vAxis: { title: 'MMTCO2e' },
                    xAxis: { title: 'Year' },
                    isStacked: true,
                    legend: { position: "below" },
                    series: {
                        0: { lineDashStyle: [1, 1] },
                        1: { lineDashStyle: [4, 4] },
                        2: { lineDashStyle: [2, 1, 2] }
                    },
                };
                $.ajax({
                    type: "POST",
                    url: "detail.aspx/GetChartData",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var data = google.visualization.arrayToDataTable(r.d);
                        var chart = new google.visualization.AreaChart($("#chart")[0]);
                        chart.draw(data, options);
                    },
                    failure: function (r) {
                        alert(r.d);
                    },
                    error: function (r) {
                        alert(r.d);
                    }
                });
            }
        </script>

        <p>Source: <a href="https://www.epa.gov/global-mitigation-non-co2-greenhouse-gases">Global Non-CO<sub>2</sub> Greenhouse Gas Emission Projections & Mitigation Potential: 2015-2050</a>, U.S. EPA</p>
    </div>
    <div class="col-md-6">
        <p><a href="../methane-emissions-data.aspx">Explore methane emissions measurements and projections</a> throughout the world in our interactive dashboard.</p>

        <div id="chart" style="width: 100%;">
        </div>
        <a style="float:right; margin:10px;" class="btn btn-primary" href="../methane-emissions-data.aspx" tabindex="0">View Data</a>
    </div>
</div>
                </div>
            </div>

            <!-- Methane Commitments and Plans -->
            <div class="row mt-3">
                <div class="col-12">
                    <asp:Literal ID="litMethaneCommitmentsPlans" runat="server"></asp:Literal>
                </div>
            </div>

            <!-- Methane Actions -->
            <div class="row mt-3">
                <div class="col-12">
                    <asp:Literal ID="litMethaneActions" runat="server"></asp:Literal>
                </div>
            </div>

            <!-- Ministries and Agencies Supporting Methane Actions -->
            <div class="row mt-3">
                <div class="col-12">
                    <asp:Literal ID="litMinistriesAgencies" runat="server"></asp:Literal>
                </div>
            </div>

            <!-- GMI Delegates -->
            <div class="row mt-3" id="gmi-delegates">
                <div class="col-12">
                    <h2>GMI Delegates</h2>
                    <asp:PlaceHolder ID="phDelegatesTable" runat="server" />
                    <br /><br />
                </div>
                            <div class="col-md-12" style="display:none">
                            <a class="btn btn-sm btn-primary float-right" role="button" href="/delegates/index.aspx?country=<%= objid  %>">View Delegates</a>

                            <h2>GMI Delegates</h2>
                            <asp:Literal ID="delMsg" runat="server" Visible="false"></asp:Literal>
                            <table id="delegatesummary" class="table table-sm">
                                <tbody>
                                    <asp:Repeater ID="lookupRepeater" runat="server" OnItemDataBound="lookupDataBound">
                                        <ItemTemplate>
                                            <asp:Literal ID="litNav" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                </div>

            </div>
        </div>
    </section>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Function to replace text in a node without affecting child elements
            function replaceTextInNode(node, target, replacement) {
                // Check each child node
                node.childNodes.forEach(child => {
                    if (child.nodeType === Node.TEXT_NODE) {
                        // Replace only in text nodes
                        child.nodeValue = child.nodeValue.replace(target, replacement);
                    }
                });
            }

            // Check and replace in <h1> tag
            let h1Tags = document.getElementsByTagName("h1");
            for (let h1 of h1Tags) {
                replaceTextInNode(h1, "Turkiye", "Türkiye");
            }

            // Check and replace in the page title
            if (document.title.includes("Turkiye")) {
                document.title = document.title.replace("Turkiye", "Türkiye");
            }
        });


    </script>

  <script>
      document.addEventListener("DOMContentLoaded", function () {
          // Find the link by href attribute containing the email address
          const emailLink = document.querySelector('a[href="mailto:carbonell.tomas@epa.gov"]');

          // Replace the link with plain text if it exists
          if (emailLink) {
              const textNode = document.createTextNode(emailLink.textContent);
              emailLink.parentNode.replaceChild(textNode, emailLink);
          }
      });
  </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const links = document.querySelectorAll("#methane-links a[href^='#']");

            links.forEach(link => {
                const targetId = link.getAttribute("href").substring(1);
                const targetElement = document.getElementById(targetId);

                if (!targetElement) {
                    const listItem = link.closest("li");
                    if (listItem) {
                        listItem.remove();
                    }
                }
            });
        });



    </script>

 <script>
     document.addEventListener("DOMContentLoaded", function () {
         // Locate the "Methane Actions" section by its ID
         const methaneActionsSection = document.querySelector("div.section#methane-actions");

         // If the section exists
         if (methaneActionsSection) {
             // Find the <h2> tag inside the section
             const h2Tag = methaneActionsSection.querySelector("h2");

             if (h2Tag) {
                 // Create the callout box dynamically
                 const calloutBox = document.createElement("div");
                 calloutBox.style.cssText = `
                    float: right;
                    width: 30%;
                    margin: 0 0 10px 20px;
                    border: 1px solid #ccc;
                    padding: 10px;
                    border-radius: 8px;
                    background: #f9f9f9;
                `;
                 calloutBox.innerHTML = `
                    <h4>Case Study Library</h4>
                    <p>GMI developed the Case Study Library to showcase methane mitigation successes and lessons learned. Partner Countries are invited to highlight their experiences by adding case studies to the library.</p>
                    <p><a href="/case-studies/library" class="btn btn-primary">Explore the Case Study Library</a></p>
                    
                `;

                 // Insert the callout box immediately after the <h2> tag
                 h2Tag.insertAdjacentElement("afterend", calloutBox);
             }
         }
     });
 </script>


    
    <script src="https://www.google.com/jsapi"></script>
    <script>
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);

        function drawChart() {
            var options = {
                colors: ['#2e7e56', '#f15c54', '#464379', '#696969'],
                height: 400,
                vAxis: { title: 'MMTCO2e' },
                isStacked: true,
                legend: { position: "below" }
            };

            $.ajax({
                type: "POST",
                url: "profile.aspx/GetChartData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var data = google.visualization.arrayToDataTable(response.d);
                    var chart = new google.visualization.AreaChart(document.getElementById("chart"));
                    chart.draw(data, options);
                },
                error: function (error) {
                    console.error("Chart data retrieval failed:", error);
                }
            });
        }

        // Function to get URL parameter by name
        function getUrlParameter(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        // Check if parameter 'c' equals 'finland'
        document.addEventListener("DOMContentLoaded", function () {
            const sectorButtons = document.getElementById("sectorbuttons");
            const finHeader = document.getElementById("FinHeader");
            const philHeader = document.getElementById("PhilHeader");
            const cParam = getUrlParameter("c");

            if (cParam === "finland") {
                sectorButtons.style.display = "block";
                finHeader.style.display = "block";
                philHeader.style.display = "none";
                
            } else {
                sectorButtons.style.display = "none";
                finHeader.style.display = "none";
                philHeader.style.display = "block";
            }
        });

    </script >




    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- #include virtual="/includes/footer.html" -->
</body>
</html>
