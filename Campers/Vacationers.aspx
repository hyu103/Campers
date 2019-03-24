<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vacationers.aspx.cs" Inherits="LabTest1.Vacationers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Enter a location:<br />
        <br />
        <asp:TextBox ID="tbLocation" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="tbLocation" ErrorMessage="Location is required." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnHowMany" runat="server" OnClick="btnHowMany_Click" Text="How Many Vacationers?" />
        <br />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
