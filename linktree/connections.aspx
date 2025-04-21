<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="connections.aspx.vb" Inherits="M2M_Redesign.connections" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Link Tree - Connections | Global Methane Initiative</title>
       <!-- #include virtual="/includes/include_head.html" -->
    <meta name="viewport" content="width=device-width, initial-scale=0.7">
    <script>
function setCookie(cname,cvalue,exdays) {
  const d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  let expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(';');
  for(let i = 0; i < ca.length; i++) {
    let c = ca[i];
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
  let user = getCookie("userid");
  if (user != "") {
      console.log("Welcome again " + user);
  } else {

      function getQueryVariable(variable) {
          var query = window.location.search.substring(1);
          var vars = query.split("&");
          for (var i = 0; i < vars.length; i++) {
              var pair = vars[i].split("=");
              if (pair[0] == variable) { return pair[1]; }
          }
          return (false);
      }
        
      user = getQueryVariable("id");

      if (user != "" && user != null) {
          setCookie("userid", user, 30);
      } else {
          window.location.href = "http://www.globalmethane.org/2024forum";
      }
  }
}
    </script>
    <style>
        body {
            padding-top: 5rem;
        }

        svg{
            width:20px;
        }
    </style>
</head>
<body onload="checkCookie()">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <div class="container">
      <a class="navbar-brand" href="index.aspx">Home</a>
      <a class="navbar-toggler" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </a>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
          
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
            <a class="nav-link" href="agenda.aspx">Review Agenda</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="connections.aspx">Make Connections <span class="sr-only">(current)</span></a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="feedback.aspx">Session Feedback</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="photos.aspx">Submit Photos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://forms.office.com/Pages/DesignPageV2.aspx?subpage=design&token=2463cbdf7b1c4c55a4fb65a4a68bd841&wdlor=cD8B70A01-E6F5-4F61-BC54-8F3163DAE134&id=uuQPpMer_kiHkrQ4iZNkAOHm6AdDWoNOmsvV4WobLu9UOU9DWVE0M0ZJQlpVVlNBU09FVEVBREdHRy4u&topview=Preview" target="_blank">Evaluate the Forum</a>
          </li>
        </ul>
              </div>
      </div>
    </nav>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center" >
                <div class="col-md-12">
            <div id="myConnectionSection" runat="server">
            <h2>My Connections</h2>
                <a href="export.aspx">Export my connections to my email address</a>.
                                                   <asp:GridView ID="conList" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="connectionID" HeaderText="ConnectionID" />
        <asp:BoundField DataField="firstname" HeaderText="First Name" />
        <asp:BoundField DataField="lastname" HeaderText="Last Name"  />
        <asp:BoundField DataField="connection" HeaderText="Email"  />
        <asp:BoundField DataField="note" HeaderText="Note"  />
        <asp:BoundField DataField="affiliation" HeaderText="Affiliation"  />
        
    </Columns>
</asp:GridView>
                
            <hr /></div>
                </div>
                </div>
            <div class="row justify-content-center">
                <div class="col-md-12">
            <h2>Attendee List</h2>
                                       <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="GMIRegID" HeaderText="GMIRegID"  />
        <asp:BoundField DataField="firstName" HeaderText="firstName"  />
        <asp:BoundField DataField="lastName" HeaderText="lastName"  />
        <asp:BoundField DataField="affiliation" HeaderText="Affiliation" />
        <asp:BoundField DataField="country" HeaderText="Country" />
        <asp:BoundField DataField="share" HeaderText="Share" />
    </Columns>
</asp:GridView>
                </div>
                </div>
        </div>
    </form>

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
    <script src="https://cdn.jsdelivr.net/npm/jquery.cookie@1.4.1/jquery.cookie.min.js"></script>
     
    <script>
        $(document).ready(function () {

            var userCapture = $('#idHolder').text()

            var Commstable = $('#gvComms').DataTable({
                orderCellsTop: true,
                ordering: true,
                order: {
                    idx: 1,
                    dir: 'asc'
                },
                columnDefs: [
                    {
                        "render": function (data, type, row) {
                            //console.log(row[0] + ' - ' + row[0].length);
                            if (row[6] === 0) {
                                var emailTag = "n"
                            } else {
                                var emailTag = "y"
                            }
                          
                            return '<a href="addConnection.aspx?e=' + emailTag + '&id=' + $.cookie("userid") + '&c=' + row[1] + '"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#007F73" style="fill: #007F73" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg></a> ' + row[2].charAt(0).toUpperCase() + row[2].slice(1).toLowerCase()
                                + ' ' + row[3].charAt(0).toUpperCase() + row[3].slice(1).toLowerCase() + ', ' + row[4]  ;
                            
                        },
                        "title": "Add",
                        "targets": [0]
                    },
                    {
                        "render": function (data, type, row) {
                            return row[2].charAt(0).toUpperCase() + row[2].slice(1).toLowerCase()
                                + ' ' + row[3].charAt(0).toUpperCase() + row[3].slice(1).toLowerCase() ;
                        },
                        "title": "Name",
                        "targets": [2]
                    },
                    {
                        "targets": [0,2,3,4,5],
                        "sortable": false
                    },
                    {
                        "targets": [1,2,3,4,6],
                        "visible": false
                    }],
                initComplete: function () {

                    this.api().columns([5]).every(function () {
                        var column = this;
                        var select = $('<select><option value="">' + $(this.header()).text() + '</option></select>')
                            .appendTo($(column.header()).empty())
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });
                }
            });

            var Commstable = $('#conList').DataTable({
                orderCellsTop: true,
                "order": [[1, "desc"]],
                columnDefs: [
                    {
                        "render": function (data, type, row) {
                            return '<a href="removeConnection.aspx?id=' + row[0] + '"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#A0153E"  style="fill: #A0153E" d="M432 256c0 17.7-14.3 32-32 32L48 288c-17.7 0-32-14.3-32-32s14.3-32 32-32l352 0c17.7 0 32 14.3 32 32z"/></svg> </a> ' + row[1].charAt(0).toUpperCase() + row[1].slice(1).toLowerCase()
                                + ' ' + row[2].charAt(0).toUpperCase() + row[2].slice(1).toLowerCase() +', ' + row[5];
                        },
                        "title": "Delete",
                        "targets": [0]
                    },
                    {
                        "render": function (data, type, row) {
                            return row[1].charAt(0).toUpperCase() + row[1].slice(1).toLowerCase()
                                + ' ' + row[2].charAt(0).toUpperCase() + row[2].slice(1).toLowerCase();
                        },
                        "title": "Name",
                        "targets": [1]
                    },
                    {
                        "targets": [0, 4],
                        "sortable": false
                    },
                    {
                        "targets": [1,2,3,5],
                        "visible": false
                    }]
            });

        });
    </script>

</body>
</html>
