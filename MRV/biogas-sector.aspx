<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="biogas-sector.aspx.vb" Inherits="M2M_Redesign.biogas_sector" %>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Measurement, Reporting and Verification (MRV) of Methane: Biogas Sector | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <meta name="keywords"
        content=" biogas, measurement, reporting, verification, global, methane, GMI, climate, environment, GHG">
    <meta name="description"
        content="The MRV Handbook is designed to help decision makers in developing countries reduce methane emissions from the biogas sector with measurement, reporting, and verification.">
    <meta name="robots" content="max-snippet:-1">
    <meta name="googlebot" content="max-snippet:-1">
</head>

<body>

     <style>
        .box {
            position:fixed;
            top:0;
            left:0;
            z-index:200;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100vw;
            height: 100vh;
            background: white;
        }

            .box div {
                width: 300px;
                height: 300px;
            }
    </style>

    <div class="box" id="boxToHide">
        <div>
            <label for="pass">Password:</label>
            <input type="password" id="txtEmail" name="password"
                minlength="8" required>
            <a id="passwordbtn" class="btn btn-dark" style="color: white">Sign In</a>
        </div>

    </div>



    <!-- #include virtual="/includes/header.html" -->

    <!-- Page Content -->

    <style>
        .MRVOnThisPage {
            background: #f8f8f8;
            border: 1px solid #e7b000;
            padding: 20px;
            margin-bottom: 20px;
        }

        .MRVList {
            list-style: none;
            padding-left: 0 !important;
        }

            .MRVList li::before {
                content: "";
                background-size: contain;
                display: inline-block;
                width: 2.5em;
                height: 2.5em;
                position: relative;
                top: 0.1rem;
                margin-right: 0.2rem;
            }

            .MRVList li:nth-child(1)::before {
                background-image: url(measurement.svg);
            }

            .MRVList li:nth-child(2)::before {
                background-image: url(reporting.svg);
            }

            .MRVList li:nth-child(3)::before {
                background-image: url(verification.svg);
            }

        .MRVWhenList {
            list-style: none;
            padding-left: 0 !important;
        }

            .MRVWhenList li::before {
                content: "";
                background-size: contain;
                display: inline-block;
                width: 2.5em;
                height: 2.5em;
                position: relative;
                top: 0.1rem;
                margin-right: 0.2rem;
            }

            .MRVWhenList li:nth-child(1)::before {
                background-image: url(emissions.svg);
            }

            .MRVWhenList li:nth-child(2)::before {
                background-image: url(reduction.svg);
            }
    </style>
    <section class="py-5 gmi-light-blue">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <h1>Measurement, Reporting and Verification (MRV) of Methane: Biogas Sector </h1>
                    <p>
                       <small class="text-muted text">
                                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                                        <a href="index.aspx">MRV Hub</a>
                                    </small>
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-white">
        <div class="container">

            <div class="row" id="part1">
                <div class="col-sm-12">
                    <div class="MRVOnThisPage">
                        <div class="row">
                            <div class="col-sm-8">

                                <h4>On this page:</h4>
                                <ul>
                                    <li><a href="#part2">Best Practices for the Biogas Sector</a></li>
                                    <li><a href="#resources">Resources for the Biogas Sector</a></li>
                                    <li><a href="#benefits">Benefits of Biogas Sector MRV</a></li>

                                </ul>

                            </div>
                            <div class="col-sm-4">

                                <!--
                                <a href="https://globalmethane.org/resources/details.aspx?resourceid=5177"><img src="mrv-handb00k-thumb.jpg" style="width:130px;float:left;margin-right:20px;border:1px solid black;"/></a>
                              
                                    <a href="https://globalmethane.org/resources/details.aspx?resourceid=5177">Learn about and download the MRV handbook</a> -->
                                

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row" id="part2">
                <div class="col-sm-12">
                    <h2>Best Practices for the Biogas Sector</h2>
                    Emissions mitigation projects in the biogas sector include:
                    <div style="background: #ebf7f6; width: 100%; padding: 20px; margin-bottom: 20px;">
                        <ul style="margin-bottom: 0;">
                            <li>Landfill gas recovery for solid waste; </li>

                            <li>Anaerobic digester projects for organic solid waste, agricultural waste, and wastewater.
                            </li>
                        </ul>
                    </div>
                    <p>
                        There are common principles and best practices for measurement, reporting, and verification of
                        emissions reductions for each of these types of biogas projects.
                    </p>
                    <p>
                        Government agencies can use the best practices outlined here to develop MRV systems and plans
                        that are tailored toward their specific needs. These principles support the basic requirements
                        of any emissions accounting framework, as identified below.
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h3>Measurement</h3>
                    <p>
                        From a bottom-up perspective, the most important component of MRV is the measurement of data.
                        This core component provides the basis for claiming GHG reductions from the action(s) taken.
                    </p>
                    <style>
                        .list-wrapper {
                            position: relative;
                        }

                        .list-item-wrapper {
                            margin-top: 10px;
                            position: relative;
                        }

                        .list-bullet {
                            float: left;
                            position: absolute;
                            margin-right: 20px;
                            background: #129d94;
                            height: 30px;
                            width: 30px;
                            z-index: 6;
                            line-height: 30px;
                            border-radius: 100px;
                            font-weight: 700;
                            color: white;
                            text-align: center;
                        }

                        .list-item {
                            position: relative;
                            vertical-align: middle;
                            left: 40px;
                        }

                        .list-title {
                            font-weight: 700;
                        }

                        .list-text {
                            font-weight: 400;
                        }

                        .red-line {
                            background: #dbf0ef;
                            z-index: 4;
                            width: 8px;
                            height: 100%;
                            position: absolute;
                            left: 10px;
                        }

                        .white-line {
                            background: #FFF;
                            bottom: 0px;
                            z-index: 5;
                            width: 8px;
                            height: 100%;
                            position: absolute;
                            left: 10px;
                        }
                    </style>
                    <div class="list-wrapper">

                        <div class="red-line"></div>
                        <script src="https://kit.fontawesome.com/fd4c65d2f4.js"></script>

                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Develop a measurement plan </div>
                                <div class="list-text">
                                    <p>
                                        The main activity for measurement is the collection and management of data and
                                        information to support GHG reductions. Developing and implementing a
                                        comprehensive measurement plan is a critical step in this process. <strong>A
                                            measurement plan provides facility personnel with a blueprint of key
                                            steps,</strong> including defining what data and information need to be
                                        collected (e.g., gas flow rates), how the data and information need to be
                                        collected, how data are checked for accuracy, and how to aggregate and summarize
                                        the data to determine the GHG reductions achieved.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Choose a method for quantifying emissions reductions </div>
                                <div class="list-text">
                                    GHG emissions reductions should be quantified at least annually. Depending on the
                                    circumstances and requirements of the reporting program, emissions reductions can be
                                    quantified using ex-ante or ex-post methods.
                                    <div style="background: #ebf7f6; width: 100%; padding: 20px; margin-bottom: 20px;">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <ul style="margin-bottom: 0;">
                                                    <li><strong>Ex-ante quantification</strong> involves modeling and
                                                        forecasting potential emissions or emissions reductions. These
                                                        estimates are generally based on assumptions and have a
                                                        significant margin of error. </li>

                                                    <li><strong>Ex-post quantification </strong>is based on data
                                                        captured from the project site. Ex-post measurement is often
                                                        required for formal emissions reductions reports (e.g., under
                                                        carbon offsets protocols). </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <img src="biogasSticker.jpg"
                                                    style="border-radius: 50%; width: 150px; float: right;" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Use established methodologies and tools </div>
                                <div class="list-text">
                                    Using established methodologies – such as those based on IPCC GHG inventory
                                    guidelines – is considered a best practice. GMI provides several tools and resources
                                    for measuring emissions and emissions reductions for the biogas sector. Links to
                                    these tools and resources are provided below.
                                </div>
                            </div>

                        </div>
                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Keep accurate records and project documentation </div>
                                <div class="list-text">
                                    In addition to emissions reductions data, it is important to document:
                                    <div style="background: #ebf7f6; width: 100%; padding: 20px; margin-bottom: 20px;">
                                        <div class="row">
                                            <div class="col-md-8">

                                                <ul style="margin-bottom: 0;">
                                                    <li>Methodologies used to quantify emissions reductions </li>

                                                    <li>GHGs included in the project’s scope </li>

                                                    <li>Activity data and how they are measured </li>

                                                    <li>Baseline and any other underlying assumptions </li>

                                                    <li>Sources of uncertainty </li>

                                                    <li>Data sources </li>

                                                    <li>Any data gaps associated with the period for which biogas
                                                        mitigation efforts are quantified </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <img src="biogasCows.jpg"
                                                    style="border-radius: 5px; width: 200px; float: right;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Resolve data gaps and identify accurate data substitutes </div>
                                <div class="list-text">
                                    <p>
                                        Monitoring and data collection equipment will often fail or have interruptions
                                        during a monitoring period. Frequently, GHG mitigation programs will have
                                        specific requirements and methods to substitute for missing data.
                                    </p>

                                    <p>
                                        Without specific guidance, projects should seek to use methods that are
                                        reasonable, supported by other data during the measurement period, and are
                                        conservative in nature.
                                    </p>

                                    <p>
                                        <a href="https://www.ipcc-nggip.iges.or.jp/public/2006gl/index.html">IPCC
                                            Guidelines for National Greenhouse Gas Inventories</a> include methods for
                                        resolving data gaps using techniques such as overlap, surrogate data,
                                        interpolation, and trend extrapolation.
                                    </p>
                                </div>
                            </div>
                            <div class="white-line"></div>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row" id="part4">
                <div class="col-sm-12">


                    <h3>Reporting </h3>

                    <p>
                        Reporting is intended to track and store GHG information and inform interested parties of
                        results. Reports might need to be submitted to:

                        <ul>
                            <li>National government agencies, as required under national GHG emissions reporting
                                programs; </li>

                            <li>Local governments, as required for developing municipal emissions inventories; </li>

                            <li>Voluntary programs and networks (e.g., CDP, C40 Cities, Global Covenant of Mayors for
                                Climate and Energy).</li>
                        </ul>
                    </p>


                    <div class="list-wrapper">

                        <div class="red-line"></div>

                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Ensure the right project data will be reported </div>
                                <div class="list-text">
                                    The type of information reported, and the level of detail desired, will vary
                                    depending on the reporting program.

                                    Information that is typically required by reporting programs include:
                                    <div style="background: #ebf7f6; width: 100%; padding: 20px; margin-bottom: 20px;">
                                        <div class="row">
                                            <div class="col-md-8">

                                                <ul style="margin-bottom: 0;">
                                                    <li>Project proponent name and contact information </li>

                                                    <li>Project location </li>

                                                    <li>Time period for emissions reductions </li>

                                                    <li>Baseline emission and emissions reductions </li>

                                                    <li>Proposed improvement plan (if required) </li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Report data regularly </div>
                                <div class="list-text">
                                    <p>
                                        Aligning with the best practice of quantifying emissions reductions annually,
                                        most programs require annual reporting of GHG emissions and reductions. Programs
                                        may have more frequent deadlines for reporting monitoring data.
                                    </p>
                                </div>
                            </div>
                            <div class="white-line"></div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row" id="part5">
                <div class="col-sm-12">
                    <h3>Verification</h3>
                    <p>
                        Verification is intended to provide assurance on the methodologies used to quantify mitigation
                        actions and the quality of data reported. It can also serve as a tool and learning process for
                        project operators by raising awareness about opportunities for continuous improvement.
                    </p>


                    <div class="list-wrapper">

                        <div class="red-line"></div>

                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Follow the typical steps involved in verification </div>
                                <div class="list-text">
                                    Verification for all biogas subsectors involves the same basic steps:
                                    <div style="background: #ebf7f6; width: 100%; padding: 20px; margin-bottom: 20px;">
                                        <div class="row">
                                            <div class="col-md-6">

                                                <ul style="margin-bottom: 0;">
                                                    <li>Receive initial GHG data and documentation </li>

                                                    <li>Conduct strategic analysis </li>

                                                    <li>Conduct risk assessment </li>

                                                    <li>Create/modify risk-based verification and sampling plan </li>

                                                    <li>Review GHG data and documentation </li>

                                                    <li>Visit facility/project </li>

                                                    <li>Develop clarifications or corrective actions </li>

                                                    <li>Receive additional data and documentation (if needed) </li>

                                                    <li>Issue verification statement </li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6">
                                                <img src="biogasShot.jpg"
                                                    style="border-radius: 5px; width: 250px; float: right;" />
                                            </div>

                                        </div>
                                    </div>
                                    <p>The level of effort required for verification is most affected by project-specific conditions, data management, and the requirements of a particular reporting program. </p>
                                </div>
                            </div>

                        </div>
                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Ensure data is verified by a third-party and against standards  </div>
                                <div class="list-text">
                                    <p>As a best practice, GHG data and information should be verified by a third-party verification body, which will ensure impartiality and reduce risks, while increasing the reliability of both data and any emissions offsets as a result of mitigation efforts. </p>



                                    <p>Verifications should be conducted to a verification standard and specified criteria. The standard could be the <a href="https://www.iso.org/standard/66455.html">International Organization for Standardization 14064-3:2019 Greenhouse Gases – Part 3: Specification with Guidance for the Verification and Validation of Greenhouse Gas Statements</a>; or a standard developed specifically for the reporting program or country. </p>
                                </div>
                            </div>

                        </div>
                        <div class="list-item-wrapper">
                            <div class="list-bullet">
                                <i class="fas fa-angle-right fa-2x" style="margin-left: 5px;"></i>
                            </div>
                            <div class="list-item">
                                <div class="list-title">Adhere to verification content, frequency, and site visit expectations  </div>
                                <div class="list-text">
                                    <p>The verification must include more than just an assessment of the emissions reductions reported. It should include an assessment of project boundaries, documentation checks, onsite inspections, a review of measurement and metering methods and equipment, an assessment of data collection and management systems, and an independent calculation of emissions reductions achieved by the project. </p>

                                    <p>
                                        While it is a best practice to report annually, verification could be every other year, every three years, or even less frequently if an initial verification is conducted early in the mitigation project’s lifecycle. 
                                    </p>

                                    <p>
                                        Almost all programs require the project to be physically visited during its initial verification of the measurement period. After this initial visit, requirements for when another visit needs to occur vary widely. 
                                </div>
                            </div>
                            <div class="white-line"></div>
                        </div>
                    </div>

                </div>
            </div>

            </div></section>
    <section class="py-5">
        <div class="container">
            <div class="row" id="resources">
                <div class="col-sm-12" style="margin-bottom: 20px;">
                    <h2>Resources for the Biogas Sector  </h2>
                    <h4>Key Resources</h4>
                    <p>Resources for understanding and conducting MRV are listed below. For a more complete list of MRV resources, protocols, standards, and tools see GMI’s MRV Handbook.   </p>
                    <div style="background: #ebf7f6; width: 100%; padding: 20px; margin-bottom: 20px;">
                    <ul>
                        <li><a href="https://wriorg.s3.amazonaws.com/s3fs-public/MRV_101_0.pdf" target="_blank">MRV 101: Understanding Measurement, Reporting, and Verification of Climate Change Mitigation</a>. This report introduces three approaches to MRV for GHG mitigation efforts, including methodology and data requirements. </li>

                        <li><a href="https://unfccc.int/files/national_reports/annex_i_natcom_/application/pdf/non-annex_i_mrv_handbook.pdf" target="_blank">Handbook on Measurement, Reporting and Verification for Developing Country Parties</a>. This handbook provides detailed information and instructions on the obligations a country has on MRV, including timing and content requirements for communications per UNFCCC policy. It includes a template for reporting, and instructions for seeking technical support. </li>

                        <li><a href="https://www.climatelinks.org/resources/rali-ghg-mrv-harmonization-framework" target="_blank">GHG MRV Harmonization Framework</a>. This report is a step-by-step guide for using the top-down and bottom-up “Harmonization Framework” for conducting GHG accounting, determining GHG mitigation efforts, and implementing MRV practices. </li>

                        <li><a href="https://transparency-partnership.net/system/files/document/GH_New%20Climate_MRV%20in%20Practice_2018.pdf" target="_blank">"MRV In Practice” – Connecting Bottom-Up and Top-Down Approaches for Developing National MRV Systems for NDCs</a>. This report offers advice for developing and refining MRV systems, based on UNFCCC requirements. </li>
                    </ul>
                        </div>
                    <h4>GMI Tools  </h4>
                    <p>GMI provides several tools and resources for measuring emissions and emissions reductions for the biogas sector.  </p>
                    <div style="background: #ebf7f6; width: 100%; padding: 20px; margin-bottom: 20px;">
                    <ul>
                        <li><a href="https://www.globalmethane.org/SWEET">Solid Waste Emissions Estimation Tool (SWEET) Version 4.0</a>. This downloadable MS Excel tool estimates GHG emissions reductions for municipal solid waste projects. It is helpful for city employees responsible for tracking climate impacts of waste activities. </li>

                        <li>
                        <a href="https://www.globalmethane.org/resources/details.aspx?resourceid=5170">Anaerobic Digestion Screening Tool</a>. This tool allows users to perform rapid screening-level assessments of potential emissions reductions and biogas generation benefits of anaerobic digesters. </li>

                       <!-- <li>
                        Landfill Gas Screening Tool. This simple MS Excel-based calculator estimates landfill gas emissions based on a limited number of data inputs. </li> -->

                        <li><a href="https://www.globalmethane.org/BIOWATT">Wastewater Assessment Technology Tool (BioWATT)</a>. This downloadable MS Excel tool calculates biogas production from waste-to-energy projects and the GHG emissions reductions from using biogas-generated electricity. </li>
                    </ul>
                        </div>
                </div>
            </div>
                       </div></section>
    <section class="py-5 bg-white">
        <div class="container">

             <div class="row" id="benefits">
                <div class="col-sm-12" style="margin-bottom: 20px;">
                    <h2>Benefits of Biogas Sector MRV  </h2>
                    <h4>Develop National Greenhouse Gas (GHG) Inventories Using Biogas Project MRV Data  </h4>
                    <p>Biogas sector MRV can provide a wealth of data that can be used to improve GHG emissions inventories.  </p>
                    
