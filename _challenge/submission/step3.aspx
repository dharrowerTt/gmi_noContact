<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="step3.aspx.vb" Inherits="M2M_Redesign.step3" %>

<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link href="assets/fontawesome/all.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/style.css">
  <title>GMC Submission Form</title>
</head>

<body>
  <div class="container">
    <div class="row" style="margin-top:20px; margin-bottom:20px;">
      <div class="col-md-6">
        <img src="https://globalmethane.org/challenge/images/gmclogo.svg" style="width:100%;">
      </div>
      <div class="col-md-6" style="text-align:right;">
        <img src="https://globalmethane.org/challenge/images/gmilogo.svg" style="width:50%;">
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <h1>Global Methane Challenge Submission Form</h1>
      </div>
    </div>

    <ul class="progressbar">
      <li class="active">Step 1</li>
      <li class="active">Step 2</li>
      <li class="active last">Step 3</li>
      <li>Step 4</li>
      <li>Step 5</li>
    </ul>

    <div class="container">
      <div class="row">
        <div class="col-md-12 order-md-1">
          <h4 class="mb-3" style="margin-top: 15px;">Step 3: Where can people go to learn more about your project?
          </h4>
          <p>Please provide a link to any of the following:
            <ul>
              <li>Web page(s) that provides details about your activity</li>
              <li>Press releases</li>
              <li>News/media coverage</li>
              <li>Social media profiles</li>
              <li>Photo galleries or project descriptions</li>
            </ul>
              </p>
            <form class="needs-validation" novalidate>

              <div>
                GMI will add links to direct people to the URLs that you provide here. You may add multiple URLs. Enter
                the full URL (for example, "<a href="https://www.globalmethane.org">https://www.globalmethane.org</a>")
                and click the <em>Add New Row</em> button.
              </div>
              <p>
                <div class="mb-3">
                  <label for="urls">Specify URL(s) for websites.</label>
              </p>
                            <form runat="server">
                                <div class="input-group mb-3">
  <asp:TextBox ID="linkUrls" runat="server" class="form-control url-input" Visible="False" Style="background-color:#A5CDEF;"></asp:TextBox>
  <div class="input-group-append">
   <asp:Button ID="EditBox" Visible="False" runat="server" Text="Edit" />
  </div>
</div>
                

                                
    <asp:TextBox ID="ID" type="text" style="display:none"  placeholder="" runat="server"></asp:TextBox>
    <asp:TextBox ID="urlList" type="text" class='output-box' style="display:none;background-color:#A5CDEF;margin-bottom:5px;"  placeholder="" runat="server"></asp:TextBox>
</form>
              <div class="input-group">
                <div id="urlForm" style="width: 100%;">
      
                  <input type="text" class="form-control url url-input" id="urls" placeholder="">
                </div>
              </div>

        <input type="button" id="addURL" value="Add New Row" class="btn btn-primary btn-lg" />
        <input type="button" id="removeURL" value="Remove Row" class="btn btn-primary btn-lg"/>


      <hr class="mb-4 linebreak">
      <div>
      <div class="btn btn-primary btn-lg" style="float:left;" id='goBack'>Previous Step</div>
          <div class="btn btn-primary btn-lg" style="float:right;" id='btnSave'>Next Step</div>
        <br>
        <br>
        <br>
              
      </div>
              </form>


                      </div>
    </div>


  </div>
  </div>

    <form style="display: none" action="step4.aspx" method="POST" id="redirectform">
  <input type="hidden" id="submissionID" name="submissionID" value="<%=submissionID%>"/>
</form>
        <form style="display: none" action="step2.aspx" method="POST" id="backwardsForm">
  <input type="hidden" id="submissionIDBack" name="submissionID" value="<%=submissionID%>"/>
</form>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
  </script>

  <script>
    var counter = 0;

    document.getElementById("addURL").onclick = function () {

      counter = counter + 1;
      var form = document.getElementById("urlForm");
      var input = document.createElement("input");
      input.setAttribute('class', 'form-control url url-input');
      input.setAttribute('id', 'textbox' + counter);
      input.type = "text";
      console.log(counter);
      form.appendChild(input);

      document.getElementById("removeURL").style.display = "inline-block";
    }

    document.getElementById("removeURL").onclick = function () {
      var form = document.getElementById("urlForm");

      var element = document.getElementById("textbox" + counter);
      element.parentNode.removeChild(element);

      counter = counter - 1;
      console.log(counter);
      if (counter == 0) {
          document.getElementById("removeURL").style.display = "none";
      }
    }


  </script>


    <script type="text/javascript">
    $(function () {
        $("[id*=btnSave]").bind("click", function () {

            var textInput = [];
            $(".url-input").each(function () {
                if (this.value.length > 0){
                    textInput.push(this.value);
                }
            });
            var textOutput = textInput.join(', ');
            

            var urls = {};
            urls.urlList = textOutput;

            $.ajax({
                type: "POST",
                url: "step3.aspx/uploadURLS",
                data: '{urls: ' + JSON.stringify(urls) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
  
                    $("#redirectform").submit();
                }
            });
            return false;
        });
    });

    $(function () {
        $("[id*=goBack]").bind("click", function () {

            var textInput = [];
            $(".url-input").each(function () {
                if (this.value.length > 0) {
                    textInput.push(this.value);
                }
            });
            var textOutput = textInput.join(', ');


            var urls = {};
            urls.urlList = textOutput;

            $.ajax({
                type: "POST",
                url: "step3.aspx/uploadURLS",
                data: '{urls: ' + JSON.stringify(urls) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    $("#backwardsForm").submit();
                }
            });
            return false;
        });
    });
</script>

</body>

</html>