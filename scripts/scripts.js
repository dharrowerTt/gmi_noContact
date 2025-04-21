$(document).ready(function () { //begin jquery



    var $clicked = 0;

    //disable contact button script
    function disablelink() {
        var obj = document.getElementById("emailbutton");
        obj.disabled = true;
        obj.onclick = new Function("return false;");
        parent.location = 'mailto:secretariat@globalmethane.org?subject=Global Methane Initiative';
    }



    //Tab Switcher
    $("#org_tab").hide();
    $("#project_tab").hide();
    $("li.country").addClass("country_on");

    $("#storytabs .country").click(function () {
        $("#org_tab").hide();
        $("#project_tab").hide();
        $("#country_tab").show();
        $("li.country").addClass("country_on");
        $("li.org").removeClass("org_on");
        $("li.project").removeClass("project_on");
    });

    $("#storytabs .org").click(function () {
        $("#country_tab").hide();
        $("#project_tab").hide();
        $("#org_tab").show();
        $("li.org").addClass("org_on");
        $("li.country").removeClass("country_on");
        $("li.project").removeClass("project_on");
    });

    $("#storytabs .project").click(function () {
        $("#country_tab").hide();
        $("#org_tab").hide();
        $("#project_tab").show();
        $("li.project").addClass("project_on");
        $("li.country").removeClass("country_on");
        $("li.org").removeClass("org_on");
    });


    //Tab Switcher2
    $("#stories2 #project_tab").hide();
    $("#stories2 #org_tab").show();
    $("#stories2 li.org").addClass("org_on");

    $("#stories2 #storytabs .org").click(function () {
        $("#project_tab").hide();
        $("#org_tab").show();
        $("li.org").addClass("org_on");
        $("li.project").removeClass("project_on");
    });

    $("#stories2 #storytabs .project").click(function () {
        $("#org_tab").hide();
        $("#project_tab").show();
        $("li.project").addClass("project_on");
        $("li.org").removeClass("org_on");
    });



    //Accordion

    $(".accordion ul.acclist").hide();
    $(".accordion h3").click(function () {
        $(this).next("ul.acclist").slideDown("slow").siblings("ul.acclist:visible").slideUp("slow");
        $(this).addClass("active");
        $(this).siblings("h3").removeClass("active");
    });


    $(".accordion div").hide();
    //	$(".accordion h3#reportsdiv").addClass("active");
    //	$(".accordion h3#reportsdiv+div").slideDown("slow");
    $(".accordion h3").click(function () {
        $(this).next("div").slideDown("slow").siblings("div").slideUp("slow");
        $(this).addClass("active");
        $(this).siblings("h3").removeClass("active");
        //$('#countryleft').css( { "margin-bottom" : "600px" , "clear" : "both" } );
        //$('.accordion').addClass("accordionadd");
        //$('#maincontentarea').addClass("maincontentareaadd");
    });

    $(".accordion div.open").show();


    $(".accordion2, .accordion3").each(function () {
        var $accordion = $(this),
		$h3 = $accordion.find('h3');

        $accordion.find('.innerslide').show();
        //added by Bo 2-7-12
        if ($('#activitydetailsinfo h3').length === 1) {
            $accordion.find('.innerslide').show();
        } else {
            $accordion.find('.innerslide').hide();
        };

    });

    $(".accordion2 h3").click(function () {
        var $this = $(this);

        if ($clicked == 0) {
            $this.addClass('active').next('div').slideDown('slow');
            $clicked = 1;
        }
        else {
            $this.removeClass('active').next('div').slideUp('slow');
            $clicked = 0;
        }

        return false;
    });

    //			$(".accordion2 .innerslide").hide();
    //			$(".accordion2 h3").click(function(){
    //				 if($(this).hasClass('active')) {  
    //             	 $(this).next("div").slideUp('slow',function() {  
    //                 $(this).removeClass('active');  
    //           });  
    //        	}
    //			});


    //			$(".accordion2 h3").click(function(){
    //				$(this).next("div").slideDown("slow").siblings("div").slideUp("slow");
    //				$(this).addClass("active");
    //				$(this).siblings("h3").removeClass("active");
    //			});

    //			$(".accordion2 h3.active").click(function(){
    //				$(this).next("div").slideUp("slow");
    //				$(this).removeClass("active");
    //			});




    //remove bottom border
    $('#rightlist li:last').css("border-bottom", "0");
    $('#sectorevents li:last').css("border-bottom", "0");


    //zebra table
    //$('.zebra tr:even').addClass('alt');
    $("#projectstable2").tablesorter({
        widgets: ['zebra']
    });


    //Flash map
    //$('#flashmap').flash({
    //		swf: 'flash/map.swf',
    //		width: 789,
    //		height: 397,
    //		params: {
    //           wmode: 'transparent'
    //        }
    //
    //	});

    //$('#flashmap2').flash({
    //		swf: '../flash/map.swf',
    //		width: 789,
    //		height: 397,
    //		params: {
    //           wmode: 'transparent'
    //        }
    //
    //	});

    // projects randomizer

    var projects = new Array();
    projects[0] = "<h2>Brazilian Landfill to Generate Electricity and Earn Carbon Credits</h2><p>Belo Horizonte Landfill, a closed landfill in Municipality of Belo Horizonte, Brazil, expects to use landfill gas as an energy source very soon. An assessment report estimated that sufficient landfill gas could be recovered to generate 9 megawatts of power and reduce annual emissions by an average of 134,160 metric tons of carbon dioxide equivalent each year for ten years.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_brazil1.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[1] = "<h2>Chinese Landfill to Sell Electricity to Grid and Gain Income from Carbon Credits</h2><p>The U.S. Environmental Protection Agency helped the Chengdu City Landfill complete an assessment of the landfill gas potential for energy use. The landfill is looking to supply electricity to the local grid as well as register the project and sell Certified Emission Reductions under the Kyoto Protocol's Clean Development Mechanism.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_china1.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[2] = "<h2>Oxidizing Ventilation Air Methane to Increase Mine Safety, Reduce Emissions, and Make Hot Water for Miners</h2><p>A project at the Datong Mine, located in the Chongqing Municipality in Southwest China, will destroy ventilation air methane as well as produce hot water for coal mine workers.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_china2.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[3] = "<h2>Liquefied Coal Mine Methane to be Hauled by Truck in China</h2><p>A project is underway to gather, purify, and liquefy as much as 130 million cubic meters annually of coal mine methane from Songzao, China's six operating coal mines in the Chongqing Municipality. The liquefied natural gas will be transported by truck for use locally and in other areas south and east of the municipality.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_china3.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[4] = "<h2>Energy Independence, Environmental Benefits, and Financial Gain from Methane Capture on Brazilian Swine Farms</h2><p>Frigorífico Mabella, a pork processing, swine production, and trading company in Brazil uses a biogas to supply electricity. The farm combines high technology with simple designing, which makes it financially attractive as well as benefiting the environment.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_brazil2.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[5] = "<h2>Chinese Landfill Succeeds at Capturing and Using Landfill Gas</h2><p>More than half a million tons of carbon dioxide equivalent emissions will be reduced by 2022 at the Gaoantun Landfill in China by the capture and reuse of landfill gas. Energy from the landfill gas will be available to sell to potential end-users located near the landfill.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_china4.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[6] = "<h2>First Indian Landfill Gas Project to Receive Carbon Credits</h2><p>As the first of its kind for India, the Gorai landfill is expected to reduce 2 million tons of carbon dioxide equivalent emissions over the lifetime of the project and has the potential to earn $5.2 million (USD) for carbon credits for captured gas.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_india1.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[7] = "<h2>First Landfill Gas-to-Energy Project Online in Ukraine</h2><p>Ukraine's first landfill gas energy project in Khmelnitsky is using landfill gas to fuel four infrared heaters installed in the landfill's maintenance garage-a perfect application for this location.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_ukraine1.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";
    projects[8] = "<h2>Chinese Landfill Uses Micro-Turbine to Produce Power for Onsite Use</h2><p>Reducing methane emissions through both capture and flaring at the Mentougou Landfill in China should eliminate up to 395,021 metric tons of carbon dioxide equivalent by 2028.</p><p class='moreinfo'><a href='../resources/archive/projects/projects_china5.aspx'>[More Info]</a></p><p id='allproj'><a href='../resources/archive/projects/projects_index.aspx'>View All Project Spotlights >></a></p>";

    var randomproj = Math.floor(Math.random() * projects.length);
    $('#sstitle').after(projects[randomproj]);
    $('#project_tab').append(projects[randomproj]);



    // activity table jquery
    $.tablesorter.defaults.widgets = ['zebra'];


    var flag1 = false;
    //var flag2 = false;
    //sarah notes
    var flag2 = true;

    //if ($("#activityag").is(":checked")) flag1 = true;

    //sarah notes: We only show project type for Agriculture sector.
    //comment out next two lines.
    //if ($("#sectorpickactivitytype2").val() == "012A0000000am85IAA") flag2 = true;
    //if (!flag2) $("#multi1, #multi2, #multi3").hide();


    //if (!flag1) $("#activitysectorpickddboxes2, #multi1, #multi2, #multi3").hide();
    //Hide div w/id extra
    //$("#activitysectorpickddboxes, #activitysectorpickddboxes2, #activitysectorpickddboxes3, #activitysectorpickddboxes4").css("display", "none");

    //new sarah added for Ag sector
    //comment out for now since we only have Ag


    ////THIS IS CHANGING AS OF 1/16/12 PER BO -- KEEPING FOR LEGACY
    //    if ($("#activityag").is(":checked")) {
    //        flag1 = false;
    //        $("#activitysectorpickddboxes2").hide("fast");
    //		$("#activitysectorpickddboxes5").hide("fast");
    //    }
    //    else {
    //        flag1 = true;
    //        $("#activitysectorpickddboxes2").show("fast");
    //		$("#activitysectorpickddboxes5").show("fast");
    //    }
    //    //end of sarah added for Ag sector
    //
    $(".sectorboxestitle, .sectorboxestitle2, .sectorboxestitle2a, #activitysectorpickddboxes2, #activitysectorpickddboxes5, #activitysectorpickddboxes").hide("fast");
    /*$('input.unique').click(function() {
    $('input.unique:checked').not(this).removeAttr('checked');
    if ($("#projectdatabasecheck").is(":checked")) {
    flag1 = true;
    $("#activitysectorpickddboxes2").show("fast");
    }
    else {
    flag1 = false;
    $("#activitysectorpickddboxes2").hide("fast");
    }
    	
    if ($("#expoposterscheck").is(":checked")) {
    flag1 = true;
    $("#activitysectorpickddboxes5").show("fast");
    }
    else {
    flag1 = false;
    $("#activitysectorpickddboxes5").hide("fast");
    }
    });*/


    //Ag sector
    //show/hide after page is loaded - sarah 02-27
    if ($("#activityag").is(":checked")) {

        $(".sectorboxestitle").show("fast");

        $("#activitysectorpickddboxes2, #activitysectorpickddboxes5").show("fast");
        $(".sectorboxestitle2").hide("fast");


        if ($("#projectdatabasecheck").is(":checked")) {
            $("#activitysectorpickddboxes2").show("fast");

            $('#expoposterscheck').removeAttr('checked');
            $("#activitysectorpickddboxes5").hide("fast");
        }
        else {
            $("#activitysectorpickddboxes2").hide("fast");
        }


        if ($("#expoposterscheck").is(":checked")) {
            $("#activitysectorpickddboxes5").show("fast");

            $('#projectdatabasecheck').removeAttr('checked');
            $("#activitysectorpickddboxes2").hide("fast");
        }
        else {
            $("#activitysectorpickddboxes5").hide("fast");
        }
    }
    else {
        $("#activitysectorpickddboxes2, #activitysectorpickddboxes5, .sectorboxestitle2").hide("fast");
    }
    //end of sarah added for Ag sector




    //Landfill Sector
    //show/hide after page is loaded - sarah 02-27
    if ($("#activityland").is(":checked")) {
        $(".sectorboxestitle2").show("fast");
        if ($("#lsacheck").is(":checked")) {
            $(".sectorboxestitle2a, #activitysectorpickddboxes").show("fast");
            if ($("#lfgprojects").is(":checked")) {
                $("#landdd2").show("fast");
                $("#landdd1").show("fast");

                $("#landacttype").hide("fast");
            }
            if ($("#otherlfgacts").is(":checked")) {
                $("#landacttype").show("fast");

                $("#landdd2").hide("fast");
                $("#landdd1").hide("fast");
            }
        }

    }
    else {

    }
    //end of sarah added for landfill sector



    //sarah 02-20
    $('#allsectors').click(function () {
        //$('#activitysectorpick input.unique:checked').not(this).removeAttr('checked');


        if ($("#allsectors").is(":checked")) {
            //    $("#activitysectorpickddboxes2").show("fast");
            //    $("#activitysectorpickddboxes5").show("fast");
            $(".sectorboxestitle, .sectorboxestitle2, .sectorboxestitle2a, #landacttype, #activitysectorpickddboxes, #activitysectorpickddboxes2, #activitysectorpickddboxes5").hide("fast");

            if ($("#activityag").is(":checked")) {
                $('#activityag').removeAttr('checked');
            }
            if ($("#activityland").is(":checked")) {
                $('#activityland').removeAttr('checked');
            }
        }
        else {
            //     $("#activitysectorpickddboxes2").hide("fast");
            //     $("#activitysectorpickddboxes5").hide("fast");
            $(".sectorboxestitle").hide("fast");
            //	$('#activitysectorpickddboxes').removeAttr('checked');
        }
    });

    $('#activityag').click(function () {
        //$('#activitysectorpick input.unique:checked').not(this).removeAttr('checked');
        $('#lsacheck, #lsocheck').removeAttr('checked');


        if ($("#activityag").is(":checked")) {
            //alert(" I check Ag");
            //    $("#activitysectorpickddboxes2").show("fast");
            //    $("#activitysectorpickddboxes5").show("fast");
            $(".sectorboxestitle").show("fast");
            $(".sectorboxestitle2, .sectorboxestitle2a, #landacttype, #activitysectorpickddboxes").hide("fast");
            $('#projectdatabasecheck, #expoposterscheck, #lsacheck, #lsocheck, #lfgprojects, #otherlfgacts, #activityland, #allsectors').removeAttr('checked');

            if ($("#allsectors").is(":checked")) {
                $('#allsectors').removeAttr('checked');
            }
            if ($("#activityland").is(":checked")) {
                $('#activityland').removeAttr('checked');
            }
        }
        else {
            //     $("#activitysectorpickddboxes2").hide("fast");
            //     $("#activitysectorpickddboxes5").hide("fast");
            $(".sectorboxestitle").hide("fast");
            $('#lsacheck, #lsocheck').removeAttr('checked');
            //	$('#activitysectorpickddboxes').removeAttr('checked');
        }
    });

    $('#activityland').click(function () {
        //$('#activitysectorpick input.unique:checked').not(this).removeAttr('checked');
        $('#projectdatabasecheck, #expoposterscheck, #lsacheck, #lsocheck, #lfgprojects, #otherlfgacts, #activityag, #allsectors').removeAttr('checked');


        if ($("#activityland").is(":checked")) {
            $(".sectorboxestitle2").show("fast");
            $("#activitysectorpickddboxes2, #activitysectorpickddboxes5, .sectorboxestitle").hide("fast");
            //			$("#activitysectorpickddboxes").hide("fast");
            $('#projectdatabasecheck, #expoposterscheck, #lsacheck, #lsocheck, #lfgprojects, #otherlfgacts, #activityag, #allsectors').removeAttr('checked');


            if ($("#activityag").is(":checked")) {
                $('#activityag').removeAttr('checked');
            }
            if ($("#allsectors").is(":checked")) {
                $('#allsectors').removeAttr('checked');
            }
        }
        else {
            $(".sectorboxestitle2").hide("fast");
            $('#projectdatabasecheck, #expoposterscheck, #lsacheck, #lsocheck, #lfgprojects, #otherlfgacts, #activityag, #allsectors').removeAttr('checked');
            //$('#projectdatabasecheck').removeAttr('checked');
            //$('#expoposterscheck').removeAttr('checked');
            //			$("#activitysectorpickddboxes").hide("fast");
        }
    });

    $('#projectdatabasecheck').click(function () {
        //$('input.unique:checked').not(this).removeAttr('checked');


        if ($("#projectdatabasecheck").is(":checked")) {
            $("#activitysectorpickddboxes2").show("fast");
            $('#expoposterscheck, #activityland, #allsectors, #lsacheck, #lsocheck').removeAttr('checked');
            $("#activitysectorpickddboxes5").hide("fast");
        } else {
            $("#activitysectorpickddboxes2").hide("fast");
            $('#expoposterscheck, #activityland, #allsectors, #lsacheck, #lsocheck').removeAttr('checked');
        }
    });

    $('#expoposterscheck').click(function () {
        //$('input.unique:checked').not(this).removeAttr('checked');

        if ($("#expoposterscheck").is(":checked")) {
            $("#activitysectorpickddboxes5").show("fast");
            $('#projectdatabasecheck, #activityland, #allsectors, #lsacheck, #lsocheck').removeAttr('checked');
            $("#activitysectorpickddboxes2").hide("fast");
        } else {
            $("#activitysectorpickddboxes5").hide("fast");
            $('#projectdatabasecheck, #activityland, #allsectors, #lsacheck, #lsocheck').removeAttr('checked');
        }
    });



    //new sarah added for landfill sector
    /*var flaglandfill = false;
    var flaglandfill2 = false;

    if ($("#activityland").is(":checked")) {
    flaglandfill = true;
    $(".sectorboxestitle2").show("fast");
    $("#activitysectorpickddboxes").show("fast");
        
    }
    else {
    flaglandfill = false;
    $(".sectorboxestitle2").hide("fast");
    $("#activitysectorpickddboxes").hide("fast");
    }*/

    $('#lsacheck').click(function () {
        //$('.sectorboxestitle2 input.unique:checked').not(this).removeAttr('checked');
        if ($("#lsacheck").is(":checked")) {
            $(".sectorboxestitle2a").show("fast");
            //          $("#activitysectorpickddboxes").show("fast");
            $('#lsocheck, #lfgprojects, #otherlfgacts, #activityag, #allsectors, #projectdatabasecheck, #expoposterscheck').removeAttr('checked');
        } else if ($("#lsacheck").not(":checked")) {
            $(".sectorboxestitle2a").hide("fast");
            $("#activitysectorpickddboxes").hide("fast");
        }
    });

    $('#lsocheck').click(function () {
        //$('.sectorboxestitle2 input.unique:checked').not(this).removeAttr('checked');
        $("#activitysectorpickddboxes").hide("fast");
        $(".sectorboxestitle2a").hide("fast");
        $('#lsacheck, #lfgprojects, #otherlfgacts, #activityag, #allsectors, #projectdatabasecheck, #expoposterscheck').removeAttr('checked');
    });


    $('#lfgprojects').click(function () {
        //$('.sectorboxestitle2a input.unique:checked').not(this).removeAttr('checked');
        if ($("#lfgprojects").is(":checked")) {
            $("#activitysectorpickddboxes").show("fast");
            $("#landdd2, #landdd1").show("fast");
            $("#landacttype").hide("fast");

            $('#otherlfgacts, #activityag, #allsectors, #projectdatabasecheck, #expoposterscheck, #lsocheck').removeAttr('checked');
        } else if ($("#lfgprojects").not(":checked")) {
            $("#activitysectorpickddboxes").hide("fast");
            $("#landdd2, #landdd1").hide("fast");
        }
    });


    $('#otherlfgacts').click(function () {

        //$('.sectorboxestitle2a input.unique:checked').not(this).removeAttr('checked');
        if ($("#otherlfgacts").is(":checked")) {
            $("#activitysectorpickddboxes").show("fast");
            $("#landacttype").show("fast");
            $("#landdd2, #landdd1").hide("fast");

            $('#lfgprojects, #activityag, #allsectors, #projectdatabasecheck, #expoposterscheck, #lsocheck').removeAttr('checked');
        } else if ($("#otherlfgacts").not(":checked")) {
            $("#activitysectorpickddboxes").hide("fast");
            $("#landacttype").hide("fast");
        }
    });

    /*	$('#lsacheck').click(function () {
    // $('input.unique:checked').not(this).removeAttr('checked');


    if ($("#lsacheck").is(":checked")) {
    $("#activitysectorpickddboxes").show("fast");
    } else if ($("#lsacheck").not(":checked")) {
    $("#activitysectorpickddboxes").hide("fast");
    }
    });*/

    //    if ($("#sectorpickactivitytype").val() == "012A0000000am85IAA") flaglandfill2 = true;
    //    if (!flaglandfill2) $("#landdd1, #landdd2").hide();


    //    $("#sectorpickactivitytype").change(function () {
    //        if ($("#activitytypeisproject2").is(":selected")) {
    //            $("#landdd1, #landdd2").show("fast");
    //        } else if ($("#activitytypeisproject2").not(":selected")) {
    //            $("#landdd1, #landdd2").hide("fast");
    //        }
    //    });



    /*	$('#lsacheck').click(function () {
    if ($("#activityland").is(":checked")) {
    $(".sectorboxestitle2").show("fast");
    $("#activitysectorpickddboxes").hide("fast");
    }
    else {
    $(".sectorboxestitle2").hide("fast");
    $("#activitysectorpickddboxes").hide("fast");
    }
    });*/


    //end of sarah added for landfill sector

    //     $("#activityag").click(function () {

    //    if ($("#activityag").is(":checked")) {
    //    $("#activitysectorpickddboxes2").show("fast");
    //    if ($("#activitytypeisproject").is(":selected")) {
    //    $("#multi1, #multi2, #multi3").show("fast");
    //    } else if ($("#activitytypeisproject").not(":selected")) {
    //    $("#multi1, #multi2, #multi3").hide("fast");
    //    }

    //    $("#sectorpickactivitytype2").change(function () {
    //    if ($("#activitytypeisproject").is(":selected")) {
    //    $("#multi1, #multi2, #multi3").show("fast");
    //    } else if ($("#activitytypeisproject").not(":selected")) {
    //    $("#multi1, #multi2, #multi3").hide("fast");
    //    }
    //    });
    //    }
    //    else if ($("#activityag").not(":checked")) {

    //    $("#activitysectorpickddboxes2").hide("fast");
    //    $("#multi1, #multi2, #multi3").show("fast");
    //    }
    //    });

    //new sarah revised activityAg function
    //comment out for now since we only have Ag

    //COMMENTING OUT FOR THE MOMENT 1/16/12 PER BO
    //    $("#activityag").click(function () {
    //        if ($("#activityag").is(":checked")) {
    //            $("#activitysectorpickddboxes2").show("fast");          
    //            $("#multi1, #multi2, #multi3").show("fast");  
    //       }
    //        else if ($("#activityag").not(":checked")) {
    //            $("#activitysectorpickddboxes2").hide("fast");
    //            $("#multi1, #multi2, #multi3").show("fast");
    //        }
    //    });
    // end of sarah revised activityAg function


    //this is to be used for now while we only have one sector to showcase. once more remove this chunk and uncomment above.
    //may have to fiddle with the 'flags' above that as well.

    //sarah notes: We only show project type for Agriculture sector.
    //comment out next function.

    //    $("#sectorpickactivitytype2").change(function () {
    //        if ($("#activitytypeisproject").is(":selected")) {
    //            $("#multi1, #multi2, #multi3").show("fast");
    //        } else if ($("#activitytypeisproject").not(":selected")) {
    //            $("#multi1, #multi2, #multi3").hide("fast");
    //        }
    //    });




    /*   $("#activityland").click(function () {

    if ($("#activityland").is(":checked")) {
    $("#activitysectorpickddboxes").show("fast");
    if ($("#activitytypeisproject2").is(":selected")) {
    $("#landdd1, #landdd2").show("fast");
    } else if ($("#activitytypeisproject2").not(":selected")) {
    $("#landdd1, #landdd2").hide("fast");
    }

    $("#sectorpickactivitytype").change(function () {
    if ($("#activitytypeisproject2").is(":selected")) {
    $("#landdd1, #landdd2").show("fast");
    } else if ($("#activitytypeisproject2").not(":selected")) {
    $("#landdd1, #landdd2").hide("fast");
    }
    });
    }
    else if ($("#activityland").not(":checked")) {

    $("#activitysectorpickddboxes").hide("fast");
    $("#landdd1, #landdd2").show("fast");
    }
    });*/



    $("#activitycoal").click(function () {

        if ($("#activitycoal").is(":checked")) {
            $("#activitysectorpickddboxes3").show("fast");
        }
        else if ($("#activitycoal").not(":checked")) {

            $("#activitysectorpickddboxes3").hide("fast");
        }
    });


    $("#activityoilgas").click(function () {

        if ($("#activityoilgas").is(":checked")) {
            $("#activitysectorpickddboxes4").show("fast");
        }
        else if ($("#activityoilgas").not(":checked")) {

            $("#activitysectorpickddboxes4").hide("fast");
        }
    });



    $("#activitysearchtable td span").addClass("hide");
    $("#activitysearchtable").tablesorter();
    $("#activitysearchtable th").click(function () {
        $("#activitysearchtable td span").removeClass("hide");
        $("#activitysearchtable td span").addClass("show");
    });

    $("#sitesearchtable td span").addClass("hide");
    $("#sitesearchtable").tablesorter();
    $("#sitesearchtable th").click(function () {
        $("#sitesearchtable td span").removeClass("hide");
        $("#sitesearchtable td span").addClass("show");
    });


    $('#activitytabs a').click(function () {
        switch_tabs($(this));
    });

    $('#translationtabs a').click(function () {
        switch_translationtabs($(this));
    });

    $('#subnavtabs a').click(function () {
        switch_subnavtabs($(this));
    });

    switch_tabs($('.defaulttab'));
    switch_translationtabs($('.defaulttab'));
    switch_subnavtabs($('.defaulttab'));


    if ($("#HiddenIsPostBack").val() == "true") {
        $('#searchresults').removeClass("hide");

    }
    else {
        $('#introtext').removeClass("hide");
    }

    function switch_tabs(obj) {
        $('.tab-content').hide();
        $('#activitytabs a').removeClass("selected");
        var id = obj.attr("rel");

        $('#' + id).show();
        obj.addClass("selected");
    }

    function switch_translationtabs(obj) {
        $('.tab-content-feature').hide();
        $('#translationtabs a').removeClass("selected");
        var id = obj.attr("rel");

        $('#' + id).show();
        obj.addClass("selected");
    }

    function switch_subnavtabs(obj) {
        $('.tab-content').hide();
        $('#subnavtabs a').removeClass("selected");
        var id = obj.attr("rel");

        $('#' + id).show();
        obj.addClass("selected");
    }


    var linkanchor = window.location.hash;

    if (linkanchor == '#tab2') {
        switch_tabs($('#activitytabs a[rel=activitysearchtable]'));
    };
    if (linkanchor == '#tab3') {
        switch_tabs($('#activityDetailstab a[rel=activitydetailsinfo]'));
    };



    // question mark popup
    $('#qmark').qtip({
        content: 'GMI sites are distinct, sector-specific facilities (i.e., swine operation, coal mine, landfill, gas company) at which methane abatement, recovery, and/or use activities (e.g., flaring, measurement/feasibility studies, technology demonstrations, power generation) have been identified or undertaken by Partner Countries, Project Network members, and other stakeholders that have devoted time and efforts to advance methane emission reduction through GMI. There might be multiple activities at a given site as methane emission reduction projects move from idea to implementation.',
        show: 'mouseover',
        hide: 'mouseout',
        style: {
            width: 400,
            padding: 5,
            background: '#d1ebfc',
            color: 'black',
            'font-size': 11,
            opacity: .75,
            //      textAlign: 'center',
            border: {
                width: 1,
                radius: 5,
                color: '#bde2fa'
            }
        },
        position: {
            corner: {
                target: 'topRight',
                tooltip: 'bottomLeft'
            }
        }

    });



    $('#qmark2').qtip({
        content: 'Do you have a site/activity to add or suggestion for improving the GMI database, or would you like to submit a change or correction to data currently found in the database? If so, please add your information or submit a comment.',
        show: 'mouseover',
        hide: 'mouseout',
        style: {
            width: 400,
            padding: 5,
            background: '#d1ebfc',
            color: 'black',
            'font-size': 11,
            opacity: .75,
            //      textAlign: 'center',
            border: {
                width: 1,
                radius: 5,
                color: '#bde2fa'
            }
        },
        position: {
            corner: {
                target: 'topRight',
                tooltip: 'bottomLeft'
            }
        }

    });

    $('#qmark3').qtip({
        content: 'GMI sites are facilities at which methane abatement, recovery, and/or use projects have been identified or completed. <br/><br/>Non-GMI sites are locations of potential or existing projects that are not GMI supported.',
        show: 'mouseover',
        hide: 'mouseout',
        style: {
            width: 400,
            padding: 5,
            background: '#d1ebfc',
            color: 'black',
            'font-size': 11,
            opacity: .75,
            //      textAlign: 'center',
            border: {
                width: 1,
                radius: 5,
                color: '#bde2fa'
            }
        },
        position: {
            corner: {
                target: 'topRight',
                tooltip: 'bottomLeft'
            }
        }

    });


    //var hiding = $("#sitedetailstable div dl dd");
    //hiding.each(function(){
    //if ($(this).text() == " ") {
    //	if ($(this).parent().siblings().children("dd").text() == " ") $(this).closest("div").hide();
    //	else $(this).parent().hide();	
    //}
    //});

    //hiding.parent().css("display", "none");
    //alert(hiding.length);
    //if (hiding.length == 2) 
    //hiding.siblings().parent().parent().hide();
    //$("#sitedetailstable dl dd:contains('---')").parent().css("background-color", "red");

    /*$(window).load(function() {
    $(".sectorboxestitle").show("fast");
    });*/
});                        //end jquery


