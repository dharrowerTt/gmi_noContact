<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="success.aspx.vb" Inherits="M2M_Redesign.success110" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

         <!--#include file="../_register/googleAnalytics.html"-->
      <!--#include file="include/metaproperties.html"-->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Global Methane Forum 2020</title>
    <link rel="stylesheet" type="text/css" href="eventcss/eventstyles.css">
    <link rel="stylesheet" type="text/css" href="../register/css/addon.css">
    <link rel="stylesheet" type="text/css" href="../register/css/formstyles.css">
          <script src="https://use.fontawesome.com/f40f14ac2c.js"></script>
            <style>
          .hidden{
              display:none;
          }
      </style>
  </head>
  <body>

  <div id="page-container">
   <div id="content-wrap">
    <!--#include file="include/header.html"-->

 
        <div class="container" style="margin-top:3.5rem;">
          <!-- Example row of columns -->
          <div class="row">
            <div class="col-md-12">
              <h2>You are registered!</h2>
                
              <p>You are registered for the meeting. Please <a href="mailto:secretariat@globalmethane.org?subject=GMF2020">contact us</a> if you need to update your registration.</p>

                 <div id="speakerdiv" runat="server" class="alert alert-success hidden"><strong>Thank you!</strong>&nbsp;You have finalized your registration as a speaker. Please continue to your <a href="speakers/admin.aspx?id=<%= emailAddress %>">Speaker Admin Page</a> to complete your profile.</div> 
   
              <p><strong>Name:</strong>  <%= fName %> <%= lName %></p>
                <p><strong>Email:</strong> <%= emailAddress %></p>
                <p><strong>Organization:</strong> <%= organization %></p>
                <p><strong>Registered Date:</strong> <%= signUpDate %></p>
<br>

<h2>Attention</h2>
<p>GMF 2020 is being hosted by UNECE at the Palais des Nations, Geneva, Switzerland.  All participants must also register with UNECE to obtain access to the event.  To register with UNECE:</p>
<ol>
<li>Go to <a href='https://www.unece.org/index.php?id=52506' target='_blank'>UNECE’s Global Methane Forum 2020 event page<a>.  Scroll to the bottom of the page where registration information and documentation are presented. </li>
<li>On the Registration tab, click the “ONLINE REGISTRATION” link.</li>
<li>Log into the UNCDB Online Meeting Registration system.  Participants who have previously registered to attend a UNECE event will have an existing user account.  If this is your first time, create a new account to begin.</li>
</ol>
</p>
  </div>
          </div>
             <div class="row" style="text-align:center;">
                 <div class="col-sm-12" style="text-align:center;">
                 <video width="600" controls style="text-align:center;">
  <source src="eventvideo/unecelink.mp4" type="video/mp4">
Your browser does not support the video tag.
</video></div>
             </div>
             <div class="row">
                 <div class="col-sm-12" style="text-align:center;"><img src="eventimages/unece_page1.png" style="max-height:400px;text-align:center;margin:auto;" /></div>
                 </div>
                   <div class="row">
                 <div class="col-sm-12" style="text-align:center;"><img src="eventimages/unece_page2.png" style="max-height:400px; text-align:center;" /></div>
             </div>
  
        </div> <!-- /container -->
  
       </div>
    <!--#include file="include/footer.html"-->
         </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>