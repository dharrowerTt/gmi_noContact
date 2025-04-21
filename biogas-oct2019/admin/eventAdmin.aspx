<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="eventAdmin.aspx.vb" Inherits="M2M_Redesign.eventAdmin" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--#include file="../../_register/googleAnalytics.html"-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>GMI Biogas Subcommittee Meeting</title>
    <link rel="stylesheet" type="text/css" href="../eventcss/eventstyles.css">
    <link rel="stylesheet" type="text/css" href="../../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../../_register/css/formstyles.css">



</head>
<body>

    <!--#include file="../include/header.html"-->

    <div class="container" style="margin-top: 3.5rem;">
                <div class="row">
            <div class="col-md-12">
    <form id="form1" runat="server">
    <div>
    <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
    </div>
    </form>
 </div>
        </div>

    </div>
    <!-- /container -->

    <!--#include file="../include/footer.html"-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <!-- DataTable -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/plug-ins/1.10.19/dataRender/datetime.js"></script>

    <script>
        $(document).ready(function () {
            $('#table').DataTable({
                            });
        });
    </script>
</body>
</html>

