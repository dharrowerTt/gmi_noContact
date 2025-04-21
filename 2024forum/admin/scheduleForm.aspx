<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="scheduleForm.aspx.vb" Inherits="M2M_Redesign.scheduleForm" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Scheduler</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <meta name="theme-color" content="#7952b3">
</head>
<body class="bg-light">

    <div class="container">
        <main>
            <div class="py-5 text-center">

                <h2>Forum 2024 Scheduler</h2>
            </div>

            <div class="row g-5">
                <div class="col-md-5 col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Sidebar</span>
                    </h4>

                </div>
                <div class="col-md-7 col-lg-8">
                    <h4 class="mb-3">Schedule an Event</h4>
                    <form id="form1" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                        <div>
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="startDate" class="form-label">Start Date</label>
                                    <input type="date" id="startDate" name="startDate" class="form-control">
                                    <asp:TextBox ID="startDateCheck" runat="server" class="form-control"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Valid start date is required.
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="startTime" class="form-label">Start Time</label>
                                    <input type="time" id="startTime" name="startTime" class="form-control">
                                    <asp:TextBox ID="startTimeCheck" runat="server" class="form-control"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Valid start time is required.
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label for="endDate" class="form-label">End Date</label>
                                    <input type="date" id="endDate" name="endDate" class="form-control">
                                    <asp:TextBox ID="endDateCheck" runat="server" class="form-control"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Valid end date is required.
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label for="endTime" class="form-label">End Time</label>
                                    <input type="time" id="endTime" name="endTime" class="form-control">
                                    <asp:TextBox ID="endTimeCheck" runat="server" class="form-control"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Valid end time is required.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="titleText" class="form-label">Title Text</label>
                                    <div class="input-group has-validation">
                                        <asp:TextBox ID="title" runat="server" class="form-control"></asp:TextBox>
                                        <div class="invalid-feedback">
                                            Title text is required.
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="content" class="form-label">Content</label>
                                    <asp:TextBox ID="content" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Please enter your shipping address.
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label for="backColorPicker" class="form-label">Back Color</label>
                                    <input type="color" class="form-control" id="backColorPicker" onchange="clickColor(0, -1, -1, 5)" value="#ff0000">
                                    <asp:TextBox ID="backColorPickerCheck" class="form-control" runat="server"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Please select a valid country.
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label for="barColorPicker" class="form-label">Bar Color</label>
                                    <input type="color" class="form-control" id="barColorPicker" onchange="clickColor(0, -1, -1, 5)" value="#ff0000">
                                    <asp:TextBox ID="barColorPickerCheck" class="form-control" runat="server"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Please provide a valid state.
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label for="status" class="form-label">Status</label>
                                    <asp:DropDownList ID="status" runat="server" class="form-select">
                                        <asp:ListItem Selected="True" Value="Draft">Draft</asp:ListItem>
                                        <asp:ListItem Value="Final">Final</asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="invalid-feedback">
                                        Status required.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr class="my-4">
                        <asp:Button ID="Button1" runat="server" class="w-100 btn btn-primary btn-lg" Text="Submit" />
                    </form>
                </div>
            </div>
        </main>

        <footer class="my-5 pt-5 text-muted text-center text-small">
       <!--     <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Link</a></li>
                <li class="list-inline-item"><a href="#">Link</a></li>
                <li class="list-inline-item"><a href="#">Link</a></li>
            </ul> -->
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <script>
            $(function () {
                $("#startDate").change(function () {
                    $("#startDateCheck").val($(this).val());
                });
                $("#endDate").change(function () {
                    $("#endDateCheck").val($(this).val());
                });
                $("#startTime").change(function () {
                    $("#startTimeCheck").val($(this).val());
                });
                $("#endTime").change(function () {
                    $("#endTimeCheck").val($(this).val());
                });

                $("#backColorPicker").change(function () {
                    $("#backColorPickerCheck").val($(this).val());
                });
                $("#barColorPicker").change(function () {
                    $("#barColorPickerCheck").val($(this).val());
                });
            })
        </script>


</body>
</html>

