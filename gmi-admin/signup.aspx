<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="signup.aspx.vb" Inherits="M2M_Redesign.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GMI - Login or Signup</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    <script>

        function signin()
                {

                  Swal.fire({
                      title: 'We recognise you!',
                      html: 'Do you already have an account? Go sign in!',
                      type: 'alert',
                      confirmButtonText: 'Okay!'
                  }).then(function () {
                      window.location.href = "index.aspx";
                  });
        }


        function login() {

            Swal.fire({
                title: 'Welcome',
                html: 'Taking you to the control panel!',
                type: 'alert',
                showConfirmButton: false,
                timer: 1500
            }).then(function () {
                window.location.href = "controlpanel.aspx";
            });
        }

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = "username" + "=" + cvalue + ";" + expires + ";path=/";
            login()
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
                alert("Welcome again " + user);
            } else {
                user = prompt("Please enter your name:", "");
                if (user != "" && user != null) {
                    setCookie("username", user, 365);
                }
            }
        }

        function deleteCookie() {
            document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "index.aspx";
        }
  </script>

    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
