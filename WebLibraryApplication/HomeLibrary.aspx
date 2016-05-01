<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="HomeLibrary.aspx.cs" Inherits="WebLibraryApplication.HomeLibrary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-top: 30px; margin-left: 120px">
        <div>
            <h1>
                <asp:Label ID="LabelWelcome" runat="server" Text="" />
            </h1>
            <h2>
                <asp:Label ID="LabelAdmin" runat="server" Text="" />
            </h2>
        </div>

        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonRent" Width="150px" runat="server" Text="Renting Items Process" OnClick="ButtonRent_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonReturn" Width="150px" runat="server" Text="Returning Item Process" OnClick="ButtonReturn_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonExtend" Width="150px" runat="server" Text="Extending Item Process" OnClick="ButtonExtend_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonEditMember" Width="100px" runat="server" Text="Member List" OnClick="ButtonEditMember_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonEditAdmin" Width="100px" runat="server" Text="Admin List" OnClick="ButtonEditAdmin_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonEditCategory" Width="100px" runat="server" Text="Category List" OnClick="ButtonEditCategory_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonEditPublisher" Width="100px" runat="server" Text="Publisher List" OnClick="ButtonEditPublisher_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonEditItem" Width="100px" runat="server" Text="Item List" OnClick="ButtonEditItem_Click" />
        </div>
        <div style="margin-bottom: 10px">
            <asp:Button ID="ButtonEditBorrow" Width="100px" runat="server" Text="Borrow List" OnClick="ButtonEditBorrow_Click" />
        </div>
    </div>
</asp:Content>
