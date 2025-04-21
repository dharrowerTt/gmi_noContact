<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="M2M_Redesign.gmi_admin_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GMI - Login or Sign Up</title>
<link rel="stylesheet" href="css/index.css">

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
</head>


    <script>

        function passwordError() {
            Swal.fire({
                html: "Something's not right! Please check your password.",
                type: 'warning',
                confirmButtonText: 'Okay!'
            }).then(function () {
               
            });
        }
                function exists()
                {
                  Swal.fire({
                      title: 'You might be new here!',
                      html: "We don't have record of your email address, please register.",
                      type: 'success',
                      confirmButtonText: 'Okay!'
                  }).then(function () {
                      document.querySelector('.cont').classList.toggle('s--signup');
                  });
                }


  </script>

<body onload="checkCookie()">
        <div id="cover"></div>
    <script>
         //cookie functions
        function login() {
            window.location.href = "controlpanel.aspx";
        }

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = "username" + "=" + cvalue + ";" + expires + ";path=/";
            login()
        }
    </script>

<div class="cont">
  <div class="form sign-in">
    <h2>Welcome back,</h2>
      <form id="signin" runat="server">
    <label>
      <span>Email</span>
       <asp:TextBox ID = "email" name="email" type="email" runat = "server" required/>
    </label>
    <label>
      <span>Password</span>
        <asp:TextBox ID="password" name="password" type="password" runat="server" required />
             
    </label>
    <p class="forgot-pass"><a href="forgot.aspx">Forgot password?</a></p>

          <asp:Button ID="Button1" class="submit" runat="server" Text="Sign In" />
    </form>
  </div>
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>New here?</h2>
        <p>Register your details!</p>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already have an account, just sign in.</p>
      </div>
      <div class="img__btn">
        <span class="m--up">Sign Up</span>
        <span class="m--in">Sign In</span>
      </div>
    </div>

    <div class="form sign-up">
      <h2>Ready to sign up</h2>
        <form method="post" action="signup.aspx">
      <label>
        <span>First Name</span>
         <input id="su_fname" name="su_fname" type="text" required/>
      </label>
       <label>
        <span>Last Name</span>
         <input id="su_lname" name="su_lname" type="text" required/>
      </label>
      <label>
        <span>Email</span>
        <input id="su_email" name="su_email" type="email" required/>
      </label>
      <label>
        <span>Password</span>
        <input id="su_password" name="su_password" type="password" required/>
      </label>
      <button type="submit"  class="submit">Sign Up</button>
            </form>
    </div>
  </div>
</div>



    <script>
        document.querySelector('.img__btn').addEventListener('click', function () {
            document.querySelector('.cont').classList.toggle('s--signup');
        });
    </script>

    <script>



function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i < ca.length; i++) {
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
  var user=getCookie("username");
  if (user != "") {
      window.location.replace("controlpanel.aspx");
  } else {
 
  }
}
</script>
</body>
</html>
