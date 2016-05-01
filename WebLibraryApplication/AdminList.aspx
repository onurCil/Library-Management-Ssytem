<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="AdminList.aspx.cs" Inherits="WebLibraryApplication.AdminList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%;margin-top:30px">
        <asp:GridView ID="GridViewAdmin" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"
            DataKeyNames="AdminId" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="true">
            <Columns>
                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("AdminId")%>' CommandName="EditRow" runat="server">Edit</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" OnClientClick="return confirm('Are you sure you want to delete this row');" CommandArgument='<%# Eval("AdminId")%>' CommandName="DeleteRow" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("AdminId") %>' CommandName="UpdateRow" runat="server">Update</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("AdminId") %>' CommandName="CancelUpdate" runat="server">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Admin ID" InsertVisible="False" SortExpression="AdminId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("AdminId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("AdminId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton CommandName="InsertRow" ID="lbInsert" ValidationGroup="Insert" runat="server">
                                    Insert
                        </asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxAdminName" Width="130px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Name %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelName" runat="server" Width="130px" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Name%>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" Width="130px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlGender" runat="server" SelectedValue='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Gender%>'>
                            <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditGender" runat="server" ErrorMessage="Gender is required" ControlToValidate="ddlGender" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelGender" runat="server" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Gender %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlAdminInsertGender" runat="server">
                               <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertddlGender" runat="server" ErrorMessage="Gender is required" ControlToValidate="ddlAdminInsertGender" Text="*" InitialValue="Select Shelf Number" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxAdminAddress" Width="60px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Address %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelAddress" Width="30px" runat="server" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Address %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddress" Width="80px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertAddress" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Password" SortExpression="Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxAdminPassword" Width="60px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Password %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelPassword" Width="30px" runat="server" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Password %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPassword" Width="60px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nick Name" SortExpression="NickName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxAdminNickName" Width="60px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).NickName %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelNickName" Width="30px" runat="server" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).NickName %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNickName" Width="60px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertNickName" runat="server" ErrorMessage="NickName is required" ControlToValidate="txtNickName" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Online" SortExpression="Online">
                    <EditItemTemplate>
                        <asp:Label ID="LabelAdminOnline" runat="server" Text='<%# returnAdminOnline(Convert.ToBoolean(returnUserById(Convert.ToInt32( Eval("UserId"))).IsOnline))%>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelOnline" runat="server" Text='<%#returnAdminOnline(Convert.ToBoolean(returnUserById(Convert.ToInt32( Eval("UserId"))).IsOnline)) %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="E-mail" SortExpression="Mail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxAdminMail" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Mail%>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelMail" runat="server" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Mail %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertMail" runat="server" ErrorMessage="Mail is required" ControlToValidate="txtMail" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                

                 <asp:TemplateField HeaderText="Work Hour" SortExpression="WorkHour">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxEditWorkHour" Width="30px" runat="server" Text='<%#Convert.ToInt32(Eval("WorkHour")) %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelWorkHour" Width="30px" runat="server" Text='<%#Convert.ToInt32(Eval("WorkHour")) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="TextBoxInsertWorkHour" Width="30px" runat="server" ></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

</asp:Content>
