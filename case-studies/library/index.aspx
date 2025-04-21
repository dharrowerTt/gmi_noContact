<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index13" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex, nofollow">
    <title>Case Study Library | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <link rel="stylesheet" href="https://unpkg.com/tippy.js@6/dist/tippy.css" />
    <link rel="stylesheet" href="https://unpkg.com/tippy.js@6/animations/scale.css" />
    <style>
        .thumbnail {
            width: 200px;
            height: auto;
        }

        .gvCell {
            vertical-align: top;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            border-top: none;
            border-left: none;
            border-right: none;
        }

        .gvHeader {
            vertical-align: top;
            border: none;
        }

        .display th, .display td {
            border-left: none;
            border-right: none;
        }

        .display th {
            text-align: left;
            font-weight: bold;
            border-bottom: 2px solid #ddd;
        }

        .case-study-type-box {
            text-align: center;
            padding: 10px;
            cursor: pointer;
            position: relative;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            border-radius: 8px;
        }

            .case-study-type-box svg {
                width: 100%;
                height: 100px;
                border-radius: 8px;
            }

            .case-study-type-box p {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                margin: 0;
                padding: 0;
                font-size: 16px;
            }

        .country-pill {
            display: inline-block;
            background-color: #e6f1fc;
            color: #232354;
            padding: 2px 8px;
            margin: 2px;
            border-radius: 12px;
            font-size: 12px;
            white-space: nowrap;
        }

        .tippy-box[data-theme~='light-border'] {
            font-size: 1rem;
            text-align: center;
        }

.carousel-content {
    display: flex;
    flex-direction: row;
    width: 90%; /* Reduce width to allow space for controls */
    margin: 0 auto; /* Center within the carousel */
    height: 100%;
    overflow: hidden;
    box-sizing: border-box;
}

.thumbnail-content {
    width: 50%;
    display: flex;
    align-items: flex-start;
    justify-content: center;
    overflow: hidden;
    position: relative;
}

.thumbnail-content img {
    width: 100%;
    max-height: 100%;
    object-fit: contain;
    overflow: hidden;
}

.text-content {
    width: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    color: white;
    padding: 20px;
    box-sizing: border-box;
    position: relative;
    z-index: 2;
}

.text-content h2 {
    font-size: 1.8em; /* Adjusted for readability */
    line-height: 1.2;
    margin-bottom: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    max-height: 60%;
}

.text-content a.btn {
    align-self: start;
    margin-top: auto;
    padding: 10px 20px;
    font-size: 1em;
    font-weight: bold;
}

/* Carousel Control Positioning */
.carousel-control-prev,
.carousel-control-next {
    width: 5%; /* Narrow the control area width */
    z-index: 3;
    position: absolute;
    top: 50%;
    transform: translateY(-50%); /* Center vertically */
}

.carousel-control-prev {
    left: 10px; /* Position inside carousel */
}

.carousel-control-next {
    right: 10px; /* Position inside carousel */
}

@media (max-width: 768px) {
    #caseStudyCarousel {
        display: none;
    }
}



    </style>
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />


</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
<div id="caseStudyCarousel" class="carousel slide carousel-fade" data-ride="carousel" data-interval="10000">
    <!-- Carousel Indicators -->
    <ol class="carousel-indicators">
        <asp:Repeater ID="rptIndicators" runat="server">
            <ItemTemplate>
                <li data-target="#caseStudyCarousel" data-slide-to="<%# Container.ItemIndex %>" class="<%# If(Container.ItemIndex = 0, "active", "") %>"></li>
            </ItemTemplate>
        </asp:Repeater>
    </ol>

    <!-- Carousel Items -->
    <div class="carousel-inner" role="listbox">
        <asp:Repeater ID="rptCarousel" runat="server">
            <ItemTemplate>
                <div class="carousel-item <%# If(Container.ItemIndex = 0, "active", "") %>" 
                     style='<%# GradientStyle(Container.ItemIndex) %>'>
                    <div class="carousel-content d-flex">
                        <!-- Thumbnail Image on Left -->
                        <div class="thumbnail-content" style="flex: 1; display: flex; align-items: center; justify-content: center;">
                            <img src="thumbs/<%# Eval("thumbnail") %>" alt="Thumbnail" style="max-width: 100%; height: auto;">
                        </div>
                        <!-- Text Content on Right -->
                        <div class="text-content" style="flex: 1; color: white; padding: 20px;">
                            <h2 class="display-5" style="color:white;">
                                <span style="font-size:1.4em;font-weight:bold;"><%# Eval("csTitle") %></span>
                            </h2>
                            <p><a href='<%# Eval("url") %>' class="btn btn-success btn-sm" target="_blank" role="button">View Details</a></p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Carousel Controls -->
    <a class="carousel-control-prev" href="#caseStudyCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#caseStudyCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </a>