<h5>GHG Inventory Methodologies for the Biogas Sector </h5>

<p> 

According to the 2006 IPCC Guidelines for National Greenhouse Gas Inventories (published in 2006 and subsequently refined, most recently in 2019), there are typically <strong>three key methodological considerations for estimating emissions from a particular source: </strong></p>
<div style="background:#ebf7f6;width:100%;padding:20px;border-radius:4px;">
    <ul>

<li>Availability of activity data. Activity data refer to information about processes that result in emissions or removals over a certain time period (e.g., amount of organic waste sent to a landfill).  </li>

<li>Availability of emissions factors. Emissions factors are values that represent a quantity of emissions per unit of activity (e.g., tons of methane emissions per ton of organic waste landfilled).  </li>

<li><strong>Choice of method</strong>. The 2006 IPCC Guidelines provide three tiers of methods for estimating emissions from a particular sector:  

<ul><li>Tier 1 methods are based on generic models and default values (e.g., for activities and emissions factors), and generally result in higher uncertainties. </li>

<li>Tier 2 methods build on Tier 1 methods, but often include country-specific data (e.g., country-specific activity data). </li>

<li>Tier 3 methods use country- and facility-specific data and tailored models to produce estimates that typically have lower uncertainty.  </li></ul></li>
        </ul>
    </div>
