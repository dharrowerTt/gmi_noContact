<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sm-add.aspx.vb" Inherits="M2M_Redesign.sm_add" %>
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
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="subjectLine">LinkedIn Followers</label>
                     <asp:TextBox ID="LIFollowers" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="msgUrl">LinkedIn Post Count</label>
                     <asp:TextBox ID="LIPC" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="msgUrl">LinkedIn Engagement</label>
                     <asp:TextBox ID="LIE" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="subjectLine">Facebook Followers</label>
                     <asp:TextBox ID="FBFollowers" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="msgUrl">Facebook Post Count</label>
                     <asp:TextBox ID="FBPC" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="msgUrl">Facebook Engagment</label>
                     <asp:TextBox ID="FBE" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="subjectLine">X Followers</label>
                     <asp:TextBox ID="XFollowers" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="msgUrl">X Post Count</label>
                     <asp:TextBox ID="XPC" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="form-group">
                     <label for="msgUrl">X Engagement</label>
                     <asp:TextBox ID="XE" class="form-control" runat="server" required></asp:TextBox>
                  </div>
               </div>
                </div>
                <div class="row">
                    <div class="col-12-md">
                        <asp:Button ID="Add" runat="server" Text="Save" class="btn btn-primary btn-lg" />
                    </div>
                </div>
            
         </div>
         
         
      </form>
      <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
      <script>
              $(document).ready(function () {
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