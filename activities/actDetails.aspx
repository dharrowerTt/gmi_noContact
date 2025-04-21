<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="actDetails.aspx.vb" Inherits="M2M_Redesign.actDetails1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Previous Cooperative Agreement Awards| Global Methane Initiative</title>
    <!-- #include virtual="/includes/include_head.html" -->
    <style>
       td{
           vertical-align: top;
           padding:10px;
           background:#fcfcfc;
       }
       tr{
           border-bottom:1px solid #f6f6f6;
       }
       
tr td:first-child{
  background: #BDBBB6;
  font-weight:bold;
}
.rowhead{
            background:#4A6D7C!important;
            color:white;
        }
tr:hover{
           background:#f9f9f9;
       }

.warning{
    background:#FFF7AE;
    font-weight:bold;
    padding:10px;
    text-align:center;
    color:#F08700;
    border:1px solid #F08700;
    border-radius:5px;
}
    </style>
</head>
<body>
    <!-- #include virtual="/includes/header.html" -->
    <form id="events_index_form" runat="server">
        <div>
            <section class="py-5 gmi-light-blue">
                <div class="container">
                    <div class="warning">The information presented below is provided for reference purposes only.</div>
                    <h1>Previous Cooperative Agreement Awards</h1>
                 



                </div>
            </section>

            <section class="py-5" id="recentevents" runat="server">
                <div class="container">

                    <div class="row py-2">
                        <h2><%= ActName  %></h2>
                        <table id="projTable" class="grid">
                            <tbody>
                                <tr class="rowhead">
                                    <th >&nbsp;
                                    </th>
                                    <th >Project Information
                                    </th>
                                </tr>
                                <tr>
                                    <td>Stage
                                    </td>
                                    <td><%= ActStage  %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Sector
                                    </td>
                                    <td><%= ActStage  %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Geographical Focus
                                    </td>
                                    <td><%= ActGeoFocus %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Location
                                    </td>
                                    <td><%= ActLocation %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Description of Project
                                    </td>
                                    <td><%= ActDesc %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Instrumental Organizations
                                    </td>
                                    <td>Texas Transportation Institute, U.S. Environmental Protection Agency<br>
                                    </td>
                                </tr>
<!--                                <tr>
                                    <td>Estimated lifetime of the project (years):
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr> -->
                                <tr>
                                    <td>Emissions reductions:<br>
                                        (MTCO2E)
                                    </td>
                                    <td><%= ActEmisReductions %>
                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>Results and Outcomes
                                    </td>
                                    <td><%=ActResults %>
                                    </td>
                                </tr>
                        <!--        <tr>
                                    <td>Additional Documentation
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Primary contact for this project or activity
                                    </td>
                                    <td>
                                        <p>First Name: Josias</p>
                                        <p>Last Name: Zietsman</p>
                                        <p>Organization Name: Environment and Air Quality Division, Texas Transportation Institute, The Texas A&amp;M; University System</p>
                                        <p>Email: zietsman@tamu.edu</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Financial And In-Kind Support (U.S.&nbsp;$)
                                    </td>
                                    <td>Total Amount provided by all Partner Countries and Organizations instrumental to this project or activity: $100000<p></p>
                                        &nbsp;<p>
                                            Description of In-Kind Support:
                                            <br>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Comments
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>Expo
                                    </td>
                                    <td></td>
                                </tr>-->
                            </tbody>
                        </table>



                    </div>

                </div>

            </section>
    </form>
    <!-- #include virtual="/includes/footer_scripts.aspx" -->
</body>

</html>