<br />
                    <h5>Leveraging MRV to Employ Higher-Tier Methods and Enhance GHG Inventories   </h5>
                    <p>Many governments currently use Tier 1 methods for emissions categories in the biogas sector, which can often result in +/-50 percent uncertainty for biogas sector categories. Under the UNFCCC, countries are encouraged to use higher-tier methodologies.  </p>

 

<p><strong>Opportunities for using data acquired through MRV </strong>to advance to higher-tier methods include: </p>

 <div style="background:#ebf7f6;width:100%;padding:20px;border-radius:4px;">

<ul><li><strong>Refining Recovery Estimates.</strong> Governments can use data on methane recovery from biogas projects to develop nation-specific recovery rates and improve inventories, rather than using generic default values.  </li>

<li><strong>Improving Activity Data.</strong> Governments can leverage biogas project MRV of emissions to develop better-informed estimates of activities that contribute emissions and practices that avoid them. </li>

<li><strong>Developing Country-Specific Emissions Factors.</strong> Governments can use MRV data to develop country-specific emissions factors for biogas sector sources. </li> </ul>
           </div>           
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h4> 

Enhance Mitigation Targets in Nationally Determined Contributions (NDCs) using Biogas Project MRV Data </h4>
                    <p>Biogas project MRV can help inform national mitigation targets in NDCs and enable national governments to better track their progress toward mitigation commitments. </p>

                    <h5>What are NDCs?</h5>
                    <div style="margin-left:50px;">
                    <p><strong>NDCs outline a countries’ efforts to reduce national emissions and contribute to the achievement of the long-term goals set forth in the Paris Agreement.  </strong></p>

 

