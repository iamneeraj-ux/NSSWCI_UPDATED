<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Speaker and Panelist.aspx.cs" Inherits="NationalSymposium.ns.Admin.Speaker_and_Panelist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView_RowCommand">
    <Columns>
        <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
        <asp:BoundField DataField="Name" HeaderText="Name " />
         <asp:BoundField DataField="MobileNo" HeaderText="Mobile No." />
         <asp:BoundField DataField="Designation" HeaderText="Designation" />
         <asp:BoundField DataField="State" HeaderText="State" />
         <asp:BoundField DataField="Organization" HeaderText="Organization" />
         <asp:BoundField DataField="FileName" HeaderText="File Name" />
         <asp:BoundField DataField="FilePath" HeaderText="File Path" />
        <%--<asp:BoundField DataField="UploadDate" HeaderText="Upload Date" DataFormatString="{0:yyyy-MM-dd}" />--%>
        <asp:TemplateField HeaderText="View File">
            <ItemTemplate>
                <asp:LinkButton ID="lnkViewFile" runat="server" CommandName="ViewFile" CommandArgument='<%# Eval("FilePath") %>' Text="View File"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        </div>
    </form>
</body>
</html>
