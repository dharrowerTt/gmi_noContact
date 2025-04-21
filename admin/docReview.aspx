<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="docReview.aspx.vb" Inherits="M2M_Redesign.docReview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="DocumentReviewForm" runat="server">
    <div style="float:left;width:500px;">
    <dl class="onelinelist">
                        <dt>Attachments not yet Downloaded:</dt>
                        <dd>
                            <asp:Literal ID="attachmentActDownload" runat="server" /></dd>
                    </dl>
                    </div>
    <div style="float:left;width:500px;">
                    <dl class="onelinelist">
                        <dt>Attachments already Downloaded:</dt>
                        <dd>
                            <asp:Literal ID="attachmentAct" runat="server" /></dd>
                    </dl>
    </div>
    </form>
</body>
</html>
