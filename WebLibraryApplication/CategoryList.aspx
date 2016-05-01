<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="WebLibraryApplication.CategoryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div style="width: 100%;margin-top:30px">
        <asp:GridView ID="GridViewAdmin" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"
            DataKeyNames="CategoryId" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="true">
            <Columns>
                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("CategoryId")%>' CommandName="EditRow" runat="server">Edit</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" OnClientClick="return confirm('Are you sure you want to delete this row');" CommandArgument='<%# Eval("CategoryId")%>' CommandName="DeleteRow" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("CategoryId") %>' CommandName="UpdateRow" runat="server">Update</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("CategoryId") %>' CommandName="CancelUpdate" runat="server">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category ID" InsertVisible="False" SortExpression="CategoryId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("CategoryId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("CategoryId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton CommandName="InsertRow" ID="lbInsert" ValidationGroup="Insert" runat="server">
                                    Insert
                        </asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxCategoryName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Shelf Number" SortExpression="ShelfNumber">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListCategoryShelfNumber" runat="server" SelectedValue='<%#Eval("ShelfNumber") %>'>
                            <asp:ListItem>Select Shelf</asp:ListItem>
                            <asp:ListItem>A1</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A2</asp:ListItem>
                            <asp:ListItem>L1</asp:ListItem>
                            <asp:ListItem>H1</asp:ListItem>
                            <asp:ListItem>P1</asp:ListItem>
                            <asp:ListItem>R</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                            <asp:ListItem>M1</asp:ListItem>
                            <asp:ListItem>G</asp:ListItem>
                            <asp:ListItem>P2</asp:ListItem>
                            <asp:ListItem>A3</asp:ListItem>
                            <asp:ListItem>L2</asp:ListItem>
                            <asp:ListItem>T1</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                            <asp:ListItem>M2</asp:ListItem>
                            <asp:ListItem>T2</asp:ListItem>
                            <asp:ListItem>H2</asp:ListItem>
                            <asp:ListItem>H3</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditShelfNumber" runat="server" ErrorMessage="Shelf Number is required" ControlToValidate="DropDownListCategoryShelfNumber" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("ShelfNumber") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="dllCategoryInsertShelfNumber" runat="server">
                            <asp:ListItem>Select Shelf</asp:ListItem>
                            <asp:ListItem>A1</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A2</asp:ListItem>
                            <asp:ListItem>L1</asp:ListItem>
                            <asp:ListItem>H1</asp:ListItem>
                            <asp:ListItem>P1</asp:ListItem>
                            <asp:ListItem>R</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                            <asp:ListItem>M1</asp:ListItem>
                            <asp:ListItem>G</asp:ListItem>
                            <asp:ListItem>P2</asp:ListItem>
                            <asp:ListItem>A3</asp:ListItem>
                            <asp:ListItem>L2</asp:ListItem>
                            <asp:ListItem>T1</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                            <asp:ListItem>M2</asp:ListItem>
                            <asp:ListItem>T2</asp:ListItem>
                            <asp:ListItem>H2</asp:ListItem>
                            <asp:ListItem>H3</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertShelf" runat="server" ErrorMessage="Shelf Number is required" ControlToValidate="dllCategoryInsertShelfNumber" Text="*" InitialValue="Select Shelf Number" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
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
