<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="form.aspx.vb" Inherits="M2M_Redesign.form" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Global Methane Challenge</title>

    <!-- Bootstrap core CSS -->
    <link href="form/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
    .gmcdark{
        background-color: #4c5c96!important;
    }

    .otherat{
        background:#9DB4C0;
       display:none;
     padding:10px;
    }

    .tinted{
        background: #deeaf6;
        padding:10px;
    }

    .captured{
        background:#5C6B73;
        padding:20px;
    }

    .clipbtn{
        background:#2574a9;
        color:white;
    }
</style>
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top gmcdark">
      <div class="container">
        <a class="navbar-brand" href="#">Global Methane Challenge</a>

      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h1 class="mt-5">Thanks for your submission!</h1>
          <p class="lead">We'll be in touch soon to discuss your Global Methane Challenge story.<br />Until then, please help us by filling in as much information about your commitment as possible.<br />Return to the <a href="../index.aspx">Global Methane Challenge</a>.</p>
<hr />
        </div>
      </div>
     <form runat='server'>
         <asp:TextBox ID="fName" runat="server" ReadOnly></asp:TextBox>
         <asp:TextBox ID="lName" runat="server" ReadOnly></asp:TextBox>
         <asp:TextBox ID="eAddress" runat="server" ReadOnly></asp:TextBox>
         <asp:TextBox ID="OrgName" runat="server" ReadOnly></asp:TextBox>


                <hr />
                <div class="row tinted">
                    <div class="col-12">
                        
                            <div class="form-group">
                                <label for="exampleInputPassword1">GMC ID</label>
                                <asp:TextBox runat="server" id="codeCheck" class="form-control" ReadOnly />
                            </div>
      
                            <div class="form-group">
                                <label for="exampleInputPassword1">Title of Global Methane Challenge action</label>
                                <asp:TextBox runat="server" class="form-control" id="titleQ" />
                            </div>
                            <div class="form-group">
                                <label for="DropDownList1">Action type</label>

                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"></asp:DropDownList>


                            </div>
                            <div class="form-group otherat">
                                <label for="exampleInputPassword1">Please enter your action type</label>
                                 <asp:TextBox runat="server" class="form-control" id="actionTypeQ" />
                            </div>
                            <div class="form-group">
                                <label for="exampleTextarea">Description of action:</label>
                                <asp:TextBox runat="server" class="form-control" id="description" TextMode="MultiLine" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Are you working with other partners on this action? Please describe.</label>
                                <asp:TextBox runat="server" class="form-control" id="partnerQ" TextMode="MultiLine" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Where are you planning to take the action(s)?</label>
                                <asp:TextBox runat="server" class="form-control"  id="whereQ" TextMode="MultiLine" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Is the action domestic, bilateral or multilateral? If other countries are involved, please identify the name and roles of each country.</label>
                                  <asp:TextBox runat="server" class="form-control"  id="styleQ" TextMode="MultiLine" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">How will you measure or track progress for this action?</label>
                                <asp:TextBox runat="server" class="form-control"  id="trackPQ" TextMode="MultiLine" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">How will you measure or track success for this action?</label>
                                <asp:TextBox runat="server" class="form-control"  id="trackSQ" TextMode="MultiLine"/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Anticipated emission reductions from this action (if applicable, MMTCO<sub>2</sub>e):</label>
                                <asp:TextBox runat="server" class="form-control"  id="reductionQ" TextMode="MultiLine"/>
                            </div>
            
                            <hr />
                            <input  runat="server" id="submission" type="submit" value="Submit" class="btn btn-primary" />
                            <br />

                            <hr />
                            <br />
                        </form>
                    </div>
            </div>
        </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>

      <script type="text/javascript">
$(document).ready(function() {
    $("select").change(function () {

        if ($("select").val() == "Other") {
            $(".otherat").show();
        } else {
            $(".otherat").hide();
        }
        
    });

    var clipboard = new ClipboardJS('.btn', {
        target: function () {
            return document.querySelector('.clipbtn');
        }
    });
    clipboard.on('success', function (e) {
        console.log(e);
    });
    clipboard.on('error', function (e) {
        console.log(e);
    });
});
      </script>

  </body>

</html>
