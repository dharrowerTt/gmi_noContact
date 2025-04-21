<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="addConnection.aspx.vb" Inherits="M2M_Redesign.addConnection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Link Tree - Connections | Global Methane Initiative</title>
       <!-- #include virtual="/includes/include_head.html" -->
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
        

      if (user != "" && user != null) {
          setCookie("userid", user, 30);
      } else {
          window.location.href = "http://www.globalmethane.org/2024forum";
      }
  }
        }

    

    </script>
</head>
<body onload="checkCookie()">
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                       <h2> You can add a note to your saved contact.</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-9" style="display:none;">
                         <div class="form-group">
    <label for="user">User</label>
    <asp:TextBox runat="server" type="text" cssClass="form-control" id="user"></asp:TextBox>

  </div>
                    </div>
                    <div class="col-md-9" style="display:none;">
                                         <div class="form-group">
    <label for="user">Connection</label>
    <asp:TextBox runat="server" type="text" cssClass="form-control" id="connection"></asp:TextBox>

  </div>
                    </div>
                    <div class="col-md-9">
                          <div class="form-group">
    <label for="noteArea">The notes space is private to your profile.</label>
    <asp:TextBox runat="server" type="text" cssClass="form-control" id="noteArea" TextMode="MultiLine" ></asp:TextBox>
  </div>
                        <div id="optMessage" style="display:none">
                            <em>We didn't get explicit permission to share this person's email. You can use the notes space to store it for yourself.</em>
                        </div>
                        <br />
                    </div>
                    <div class="col-md-9">
                          <asp:LinkButton runat="server" ID="addConnection" cssClass="btn btn-primary">Submit</asp:LinkButton>
                                                  <asp:LinkButton runat="server" ID="LinkButton1" cssClass="btn btn-secondary">Cancel</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        window.onload = function () {
            function populateFormFields() {
                const urlParams = new URLSearchParams(window.location.search);
                const idValue = urlParams.get('id');
                const cValue = urlParams.get('c');
                const eValue = urlParams.get('e');

                if (eValue === 'n') {
                    document.getElementById('optMessage').style.display = "block";
                }

                document.getElementById('user').value = idValue || '';
                document.getElementById('connection').value = cValue || '';
            }

            populateFormFields(); // Call the function when the window is fully loaded
        };
    </script>
</body>
</html>
