<%@ Page Language="vb" AutoEventWireup="false"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->

    <script language="VB" runat="server">
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            Dim errMsg As String = vbEmpty
            Dim statusCode As Integer = 0

            If (IsNothing(Server.HtmlEncode(Request.QueryString("Code"))) = False) Then
                If Integer.TryParse(Server.HtmlEncode(Request.QueryString("Code")), 0) Then
                    statusCode = Server.HtmlEncode(Request.QueryString("Code"))
                End If
            End If

            Select Case statusCode
                Case 307    'Temporary Redirect
                    errMsg = "We apologize for the inconvenience. The website is experiencing an unusually high volume of requests. Please try your search again at a later time. "
                Case 403    'Forbidden
                    errMsg = "A problem occurred with your last request. If this persists, please contact the site administrator via email at <a href='mailto:secretariat@globalmethane.org?subject=Site error'>secretariat@globalmethane.org</a>"
                Case 404    'Not Found
                    errMsg = "The page you are looking for has moved or no longer exists. <br/>Please use the site navigation or search function to find the page you are looking for."
                Case 503    'Service Unavailable
                    errMsg = "Sorry, service is currently unavailable. Please try later."
                Case Else
                    errMsg = "A problem occurred with your last request. If this persists, please contact the site administrator via email at <a href='mailto:secretariat@globalmethane.org?subject=Site error'>secretariat@globalmethane.org</a>"

            End Select

            lblMessage.Text = errMsg
        End Sub

</script>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="error" runat="server">
    <div>
    
	<!-- Page Content -->
     <section class="py-5 gmi-light-blue">
        <div class="container">
            <h1>Oops!</h1>
            <p>We can't find the page you are looking for or we cannot process your request.</p>
            <asp:Literal ID="lblMessage" runat="server" ></asp:Literal>
            <p>Please <a href="/contact-us/index.aspx">contact us</a> if you are having persistent issues with this website.</p>
        </div>
    </section>
    <section class="py-5">
        <div class="container">
            <button onclick="goBackf()" type="button" class="btn btn-primary">Go Back</button>
        </div>
    </section>
    </div>
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
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	
	
    <script type="text/javascript">
        $(document).ready(function () {
            var table = $('#list').DataTable({
                "columnDefs": [{
                        "visible": false,
                        "targets": 3
                    },
                    {
                        "orderable": false,
                        "targets": '_all'
                    }
                ],

                "order": [
                    [3, 'asc']
                ],
                "drawCallback": function (settings) {
                    var api = this.api();
                    var rows = api.rows({
                        page: 'current'
                    }).nodes();
                    var last = null;

                    api.column(3, {
                        page: 'current'
                    }).data().each(function (group, i) {
                        if (last !== group) {
                            $(rows).eq(i).before(
                                '<tr class="bg-secondary text-white text-center align-middle"><td colspan="5"><h3>' + group +
                                '</h3></td></tr>'
                            );

                            last = group;
                        }
                    });
                },
                initComplete: function () {
                    this.api().columns([1, 2, 3, 4, 5]).every(function () {
                        var column = this;
                        var select = $('<br><select style="width:95%;"><option value=""></option></select>')
                            .appendTo($(column.header()))
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d +
                                '</option>')
                        });
                    });
                },
                "lengthMenu": [
                    [10, 25, 50, 100, -1],
                    [10, 25, 50, 100, "All"]
                ],
                iDisplayLength: 25,
                dom: 'lfrBtip',
                scrollX: true,
                buttons: [
                    'copyHtml5','excelHtml5'
                ]
			});

            $('#mySector').on('change', function () {
                table.columns(3).search(this.value).draw();
            });

            function getURLParameter(name) {
                return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location
                    .search) || [, ""])[1].replace(/\+/g, '%20')) || null
            }

            var val = getURLParameter('sector');
            if (val > "") {
            $('#mySector').val(val);
            table.columns(3).search(val).draw();
            }
            var val = getURLParameter('country');
            if (val > "") {
            $('#mySector').val(val);
            table.columns(2).search(val).draw();
            }
        });

    </script>

    <script type="text/javascript" language="javascript" class="init">
        // Order by the grouping
        $('#list tbody').on('click', 'tr.group', function () {
            var currentOrder = table.order()[0];
            if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                table.order([2, 'desc']).draw();
            } else {
                table.order([2, 'asc']).draw();
            }
        });
    </script>	

<script>

    function goBackf() {
   
        window.history.go(-2);
    }


var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};

	
	
//tests the url for a type of resources based on the filter option values
$( document ).ready(function () {
		var tagsearchvalue = "";
	
		var sectorValue = getUrlParameter("sector");
		if (typeof sectorValue === 'undefined' || sectorValue === null) {
			document.getElementById('mySector').selectedIndex = 0;
			var sectorValue = "";
		} else {
			document.getElementById('mySector').value = sectorValue;
			tagsearchvalue = tagsearchvalue + ' ' + sectorValue
		};

	
		var table = $('#list').DataTable();
        table 
			.columns( 3 )
			.search(tagsearchvalue)
            .draw();

});
	

</script>
	
	
</body>
</html>
