<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="create.aspx.vb" Inherits="M2M_Redesign.create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        
element.style {
}
input  {
    padding: .5em .6em;
    display: inline-block;
    border: 1px solid #ccc;
    -webkit-box-shadow: inset 0 1px 3px #ddd;
    box-shadow: inset 0 1px 3px #ddd;
    border-radius: 4px;
    vertical-align: middle;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
html, button, input, select, textarea, .pure-g [class *= "pure-u"] {
    font-family: Helvetica, Arial, sans-serif;
    letter-spacing: 0.01em;
}
input {
    line-height: normal;
}
button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    margin: 0;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
body {
    min-width: 320px;
    background-color: #fff;
    color: #777;
    line-height: 1.6;
}
html {
    font-family: sans-serif;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}
user agent stylesheet
html {
    color: -internal-root-color;
}
*:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
*:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
    </style>
</head>
<body>
    <h2>Add a Speaker</h2>
    <form id="form1" runat="server">
    <div>First Name<br />
        <asp:TextBox ID="fName" runat="server"></asp:TextBox><br />
        Last Name<br />
        <asp:TextBox ID="lName" runat="server"></asp:TextBox><br />
        Email Address<br />
        <asp:TextBox ID="email" runat="server"></asp:TextBox><br />
        Company Name<br />
        <asp:TextBox ID="organization" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Create Speaker" />
             <asp:Label ID="Label1" ForeColor="Green" runat="server" />
    </div>
    </form>

    <hr />
      <h2>List of Speakers</h2>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
</body>
</html>
