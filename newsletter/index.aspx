<%@ Page Language="VB" AutoEventWireup="false" Inherits="M2M_Redesign.index15" CodeBehind="index.aspx.vb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Newsletters | Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->

        <style>
        .card {
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .card-body {
            flex-grow: 1;
        }
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="newsletter_index_form" runat="server">
        <div>
            <section class="py-5 gmi-light-blue">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8">
                            <h1>Recent GMI Newsletters</h1>
                            <p>Browse the latest newsletters from the GMI below. Stay updated on methane reduction initiatives, upcoming events, and news.</p>
                        </div>
                        <div class="col-sm-4">
                            <div class="border border-secondary bg-white px-0">
                                <div class="py-1 text-center bg-dark text-white"><strong>Stay Informed</strong></div>
                                <p class="py-3 px-3">Sign up for the GMI mailing list to receive newsletters directly. 
                                    <br><br>
                                    <a href="http://eepurl.com/ggwT3T" role="button" class="btn btn-outline-primary">Sign Up</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="py-5 bg-white">
                <div class="container">
                    <div class="row">
                        <asp:Repeater ID="rptNewsletters" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">
                                    <div class="card mb-4">
                                        <img class="card-img-top" src='<%# Eval("thumbnail") %>' alt="Newsletter Thumbnail" />
                                        <div class="card-body">
                                            <h5 class="card-title"><%# Eval("subjectLine") %></h5>
                                            <p class="card-text"><%# Eval("summary") %></p>
                                            <a href='<%# Eval("msgURL") %>' class="btn btn-primary">Read More</a>
                                        </div>
                                        <div class="card-footer text-muted">
                                            Date: <%# Eval("dateofSend") %>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </section>
        </div>
    </form>
    <!-- Optional JavaScript -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