/* making the date static for now...
function placeDate() {
	  	var currentTime = new Date();
		var month = currentTime.getMonth() + 1;
		var year = currentTime.getFullYear();
		var lastupdated = month + "/" + year;
		document.getElementById('thedate').innerHTML=lastupdated;
	  };
	  placeDate();
*/






// google translate
function doTranslate(lang_pair) {
    //window.open('http://translate.google.com/translate_c?hl=en&langpair=' + lang_pair + '&u=' + location.href); //translate_p
    window.open('http://translate.google.com/translate_p?hl=en&langpair=' + lang_pair + '&u=' + 'http://www.globalmethane.org/' + location.pathname);

        }

function ShowDoc(url){
window.open(url,'guide','status=0,toolbar=1,menubar=1,resizable=1,location=50,scrollbars=1,width=800,height=500');
}


function ValidatePageForCRMSearch() {        
		if (document.getElementById('allsectors').checked == false && document.getElementById('activityag').checked == false && document.getElementById('activityland').checked == false) {
            alert("Please select your sector.");
            return false;
        }
        else if (document.getElementById('activityag').checked == true && document.getElementById('projectdatabasecheck').checked == false && document.getElementById('expoposterscheck').checked == false) {
            alert("Please select Project Database or Ag Sector Activities.");
            return false;
        }
        else if (document.getElementById('activityland').checked == true && document.getElementById('lsocheck').checked == false && document.getElementById('lsacheck').checked == false) {
            alert("Please select Sites only or Sites and activities.");
            return false;
        }
        else if (document.getElementById('lsacheck').checked == true && document.getElementById('lfgprojects').checked == false && document.getElementById('otherlfgacts').checked == false) {
            alert("Please select LFG Projects or Other MSW Sector Activities.");
            return false;
        }
        else {
			return true;
        }         
};




