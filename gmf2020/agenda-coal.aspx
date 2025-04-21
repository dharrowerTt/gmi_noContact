<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="agenda-coal.aspx.vb" Inherits="M2M_Redesign.agenda_coal" %>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
      <!--#include file="../_register/googleAnalytics.html"-->
    
      <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Global Methane Forum 2020</title>

    <link rel="stylesheet" type="text/css" href="../_register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="include/animate.css">
    <link rel="stylesheet" type="text/css" href="include/obnoxious.css">
    <link rel="stylesheet" type="text/css" href="../_register/css/formstyles.css">
    <link rel="stylesheet" type="text/css" href="eventcss/eventstyles.css">
          <script src="https://use.fontawesome.com/f40f14ac2c.js"></script>
          <meta name="theme-color" content="#0d5d84" />
  </head>
  <body>

  <div id="page-container">
   <div id="content-wrap">
    <!--#include file="include/header.html"-->


            <!--#include file="content/agenda-coal.html"-->

     
       </div>
    <!--#include file="include/footer.html"-->
         </div>
          <script>
        var element = document.getElementById("agendaLink");
        element.classList.add("active");
    </script>
    <!-- Optional JavaScript -->

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script>
      jQuery(document).ready(function() {
         jQuery(".main-table").clone(true).appendTo('#table-scroll').addClass('clone');   
       });
      </script>
  </body>
</html>
