<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.communications_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recent Communications | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="communications_index_form" runat="server">
    <div>
    
	 <section class="py-5 gmi-light-blue">
        <div class="container">
			<div class="row">
				<div class="col-sm-8">
					<h1>Recent GMI Communications</h1>
					<p>Messages distibuted through the GMI mailing list are presented below. These messages are provided for reference purposes. GMI does not actively maintain the content of messages after they have been distributed.</p>
				</div>
				<div class="col-sm-4">
					<div class="border border-secondary bg-white px-0">
						<div class="py-1 text-center bg-dark text-white"><strong>Stay Informed</strong></div>
                             <p class="py-3 px-3">To ensure that you receive all new messages, please <a href="http://eepurl.com/ggwT3T">join the GMI mailing list</a>.
								 <br><br>
							<a href="http://eepurl.com/ggwT3T" role="button" class="btn btn-outline-primary">Sign Up</a></p>
					</div>

				</div>
			</div>
		</div>
	</section>
	<section class="py-5 bg-white">
        <div class="container">

                           <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="dateofSend" HeaderText="Date Sent"  />
        <asp:BoundField DataField="subjectLine" HeaderText="Subject Line"  />
        <asp:BoundField DataField="msgURl" HeaderText="URL"  />
        <asp:BoundField DataField="areaOfInterest" HeaderText="Area of Interest"  />
        <asp:BoundField DataField="language" HeaderText="Language" />
    </Columns>
</asp:GridView>
               
              			
		</div>
	</section>


	</form>
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
    window.onscroll = function() {scrollFunction()};

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
            var Commstable = $('#gvComms').DataTable({
                orderCellsTop: true,
                "order": [[0, "desc"]],
                columnDefs: [
                    {
                        "render": function (data, type, row) {
                            return '<a href="email.aspx?c=' + row[2] + '">' + row[1] + ' </a>';
                        },
                        "title": "Message",
                        "targets": [1]
                    },
                    {
                        "targets": [3, 4],
                        "sortable": false
                    },
                    {
                        "targets": [2],
                        "visible": false
                    }],
                initComplete: function () {
                    
                    this.api().columns([3,4]).every(function () {
                        var column = this;
                        var select = $('<select><option value="">' + $(this.header()).text()  + '</option></select>')
                            .appendTo($(column.header()).empty())
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });
                }
            });
               
            });





    </script>



	
	
	
	
 


	
	
</body>

</html>