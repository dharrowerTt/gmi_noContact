<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="details.aspx.vb" Inherits="M2M_Redesign.details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Case Study Library Details | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
        .top-thumbnail {
            width: 100%;
            height: auto;
        }

        .sidebar {
            border: 1px solid #ccc;
            padding: 20px;
        }

        #caseStudyDetails {
            padding-bottom: 40px;
        }

        .related-case-studies {
            background-color: #f0f0f0;
            padding: 30px 0;
        }

        .related-case-studies .card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
            margin-bottom: 15px;
        }

        .related-case-studies .card-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .related-case-studies .card-title {
            font-size: 1rem;
            text-align: center;
            margin-top: 10px;
        }

        .related-case-studies .card-footer {
            margin-top: auto;
            text-align: center;
        }

        .related-case-studies .card-img-top {
            width: 100%;
            height: 180px;
            object-fit: cover;
            object-position: right top;
            overflow: hidden;
        }

        .country-pill {
            display: inline-block;
            background-color: #e6f1fc;
            color: #232354;
            padding: 2px 8px;
            margin: 2px 2px 5px 0;
            border-radius: 12px;
            font-size: 12px;
        }

        .country-list {
            margin-top: 10px;
        }

        .breadcrumb {
            background-color: #fcfcfc;
        }
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="form1" runat="server">
        <section class="py-5 gmi-light-blue">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <a id="linkBackToStudies" runat="server" class="breadcrumb">Back to Case Studies</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <img id="imgThumbnail" runat="server" class="top-thumbnail" alt="Case Study Thumbnail" />
                    </div>
                    <div class="col-md-9">
                        <h2 id="lblTitle" runat="server"></h2>
                        <asp:HyperLink ID="btnViewCaseStudy" runat="server" CssClass="btn btn-primary mt-3" Text="View Case Study" />
                    </div>
                </div>
            </div>
        </section>

        <section class="pt-5 bg-white" id="caseStudyDetails">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 sidebar bg-light">
                        <h4>Case Study Details</h4>
                        <asp:Literal ID="litGmiSectors" runat="server" Visible="False"></asp:Literal>
                        <asp:Literal ID="litTopics" runat="server" Visible="False"></asp:Literal>
                        <asp:Literal ID="litCountryApplicability" runat="server" Visible="False"></asp:Literal>
                        <asp:Literal ID="litStartDate" runat="server" Visible="False"></asp:Literal>
                        <!-- New Literal for Learn More Button -->
                        <asp:Literal ID="litLearnMoreButton" runat="server" Visible="False"></asp:Literal>
                    </div>
                    <div class="col-md-9">
                        <h3>Summary</h3>
                        <asp:Literal ID="litBriefSummary" runat="server"></asp:Literal>
                    </div>
                </div>
                                        <div class="row mt-3">
                <div class="col-md-12">
                    <div class="alert alert-info" role="alert" style="background:white!important;">
 The GMI Case Study Library was developed to share best practices and lessons learned from real-world methane mitigation experiences. Any reference in any case study to a specific company or commercial product or service by trade name, trademark, manufacturer, company or otherwise does not constitute or imply the endorsement or recommendation of GMI, U.S. Environmental Protection Agency, or other partners.
</div>
                </div>
            </div>
            </div>
        </section>

        <section class="py-5 related-case-studies">
            <div class="container">
                <h3 class="text-center">Related Case Studies</h3>
                <div class="row">
                    <div class="col-md-12">
                        You may be interested in these case studies that match the same countries. Up to four are shown. Return to the <a href="index.aspx">Case Study Library</a> to view more.
                    </div>
                </div>
                <div class="row">
                    <asp:Repeater ID="rptRelatedCaseStudies" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <div class="card">
                                    <img src='<%# "thumbs/" & Eval("thumbnail") %>' alt='<%# Eval("csTitle") %>' class="card-img-top" />
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("csTitle") %></h5>
                                    </div>
                                    <div class="card-footer">
                                        <a href='details.aspx?id=<%# Eval("ID") %>' class="btn btn-primary btn-block">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
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
    </form>

    <!-- #include virtual="/includes/footer.html" -->
</body>
</html>
