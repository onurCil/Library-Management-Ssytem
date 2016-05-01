<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebLibraryApplication.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 100px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label1" runat="server" Text="Label">User Full Name:</asp:Label>
        </div>
        <div>
            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ControlToValidate="TextBoxName" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Full Name is missing"></asp:RequiredFieldValidator>

        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label2" runat="server" Text="Label">Nick Name:</asp:Label>

        </div>
        <div>
            <asp:TextBox ID="TextBoxNick" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBoxNick" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Nick Name is missing"></asp:RequiredFieldValidator>

        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label3" runat="server" Text="Label">Password:</asp:Label>
        </div>
        <div>
            <input runat="server" id="InputPassword" type="password" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="InputPassword" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Password is missing"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label4" runat="server" Text="Label">Confirm Password:</asp:Label>
        </div>
        <div>
            <input runat="server" id="InputConfirmPassword" type="password" />
        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label5" runat="server" Text="Label">Mail:</asp:Label>
        </div>
        <div style="float: left">
            <asp:TextBox ID="TextBoxMail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBoxMail" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Mail is missing"></asp:RequiredFieldValidator>

        </div>

        <div style="margin-left: 400px">
            <asp:Button ID="ButtonSignUp" runat="server" Text="SIGN UP" OnClick="ButtonSignUp_Click" ValidationGroup="check" />
            <asp:Button ID="ButtonCancel" runat="server" Text="BACK" OnClick="ButtonCancel_Click" />
        </div>
        <div style="margin-left: 400px">
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" ValidationGroup="check" />
        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label6" runat="server" Text="Label">Gender:</asp:Label>
        </div>
        <div>
            <asp:RadioButtonList ID="RadioButtonGender" runat="server">
                <asp:ListItem style="color:blue" Value="Male">Male</asp:ListItem>
                <asp:ListItem style= "color:red" Value="Female">Female</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="RadioButtonGender" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Gender is missing"></asp:RequiredFieldValidator>

        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label7" runat="server" Text="Label">Address:</asp:Label>
        </div>
        <div>
            <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBoxAddress" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Address is missing"></asp:RequiredFieldValidator>


        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label8" runat="server" Text="Label">Faculty Name:</asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="ddlFacultyName" runat="server">
                <asp:ListItem>Select Faculty</asp:ListItem>
                <asp:ListItem>Buca Eğitim Fakültesi</asp:ListItem>
                <asp:ListItem>Denizcilik Fakültesi</asp:ListItem>
                <asp:ListItem>Edebiyat Fakültesi</asp:ListItem>
                <asp:ListItem>Fen Fakültesi</asp:ListItem>
                <asp:ListItem>Güzel Sanatlar Eğitim Fakültesi</asp:ListItem>
                <asp:ListItem>Hukuk Fakültesi</asp:ListItem>
                <asp:ListItem>İlahiyat Eğitim Fakültesi</asp:ListItem>
                <asp:ListItem>İşletme Fakültesi</asp:ListItem>
                <asp:ListItem>Mimarlık Fakültesi</asp:ListItem>
                <asp:ListItem>Mühendislik Fakültesi</asp:ListItem>
                <asp:ListItem>Tıp Fakültesi</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ddlFacultyName" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Faculty is missing"></asp:RequiredFieldValidator>

        </div>
    </div>
    <div style="margin-top: 10px; margin-left: 100px">
        <div style="float: left; width: 150px">
            <asp:Label ID="Label9" runat="server" Text="Label">Member Position:</asp:Label>
        </div>
        <div style="margin-bottom: 50px">
            <asp:DropDownList ID="ddlMemberType" runat="server">
                <asp:ListItem>Select Position</asp:ListItem>
                <asp:ListItem>Instructor</asp:ListItem>
                <asp:ListItem>Student</asp:ListItem>
                <asp:ListItem>Staff</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ddlMemberType" ForeColor="Red" ValidationGroup="check" runat="server" Text="*" ErrorMessage="Position is missing"></asp:RequiredFieldValidator>

        </div>
        <div>
            <asp:Label runat="server" ID="ErrorLabel" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