<p>The first round of NDCs were submitted in anticipation of and shortly after the adoption of the Paris Agreement in 2015. Countries are asked to update their NDCs every five years, and as of November 2021, over 150 countries have submitted a new or updated NDC.</p>  

 

<p>NDCs will be reviewed as part of a global “stocktake” of efforts toward achieving global mitigation targets, the first of which will be conducted in 2023 (and every five years thereafter). </p>
                        </div>
                    <h5>Why Include Methane Emissions Reductions in Updated NDCs?</h5>
                    <div style="margin-left:50px;">
                    <p><strong>Research indicates that without significant reductions in short-lived climate pollutants, such as methane, global temperature increases will exceed 2.0°C by 2100. </strong> </p>

 

<p>As the biogas sector is responsible for approximately 20 percent of anthropogenic methane emissions, actions in this sector can play a critical role in meeting global mitigation targets. </p>
                        </div>
                    <h5>Approaches to Including Methane in NDCs </h5>
                    <p>As governments develop their NDCs, they can consider integrating efforts to mitigate biogas methane emissions by: </p>

 

<ul><li><strong>Identifying the largest sources</strong> of anthropogenic methane emissions in the biogas sector (e.g., landfills, wastewater treatment facilities, agricultural operations).  </li>

<li><strong>Establishing emissions reductions goals</strong> by source category (targets can be a percentage reduction in relation to the baseline year or a specific metric ton reduction).  </li>