//google analytics

(function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date(); a = s.createElement(o),
    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

ga('create', 'UA-35143521-1', 'globalmethane.org');
ga('send', 'pageview');


//Event Tracking
$(document).ready(function () {
    $('a[href$=.pdf]').click(function () {
        _gaq.push(['_trackEvent', 'oldestwithout', 'oldest', 'Baby\'s First Birthday']);
        _trackEvent('old2without', 'old2');
        ga('send', 'event', 'new2without', 'new');
        ga('send', 'event', 'downloads', 'download');
    });
});
/*
$(document).ready(function () {
    $('a.eventTest').click(function () {
        ga('send', 'test4', 'test4', 'new');
    });
});*/

   // $('a.eventTest').click(function () {
    //   ga('send', 'test5', 'test5', 'new');
    //});


/*
var Begin = new Date();
var Start = Begin.getTime();
//code to attach trackevent code block for document downloads/external links/mailto links  
$(document).ready(function () {
    // Creating custom :external selector
    $.expr[':'].external = function (obj) {
        return !obj.href.match(/^javascript/) && (obj.hostname != location.hostname) && !obj.href.match(/^mailto\:\?/);
    };

    // Add 'external' CSS class to all external links
    $('a:external').addClass('external');
    $('a.external').bind('click', function () {
        var obcat = this.href.match(/^mailto\:/);
        var targeturl = this.href;
        if (obcat) {
            targeturl = targeturl.replace('mailto:', '');
            var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
            _gaq.push(['_trackEvent', 'Emails', 'Click-Event', targeturl, timeElapse, true]);
        } else {
            var targetname = this.text;
            var targetpath = (this.pathname.charAt(0) == "/") ? this.pathname : "/" + this.pathname;
            if (this.search && this.pathname.indexOf(this.search) == -1) targetpath += this.search;
            if (this.hostname != location.host) targetpath = this.hostname + targetpath;
            var isDoc = this.href.match(/\.(?:doc|eps|jpg|png|svg|xls|ppt|pdf|xls|zip|txt|vsd|vxd|js|css|rar|exe|wma|mov|avi|wmv|mp3)($|\&|\?)/);
            if (isDoc) {
                var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
                _gaq.push(['_trackEvent', 'Documents', 'Click-Event', targetpath, timeElapse, true]);
            } else {
                var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
                _gaq.push(['_trackEvent', 'Outbound', targeturl, document.location.href, timeElapse, true]);
            }
        }
    });

    $('a').bind('click', function () {
        var targetname = this.text;
        var targetpath = (this.pathname.charAt(0) == "/") ? this.pathname : "/" + this.pathname;
        if (this.search && this.pathname.indexOf(this.search) == -1) targetpath += this.search;
        if (this.hostname != location.host) targetpath = this.hostname + targetpath;
        var isDoc = this.href.match(/\.(?:doc|docx|eps|jpg|png|svg|xls|ppt|pptx|pdf|xls|xlsx|zip|txt|vsd|vxd|js|css|rar|exe|wma|mov|avi|wmv|mp3)($|\&|\?)/);
        if (isDoc) {
            var End = new Date(); var Stop = End.getTime(); var timeElapse = Math.round((Stop - Start) / 1000);
            _gaq.push(['_trackEvent', 'Documents', 'Click-Event', targetpath, timeElapse, true]);
        }
    });
});

*/
        window.onload = function () {
            var scrollY = parseInt('<%=Request.Form("scrollY") %>');
            if (!isNaN(scrollY)) {
                window.scrollTo(0, scrollY);
            }
        };
        window.onscroll = function () {
            var scrollY = document.body.scrollTop;
            if (scrollY == 0) {
                if (window.pageYOffset) {
                    scrollY = window.pageYOffset;
                }
                else {
                    scrollY = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
                }
            }
            if (scrollY > 0) {
                var input = document.getElementById("scrollY");
                if (input == null) {
                    input = document.createElement("input");
                    input.setAttribute("type", "hidden");
                    input.setAttribute("id", "scrollY");
                    input.setAttribute("name", "scrollY");
                    document.forms[0].appendChild(input);
                }
                input.value = scrollY;
            }
        };
