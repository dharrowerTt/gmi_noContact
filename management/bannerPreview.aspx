<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="bannerPreview.aspx.vb" Inherits="M2M_Redesign.bannerPreview" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banner Preview</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
    <style>
        body {
            background-color: #f8f9fa; /* Light gray background */
        }
        .carousel {
            max-width: 900px;
            margin: auto;
        }
        .carousel-item {
            height: 300px;
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body>

    <div id="headercarouselarea" class="carousel slide carousel-fade" data-ride="carousel" data-interval="5000" aria-label="Featured Items Carousel">
        <ol class="carousel-indicators">
            <asp:Literal ID="carouselIndicators" runat="server"></asp:Literal>
        </ol>

        <div class="carousel-inner" role="region" aria-label="Carousel Content">
            <asp:Literal ID="carouselInner" runat="server"></asp:Literal>
        </div>

        <a class="carousel-control-prev" href="#headercarouselarea" role="button" data-slide="prev" aria-label="Previous Slide">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#headercarouselarea" role="button" data-slide="next" aria-label="Next Slide">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function(){
            $('#headercarouselarea').carousel();
        });
    </script>

</body>
</html>
