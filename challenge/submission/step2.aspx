<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="step2.aspx.vb" Inherits="M2M_Redesign.step2" %>

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
    <style>

        .textarea{
            width:100%;
            height: 150px!important;
        }
    </style>
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
      <li class="active last">Step 2</li>
      <li>Step 3</li>
      <li>Step 4</li>
      <li>Step 5</li>
    </ul>

    <div class="row">
      <div class="col-md-12 order-md-1">
        <h4 class="mb-3" style="margin-top: 15px;">Step 2: What actions are you taking to reduce methane emissions?</h4>
        <form runat="server" class="needs-validation" novalidate>
            <asp:TextBox ID="ID" type="text" style="display:none"  placeholder="" runat="server"></asp:TextBox>
          <div class="mb-3">
            <label for="actiontitle">Title of action/activity</label>
            <small id="actiontitleHelp" class="form-text text-muted">Provide a descriptive title for your story.</small>
            <div class="input-group">
                <asp:TextBox ID="actiontitle" type="text" class="form-control"  placeholder="" runat="server"></asp:TextBox>
            </div>
          </div>

          <div class="mb-3">
            <label>Applicable GMI sectors (check all that apply)</label>
            <div class="form-check">
             <asp:CheckBox ID="BioGasCheck" runat="server" class="form-check-input" />
              <label class="form-check-label" for="BioGasCheck">
                Biogas
              </label>
            </div>
            <div class="form-check">
             <asp:CheckBox ID="CoalMinesCheck" runat="server" class="form-check-input"/>
              <label class="form-check-label" for="CoalMinesCheck">
                Coal Mines
              </label>
            </div>
            <div class="form-check">
            <asp:CheckBox ID="OilGasCheck" runat="server" class="form-check-input" />
              <label class="form-check-label" for="OilGasCheck">
                Oil & Gas
              </label>
            </div>
          </div>

          <div class="mb-3">
            <label for="activitylocation">Location(s) of activities (countries)</label>
            <small id="activitylocationeHelp" class="form-text text-muted">Specify the countries in which you are conducting
              activities.</small>
            <div class="input-group">
                <asp:TextBox ID="activitylocation" type="text"  placeholder="" class="form-control"  runat="server" MaxLength="4000"></asp:TextBox>
            </div>
          </div>

          <div class="mb-3">
            <label for="partners">Partnering organizations</label>
            <small id="partnersHelp" class="form-text text-muted">Identify the names of organizations or agencies
              that are partnering with your organization or contributing significantly to your activities.</small>
            <div class="input-group">
              <asp:TextBox ID="partners" type="text"  placeholder="" class="form-control"  runat="server" MaxLength="4000"></asp:TextBox>
            </div>
          </div>

          <div class="mb-3">
            <div class="form-group">
              <label for="activityinfo">Description of activity <button class="moreinfo fa-xs" data-template="one"><i
                    class="fas fa-question"></i></button></label>
              <small id="activityinfoHelp" class="form-text text-muted">Provide a brief overview of your story. Describe
                how you are reducing methane emissions and identify the tools or methods that you are using to measure
                methane emissions.</small>
                <asp:TextBox runat="server" class="form-control textarea" id="activityinfo" maxlength="4000" placeholder="" TextMode="MultiLine"></asp:TextBox>
              <div id="activitycountdown">4000 characters left</div>
              <div class="invalid-feedback" style="width: 100%;">
                A description of your activity is required.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <div class="form-group">
              <label for="outcomes">Outcomes and results of your action <button  class="moreinfo fa-xs" data-template="two"><i
                    class="fas fa-question"></i></button></label>
              <small id="outcomeHelp" class="form-text text-muted">Describe the real or anticipated results of your
                activities. For example, provide estimates for the emission reductions achieved. Please use metric
                tonnes of carbon dioxide equivalent (MTCO₂e) for emission reduction estimates.</small>
        
                <asp:TextBox runat="server" class="form-control textarea" id="outcomes" maxlength="4000" placeholder=""  TextMode="MultiLine"></asp:TextBox>
              <div id="outcomescountdown" class="outcomescountdown">4000 characters left</div>
              <div class="invalid-feedback" style="width: 100%;">
                A description of outcomes and results is required.
              </div>
            </div>
          </div>


          <div class="mb-3">
            <div class="form-group">
              <label for="nextsteps">Next steps/future actions <button class="moreinfo fa-xs" data-template="three"><i
                    class="fas fa-question"></i></button></label>
              <small id="nextstepsHelp" class="form-text text-muted">If applicable, tell us about future actions you
                will take to continue your story.</small>
                <asp:TextBox runat="server" class="form-control textarea" id="nextsteps" maxlength="4000" placeholder="" TextMode="MultiLine"></asp:TextBox>
                 <div id="nextstepscountdown">4000 characters left</div>
              <div class="invalid-feedback" style="width: 100%;">
                A description of outcomes and results is required.
              </div>
            </div>
            <hr class="mb-4 linebreak">

          </div>
            <asp:Button ID="LastStep" class="btn btn-primary btn-lg" runat="server" Text="Previous Step"  style="float:left;"/>
            <asp:Button ID="NextStep" class="btn btn-primary btn-lg" runat="server" style="float:right;"  Text="Next Step" />
          <br>
          <br>
          <br>
            </form>
      </div>

      <hr class="mb-4">
      
    </div>
  </div>

  <div style="display: none;">
    <div id="one">
      <strong>Example Text</strong><br>
      The Indian Institute of Technology Delhi (IITD) is committed to contributing innovative scientific and technical
      education and research to India and the world and serving as a valuable biogas resource for industry and society.
      ITD and Sampurn Agri Ventures Pvt. Ltd. collaborated to create the first commercial power plant in the world that
      uses 100 percent rice (paddy) straw to produce biogas. The power plant, located in Fazilka, Punjab, generates
      1.0 megawatts of power for 8 to 9 hours from biogas and supplies electricity to the national grid.
    </div>
    <div id="two">

      <strong>Example Text</strong><br>
      This project demonstrates that producing biogas from rice straw can provide an excellent source of clean energy
      and help to protect the environment. The rice straw, usually burnt after harvesting the rice crop, causes severe
      air pollution in urban cities like Delhi. The production of biogas from rice straw reduces air pollution and smog.
      Emission reductions from the biogas-based power generation plant are estimated to be 0.015 MMTCO<sub>2</sub>e per
      year.

    </div>
    <div id="three">
      <strong>Example Text</strong><br>
      Installing commercial biogas production facilities in the northern states of India will significantly reduce the
      open-field burning of rice straw and other agricultural residues. The present use of paddy straw at the power
      plant in Fazilka, Punjab results in savings of approximately 120.0 gigajoules/day of energy, which would otherwise
      be released into the atmosphere by direct combustion. This project eliminates the release of atmospheric
      pollutants that result from burning paddy straw in farmers’ fields.
    </div>
  </div>


  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
  </script>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=Array.prototype.find,Promise,Object.assign"></script>
  <script src="https://unpkg.com/@popperjs/core@2"></script>
  <script src="https://unpkg.com/tippy.js@6"></script>
  
  <script>

