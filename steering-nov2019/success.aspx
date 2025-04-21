<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="success.aspx.vb" Inherits="M2M_Redesign.success105" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

         <!--#include file="../_register/googleAnalytics.html"-->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>GMI Steering Committee Meeting</title>
    <link rel="stylesheet" type="text/css" href="eventcss/eventstyles.css">
    <link rel="stylesheet" type="text/css" href="../register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../register/css/formstyles.css">
  </head>
  <body>

       <!--#include file="include/header.html"-->

 
        <div class="container" style="margin-top:3.5rem;">
          <!-- Example row of columns -->
          <div class="row">
            <div class="col-md-12">
              <h2>You are registered!</h2>
              <p>You are registered for the meeting. Please <a href="mailto:secretariat@globalmethane.org?subject=Biogas Subcommittee Meeting">contact us</a> if you need to update your registration.</p>

              <p><strong>Name:</strong>  <%= fName %> <%= lName %></p>
                <p><strong>Email:</strong> <%= emailAddress %></p>
                <p><strong>Registered Date:</strong> <%= signUpDate %></p>
<br>


              

            </div>
          </div>
  
        </div> <!-- /container -->
  
      <!--#include file="include/footer.html"-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>