<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="step4.aspx.vb" Inherits="M2M_Redesign.step4" %>

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
        table img, .uploadImage{
            width:150px;
            height:auto;
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
            <li class="active">Step 2</li>
            <li class="active">Step 3</li>
            <li class="active last">Step 4</li>
            <li>Step 5</li>
        </ul>

        <div class="container">
            <div class="row">
                <div class="col-md-12 order-md-1">
                    <h4 class="mb-3" style="margin-top: 15px;">Step 4: Do you have any photos, images, or videos
                        that
                        will help to tell your story?</h4>
                    <p>
                        Use the button below to upload images that can be added to your story. Please include images for
                        your organization logo, project logo, diagrams, or photos that will convey
                        technical concepts or real-world impacts of your activities. You may add multiple images.

                    </p>
                    <form class="needs-validation" runat="server" novalidate>

                        <div class="mb-3">
                            <div class="form-group">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick = "Upload" />
                                <asp:GridView ID="gvImages" runat="server" OnRowDeleting="OnRowDeleting" OnRowDataBound = "OnRowDataBound" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:ImageField DataImageUrlField="Path" HeaderText="Image" HeaderStyle-CssClass="uploadImage" />
        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
       
    </Columns>
</asp:GridView>
                        <hr />
   
                        <div id="dialog" style="display: none">
                        </div>
                            </div>
                        </div>

                        <div>
                            <div id="ytForm" style="width: 100%;" class="mb-3">
                                <label for="videos">Provide links to existing videos on YouTube, etc.</label>
                                <asp:TextBox ID="ID" type="text" style="display:none"  placeholder="" runat="server"></asp:TextBox>
    <asp:TextBox ID="urlList" type="text" class='output-box' style="display:none"  placeholder="" runat="server"></asp:TextBox>
                                <div class="input-group mb-3">
                                    <asp:TextBox ID="youtubeUrls" runat="server" class="form-control youtube-input" Style="background-color:#A5CDEF;" Visible="False"></asp:TextBox>
                                      <div class="input-group-append">
   <asp:Button ID="EditBox" Visible="False" runat="server" Text="Edit" />
  </div>
</div>
                                <div class="input-group">
                                        
                                    <input type="text" class="form-control url youtube-input" id="videos" placeholder="">
                                </div>
                                <br>
                            </div>
                        </div>
                        <input type="button" id="addURL" value="Add New Row" class="btn btn-primary btn-lg" />
                        <input type="button" id="removeURL" value="Remove Row" class="btn btn-primary btn-lg" />

                        <div style="margin-top: 20px;">
                            Want to upload a video file? Use the <a
                                href="https://docs.google.com/forms/d/e/1FAIpQLSfu93SWPy-vz1xBUf2upwzWDYJS2KylAfpw8FTXalG6dwLC1w/viewform"
                                target="_blank">Global Methane Challenge Video Submission form</a> to upload a video
                            file (for example, .mp4). A direct video submission requires a separate form due to the file
                            size requirements. The video form will open in a separate tab.
                        </div>
                        <hr class="mb-4 linebreak">

                        <div>
                            <div class="btn btn-primary btn-lg" style="float:left;" id='goBack'>Previous
                            Step</div>
                            <div class="btn btn-primary btn-lg" style="float:right;" id='btnSave'>Next
                            Step</div>
                        <br>
                        <br>
                        <br>

                                     

</form>
                        </div>
                </div>


            </div>
        </div>


            <form style="display: none" action="step5.aspx" method="POST" id="redirectform">
          <input type="hidden" id="submissionID" name="submissionID" value="<%=submissionID%>"/>
        </form>

        <form style="display: none" action="step3.aspx" method="POST" id="BackSpace">
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
                var form = document.getElementById("ytForm");
                var input = document.createElement("input");
                input.setAttribute('class', 'form-control url');
                input.setAttribute('id', 'textbox' + counter);
                input.type = "text";

                form.appendChild(input);

                document.getElementById("removeURL").style.display = "inline-block";
            }

            document.getElementById("removeURL").onclick = function () {
                var form = document.getElementById("ytForm");

                var element = document.getElementById("textbox" + counter);
                element.parentNode.removeChild(element);

                counter = counter - 1;
            }
        </script>

    <script type="text/javascript">
    $(function () {
        $("table img").bind("click", function () {
            alert($(this).attr('src'));
            var ImageUrl = ($(this).attr('src'));

            console.log(ImageUrl);

            $.ajax({
                type: "POST",
                url: "step4.aspx/deleteImg",
                data: 'urls= ' + ImageUrl ,
                success: function (response) {
                    



                }
            });
            return false;
        });
    });
        </script>


    <script type="text/javascript">
    $(function () {
        $("[id*=btnSave]").bind("click", function () {

            var textInput = [];
            $(".youtube-input").each(function () {
                if (this.value.length > 0) {
                    textInput.push(this.value);
                }
            });
            var textOutput = textInput.join(', ');
            

            var urls = {};
            urls.urlList = textOutput;

            $.ajax({
                type: "POST",
                url: "step4.aspx/uploadYoutube",
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
            $(".youtube-input").each(function () {
                if (this.value.length > 0) {
                    textInput.push(this.value);
                }
            });
            var textOutput = textInput.join(', ');


            var urls = {};
            urls.urlList = textOutput;

            $.ajax({
                type: "POST",
                url: "step4.aspx/uploadYoutube",
                data: '{urls: ' + JSON.stringify(urls) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    $("#BackSpace").submit();
                }
            });
            return false;
        });
    });
</script>
</body>

</html>