<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Methane Initiative</title>

    <!-- #include virtual="/includes/include_head.html" -->

    <style>
        .gmi-light-orange {
            display: none;
        }

        #container {
            margin: 20px;
        }
        #data span{
            font-weight:bold;
        }
    </style>
</head>
<body>
    <div id="container">
        <div id="form">
            <input style="width:600px;" type="text" id="urlField" name="urlField" value="https://www.globalmethane.org/explore/index.aspx"><button onclick="goToURl()">Go There</button>
            <div>
                <h5>Sector</h5>
                <input type="radio" id="biogas" onclick="handleClick(this);"
                    name="sector" value="biogas" />
                <label for="biogas">Biogas</label>

                <input type="radio" id="coal" onclick="handleClick(this);"
                    name="sector" value="coal" />
                <label for="coal">Coal</label>

                <input type="radio" id="oilgas" onclick="handleClick(this);"
                    name="sector" value="oilgas" />
                <label for="oilgas">Oil & Gas</label>
                <input type="radio" id="none" onclick="handleClick(this);"
                    name="sector" value="none" />
                <label for="none">None</label>
            </div>
        </div>
        <hr />
        <p id="data">This URL has <span id="count"></span> parameters </p>
        <p id="details"></p>
    </div>
    <script>

        function goToURl() {
            window.location.href = document.getElementById("urlField").value;
        }
        var currentValue = 0;
        function handleClick(myRadio) {
            var BaseURL = "https://www.globalmethane.org/explore/index.aspx";
            if (myRadio.value == "none") {
                document.getElementById("urlField").value = BaseURL;
            } else {
                var combiner = "?";
                var SectorAddon = "sector=" + myRadio.value;
                var completed = BaseURL + combiner + SectorAddon;
                document.getElementById("urlField").value = completed;
             
            }
        }

        var getParams = function (url) {
            var params = {};
            var parser = document.createElement('a');
            parser.href = url;
            var query = parser.search.substring(1);
            var vars = query.split('&');
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split('=');
                params[pair[0]] = decodeURIComponent(pair[1]);
            }
            return params;
        };
        var str = window.location.href;
        var matches = str.match(/[a-z\d]+=[a-z\d]+/gi);
        var count = matches ? matches.length : 0;
        if (count > 0) {
            document.getElementById('count').innerHTML = count;
            var params = getParams(str);
            var params = JSON.stringify(params);
            var params = params.replace("{", "");
            var params = params.replace("}", "");
            var params = params.replace(",", "<br>");
            document.getElementById('details').innerHTML = params;
        } else {
            document.getElementById('data').innerHTML = "there are no parameters in this URL";

        }



    </script>
</body>

</html>
