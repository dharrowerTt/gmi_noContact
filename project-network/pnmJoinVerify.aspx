<%@ Page Language="vb" ContentType="text/html" ResponseEncoding="UTF-8" CodeBehind="pnmJoinVerify.aspx.vb"
    AutoEventWireup="false" Inherits="M2M_Redesign.pnmJoinVerify" %>

<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Change Confirmation | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
<!-- #include virtual="/includes/header.html" -->
     <form id="form1" runat="server">
    <div>
	<!-- Page Content -->
    <section class="py-5 gmi-light-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center">
					<img class="logoimg" src="/assets/images/gmipnNew.png" style="min-width:150px;max-width:250px;width:95%;margin-bottom:25px;">
</div>
                <div class="col-sm-8">
                    <p><a href="index.aspx#members">
                        <small class="text-muted text">
                            <i class="fa fa-arrow-left" aria-hidden="true"></i> 
                            Project Network
                        </small>
                        </a></p>
                    <h1> Confirm Your Request</h1>
        <p>
            Please review the information collected and click below to Confirm your request for membership in the Project Network. If you want to make changes, use the browser back button to update the form.</p>
</div>
        </div>
    </section>
    <section class="py-5 bg-white">
		<div class="container">
        <asp:Panel ID="divverify" runat="server">
            <p>
                <strong>Thank you for completing this form. Please confirm the information you entered
                    below. If it is correct, click the Confirm button at the bottom of this page. If
                    it is not correct, click the browser back button to make the
                    necessary corrections.</strong></p>
            <p>
                <img src="/assets/images/checkedbox_trans.gif" />
                I understand that submitting this form signifies a voluntary commitment by my organization
                to support the Global Methane Initiative and become an active participant in the
                Project Network. I agree that GMI can share my information on the website as a resource
                for global project development and that the provided contact(s) names will be listed
                with my organization.</p>
            <p>
                The Project Network is comprised of representatives from local governments, the
                private sector, the research community, development banks and other governmental
                and nongovernmental organizations who are committed to identifying and implementing
                cost-effective methane emission reduction opportunities that bring this clean energy
                source to market.</p>
            <h2>
                Project Network Membership Responsibilities</h2>
            <ul>
                <li>Support the goal of reducing global methane emissions through cost-effective, near-term
                    methane recovery and use as a clean energy source.</li>
                <li>Actively participate in Initiative-sponsored workshops and events for the purpose
                    of facilitating project development and information exchange.</li>
                <li>Work with Partner governments and other members of the Project Network in identifying
                    and undertaking cooperative activities aimed at overcoming challenges to cost-effective
                    methane recovery and use.</li>
                <li>Take actions that support project development, such as emission inventories, feasibility
                    studies, technology demonstration, technology deployment, and project finance.</li>
                <li>Communicate your participation and report the results of your activities to other
                    members.</li>
            </ul>
            <h2>
                Contact Information:</h2>
            <div style="width: 50%; float: left; min-height: 576px;">
                <p>
                    <label for="Name">
                        Organization:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="Name" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Website">
                        Web site:</label>
                    <strong>
                        <asp:Label ID="Website" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="DateEntered">
                        Date Entered:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="DateEntered" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="FirstName">
                        First Name:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="FirstName" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="lastName">
                        Last Name:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="lastName" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Titlex">
                        Title:</label>
                    <strong>
                        <asp:Label ID="Titlex" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="MailAddress1">
                        Organization Address:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="MailAddress1" runat="server"></asp:Label>
                    <asp:Label ID="MailAddress2" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="City">
                        City:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="City" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="State">
                        State/Province:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="State" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="PostalCode">
                        Postal Code:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="PostalCode" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Country">
                        Country:</label>
                    <span class="required">*</span> <strong>
                        <asp:Label ID="Country" runat="server"></asp:Label></strong></p>
            </div>
            <div style="width: 50%; float: left; min-height: 576px;">
                <p>
                    <label for="MailAddress3">
                        Contact Address:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="MailAddress3" runat="server"></asp:Label>
                <asp:Label ID="MailAddress4" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="City_c">
                        City:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="City_c" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="State_c">
                        State/Province:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="State_c" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="PostalCode_c">
                        Postal Code:<span class="required">*</span></label>
                    <strong>
                        <asp:Label ID="PostalCode_c" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Country_c">
                        Country:</label>
                    <span class="required">*</span> <strong>
                        <asp:Label ID="Country_c" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Email">
                        Email:</label>
                    <span class="required">*</span> <strong>
                        <asp:Label ID="Email" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Telephone">
                        Telephone:</label>
                    <span class="required">*</span> <strong>
                        <asp:Label ID="Telephone" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Cellphone">
                        Cell Phone:</label>
                    <strong>
                        <asp:Label ID="Cellphone" runat="server"></asp:Label></strong></p>
                <p>
                    <label for="Fax">
                        Fax:</label>
                    <strong>
                        <asp:Label ID="Fax" runat="server"></asp:Label></strong></p>
            </div>
            <div class="clear">
            </div>
          
            <h2>
                <label for="type">
                    Type of Organization:</label></h2>
          
            <p>
                <asp:Image ID="orgType1" runat="server" ImageUrl="/assets/images/uncheckedradio.gif"></asp:Image>
                Private Sector</p>
            
            <p>
                <asp:Image ID="orgType2" runat="server" ImageUrl="/assets/images/uncheckedradio.gif"></asp:Image>
                Local, regional or other governmental organization
            </p>
            
            <p>
                <asp:Image ID="orgType3" runat="server" ImageUrl="/assets/images/uncheckedradio.gif"></asp:Image>
                Researcher organization</p>
           
            <p>
                <asp:Image ID="orgType4" runat="server" ImageUrl="/assets/images/uncheckedradio.gif"></asp:Image>
                Non-governmentalorganization
            </p>
            
            <p>
                <asp:Image ID="orgType5" runat="server" ImageUrl="/assets/images/uncheckedradio.gif"></asp:Image>
                Financial Institution
            </p>
            
            <asp:Button ID="btnBack" runat="server" Text="Back" Visible="false" CssClass="btn btn-outline-danger"></asp:Button>
            <asp:Button ID="btnSubmit" runat="server" Text="Confirm"  CssClass="btn btn-primary"></asp:Button>
        </asp:Panel>
        <asp:Panel ID="diverror" runat="server" Visible="false">
            <h2>
                A problem occurred</h2>
            <p>
                Thank you for submitting your request to join the Project Network. Unfortunately,
                an error occurred in saving your information. An administrator has been notified
                about the issue.
            </p>
            <p>
                In order to complete your request to join, please download <a href="/documents/ppnma.pdf">
                    this agreement</a> (PDF, 2 pp, 268 KB) and fax a hard copy to +1-781-674-2906,
                Attn: GMI ASG or email to <a href="mailto:secretariat@globalmethane.org&subject=Join the GMI Project Network">
                    secretariat@globalmethane.org</a>.</p>
            <p>
                We look forward to collaborating with you to achieve the goals of the Initiative.
                Please do not hesitate to contact us at <a href="mailto:secretariat@globalmethane.org&subject=GMI Project Network">
                    secretariat@globalmethane.org</a> if you have any questions regarding the Initiative.</p>
        </asp:Panel>
        <p>
       
        </form>
 </div>
	</section>
	<asp:Label runat="server" ID ="lblMemo" Visible="false"></asp:Label>
	<button onclick="topFunction()" class="btn btn-dark btn-sm" id="btnToTop" title="Go to top"><i class="fa fa-chevron-up" aria-hidden="true"></i> Top</button>
		
	
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
    window.onscroll = function() {scrollFunction()};

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
		
	
		
		
</body>

</html>
