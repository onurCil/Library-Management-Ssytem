<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="LoginLibrary.aspx.cs" Inherits="WebLibraryApplication.LoginLibrary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 45px; margin-left: 200px">
            <asp:Label ID="Label11" runat="server" Text="Label"><strong>One account. All of Library</strong></asp:Label>
           
        </div>
    <div style="margin-top: 20px; margin-left: 200px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label1" runat="server" Text="Label"><strong>Nick Name:</strong></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="TextBoxLoginNick" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ControlToValidate="TextBoxLoginNick" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Name is missing"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div style="margin-top: 20px; margin-left: 200px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label2" runat="server" Text="Label"><strong>Password:</strong></asp:Label>
        </div>
        <div>
            <input runat="server" id="InputLoginPassword" type="password" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ControlToValidate="InputLoginPassword" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Password is missing"></asp:RequiredFieldValidator>

        </div>
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" ValidationGroup="check" />
        </div>
        <div style="margin-top: 20px; margin-left: 150px">
            <asp:Button ID="ButtonLogin" runat="server" Text="Sign in" OnClick="ButtonLogin_Click" ValidationGroup="check" />
            
        </div>
        <div>
        </div>
        <div style="margin-top: 10px">
            <asp:Label ID="LabelNoUser" runat="server" ForeColor="Red" Text=""></asp:Label>
        </div>
        <div style="margin-top: 30px; margin-left: 150px">
            <asp:Label ID="Label4" runat="server" Text="Label">Don't have a DEU Library Account?</asp:Label>
            <asp:Button ID="ButtonSignUp" runat="server" Text="Sign up now" OnClick="ButtonSignUp_Click" />
        </div>
       <div style="margin-top: 100px; margin-left: 100px">
        <asp:Image ID="Image2" ImageUrl="~/images/bilgi.jpg" runat="server" />
       </div>
            
        </div>
    </div>

</asp:Content>

