<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index25" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMART Plus Tool | Global Methane Initiative</title>
    <meta name="robots" content="noindex,nofollow" />
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
        * {
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->


    <!-- Section: Overview -->
    <section class="py-5 bg-white" id="overview">
        <div class="container">
              <h1>SMART Plus Tool</h1>
            <h2>What it is</h2>
            <ul>
                <li>The Simplified Methane Assessment and Reporting Tool, or SMART Plus tool, is an innovative, easy-to-use tool that helps improve the accuracy of estimated methane emissions  (and other pollutants such as carbon dioxide) from oil & gas operations, both at the facility level and at the national level.  </li>
            </ul>

            <h2>Why it matters</h2>
            <ul>
                <li>Methane, a potent greenhouse gas and the primary constituent of natural gas, is a valuable fuel resource; its conservation saves money and improves the environment. Improving the accuracy of estimated methane emissions from oil & gas operations, whether at the facility or national level, can help oil and gas companies and policy makers in a number of ways, including the identification of large sources of methane emissions that were previously overlooked and could be mitigated.</li>
                <li>National level governments may not understand the scope and scale of methane emissions from this sector; improving the accuracy of emissions estimates could help them understand emissions sources and provide appropriate policies and incentives to mitigate these emissions.  Countries reporting their annual greenhouse gas (GHG) emissions to the United Nations Framework Convention on Climate Change (UNFCCC) would benefit from having an easy-to-use resource to collect and aggregate this data. </li>
                <li>Private sector facilities can benefit from using a systematic approach to estimate more accurate facility-level emissions that could identify operational inefficiencies and opportunities to reduce emissions. </li>
            </ul>

            <h2>Who should use it</h2>
            <p>This Tool is intended to be used by national governments as well as company-level stakeholders in developing countries.</p>

            <h3>How it works</h3>
            <p>There are three components of the SMART Plus Tool, which are described below:</p>
            <ul>
                <li><a href="#facility-template">The SMART Plus Facility Template</a></li>
                <li><a href="#database-application">The SMART Plus Database application</a></li>
                <li><a href="#reporting-template">The SMART Plus IPCC Tier 1/Tier 2 Reporting Template</a></li>
            </ul>

            <h2>Other resources</h2>
            <ul>
                <li><a href="https://www.ipcc-nggip.iges.or.jp/public/2006gl/pdf/2_Volume2/V2_4_Ch4_Fugitive_Emissions.pdf#page=65" target="_blank">2006 Intergovernmental Panel on Climate Change (IPCC) Guidelines for National Greenhouse Gas Inventories</a></li>
                <li><a href="https://www.ipcc-nggip.iges.or.jp/public/2019rf/pdf/2_Volume2/19R_V2_4_Ch04_Fugitive_Emissions.pdf" target="_blank">2019 Refinement to the 2006 Guidelines</a></li>
                <li><a href="https://www.ipcc-nggip.iges.or.jp/software/index.html" target="_blank">IPCC Inventory Software</a></li>
            </ul>
        </div>
    </section>

    <!-- Section: SMART Plus Facility Template -->
    <section class="py-5" id="facility-template">
        <div class="container">
            <h2>SMART Plus Facility Template (v1.0)</h2>
            <div class="row">
                <div class="col-sm-8">
                    <!-- Placeholder for Facility Template Content -->
                    <p>This Excel-based template estimates facility-level emissions of greenhouse gases (GHGs) including methane, carbon dioxide, and nitrous oxide, as well as criteria air contaminants (CACs) including carbon monoxide, nitrogen oxides, non-methane VOCs, and sulphur dioxide. </p>

                    <p>This template provides a format for collecting appropriate data and estimates total facility-level emissions using default emission factors and equipment component counts as well as user-provided infrastructure and activity data for a given facility. The template also accepts direct measurement data, which, if available, will override emissions calculations and provide a more refined estimate.</p>

                    <p>Users seeking to estimate emissions at multiple facilities can fill out a unique SMART Plus Facility template for each facility. </p>

                    <p>If facility-specific emissions are aggregated across an entire country, the result would produce a national emissions inventory for the oil & gas sector consistent with an IPCC Tier 3 approach.  If facility-specific emissions were calculated in this manner for only a representative subset of facilities, this process could yield IPCC Tier 2, or country-specific, emission factors.</p>

                    <p>
                        Click <a href="https://globalmethane.org/download/smartplus.aspx?id=1">here</a> to access the SMART Plus Facility Template and accompanying User Manual.
                    </p>
                </div>
                <div class="col-sm-4">
                    <img src="1thumb.png" alt="SMART Plus Facility Template" class="img-fluid" />
                </div>
            </div>
        </div>
    </section>

    <!-- Section: SMART Plus Database Application -->
    <section class="py-5 bg-white" id="database-application">
        <div class="container">
            <h2>SMART Plus Database Application (v1.0)</h2>
            <div class="row">
                <div class="col-sm-8">
                    <!-- Placeholder for Database Application Content -->
                    <p>This beta SMART Plus Database is a Microsoft Access application that can import multiple SMART Plus Facility templates to summarize emissions estimates across facilities and allow users to filter combined emissions profiles by several aspects, such as by industry segment, emissions source, year, or facility. The Database can be used to calculate IPCC Tier 2 emission factors that can be manually copied into the IPCC Inventory Software purposes of reporting national GHG inventories to the UNFCCC for Category 1.B.2 (Oil and Natural Gas). These newly developed Tier 2 emission factors can also be imported into the beta SMART Plus IPCC Tier 1/Tier 2 Reporting Template for the purposes of comparing the effect of Tier 1 vs Tier 2 emission factors on the user’s national GHG inventory ahead of making inventory submissions into the IPCC Inventory Software.</p>

                    <p>
                        Click <a href="https://globalmethane.org/download/smartplus.aspx?id=2">here</a>  to access the SMART Plus Database application and accompanying User Manual.
                    </p>
                </div>
                <div class="col-sm-4">
                    <img src="2thumb.png" alt="SMART Plus Database Application" class="img-fluid" />
                </div>
            </div>
        </div>
    </section>

    <!-- Section: SMART Plus IPCC Tier 1/Tier 2 Reporting Template -->
    <section class="py-5" id="reporting-template">
        <div class="container">
            <h2>SMART Plus IPCC Tier 1/Tier 2 Reporting Template (v1.0)</h2>
            <div class="row">
                <div class="col-sm-8">
                    <!-- Placeholder for Reporting Template Content -->
                    <p>This beta template functions similarly to the IPCC Inventory Software by calculating emissions using an IPCC Tier 1/Tier 2 approach for UNFCCC Category 1.B.2 (Oil and Natural Gas). The template is designed to be used as a decision support tool that allows users to compare pre-populated default IPCC Tier 1 emission factors (from the 2019 Refinement to the 2006 IPCC Guidelines) with Tier 2 emission factors that have been developed either through the use of other SMART Plus tool components or from other studies. Users can implement this tool to understand how the emission factor they select will impact their final inventory submission via the IPCC Software. Version 1.0 of this template includes Tier 1 factors from the 2019 Refinement only; U.S. EPA plans to incorporate original emission factors from the 2006 Guidelines into a later version, providing users the added ability to compare 2006 and 2019 emission factors, in addition to Tier 2 factors.                    </p>

                    <p>
                        Click <a href="https://globalmethane.org/download/smartplus.aspx?id=3">here</a>  to access the SMART Plus Tier 1/Tier 2 Reporting Template and accompanying User Manual.
                    </p>
                </div>
                <div class="col-sm-4">
                    <img src="3thumb.png" alt="SMART Plus Reporting Template" class="img-fluid" />
                </div>
            </div>
        </div>
    </section>

    <!-- Section: FAQ -->
    <section class="py-5 bg-white" id="faq">
        <div class="container">
            <h2>Frequently Asked Questions</h2>
           <div class="accordion" id="smartPlusAccordion">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Who can use SMART Plus?
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>SMART Plus can be used by national government stakeholders who are responsible for compiling their national GHG inventory for oil and gas systems in accordance with annual or bi-annual UNFCCC reporting requirements under the Paris Agreement. Outputs from the Tool are directly aligned with the IPCC Inventory Software used for submitting GHG inventories to the UNFCCC.</p>
        <p>SMART Plus can also assist those who aim to refine their oil and gas sector GHG inventory estimates by developing an Intergovernmental Panel on Climate Change (IPCC) Tier 2, or country-specific, emission factor.</p>
        <p>SMART Plus can also be used by company-level stakeholders in developing countries who wish to understand their company-wide or facility-level emissions profile.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        What methodology does SMART Plus follow?
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>The SMART Plus Facility Template incorporates and aligns with the methodology for IPCC Tier 3.</p>
        <p>The SMART Plus Database application incorporates standard mathematical approaches for calculating averages; in this case, average emissions.</p>
        <p>The SMART Plus IPCC Tier 1/Tier 2 Reporting Template incorporates and aligns with the methodology for IPCC Tiers 1 and 2.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        How can I use SMART Plus to create a national inventory for the oil and gas sector?
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>Users can implement various SMART Plus tool components to meet the needs of their GHG inventory context, which could include:</p>
        <ul>
          <li>Conducting a facility-level GHG emissions assessment, which could be considered aligned with IPCC Tier 3 if all facilities in a given country or jurisdiction are assessed.</li>
          <li>Conducting a Tier 3 approach at a representative set of facilities for the purposes of generating a Tier 2 emission factor for a particular source category.</li>
          <li>Comparing default Tier 1 emission factors (from the 2019 Refinement to the 2006 IPCC Guidelines) with Tier 2 emission factors ahead of submitting data into the IPCC Inventory Software.</li>
        </ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        How do I use SMART Plus to estimate facility-level emissions?
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>To estimate emissions at one facility, users can download and complete a single SMART Plus Facility template for that facility. The Facility template is a standalone file that does not require the use of any other SMART Plus components.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        How do I use SMART Plus to create an emissions profile across multiple facilities (including for the purposes of conducting an IPCC Tier 3 assessment)?
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>To estimate emissions across multiple facilities, users must first download the SMART Plus Facility template and then complete a unique template for each individual facility.</p>
        <p>Then, users must import each completed Facility template into the SMART Plus Database application. Once imported into the Database, users can view aggregated summaries of emissions and manually copy this data into the IPCC Inventory Software.</p>
        <p>If the facilities being assessed are characterized as a representative sample for the entire country or jurisdiction, then this can be considered sufficient to determine an IPCC Tier 2 emission factor for a particular source type at those facilities.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingSix">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
        How do I use SMART Plus to develop IPCC Tier 2 emission factors?
      </button>
    </h2>
    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>To develop IPCC Tier 2 emission factors, start by first identifying an industry segment (for example, Gas Production and Gathering), sub-segment (for example, Onshore), and type of activity parameter (for example, Active gas wells) for IPCC Category 1.B.2, Oil and Natural Gas. Conduct an IPCC Tier 3 assessment at multiple corresponding facilities using a unique SMART Plus Facility template at each facility and then import those templates into the SMART Plus Database Application. Ensure that these facilities are considered representative for the user’s country or jurisdiction.</p>
        <p>Follow the User Manual steps to calculate a Tier 2 emission factor with just a few clicks.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingSeven">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
        What are the available filters that can be used to view results in the SMART Plus database when summarizing emissions across multiple facilities?
      </button>
    </h2>
    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>Users can view emissions summaries in the SMART Plus Database by selecting filters including year, company, facility, facility type, industry segment, and source category.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingEight">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
        Can I visualize my emissions profile using SMART Plus?
      </button>
    </h2>
    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>Yes. Each of the three SMART Plus components displays emissions profiles using pie charts in addition to providing tabular results.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingNine">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
        Where can I learn more about the IPCC Guidelines for estimating GHG inventories from oil and gas systems?
      </button>
    </h2>
    <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>Click here to view the 2006 IPCC Guidelines, Chapter 4 – Fugitive Emissions. Oil and gas systems are covered in Section 4.2.</p>
        <p>Click here to view the 2019 Refinement to the IPCC Guidelines, Chapter 4 – Fugitive Emissions. Oil and gas systems are covered in Section 4.2.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTen">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
        How was SMART Plus developed?
      </button>
    </h2>
    <div id="collapseTen" class="accordion-collapse collapse" aria-labelledby="headingTen" data-bs-parent="#smartPlusAccordion">
      <div class="accordion-body">
        <p>SMART Plus was developed by U.S. EPA under the auspices of GMI and funded by the U.S. Department of State’s Transparency Accelerator program to provide GHG inventory technical assistance to developing countries. Version 1.0 of the Facility template has been peer reviewed, and U.S. EPA anticipates conducting peer reviews for Version 1.0 of the Database application and Version 1.0 of the Tier 1/Tier 2 reporting template in early 2025.</p>
      </div>
    </div>
  </div>
</div>

        </div>
    </section>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />


	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- #include virtual="/includes/footer.html" -->

    <style>
  .accordion-button {
    width: 100%;
    text-align: left;
    font-size: 1.2rem;
    background-color: #f8f9fa;
    color: #333;
    padding-top:.3rem;
    padding-bottom:.3rem;
    margin-top:.5rem;
  }

  .accordion-button:not(.collapsed) {
    background-color: #007bff; /* Open question background */
    color: white; /* Open question text color */
  }

  .accordion-item {
    
  }

  .accordion-body {
    background-color: #e9f5ff; /* Open answer background */
    color: #333; /* Answer text color */
    padding: 1rem;
  }

  .accordion-header {
    margin-bottom: 0;
  }

  .accordion-button:focus {
    box-shadow: none; /* Removes focus outline */
  }
</style>
</body>
</html>