</div>


    <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 vertSplitter">
                    <h1>Case Study Library</h1>
                    <p>
                        GMI is committed to fostering best practices based on real-world methane mitigation experiences that demonstrate positive achievements and lessons learned. This library provides access to case studies developed through efforts over several years, including the <a href="https://globalmethane.org/2024forum/showcase.html">Methane Action Showcase poster</a>, the <a href="https://globalmethane.org/pmf/CaseStudies">Policymaker Framework</a>, and the <a href="https://globalmethane.org/challenge/showcase.html">Global Methane Challenge</a>. New case studies will be added here as they become available. We encourage stakeholders to contribute case studies that will help others take action successfully to mitigate methane.                        
                        <br />
                        <br />
                        Use the search box and filters to find case studies.
                    </p>
                </div>
                <div class="col-sm-4">
                    <div class="border border-secondary bg-white px-0">
                        <div class="py-1 text-center bg-dark text-white"><strong>Recommend A Case Study</strong></div>
                        <p class="m-3"><strong>Recommend a case study.</strong> GMI invites you to recommend a new case study for inclusion in our library. Use the <a href="https://www.globalmethane.org/case-studies/submit.aspx">submission form</a> to share projects, policies, technologies, and activities that successfully reduce global methane emissions. </p>
                        <a href="https://www.globalmethane.org/case-studies/submit.aspx" class="btn btn-outline-primary m-3">Submit a Case Study Idea</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-white" id="upcomingevents" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-info" role="alert" style="background:white!important;">
 The GMI Case Study Library was developed to share best practices and lessons learned from real-world methane mitigation experiences. Any reference in any case study to a specific company or commercial product or service by trade name, trademark, manufacturer, company or otherwise does not constitute or imply the endorsement or recommendation of GMI, U.S. Environmental Protection Agency, or other partners.
</div>
                </div>
            </div>
            <form id="form1" runat="server">
                <div>
                    <div class="row">
                        <div class="col-md-12">
                            <h3>Filters</h3>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-md-4">
                            <div class="filter-container">
                                <label for="gmiSectorFilter"><strong>GMI Sector:</strong></label>
                                <select id="gmiSectorFilter" multiple="multiple" style="width: 100%;">
                                    <option value="Biogas">Biogas</option>
                                    <option value="Coal Mines">Coal Mines</option>
                                    <option value="Oil & Gas">Oil & Gas</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="filter-container">
                                <label for="topicFilter"><strong>Topic:</strong></label>
                                <select id="topicFilter" multiple="multiple" style="width: 100%">
                                    <!-- Options will be dynamically populated based on the table data -->
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="filter-container">
                                <label for="countryFilter"><strong>Country:</strong></label>
                                <select id="countryFilter" multiple="multiple" style="width: 100%">
                                    <!-- Options will be dynamically populated based on the table data -->
                                </select>
                            </div>
                        </div>
                       <!-- <div class="col-md-3">
                            <div class="filter-container">
                                <label for="sourceFilter"><strong>Source:</strong></label>
                                <select id="sourceFilter" multiple="multiple" style="width: 100%;">
                                   
                                </select>
                            </div>
                        </div>-->
                    </div>

                    <asp:GridView ID="gvCaseStudies" runat="server" AutoGenerateColumns="False" CssClass="display" OnPreRender="gvCaseStudies_PreRender">
                        <Columns>
                            <asp:TemplateField HeaderText="Thumbnail" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <img src='<%# If(Eval("thumbnail") IsNot DBNull.Value, "thumbs/" & Eval("thumbnail"), "thumbs/default.png") %>' alt="Thumbnail" class="thumbnail" />
                                </ItemTemplate>
                                <ItemStyle CssClass="gvCell" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Case Study" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <strong><%# If(Eval("csTitle") IsNot DBNull.Value, Eval("csTitle"), "N/A") %></strong><br />                                  
                                    <small>
                                        <%# If(Eval("countryApplicability") IsNot DBNull.Value, FormatCountries(Eval("countryApplicability").ToString()), "N/A") %>
                                    </small>
                                    <br />
                                    <%# If(Eval("briefSummary") IsNot DBNull.Value, Eval("briefSummary"), "No summary available.") %><br />
                                    <a href='details.aspx?id=<%# Eval("ID") %>'>Case study details</a>
                                </ItemTemplate>
                                <ItemStyle CssClass="gvCell" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="GMI Sectors" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <%# If(Eval("gmiSectors") IsNot DBNull.Value, Eval("gmiSectors"), "N/A") %>
                                </ItemTemplate>
                                <ItemStyle CssClass="gvCell" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Topics" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <%# If(Eval("topics") IsNot DBNull.Value, Eval("topics"), "N/A") %>
                                </ItemTemplate>
                                <ItemStyle CssClass="gvCell" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Country Applicability" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <%# If(Eval("countryApplicability") IsNot DBNull.Value, Eval("countryApplicability"), "N/A") %>
                                </ItemTemplate>
                                <ItemStyle CssClass="gvCell" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="startDate" HeaderText="Timeframe" DataFormatString="{0:yyyy}" HeaderStyle-CssClass="gvHeader" ItemStyle-CssClass="gvCell" />
                            <asp:TemplateField HeaderText="Source" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <%# If(Eval("source") IsNot DBNull.Value, Eval("source"), "N/A") %>
                                </ItemTemplate>
                                <ItemStyle CssClass="gvCell" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" HeaderStyle-CssClass="gvHeader">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlCaseStudy" CssClass="btn btn-primary" runat="server" 
    NavigateUrl='<%# If(Eval("url") IsNot DBNull.Value, Eval("url"), "#") %>' 
    Text='<%# If(Eval("csType") IsNot DBNull.Value, Eval("csType").ToString(), "Case Study") %>' />
                                </ItemTemplate>
                                <ItemStyle CssClass="gvCell" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </form>
        </div>
            <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i> Top</button>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element');
        }
    </script>
    <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElem<a href="../../clsEventVO.vb">../../clsEventVO.vb</a>entInit"></script>
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
            event.preventDefault();
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    </section>
     <!-- #include virtual="../../includes/footer.html" -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.min.js"></script>

