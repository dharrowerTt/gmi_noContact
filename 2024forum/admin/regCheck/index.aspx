<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index20" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div>

                <asp:Button ID="Button1" runat="server" Text="Update Database" Visible="false" />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="regDate" HeaderText="Registration Date" />
                        <asp:BoundField DataField="email" HeaderText="Email Address" />
                        <asp:BoundField DataField="status" HeaderText="Status" />
                        <asp:BoundField DataField="visaSupportLetter" HeaderText="Visa Support Letter" />
                        <asp:BoundField DataField="modeOfParticipation" HeaderText="Mode of Participation" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label">Paste the contents (not the column headers) of <strong>Registration Date, Email Address, Status, Visa Support Letter, Mode of Participation, and Sessions (H:M)</strong>.<br /><img src="capture.png" /><br /></asp:Label>
                <asp:Button ID="Button2" runat="server" Text="View Last Upload" /><br />
                <asp:TextBox ID="txtCopied" runat="server" TextMode="MultiLine" AutoPostBack="true"
                    OnTextChanged="PasteToGridView" Height="400" Width="800" />

                <div class="row">
                    <div class="col-md-12">
                <asp:GridView ID="gvComms" runat="server" AutoGenerateColumns="false" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="UNECEemail" HeaderText="UNECE email" />
                        <asp:BoundField DataField="GMIemail" HeaderText="GMI email" />
                        <asp:BoundField DataField="UNECEstatus" HeaderText="UNECE status" />
                        <asp:BoundField DataField="UNECEparticipation" HeaderText="UNECE Participation" />
                        <asp:BoundField DataField="GMIparticipation" HeaderText="GMI Participation" />
                    </Columns>
                </asp:GridView>
                    </div>
                    </div>
                <div class="row">
                    <div class="col-md-12">
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label id="Label2" runat="server" Visible="false">UNECE export compared to GMI registrants</label>
                        <asp:GridView ID="gvComms2" runat="server" AutoGenerateColumns="false" Visible="false">
                            <Columns>
                                <asp:BoundField DataField="UNECEemail" HeaderText="UNECE email" />
                                <asp:BoundField DataField="GMIemail" HeaderText="GMI email" />                        
                                <asp:BoundField DataField="UNECEstatus" HeaderText="UNECE status" />
                                <asp:BoundField DataField="UNECEparticipation" HeaderText="UNECE Participation" />
                                <asp:BoundField DataField="GMIparticipation" HeaderText="GMI Participation" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-6">
                        <label id="Label3" runat="server" Visible="false">GMI registrants compared to UNECE registrants</label>
                        <asp:GridView ID="gvComms3" runat="server" AutoGenerateColumns="false" Visible="false">
                            <Columns>
                                <asp:BoundField DataField="GMIemail" HeaderText="GMI email" />
                                <asp:BoundField DataField="UNECEemail" HeaderText="UNECE email" />   
                                <asp:BoundField DataField="UNECEstatus" HeaderText="UNECE status" />
                                <asp:BoundField DataField="UNECEparticipation" HeaderText="UNECE Participation" />
                                <asp:BoundField DataField="GMIparticipation" HeaderText="GMI Participation" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>

            <script type="text/javascript">
                window.onload = function () {
                    document.getElementById("<%=txtCopied.ClientID %>").onpaste = function () {
                        var txt = this;
                        setTimeout(function () {
                            __doPostBack(txt.name, '');
                        }, 100);
                    }
                };
            </script>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
            </script>
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
            <script>
                $(document).ready(function () {
                    $('#gvComms').DataTable({
                        "order": [[0, "desc"]],
                        initComplete: function () {
                            this.api().columns([2, 3, 4]).every(function () {
                                var column = this;
                                var select = $('<br><select><option value=""></option></select>')
                                    .appendTo($(column.header()))
                                    .on('change', function () {
                                        var val = $.fn.dataTable.util.escapeRegex(
                                            $(this).val()
                                        );

                                        column
                                            .search(val ? val : '', false, false)
                                            .draw();
                                    });
                                var addedOptions = [];
                                column.data().unique().sort().each(function (d, j) {
                                    var options = d.split(',');

                                    for (x = 0; x < options.length; x++) {
                                        var val = options[x].trim();

                                        if (!addedOptions.includes(val)) {
                                            select.append('<option value="' + val + '">' + val + '</option>');
                                            addedOptions.push(val);
                                        }
                                    }
                                });
                            });
                        }
                    });
                    //second table
                    $('#gvComms2').DataTable({
                        "order": [[0, "desc"]],
                        columnDefs: [{
                            "render": function (data, type, row) {
                                if (row[1] === row[0]){
                                    return "✅";
                                } else {
                                    return row[1];
                                };
                            },
                            "title": "Match",
                            "targets": [1]
                        },
                            {
                                "targets": [3,4],
                                "visible": false
                            }]
                    });
                    //third table
                    $('#gvComms3').DataTable({
                        "order": [[0, "desc"]],
                        columnDefs: [{
                            "render": function (data, type, row) {
                                if (row[1] === row[0]){
                                    return "✅";
                                } else {
                                    return row[1];
                                };
                            },
                "title": "Match",
                    "targets": [1]
                        },
                            {
                                "targets": [3,4],
                                "visible": false
                            }]
                    });
                });
            </script>


        </form>
    </div>
</body>
</html>
