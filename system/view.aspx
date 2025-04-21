<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="view.aspx.vb" Inherits="M2M_Redesign.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="robots" content="noindex, nofollow">
    <title>GMI Steering Committee Participation Renewal</title>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="//cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" rel="stylesheet" />
<style>
    .edi {
        text-decoration: none;
    }

    .del {
        text-decoration: none;
        color: red;
    }

    table.dataTable thead th {
        background-color: #ADD7F6
    }

    .add {
        text-decoration: none;
        font-weight: bold;
        color: #1A1B41;
    }
</style>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="container">
                <div class="row">
                                        <div class="col-md-4">
                        <img src="../assets/images/gmi.svg" style="width: 60%" />
                    </div>
                    <div class="col-md-8">
                        <h1>GMI Steering Committee Participation Renewal</h1>
                        <asp:Label ID="UpdateLabel" runat="server" Text="Label">
                          
                        </asp:Label>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-12"><br /><br />
    
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                            <tr>
                                <td></td>
                                <td style="text-align:center;"><strong>Yes</strong></td>
                                <td style="text-align:center;"><strong>No</strong></td>
                            </tr>
                            <tr>
                                <td>Is <%=countryName%> interested in renewing its membership on the Steering Committee for the term [term dates]?
                                </td>
                                <td style="text-align:center;">
                                    <asp:RadioButton GroupName="question1" ID="RadioButton1Yes" runat="server" />
                                </td>
                                <td style="text-align:center;">
                                    <asp:RadioButton GroupName="question1" ID="RadioButton1No" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Is <%=countryName%> interested in being considered for the vacant Vice Chair position for the term [term dates]?
                                </td>
                                <td style="text-align:center;">
                                    <asp:RadioButton GroupName="question2" ID="RadioButton2Yes" runat="server" />
                                </td>
                                <td style="text-align:center;">
                                    <asp:RadioButton GroupName="question2" ID="RadioButton2No" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>Is <%=countryName%> interested in hosting an in-person Steering Committee meeting (1.5 to 2 days) in September 2023?
                                </td>
                                <td style="text-align:center;">
                                    <asp:RadioButton GroupName="question3" ID="RadioButton3Yes" runat="server" />
                                </td>
                                <td style="text-align:center;">
                                    <asp:RadioButton GroupName="question3" ID="RadioButton3No" runat="server" />
                                    <asp:TextBox ID="namefield" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="countryfield" runat="server" Visible="false"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td></td>
                                <td colspan="2" style="text-align: center;">
                                  <!--  <asp:Button ID="submitBtn" CssClass="btn btn-primary" runat="server" Text="Submit" Style="margin: auto;" /> -->
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12"><br /><br />
                        <h3><%=countryName%>'s Representatives on the Steering Committee</h3>
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                        <!-- <asp:Button ID="AddButton" runat="server" Text="Add Representative +" /> -->
                    </div>
                </div>
            </div>


        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {

            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) { return pair[1]; }
                }
                return (false);
            }

            var ct = getQueryVariable("ct");
            var usr = getQueryVariable("usr");



            $('#delegates').DataTable(
                {
                    paging: false,
                    ordering: false,
                    searching: false,
                    bInfo: false,
                    columnDefs: [
                        {
                            render: function (data, type, row) {
                                return '<a href="form.aspx?id=' + data + '&usr=' + usr + '&geo=' + row[7] + '" class="edi"> Edit </a>';
                            },
                            targets: 0,
                        },
                        {
                            render: function (data, type, row) {
                                return data + ' ' + row[2];
                            },
                            targets: 1,
                        },
                        { visible: false, targets: [0, 2, 4, 7] },
                    ],
                });
        });


    </script>
</body>
</html>
