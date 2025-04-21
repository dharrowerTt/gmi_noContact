<%@ Page Title="Case Study Library Management" Language="vb" AutoEventWireup="false" MasterPageFile="~/management/MasterPage.master" CodeBehind="csLibrary.aspx.vb" Inherits="M2M_Redesign.csLibrary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    Case Study Library Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <section class="py-3">
        <div class="container">
            <a href="csEdit.aspx" class="btn btn-primary">Add New Case Study</a>
        </div>
    </section>
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
    <section class="py-5 bg-white" id="csLibraryManagement">
        <div class="container">
            <form id="form1" runat="server">
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
                            <select id="topicFilter" multiple="multiple" style="width: 100%"></select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="filter-container">
                            <label for="countryFilter"><strong>Country:</strong></label>
                            <select id="countryFilter" multiple="multiple" style="width: 100%"></select>
                        </div>
                    </div>
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
                        <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="gvHeader">
                            <ItemTemplate>
                                <a href="csEdit.aspx?id=<%# Eval("ID") %>" class="btn btn-link">Edit</a>
                            </ItemTemplate>
                            <ItemStyle CssClass="gvCell" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </form>
        </div>
    </section>

    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
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
                { "targets": [0,2, 3, 4], "visible": false }, // Hide certain columns
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



</asp:Content>
