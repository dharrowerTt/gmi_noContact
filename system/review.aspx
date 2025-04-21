<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="review.aspx.vb" Inherits="M2M_Redesign.review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="//cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <style>
        html{
            background:rgb(220, 220, 220);
        }
        .container6 {
            width:95%;
            margin-top:60px;
            margin-left:auto;
            margin-right:auto;
  }
container6 iframe {
  width: 100%  }

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
        <div class="container">
            <div class="row">
                <h1>GMI Steering Committee Renewal of Membership Responses</h1>
            <p>Select a country and click Submit to view Responses or <a href="#summary">View Summary</a>.</p>
            <asp:DropDownList ID = "ddlCountry" runat="server">
</asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Submit" />
                       <div class="container6">
        <iframe id="urIframe" runat="server" width="95%" height="800px"></iframe>
            </div>
        </div>
 
        </div>
         <div class="container">
                        <div class="row">
                    <div class="col-md-12"><br /><br />
                        <h3 id="summary">Response Overview</h3>
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                    </div>
                </div>
             <br /><br />
             </div>
    </form>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>

        <script>
        $(document).ready(function () {

            $('#answers').DataTable(
                {
                    paging: false,
                    ordering: false,
                    searching: false,
                    bInfo: false,
                    columnDefs: [
                        {
                            render: function (data, type, row) {
                                if (data === "1") {
                                    data = "Yes"
                                } else if(data === "0"){
                                    data = "No"
                                }else{
                                    data = ""
                                }
                                return data
                            },
                            targets: [1,2,3]
                        }]
                });
        });


        </script>
</body>
</html>
