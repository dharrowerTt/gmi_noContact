<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="help.aspx.vb" Inherits="M2M_Redesign.support" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="light/lightbox.css" rel="stylesheet" />
    <title>Global Methane Initiative</title>

     <!-- #include virtual="/includes/include_head.html" -->

    <style>
        .gmi-light-orange{
            display:none;
        }
        body{
            background:#dcf4fd!important;
        }

        .agenda{
            width:100%;
            margin:auto;
            margin-bottom:20px;
        }
        .agenda tr:first-child {
            background: #2980b9; 
            white-space:nowrap;
        }
        .agenda th{
            text-align:center;
            color:white;
            padding:5px;
        }
        .agenda tr:nth-child(2){
            background:#dcf4fd;
        }
        .agenda tr{
            border-bottom:1px solid #0abde3;
        }
        .agenda tr td:first-child{
 
            padding:5px;
            vertical-align:top;
        }

        
        .agenda tr td:nth-child(2){
            padding:5px;
            vertical-align:top;
        }
        .agenda tr td:first-child span{
            font-weight:bold;
        }
        .agenda tr td:first-child ul{
             list-style-type: none;
        }
        label span{
            color:#d63031;
        }
        .requiredNote{
            color:#d63031;
        }

        .sidebar h2{
            color:#96def9;
        }

        .sidebar ul {
  margin: 0.75em 0;
  padding: 0 1em;
  list-style: none;
}
.sidebar ul li::before { 
  content: "";
  border-color: transparent #96def9;
  border-style: solid;
  border-width: 0.35em 0 0.35em 0.45em;
  display: block;
  height: 0;
  width: 0;
  left: -1em;
  top: 0.9em;
  position: relative;
}

.agenda tr:nth-child(2) {
  background: #dcf4fd!important;
  border-bottom:2px solid #007ac2;

}
.agenda tr:last-child {
  background: #dcf4fd!important;
  border-top:2px solid #007ac2;

}


@media (max-width: 768px){
    .sidebarImg{
        display:none
    }
}


.ctanav{
    background:#131131;
    color:#fafcfc;
    text-align:center;
    padding:8px;
        border-bottom: 2px solid #262261;
}
.ctanav ul{
    list-style-type:none;
    margin:0;
    padding-left: 0px;
    white-space: nowrap;
}
@media (max-width: 576px) {
    .ctanav ul{
        font-size:smaller;
    }

}
.ctanav ul li{
    padding:15px;
    display:inline;
}
.ctanav ul li a{
    color:white;
}
.mainTitle{
    color:#262261;
    line-height:.8;
}
h2 span{
    color:#455445;
    font-weight:normal;
    font-size: 16px;
}
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <div class="container" style="z-index:300;background:rgba(255,255,255,.8);padding:0;">
    <header>
        
            <div id="headercarouselarea" class="carousel slide carousel-fade" data-ride="carousel" data-interval="10000" style="border-bottom:2px solid #007ac2;">            
                <ol class="carousel-indicators">
                    <li data-target="#headercarouselarea" data-slide-to="0" class="active"></li>
                    <li data-target="#headercarouselarea" data-slide-to="1"></li>

                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" data-interval="12000" style="background-image:linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.5)), url('assets/space.jpg')">
                        <div class="carousel-caption d-none d-md-block" style="color: #fcfcfc!important;"> 
                            <h1 class="display-5">A Call to Action on Methane</h1>
                            <h2>an international dialogue hosted by the GMI</h2>
                        </div>
                    </div>
                                        <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" data-interval="12000"
                         style="background-image:linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.8)), url('assets/space2.jpg')">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="display-5">Featured Speakers</h2>
                            <p class="lead">
                                View a list of speakers at our event on 3 June.
                            </p>
                            <p><a role="button" class="btn btn-primary btn-sm" href="#">Coming Soon</a></p>
                        </div>
                    </div>

                                    <a class="carousel-control-prev" href="#headercarouselarea" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#headercarouselarea" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>


                </div>

            </div>
        </header>
    </div>
    <div class="container">
        <div class="row ctanav">
            <div class="col-md-12">
                <ul>
                          <li><a href="index.aspx">Register</a></li>
                    <li><a href="agenda.aspx">Agenda</a></li>
                    <li><a href="speakers.aspx">Speakers</a></li>
                    <li><a href="help.aspx">Help</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 sidebar  order-12 order-md-1" style="z-index:300;background:#262261;padding-top:20px;color:#fcfcfc;">
                <h2>Objectives         </h2>
                <ul >
                    <li>Raise international awareness of critical need to reduce methane emissions</li>
                    <li>Emphasize opportunities for the Global Methane Initiative (GMI) and strategic partners to take action to redeuce methane</li>
                </ul>
                <img src="assets/methane.png" class="sidebarImg" style="width:100%;">
                <h2>Outcome</h2>
                Engaged, empowered partners prepared to act on methane
        <br /><br />
            </div>
            <div class="col-md-8  order-1 order-md-12"  style="z-index:300;background:#fcfcfc;padding-top:20px;color:#232323;">
                <h2 class="mainTitle">A Call to Action on Methane <br /><span>3 June 2021 • 8:00-10:30 am EDT (UTC-4)</span></h2>
                <h3>Help</h3>
                <p>
                    <ul>
                        <li>This event will be conducted as a Microsoft Live Event</li>
<li>Registrants will receive the live meeting link approximately 72 hours in advance of the event</li>
<li>Tips for logging in will be provided soon (see <a href=https://support.microsoft.com/en-us/office/attend-a-live-event-in-teams-a1c7b989-ebb1-4479-b750-c86c9bc98d84?ui=en-us&rs=en-us&ad=us" target="_blank">Attend a live event in Teams</a> on the Microsoft Support site for more details)<br />
    <img src="assets/teams.png" style="max-width:50%;"/>
    <figcaption class="figure-caption">The Microsoft Live Event Welcome Screen</figcaption>
</li>

<li>You can watch in your web browser if your <a href="https://docs.microsoft.com/en-us/MicrosoftTeams/get-clients#web-client" target="_blank">Browser supports Microsoft Teams</a>. </li>
                        <li>The event will begin at 12:00 UTC – check <a href="https://www.timeanddate.com/worldclock/fixedtime.html?low=c&p1=263&iso=20210603T08&msg=A%20Call%20to%20Action%20on%20Methane&ah=2&am=30&sort=2" target="_blank">here to confirm your time zone</a>.<br />
                            <a class="example-image-link" href="assets/map.png" data-lightbox="example-1"><img class="example-image" src="assets/map.png" alt="image-1" style="max-width:100%;" /></a>
                             <figcaption class="figure-caption"><a href="assets/map.png" data-lightbox="image-2">Click to enlarge</a></figcaption>
                          
                        </li>


                    </ul>
                </p>

            </div>
        </div>
        <div class="row">
            
            <div class="col-md-12">
                
                <br /><br />
            </div>
        </div>
    </div>

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


        <script src="light/lightbox-plus-jquery.min.js"></script>

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
    window.onscroll = function () { scrollFunction() };

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

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
    function confirmSubmission() {
        Swal.fire({
            title: 'Success!',
            text: 'You have been registered, a link to the event will be emailed to you shortly.',
            icon: 'success',
            confirmButtonText: 'Close'
        })
    }
    function confirmSubmissionAgain() {
        Swal.fire({
            title: 'Success!',
            text: 'It looks like you already registered. We will send a copy of your sign up email shortly.',
            icon: 'success',
            confirmButtonText: 'Close'
        })
    }
</script>
</body>

</html>