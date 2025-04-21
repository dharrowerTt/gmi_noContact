<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="comms_add.aspx.vb" Inherits="M2M_Redesign.comms_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html>
<head runat="server">
    <title>Admin | New Communications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
  



    <script language="JavaScript" type="text/javascript" src="date.js"></script>
    <script type="text/javascript" language="JavaScript">
        <!--
    //var cal = new CalendarPopup();
    function validateDataEntry() {
        return true;
    }

    function validateFieldValue() {
        if (validateDataEntry()) {
            return true;
        } else {
            return false;
        }
    }
    -->
    </script>

    <style>
        body {
            background: #D2E9EE;
        }

        .container {
            background: #fafafa;
        }

        .row {
            border-bottom: 2px solid #cacaca;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .radiostyle {
            height: auto;
        }

            .radiostyle label {
                margin-left: 3px !important;
                margin-right: 10px !important;
            }
    </style>
</head>
<body onload="checkCookie()">
    <form runat="server">
    <div id="cover"></div>
    <div class="container">
        <!-- #include virtual="nav.html" -->


        <h3>Add/Edit Communication</h3>
        <div class="row">
            <div class="col-md-8">
          Please note that all of the items saved through this feature are available immediately on the GMI website.  Prior to saving, ensure that the information matches the communication and the URL is correct.
              <div class="form-group">
                   <label for="subjectLine">Subject Line</label>
                <asp:TextBox ID="subjectLine" class="form-control" placeholder="Subject Line" runat="server" required></asp:TextBox>
                  </div>
              <div class="form-group">
                   <label for="msgUrl">Message URL</label>
                <asp:TextBox ID="msgURL" class="form-control" placeholder="URL Link" runat="server" required></asp:TextBox>
                    </div>
                           <div class="form-group">
                   <label for="areaOfInterest">Area of Interest</label>
                <asp:DropDownList ID="areaOfInterest" class="form-control" runat="server" required>
                    <asp:ListItem Value="biogas">Biogas</asp:ListItem>
                    <asp:ListItem Value="coal">Coal</asp:ListItem>
                    <asp:ListItem Value="oilgas">Oil & Gas</asp:ListItem>
                    <asp:ListItem Value="general">General</asp:ListItem>
                    <asp:ListItem Value="projectnetwork">Project Network</asp:ListItem>
                </asp:DropDownList>
                               </div>
                           <div class="form-group">
                   <label for="language">Language</label>
                <asp:DropDownList ID="language" class="form-control" runat="server" required>
                    <asp:ListItem Value="English">English</asp:ListItem>
                    <asp:ListItem Value="French">French</asp:ListItem>
                    <asp:ListItem Value="Russian">Russian</asp:ListItem>
                    <asp:ListItem Value="Spanish">Spanish</asp:ListItem>
                </asp:DropDownList>
                </div>
              <div class="form-group">
                  <label for="dateSent">Date Sent</label>
                  <asp:TextBox ID="dateSent" class="form-control" type="date" runat="server"></asp:TextBox>

                  </div>

                              <div class="form-group">
                   <label for="msgUrl">Current Contacts</label>
                <asp:TextBox ID="contacts" class="form-control"  runat="server" required></asp:TextBox>
                    </div>
                              <div class="form-group">
                   <label for="msgUrl">Current Subscribers</label>
                <asp:TextBox ID="subscribers" class="form-control" runat="server" required></asp:TextBox>
                    </div>
                              <div class="form-group">
                   <label for="msgUrl">Open Rate</label>
                <asp:TextBox ID="openRate" class="form-control"  runat="server" required></asp:TextBox>
                    </div>
                              <div class="form-group">
                   <label for="msgUrl">Click Rate</label>
                <asp:TextBox ID="clickRate" class="form-control"  runat="server" required></asp:TextBox>
                    </div>
                              <div class="form-group">
                   <label for="msgUrl">Bounce Rate</label>
                <asp:TextBox ID="bounceRate" class="form-control"  runat="server" required></asp:TextBox>
                    </div>
                              <div class="form-group">
                   <label for="msgUrl">Unsubscribe Rate</label>
                <asp:TextBox ID="unsubRate" class="form-control" runat="server" required></asp:TextBox>
                    </div>

              <asp:Button ID="Add" runat="server" Text="Save" class="btn btn-primary btn-lg" />
     
            </div>
            <div class="col-md-4">
                <h6>Subject Line</h6>
                This should match the subject line of the message distributed through the mailing list.
                <h6>Message URL</h6>
                The full URL to the HTML (View this email in your browser). The HTML variable should be removed from the URL (e.g. “?e=c8fb161e52”). An example is https://mailchi.mp/0d6748f0eeab/register-for-the-gmi-coal-mines-subcommittee-virtual-meeting-on-4-march-6175202.
                <h6>Area of Interest</h6>
                Select the most appropriate option based on the audience of the message. Use General if the mailing list content applies to more than one category.
                <h6>Language</h6>
                Select the language used in the communication.
                <h6>Date Sent</h6>
                Select the date that the message was distributed.
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
               <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="dateofSend" HeaderText="Date Sent"  />
        <asp:BoundField DataField="subjectLine" HeaderText="Subject Line"  />
        <asp:BoundField DataField="msgURl" HeaderText="URL"  />
        <asp:BoundField DataField="areaOfInterest" HeaderText="Area of Interest"  />
        <asp:BoundField DataField="language" HeaderText="Language" />
        <asp:BoundField DataField="commID" HeaderText="Edit" />
    </Columns>
</asp:GridView>
            </div>
        </div>
    </div>
             </form>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <script>
    $(document).ready( function () {
        $('#gvComms').DataTable({
            "order": [[0, "desc"]],
            columnDefs: [
                {
                    "render": function (data, type, row) {
                        return '<a target="_blank" href="' + row[2] + '">' + row[1] + ' </a>';
                    },
                    "title": "Message",
                    "targets": [1]
                },
                {
                    "render": function (data, type, row) {
                        return '<a href="comms_manage.aspx?commsID=' + row[5] + '">Edit/Delete</a>';
                    },
                    "title": "Manage",
                    "targets": [5]
                },
                {
                    "targets": [2],
                    "visible": false
                }]
        });
    });
    </script>
    <script>


            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = "username" + "=" + cvalue + ";" + expires + ";path=/";
            }

        function getCookie(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function checkCookie() {
            var user = getCookie("username");
            if (user != "") {
                document.getElementById("cover").style.display = "none";
            } else {
                window.location.href = "/gmi-admin/index.aspx";
            }
        }

        function deleteCookie() {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "/gmi-admin/index.aspx";
        }


    </script>
    <script type="text/javascript">
        function confirmSubmission() {
            window.location.href = "comms_add.aspx";
        }
    </script>
</body>
</html>