<script>
    $(document).ready(function () {
        var table = $('.display').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true, // Enable ordering
            "info": true,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "dom": '<"top"lfipr>t<"bottom"p>',
            "order": [[5, 'desc'], [1, 'asc']], // Default order: Year (index 5) descending, then Title (index 1) ascending
            "columnDefs": [
                { "targets": [2, 3, 4, 6], "visible": false }, // Hide certain columns
                {
                    "targets": 5, // Make Year column sortable
                    "orderable": true,
                    "title": "Year"
                },
                {
                    "targets": 1, // Ensure the title column is sortable
                    "orderable": true,
                    "title": "Case Study"
                },
                {
                    "targets": 0, // Thumbnail should not be sorted
                    "orderable": false,
                    "title": ""
                }
            ],
            "initComplete": function () {
                // Add a reset link after the info section
                $('.top').append('<span id="resetFilters" style="cursor: pointer; font-size: 0.9em; margin-left: 15px; color: #007bff;">Reset all filters</span>');

                // Event listener for reset link
                $('#resetFilters').on('click', function () {
                    // Clear all select2 dropdowns
                    $('#gmiSectorFilter, #topicFilter, #countryFilter').val(null).trigger('change');

                    // Clear search and redraw table
                    table.search('').columns().search('').draw();
                });
            }
        });

        // Initialize Select2 for multi-select dropdowns
        $('#gmiSectorFilter, #topicFilter, #countryFilter').select2();

        // Populate filters (removed source-related logic)
        var uniqueTopics = new Set();
        table.column(3).data().each(function (value) {
            if (value) {
                var topics = value.split(';');
                topics.forEach(function (topic) {
                    uniqueTopics.add(topic.trim());
                });
            }
        });
        var sortedTopics = Array.from(uniqueTopics).sort();
        sortedTopics.forEach(function (topic) {
            $('#topicFilter').append(new Option(topic, topic));
        });

        var uniqueCountries = new Set();
        table.column(4).data().each(function (value) {
            if (value) {
                var countries = value.split(';');
                countries.forEach(function (country) {
                    uniqueCountries.add(country.trim());
                });
            }
        });
        var sortedCountries = Array.from(uniqueCountries).sort();
        sortedCountries.forEach(function (country) {
            $('#countryFilter').append(new Option(country, country));
        });

        // Custom filtering functions (updated to remove source filter)
        $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
            var selectedSectors = $('#gmiSectorFilter').val();
            var gmiSectors = data[2] || "";

            if (selectedSectors === null || selectedSectors.length === 0) {
                return true;
            }

            for (var i = 0; i < selectedSectors.length; i++) {
                if (gmiSectors.includes(selectedSectors[i])) {
                    return true;
                }
            }

            return false;
        });

        $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
            var selectedTopics = $('#topicFilter').val();
            var topics = data[3] || "";

            if (selectedTopics === null || selectedTopics.length === 0) {
                return true;
            }

            var topicArray = topics.split(';').map(function (topic) {
                return topic.trim();
            });

            for (var i = 0; i < selectedTopics.length; i++) {
                if (topicArray.includes(selectedTopics[i])) {
                    return true;
                }
            }

            return false;
        });

        $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
            var selectedCountries = $('#countryFilter').val();
            var countries = data[4] || "";

            if (selectedCountries === null || selectedCountries.length === 0) {
                return true;
            }

            var countryArray = countries.split(';').map(function (country) {
                return country.trim();
            });

            for (var i = 0; i < selectedCountries.length; i++) {
                if (countryArray.includes(selectedCountries[i])) {
                    return true;
                }
            }

            return false;
        });

        $('#gmiSectorFilter, #topicFilter, #countryFilter').on('change', function () {
            table.draw();
        });

        tippy('.case-study-type-box', {
            placement: 'top',
            animation: 'scale',
            theme: 'light-border',
            delay: [100, 100],
            duration: [200, 100],
            maxWidth: '200px',
            arrow: true,
            onShow(instance) {
                instance.popper.style.transformOrigin = 'bottom';
            },
            onHidden(instance) {
                instance.popper.style.transitionTimingFunction = 'ease-in-out';
            },
        });
    });
</script>


  

</body>
</html>