<li><strong>Identifying specific strategies</strong> to mitigate anthropogenic methane by sector and source category (e.g., requiring methane recovery from all new landfills).  </li>

<li><strong>Establishing protocols for measuring methane emissions and emissions reductions</strong> for incorporation into national communications (e.g., Biennial Transparency Reports starting no later than 2024).  </li>

<li><strong>Developing a national database of emissions reductions</strong> to more easily track and link project-level data to NDC commitments.  </li>

<li><strong>Indicating in their NDCs where the country is lacking</strong> the resources or capacity required to collect data to make MRV viable. </li></ul>

                    <h5>Examples of Countries that Have Included Methane Targets in Their NDCs </h5>
                    <div style="background:#ebf7f6;width:100%;padding:20px;border-radius:4px;">
<ul style=" list-style-type: none;padding-left:0;">
    <li style="margin-bottom:10px;"><img src="rwanda_flag.png" style="width:100px;float:left;margin-right:10px;" /><strong>Rwanda</strong>’s first NDC highlighted the need for action in the solid waste sector. This NDC described the rapid growth in waste-related methane emissions under a business-as-usual scenario. The country set a target of reducing landfill methane emissions by approximately 600,000 tonnes CO2e by 2030 and intends to institute regulations on landfill emissions and using landfill gas collection and utilization (Government of Rwanda, 2015). </li>

 

 <li style="margin-bottom:10px;"><img src="dominica_flag.png" style="width:100px;float:left;margin-right:10px;" /><strong>Dominica</strong>’s NDC includes a goal of reducing emissions from the solid waste sector by 78.6 percent by 2030, which it will achieve by addressing methane emissions from its existing landfill, which was built in 2005. Methane generated at the landfill is currently vented, but the country proposes to reduce emissions by increasing organic waste diversion and installing a flaring system (Government of Dominica, 2015). </li>

 

 <li style="margin-bottom:10px;"><img src="uruguay_flag.png" style="width:100px;float:left;margin-right:10px;" /><strong>Uruguay</strong>’s NDC presents an unconditional 57 percent reduction in methane emissions intensity per gross domestic product unit from base year 1990 by 2025, and a conditional 59 percent reduction. In the waste sector, unconditional objectives will be met through the introduction of methane capture and flaring in solid urban waste disposal systems (Government of Uruguay, 2017).  </li>

</ul></div> 
                </div>

            </div>
        </div>
    </section>




    <button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top">
        <i
            class="fa fa-chevron-up" aria-hidden="true"></i>Top</button>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>


    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element');
        }
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
    </script>
    <script>
        $('.translateText').click(function () {
            $("#languageWidget").css("display", "block");
            $(".hider").slideToggle();
        });
    </script>


    <script>
        //Get the button
        var mybtnToTop = document.getElementById("btnToTop");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybtnToTop.style.display = "block";
            } else {
                mybtnToTop.style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>

        <script>
            $("#passwordbtn").click(function () {
                event.preventDefault();
                if ($("#txtEmail").val() === "loudF3rret82") {
                    $('#boxToHide').hide();
                } else {
                    window.location.href = "../index.aspx";
                }
            });
        </script>

</body>

</html>
