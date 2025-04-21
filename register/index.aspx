<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index3" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Register</title>
    <link href="css/addon.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/formstyles.css">
  </head>
  <body>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-blue">
        <a class="navbar-brand" href="#">Event</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
  
        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                        <a class="nav-link" href="index.aspx">Register <span class="sr-only">(current)</span></a>
            </li>
          </ul>
          <!--<form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
          -->
        </div>
      </nav>
  
      <main role="main">
  
        <!-- Main jumbotron for a primary marketing message or call to action -->
       <!-- <div class="jumbotron">
          <div class="container">
            <h1 class="display-3">Hello, world!</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
          </div>
        </div>-->
  
        <div class="container" style="margin-top:3.5rem;">
          <!-- Example row of columns -->
          <div class="row">
            <div class="col-md-8">
              <h2>Registration</h2>
              <p>Insert instructions.</p>
              
            </div>
            <div class="col-md-4">
                    <form id="form1" runat="server">
                
                    <fieldset>
                      <legend>Register</legend>
                          <label for="emailaddress">Enter your email</label><br>
                        <asp:TextBox runat="server" type="email" name="emailaddress" id="emailaddress" class="inputfull" value="" required />                          
                      
                  </fieldset>
                  <div class="centerbutton">
                      
                  <button runat="server" id="btnBegin" type="submit" value="Submit" >Begin</button>
                  </div>
                </form>
            </div>
          </div>
  
          <hr>
  
        </div> <!-- /container -->
  
      </main>
  
      <footer class="container">
        <p>For more information contact XXXXXXXXXXXXXXX at XXXXXXXXXXXXXXXXXXX</p>
      </footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>