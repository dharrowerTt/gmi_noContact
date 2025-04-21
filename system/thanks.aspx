<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="thanks.aspx.vb" Inherits="M2M_Redesign.thanks1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You!</title>
</head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <style>
        body{
            background:#37517e;
            color:white;
        }
        #counter{
            text-align:center;
            font-size:10rem;
        }
        #counterText{
             text-align:center;
            font-size:3rem;
        }
    </style>

<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h3 style="text-align:right;margin-top:80px;">
                        Thank you for your submission. The details have been sent to GMI Secretariat. <br /><Br />Returning you back to the main page.
                    </h3>
                </div>
                <div class="col-md-6">
                     <div id="counter">5</div>
                    <div id="counterText">seconds</div>
                </div>
            </div>
        </div>
        <div>

            
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



        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent * 1 - 1;
            div.textContent = count;
            if (count <= 0) {

            

                var profile = getQueryVariable("id");
                var country = getQueryVariable("ct");
                var person = getQueryVariable("usr");

                if (country.length > 1) {

                    var url = "index.aspx?ct=" + country + "&usr=" +person
                    window.location.href = url;

                } else {
                    var url = "index.aspx?"
                    window.history.go(-2);

                }


            
            }
        }, 1000);
              </script>
        </div>
    </form>
</body>
</html>
