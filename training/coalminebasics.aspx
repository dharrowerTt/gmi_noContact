<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="coalminebasics.aspx.vb" Inherits="M2M_Redesign.coalminebasics" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Basics of Coal Mine Methane Training | Training | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->

	<section class="py-5 gmi-light-blue">
        <div class="container">
            <h1>Basics of Coal Mine Methane Training</h1>

            <div class="row">
				<div class="col-sm-4">
                <img src="images/CMM 101.jpg"
                    style="float:right;max-width:350px; padding-left:20px; padding-bottom:20px;">
				</div>
				<div class="col-sm-8">
                <p>
                    This training provides basic information about methane that is emitted through coal mining and summarizes potential mitigation options. The training was developed by U.S. EPA and reviewed by the Coal Mines Subcommittee in support of voluntary activities to reduce methane emissions under the Coalbed Methane Outreach Program (CMOP) and the Global Methane Initiative (GMI). The following topics are covered in the course:
<ul>
<li>Why is there methane in coal?</li>
<li>What are the primary methods of extracting coal?</li>
<li>What are the characteristics of methane emissions from coal mines?</li>
<li>How is methane captured using mine ventilation and gas drainage?</li>
<li>What are the beneficial uses of captured methane?</li>
</ul>
                    
                </p>

<p>View the <a href="coalminebasics/story.html">Basics of Coal Mine Methane Training Course</a>. </p>
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
	
	
	
 


	
	
</body>

</html>