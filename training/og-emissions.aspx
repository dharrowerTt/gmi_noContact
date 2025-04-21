<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="og-emissions.aspx.vb" Inherits="M2M_Redesign.og_emissions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Methane Emissions from the Oil and Gas Industry | Training | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->

    <section class="py-5 gmi-light-blue">
        <div class="container">
            <h1>Methane Emissions from the Oil and Gas Industry</h1>

            <div class="row">
		<div class="col-sm-4">
                			<img src="https://www.globalmethane.org/assets/images/tile-methane-emmissions-from-og.jpg" style="width:100%">
		</div>
		<div class="col-sm-8">
			<p>This training provides an overview of the oil and gas industry, the associated sources of methane emissions and summarizes potential mitigation options. The training was developed by U.S. EPA in support of voluntary activities to reduce methane emissions under the EPA’s Natural Gas STAR Program and the Global Methane Initiative (GMI).</p>
			<p><a class="btn btn-primary" href="og-emissions/story.html" target="_blank" role="button">View the course</a></p>
		</div>

            </div>
</section>
<section class="py-5 bg-white">

            <div class="container">
                <h2>Course Topics</h2>

	<h3>BACKGROUND ON METHANE</h3>
	<ul>
		<li>What is methane?</li>
		<li>Where does methane come from?</li>
		<li>Which sectors are emitting the most methane in the United States?</li>
		<li>Why is it important to reduce methane emissions?</li>
	</ul>

	<h3>OVERVIEW OF THE OIL AND NATURAL GAS INDUSTRY</h3>
	<ul>
		<li>What are the main types of oil and natural gas reservoirs?</li>
		<li>What is an oil and gas field?</li>
		<li>Where are the oil and gas systems in the U.S.?</li>
		<li>What are the basic types of oil and natural gas wells?</li>
		<li>How is the supply chain of the oil and natural gas industry organized?</li>
	</ul>

	<h3>METHANE EMISSION SOURCES FROM THE OIL AND GAS INDUSTRY</h3>
	<ul>
		<li>How is methane released from oil and gas operations?</li>
		<li>What are the top emission sources?</li>
		<li>What are some of the options for mitigating methane emissions?</li>
		<li>What are the positive outcomes of capturing and using methane?</li>
		<li>What methane mitigation technologies are available?</li>
	</ul>

                </div>

</section>


	

	<button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i> Top</button>
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element');
        }
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
    </script>
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
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>

	

	
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />


	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
    
	<script>

        $(document).ready(function () {

            var table = $('#MLtable').DataTable({
                order: [[0, "desc"]],
                responsive: true,
                search: 'GMC',
                "columns": [
                    { "width": "15%" },
                    { "width": "55%" },
                    { "width": "15%" },
                    { "width": "15%" }
                ]
            });

            yadcf.init(table, [{
                column_number: 2,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Messages",
                filter_reset_button_text: false
            }, {
                column_number: 0,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Dates",
                filter_reset_button_text: false
            }, {
                column_number: 3,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Languages",
                filter_reset_button_text: false
            }]);


            $('#tableFilter').on('click', 'a', function () {
                event.preventDefault();
                $("#tableFilter a").removeClass("filterBold");
                $(this).addClass("filterBold");


                table
                    .columns(2)
                    .search($(this).text())
                    .draw();
            });

            $('#tableFilter').on('click', 'a.reset', function () {
                event.preventDefault();
                table
                    .search('')
                    .columns(2)
                    .search('')
                    .draw();
            });


        })

    </script>
	
	
	 <!-- #include virtual="/includes/footer.html" -->
 


	
	
</body>

</html>