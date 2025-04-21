<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="gallery.aspx.vb" Inherits="M2M_Redesign.gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html,body{
            margin:0;
            font-family:sans-serif;
        }
.container {
    display: grid;
       grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
}

.item{
  background-color: #31363F;
  padding: 20px;
  color: #fff;
  border: 1px solid #fff;
}

.item img{
    width:100%;
    border-radius:12px;
}
.caption{
    font-style:italic;
}

a{
    font-weight:bold;
    color:#fcfcff;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <%= GalleryItems  %>
        </div>
    </form>
</body>
</html>
