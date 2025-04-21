<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="smartplus_files.aspx.vb" Inherits="M2M_Redesign.smartplus_files" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Download | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
        .buttons-html5 {
            margin-left: 20px;
        }
.warning{
color:red;
}
    </style>
</head>
<body>

    <!-- #include virtual="/includes/header.html" -->
  
        <section class="py-5 gmi-light-blue">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <h1 id="mainText">file_to_download</h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-white">
		<div class="container">
			<div class="row">
				<div id="divCenter" runat="server" class="col-md-9">
                    <h3 id="titleText">Download links</h3>
                  <p id="files">

                  </p>

			</div>
                <div class="col-md-3">
		
				</div>
            </div>
		</div>
	</section>

    <script>

        function MyJSFunction() {
            console.log("hello");
        }
    </script>





    <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i>Top</button>

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
    <!-- #include virtual="/includes/footer.html" -->

    <script>
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] == variable) { return pair[1]; }
            }
            return (false);
        }

        var Resource = getQueryVariable("id");

        var HeaderArea = document.getElementById("titleText");
        var HeaderImage = document.getElementById("titleImage");
        var mainText = document.getElementById("mainText");
        var files = document.getElementById("files");

        if (Resource == "1") {
            HeaderArea.textContent = "SMART Plus Facility Template (v1.0)";
            mainText.textContent = "SMART Plus Facility Template (v1.0)";
            files.innerHTML = `
            <ul>
                <li><a href="https://globalmethane.org/smartplus/1/SMART Plus - Facility.v1.0.xlsx" target="_blank">SMART Plus - Facility.v1.0.xlsx</a></li>
                <li><a href="https://globalmethane.org/smartplus/1/SMART Plus - Technical Documentation.pdf" target="_blank">SMART Plus - Technical Documentation.docx</a></li>
                <li><a href="https://globalmethane.org/smartplus/1/SMART Plus - Facility Template Manual.pdf" target="_blank">SMART Plus - Facility Template Manual.docx</a></li>
            </ul>`;
        } else if (Resource == "2") {
            HeaderArea.textContent = "SMART Plus Database Application (v1.0)";
            mainText.textContent = "SMART Plus Database Application (v1.0)";
            files.innerHTML = `
            <ul>
                <li><a href="https://globalmethane.org/smartplus/2/SMART Plus – Database.accdb" target="_blank">SMART Plus – Database.accdb</a></li>
                <li><a href="https://globalmethane.org/smartplus/2/SMART Plus - Database Manual.pdf" target="_blank">SMART Plus - Database Manual.pdf</a></li>
            </ul>`;
        } else if (Resource == "3") {
            HeaderArea.textContent = "SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)";
            mainText.textContent = "SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)";
            files.innerHTML = `
            <ul>
                <li><a href="https://globalmethane.org/smartplus/3/SMART Plus – IPCC.v1.0.xlsx" target="_blank">SMART Plus – IPCC.v1.0.xlsx</a></li>
            </ul>`;
        } else {
            HeaderArea.textContent = "Invalid Resource";
            mainText.textContent = "Resource not found. Please check the URL.";
            files.innerHTML = `<p class="warning">No download links available for the specified resource.</p>`;
        }
       
        document.title = "Download " + mainText.textContent;

        function myRedirectFunction() {
            setTimeout(myURL, 5000);
        }

        function myURL() {
            window.history.go(-2);
        }
    </script>
</body>
</html>