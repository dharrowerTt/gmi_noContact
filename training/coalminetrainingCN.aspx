<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="coalminetrainingCN.aspx.vb" Inherits="M2M_Redesign.coalminetraining" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>开展煤矿甲烷项目预可行性研究培训 | Training | Global Methane Initiative</title>
     <!-- #include virtual="/includes/include_head.html" -->
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->

	<section class="py-5 gmi-light-blue">
        <div class="container">
            <h1>开展煤矿甲烷项目预可行性研究培训</h1>

            <div class="row">
				<div class="col-sm-4">
                <img src="images/coalmineimage.jpg"
                    style="float:right;max-width:350px; padding-left:20px; padding-bottom:20px;">
				</div>
				<div class="col-sm-8">
                <p>
                             为支持GMI倡议的落实，美国环保局与联合国欧洲经济委员会（UNECE）联合制定本培训课程，介绍了煤矿瓦斯（CMM）捕集和/或利用项目开发潜力的评估原则。课程引入的一般方法应以具体矿山的数据和分析作为基础，并根据实际情况调整，以促成项目的开发和实施。</p>
                <p>         CMM项目开发人员、第三方、矿业公司和政府官员都将从培训中受益。目前课程正在开发中，包括8个独立单元。其中前6个单元已完成开发，余下单元完成后也将发布。

                </p>
				</div>

            </div>
		</section>
		<section class="py-5 bg-white">

            <div class="container">
                <h2>课程单元</h2>
                <ul class="list-group py-2">
                    <li class="list-group-item noborder nobackground py-2"><a href="CMM_module1CN/story.html" target="_blank">单元1: 简介和目标</a>	
						</li>
                    <li class="list-group-item noborder nobackground py-2"><a href="CMM_module2cn/story.html" target="_blank">单元2: 煤矿背景和评估</a>	
						</li>
                   <li class="list-group-item noborder nobackground py-2"><a href="CMM_module3cn/story.html" target="_blank">单元3: 资源评估</a>	
						</li>
                    <li class="list-group-item noborder nobackground py-2"><a href="CMM_module4cn/story.html" target="_blank">单元4: 预测瓦斯抽采系统的甲烷产量</a></li>
                    <li class="list-group-item noborder nobackground py-2">单元5: 改进瓦斯抽采</li>
                    <li class="list-group-item noborder nobackground py-2">单元6: 量化改进甲烷抽采系统后的益处</li>
                    <li class="list-group-item noborder nobackground py-2">单元7：市场、风险与财务分析</li>
                    <li class="list-group-item noborder nobackground py-2">单元8: 案例分析—以中国六龙煤矿为例</li>

                </ul>

                </div>

    </section>


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

	

	
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />


	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/yadcf/0.9.4/jquery.dataTables.yadcf.js" integrity="sha256-j83V52uLomZxGL9GIZ7eyiv32ntFn7Kr6WQSfz3mvRs=" crossorigin="anonymous"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"> </script>
    
	<script>

        $(document).ready(function () {

            var table = $('#MLtable').DataTable({
                order: [[ 0, "desc" ]],
                responsive: true,
                search: 'GMC',
				"columns": [
          			{ "width": "15%" },
           			{ "width": "55%" },
           			{ "width": "15%" },
           			{ "width": "15%" }
        		]      
            });

            yadcf.init(table, [{
                column_number: 2,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Messages",
                filter_reset_button_text: false
            }, {
                column_number: 0,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Dates",
                filter_reset_button_text: false
            }, {
                column_number: 3,
                column_data_type: "html",
                html_data_type: "text",
                filter_default_label: "All Languages",
                filter_reset_button_text: false
            }]);


            $('#tableFilter').on('click', 'a', function() {
                event.preventDefault();
                $( "#tableFilter a" ).removeClass( "filterBold" );
                $( this ).addClass( "filterBold" );


            table
              .columns(2)
              .search($(this).text())
              .draw();
            });

            $('#tableFilter').on('click', 'a.reset', function() {
              event.preventDefault();
              table
                .search('')
                .columns(2)
                .search('')
                .draw();
            });


        })

    </script>
	
	
	
 


	
	
</body>

</html>