tippy('button', {
  content: function content(reference) {
    var id = reference.getAttribute('data-template');
    var template = document.getElementById(id);
    return template.innerHTML;
  },
  allowHTML: true
});
  </script>

  <script>
    var activitytextarea = document.getElementById("activityinfo");

      activitytextarea.addEventListener('paste', handlePaste);

    activitytextarea.addEventListener("input", function () {
      var activitymaxlength = this.getAttribute("maxlength");
      var activitycurrentlength = this.value.length;

      console.log(this.value.length);
      if (activitycurrentlength >= 4000) {
          alert("You have reached the maximum number of characters.");
      } else {
          document.getElementById("activitycountdown").innerText = (4000 - activitycurrentlength +
          " characters left");
      }
    });

      var outcomestextarea = document.getElementById("outcomes");

      outcomestextarea.addEventListener('paste', handlePaste);

    outcomestextarea.addEventListener("input", function () {
      var outcomesmaxlength = this.getAttribute("maxlength");
      var outcomescurrentlength = this.value.length;
 
      console.log(this.value.length);
      if (outcomescurrentlength >= 4000) {
          alert("You have reached the maximum number of characters.");
      } else {
          document.getElementById("outcomescountdown").innerText = (4000 - outcomescurrentlength +
          " characters left");
      }
    });

      var nextstepstextarea = document.getElementById("nextsteps");

      nextstepstextarea.addEventListener('paste', handlePaste);

    nextstepstextarea.addEventListener("input", function () {
      var nextstepsmaxlength = this.getAttribute("maxlength");
      var nextstepscurrentlength = this.value.length;
   
      console.log(this.value.length);
      if (nextstepscurrentlength >= 4000) {
        alert("You have reached the maximum number of characters.");
      } else {
          document.getElementById("nextstepscountdown").innerText = (4000 - nextstepscurrentlength +
          " characters left");
      }
    });


      function handlePaste(e) {
          var clipboardData, pastedData;

          clipboardData = e.clipboardData || window.clipboardData;
          pastedData = clipboardData.getData('Text');

          if (pastedData.length() > 4000) {
              alert("There is a character limit of 4000 on this field, please try again with a smaller selection.");
              e.stopPropagation();
              e.preventDefault();
          }

      }
  </script>





</body>

</html>