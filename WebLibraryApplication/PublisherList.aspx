<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="PublisherList.aspx.cs" Inherits="WebLibraryApplication.PublisherList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%;margin-top:30px">
        <asp:GridView ID="GridViewAdmin" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"
            DataKeyNames="PublisherId" AutoGenerateColumns="False" OnRowCommand="GridViewAdmin_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="True">

            <Columns>
                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("PublisherId")%>' CommandName="EditRow" runat="server">Edit</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" OnClientClick="return confirm('Are you sure you want to delete this row');" CommandArgument='<%# Eval("PublisherId")%>' CommandName="DeleteRow" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("PublisherId") %>' CommandName="UpdateRow" runat="server">Update</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("PublisherId") %>' CommandName="CancelUpdate" runat="server">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Publisher ID" InsertVisible="False" SortExpression="PublisherId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("PublisherId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("PublisherId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton CommandName="InsertRow" ID="lbInsert" ValidationGroup="Insert" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPublisherName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPublisherAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertPublisherAddress" runat="server" ErrorMessage="Publisher Address is required" ControlToValidate="txtAddress" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


            </Columns>
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />



        </asp:GridView>
    </div>
</asp:Content>
