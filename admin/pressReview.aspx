<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pressReview.aspx.vb" Inherits="M2M_Redesign.pressReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/15da2e6088.js" crossorigin="anonymous"></script>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

    html, body {
        margin: 0;
        background: #EEEBD3;
        color: #255957;
        font-size: 16px;
        font-family: 'Roboto', sans-serif;
    }

    a {
        color: #437C90;
    }

    ul {
        list-style-type: none; /* Remove bullets */
        padding: 0; /* Remove padding */
        margin: 0; /* Remove margins */
    }

    li {
        background: #fcfcfc;
        margin: 10px;
        padding: 15px;
        border-radius: 20px;
    }

    .controlPanel {
        background: #fcfcfc;
        margin: 10px;
        padding: 15px;
        border-radius: 20px;

    }
    .even{background-color: #e9f0f0!important;}
</style>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h2>News Feed</h2>
                <div id="rss-feeds"></div>
            </div>
            <div class="col-md-8">
                <h2>Control Panel</h2>
                <div class="controlPanel" id="">
                    <form runat="server">
                        <div class="form-group">
                            <label for="url">URL</label>
                            <asp:TextBox ID="url" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="headline">Headline</label>
                            <asp:TextBox ID="headline" runat="server" class="form-control"></asp:TextBox>
                        </div>
                                 <div class="form-group">
                            <label for="publisher">Publisher</label>
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="topic">Topic</label>
                            <asp:DropDownList ID="Topic" class="form-control" runat="server">
                                <asp:ListItem Value="biogas">Biogas</asp:ListItem>
                                <asp:ListItem Value="coalmines">Coal Mines</asp:ListItem>
                                <asp:ListItem Value="oilgas">Oil & Gas</asp:ListItem>
                                <asp:ListItem Value="general">General</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="form-group">
                            <label for="paywall">Paywall?</label>
                            <asp:RadioButton ID="paywall" runat="server" />
                        </div>
                        <div class="form-group">
                             <label for="topic">Date Published</label>
                            <asp:Calendar ID="Calendar1" runat="server" Font-Names="sans-serif"></asp:Calendar>
                        </div>
                    </form>
                    <hr />
                    <table id="listPress">
                        <thead>
                            <tr>
                                <th>Article</th>
                                <th>Publisher</th>
                                <th>Date</th>
                                <th>Category</th>
                                <th>Paywall?</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href="https://news.google.com/articles/CBMiNWh0dHBzOi8vd3d3LmJiYy5jb20vbmV3cy9zY2llbmNlLWVudmlyb25tZW50LTU2OTMzNDQz0gE5aHR0cHM6Ly93d3cuYmJjLmNvbS9uZXdzL3NjaWVuY2UtZW52aXJvbm1lbnQtNTY5MzM0NDMuYW1w?hl=en-US&gl=US&ceid=US%3Aen">Cutting methane gas 'crucial for climate fight'</a></td>
                                <td>BBC News</td>
                                <td>05/07/21</td>
                                <td>General</td>
                                <td>0</td>
                                <td>Draft</td>
                            </tr>
                            <tr>
                                <td><a href="https://www.nytimes.com/2021/04/24/climate/methane-leaks-united-nations.html">Halting the Vast Release of Methane Is Critical for Climate, U.N. Says</a></td>
                                <td>NY Times</td>
                                <td>04/24/21</td>
                                <td>General</td>
                                <td>1</td>
                                <td>Draft</td>
                            </tr>
                            <tr>
                                <td><a href="https://www.npr.org/2021/04/28/991635101/senate-votes-to-restore-regulations-on-climate-warming-methane-emissions">Senate Votes To Restore Regulations On Climate-Warming Methane Emissions</a></td>
                                <td>NPR</td>
                                <td>04/28/21</td>
                                <td>General</td>
                                <td>0</td>
                                <td>Draft</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-rss/3.3.0/jquery.rss.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>




    <script>
        jQuery(function ($) {
            $("#rss-feeds").rss("https://news.google.com/rss/search?q=methane&hl=en-US&gl=US&ceid=US:en", {
                ssl: true,
                limit: 10,
                layoutTemplate: "<ul>{entries}</ul>",
                entryTemplate: "<li><a href='{url}'>{title}</a><br>{date}<br><small>Options: <a href='saveit.com/{url}'>Save To Database</a> | <a href='#'>Other Option</a></small></li>"
            });
        });


        $(document).ready(function () {
            $('#listPress').DataTable({
                "columnDefs": [{
                    'targets': [4],

                    'render': function (data, type, full, meta) {
                        if (data == 1) {
                            var paywallinfo = '<i class="fas fa-money-bill-wave"></i>';
                        } else {
                            var paywallinfo = 'free';
                        }
                        return paywallinfo;
                    }
                }]
            });
        });
    </script>



</body>
</html>
