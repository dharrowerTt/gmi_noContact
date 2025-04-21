<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="thanks.aspx.vb" Inherits="M2M_Redesign.thanks2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Delegate Nomination Form for Partner Countries</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .container {
            max-width: 960px;
        }

        .border-top {
            border-top: 1px solid #e5e5e5;
        }

        .border-bottom {
            border-bottom: 1px solid #e5e5e5;
        }

        .border-top-gray {
            border-top-color: #adb5bd;
        }

        .box-shadow {
            box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
        }

        .lh-condensed {
            line-height: 1.25;
        }
        table{
            width:100%;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form2" runat="server">
        
      <div class="container">
      <div class="py-5">
        <h2 style="color:#2688cf">Thank you!</h2>
          <p>Your request has been completed. Sending you back to the form...</p>
    </div>
          </div>
    </form>
        <script>
        var timer = setTimeout(function() {
            window.location ='delegateNomination.aspx?ct=2B93BC96-219C-4A8F-8189-A2B485691270'
        }, 5000);
        </script>
</body>
</html>
