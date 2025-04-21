<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index10" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--#include file="../_register/googleAnalytics.html"-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>GMI Coal Subcommittee Meeting</title>
    <link rel="stylesheet" type="text/css" href="eventcss/eventstyles.css">
    <link rel="stylesheet" type="text/css" href="../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../_register/css/formstyles.css">
        <link rel="stylesheet" type="text/css" href="eventstyles/style.css">
</head>
<body>

    <!--#include file="include/header.html"-->

    <div class="container" style="margin-top: 3.5rem;">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-8">

                  <!--#include file="content/home.html"-->

            </div>
            <div class="col-md-4">
                <form id="form1" runat="server">

                    <fieldset>
                        <legend>Register</legend>
                        <label for="emailaddress">Enter your email address here to begin.</label><br>
                        <asp:TextBox runat="server" type="email" name="emailaddress" ID="emailaddress" class="inputfull" value="" required />

                    </fieldset>
                    <div class="centerbutton">

                        <asp:Button ID="Button1" runat="server" class="btn btn-coal" Text="Register" />
                    </div>
                </form>
            </div>
        </div>

         <!--#include file="content/homeExtended.html"-->

    </div>
    <!-- /container -->

    <!--#include file="include/footer.html"-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
