<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="carouselLoader.aspx.vb" Inherits="M2M_Redesign.carouselLoader" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Carousel Loader</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Literal ID="litCarousel" runat="server"></asp:Literal>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
