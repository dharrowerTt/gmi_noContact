<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.project_network_index" Codebehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Network | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
		<style>
        /* Style the tab */
        .Countrytab {
            overflow: hidden;
            /*background-color: #3F4F87;*/
        }

            /* Style the buttons inside the tab */
            .Countrytab button {
                background-color: #31699E;
				color:#D7EFF7;
				margin:0px 3px 0px 0px;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 4px 12px;
                transition: 0.3s;
                font-size: 1em;
            }

                /* Change background color of buttons on hover */
                .Countrytab button:hover {
                    background-color: #1D85B9;
                }

                /* Create an active/current tablink class */
                .Countrytab button.active {
                    background-color: #1D85B9;
					color:white;
                }

        /* Style the tab content */
        .Countrytabcontent {
            background: #fff;
			border-top:4px solid #1D85B9;
            display: none;
            padding: 0px;
        }

        .Bslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Bslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .Cslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Cslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .Ogslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .SlideNone{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
                }

        .Bslidediv h3, .Cslidediv h3, .Mslidediv h3, .Ogslidediv h3{
            font-size:1em;
            font-weight: bold;
        }

        .Ogslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }
       .Mslidediv{
            border:0px solid #232323;
            padding:15px;
            background:#fcfcfc;
        }

        .Mslidediv img{
            border: 0px solid #232323;
            margin:0px 25px 25px 0px;
        }

        .tab-content {/*display: none;*/ position:absolute!important; left:-9999px!important;}
.tab-content.current {/*display: inherit;*/ position:relative!important; left:0!important;}

		.alliance {color:#F89737;margin:0px;padding:0px;}

		
.slick-dots li {
        display: inline-block;
    }
.slick-dots li:only-child {
        display: none;
    }

		
		.lightblue{
    /*
	background-color:#e1e1e1;
    padding:3px;
    margin:2px;
    border-radius:4px;
	*/
}
		.lightblue::after{
			content:"\A";
			white-space:pre;
		}

.yadcf-filter-reset-button{
    background-color:rgba(0,0,0,0);
    border:0;
    height:20px!important;
    margin-left:2px;
}
				
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
<form id="pn_index_form" runat="server">
    <div>
        <!-- Page Content -->
        <section class="py-5 gmi-light-blue">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <img class="logoimg" src="/assets/images/gmipn2.svg" style="width:95%;margin-botton:25px;">
                    </div>

                    <div class="col-sm-6">
                        <h1>Project Network</h1>
                        <p>
                            GMI's Project Network facilitates communication, project development and implementation, and private sector involvement in methane abatement projects. Project Network members bring critical expertise and experience that help GMI Partner countries reduce methane emissions and set the stage for new and ongoing methane projects. 
                        </p>
                    </div>
                    <div class="col-sm-3">
                        <div class="border border-secondary bg-white px-0">
                            <div class="py-1 text-center bg-dark text-white"><strong>On this page</strong></div>
                            <ul class="list-group py-2">
                                <li class="list-group-item noborder nobackground py-1"><a href="#members">Members</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="#whyjoin">Why Join?</a></li>
                                <li class="list-group-item noborder nobackground py-1"><a href="#resources">Resources</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <h2>Project Network Members</h2>
                        <p>
                            Current members include the private sector, non-governmental organizations, government programs, financial institutions, research and academic programs, and others.<br /><br />
                        </p>
                        <p>
                            <strong>NEW:  Find an Expert</strong><br>
                            The Project Network member list has been enhanced with filtering features to help stakeholders identify members who have specific expertise. GMI will continue to revise this feature as new Project Network members join and existing members update their profiles.
	          <br /><br />
	          <a role="button" class="btn btn-primary btn-sm" href="member_list.aspx">Project Network Members: Find an Expert</a>
                        </p>
                    </div>
                    <div class="col-sm-4">
                 <img src="pn-pie-20240701.png" style="width:100%" />
                    

                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 vertSplitter">
                        <h2 id="whyjoin">Why Join the Project Network?</h2>

                        <h3><small class="text-info">Engage with GMI</small></h3>
                        <ul>
                            <li>Attend GMI Subcommittee meetings and events</li>
                            <li>Participate in technical workshops and knowledge-sharing events</li>
                            <li>Join networking events with industry professionals</li>
                        </ul>

                        <h3><small class="text-info">Promote Your Efforts</small></h3>
                        <ul>
                            <li>Highlight your projects via the GMI website, Project Network newsletter, case studies and social media</li>
                            <li>Use the GMI logo on your organization's website</li>
                        </ul>

                        <h3><small class="text-info">Take Action</small></h3>
                        <ul>
                            <li>Reduce costs and generate profits through methane abatement, recovery, and use projects</li>
                            <li>Identify and secure funding for projects</li>
                            <li>Submit project ideas and activities to GMI Subcommittees</li>
                        </ul>

                        <h3><small class="text-info">Learn from Others</small></h3>
                        <ul>
                            <li>Gain direct access to technical expertise and assistance</li>
                            <li>Identify opportunities for projects</li>
                            <li>Take advantage of GMI&rsquo;s extensive resource library</li>
                            <li>Exchange ideas with GMI&rsquo;s 49 Partner Countries and more than 700 Project Network members to promote multidisciplinary and multinational collaborations</li>
                            <li>Stay up-to-date on the latest international methane news, reports, and technologies</li>
                            <li>Receive information tailored to your interests with GMI&rsquo;s customized mailing list</li>
                        </ul>

                    </div>
                    <div class="col-sm-4 bg-dark text-white align-middle">
                        <br>
                        <h4 class="py-3">Open to All</h4>
                        <ul>
                            <li>Private-sector entities</li>
                            <li>Financial institutions</li>
                            <li>Other governmental and non-governmental organizations</li>
                        </ul>

                        <h4 class="py-3">Voluntary</h4>
                        <p>As with participating in any GMI activity, joining the Project Network is completely voluntary.</p>

                        <h4 class="py-3">Non-Binding</h4>
                        <p>Participants may opt-out of the Project Network at any time.</p>

                        <h4 class="py-3">It&rsquo;s Free!</h4>
                        <p>There is no cost to join the Project Network.</p>
                        <br>
                        <p class="text-center"><a class="btn btn-lg btn-primary" href="join.aspx">Join Now!</a></p>
                    </div>

                </div>
            </div>
        </section>


        <!-- -->

                <!-- -->
	<!-- #include virtual="_pageIncludeIndex/content2.html" -->
            <!-- #include virtual="/includes/footer.html" -->



</body>

</html>