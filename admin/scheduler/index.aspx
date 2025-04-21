<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.index16" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scheduler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            min-height: 75rem;
            padding-top: 4.5rem;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
     <script src="js/daypilot/daypilot-all.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Fixed navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                </div>
            </div>
                </nav>
 
    <main class="container">
        <div class="bg-light p-5 rounded">
            
      
            <DayPilot:DayPilotCalendar ID="DayPilotCalendar1" runat="server" DataEndField="eventend" DataIdField="id" DataStartField="eventstart" DataTextField ="name" Days="4" DayBeginsHour="9" DayEndsHour="20" TimeFormat="Clock24Hours" WeekStarts="Monday"  DataTagFields="barColor, color" CellDuration="15" eventArrangement="SideBySide" ShowEventStartEnd="True" BusinessEndsHour="20" heightSpec="BusinessHoursNoScroll"></DayPilot:DayPilotCalendar>

                
           
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

                
           
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

   

     </form>

</body>
</html>