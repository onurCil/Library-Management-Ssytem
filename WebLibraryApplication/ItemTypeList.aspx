<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="ItemTypeList.aspx.cs" Inherits="WebLibraryApplication.ItemTypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    


    <div style="margin-top:30px">
        <asp:GridView ID="GridViewAdmin" runat="server" DataKeyNames="ItemId" AllowPaging="True" Width="100%" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ItemId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("ItemId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Type" SortExpression="Type">
                    <ItemTemplate>
                        <asp:Label ID="Label31" runat="server" Text='<%#Eval("Type")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#returnItemState(Eval("State").ToString())%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="ProductionDate" SortExpression="ProductionDate">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#(convertDate(Eval("productionDate").ToString()).Substring(0,10)) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Category Name" SortExpression="Category Name">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# returnCategoryName(Convert.ToInt32(Eval("CategoryId"))) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Publisher Name" SortExpression="Publisher Name">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#returnPublisherName(Convert.ToInt32(Eval("PublisherId"))) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NumericFirstLast" NextPageText="Next" PreviousPageText="Prev" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:GridView ID="GridViewUser" runat="server" DataKeyNames="ItemId" AllowPaging="True" Width="100%" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Type" SortExpression="Type">
                    <ItemTemplate>
                        <asp:Label ID="Label31" runat="server" Text='<%#Eval("Type")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#returnItemState(Eval("State").ToString())%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="ProductionDate" SortExpression="ProductionDate">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#(convertDate(Eval("productionDate").ToString()).Substring(0,10)) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Category Name" SortExpression="Category Name">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# returnCategoryName(Convert.ToInt32(Eval("CategoryId"))) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Publisher Name" SortExpression="Publisher Name">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%#returnPublisherName(Convert.ToInt32(Eval("PublisherId"))) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NumericFirstLast" NextPageText="Next" PreviousPageText="Prev" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>



        <asp:GridView ID="GridViewAdminDistinct" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None" AutoGenerateColumns="False" ShowFooter="True"
            OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%"
            OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval(returnPrimaryKey())%>' CommandName="EditRow" runat="server">Edit</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" OnClientClick="return confirm('Are you sure you want to delete this row ?');" CommandArgument='<%# Eval(returnPrimaryKey())%>' CommandName="DeleteRow" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval(returnPrimaryKey()) %>' CommandName="UpdateRow" runat="server">Update</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval(returnPrimaryKey()) %>' CommandName="CancelUpdate" runat="server">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                    <EditItemTemplate>
                        <asp:Label ID="LabelID" runat="server" Text='<%#Eval(returnPrimaryKey()) %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelID" runat="server" Text='<%#Eval(returnPrimaryKey()) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton CommandName="InsertRow" ID="lbInsert" ValidationGroup="Insert" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxDistinctItemName" runat="server" Text='<%#returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[1]%>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelName" runat="server" Text='<%#returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[1] %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDistinctName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDistinctInsert" runat="server" ErrorMessage="Name is required" ControlToValidate="txtDistinctName" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Type" SortExpression="Type">
                    <EditItemTemplate>
                        <asp:Label ID="LabelDistinctEditType" runat="server" Text='<%#returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[6]%>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctType" runat="server" Text='<%#returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[6]%>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Properties" SortExpression="KOLON">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxDistinctItemKolon" runat="server" Text='<%# Eval(returnTypeColumn()) %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctKolon" runat="server" Text='<%#Eval(returnTypeColumn()) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDistinctKolon" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDistinctInsertKolon" runat="server" ErrorMessage="Kolon is required" ControlToValidate="txtDistinctKolon" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlDistinctItemState" runat="server" SelectedValue='<%#returnItemState(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[2])%>'>
                            <asp:ListItem>Select State</asp:ListItem>
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Unavailable</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDistinctEditState" runat="server" ErrorMessage="State is required" ControlToValidate="ddlDistinctItemState" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctState" runat="server" Text='<%#returnItemState(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[2])%>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlDistinctItemInsertState" runat="server">
                            <asp:ListItem>Select State</asp:ListItem>
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Unavailable</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDistinctInsertState" runat="server" ErrorMessage="State is required" ControlToValidate="ddlDistinctItemInsertState" Text="*" InitialValue="Select State" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="ProductionDate" SortExpression="ProductionDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxDistinctItemProductionDate" runat="server" Text='<%# (convertDate(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[3]).Substring(0,10)) %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDistinctEditProductionDate" runat="server" ErrorMessage="ProductionDate is required" ControlToValidate="TextBoxDistinctItemProductionDate" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#(convertDate(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[3]).Substring(0,10)) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlDistinctItemDay" runat="server"></asp:DropDownList>
                        <asp:DropDownList ID="ddlDistinctItemMonth" runat="server"></asp:DropDownList>
                        <asp:DropDownList ID="ddlDistinctItemYear" runat="server"></asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>





                <asp:TemplateField HeaderText="Category Name" SortExpression="Category Name">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlDistinctItemCategory" runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctCategoryName" runat="server" Text='<%# returnCategoryName(Convert.ToInt32(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[4])) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlDistinctFooterItemCategory" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDistinctInsertCategoryName" runat="server" ErrorMessage="Category Name is required" ControlToValidate="ddlDistinctFooterItemCategory" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Publisher Name" SortExpression="Publisher Name">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlDistinctItemPublisher" runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctPublisherName" runat="server" Text='<%#returnPublisherName(Convert.ToInt32(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[5])) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlDistinctFooterItemPublisher" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDistinctInsertPublisherName" runat="server" ErrorMessage="Publisher Name is required" ControlToValidate="ddlDistinctFooterItemPublisher" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>




            </Columns>
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




        <asp:GridView ID="GridViewUserDistinct" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None" AutoGenerateColumns="False" ShowFooter="True"
            OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%"
            OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>

                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbRent" CommandArgument='<%# Eval(returnPrimaryKey())%>' CommandName="Rent" runat="server" OnClientClick="return confirm('Are You Sure You Want to Rent This Item ?');" Visible='<%# returnRentAvailable(returnItemState(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[2])) %>'>Rent</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <asp:Label ID="LabelName" runat="server" Text='<%#returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[1] %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Type" SortExpression="Type">
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctType" runat="server" Text='<%#returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[6]%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Properties" SortExpression="KOLON">
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctKolon" runat="server" Text='<%#Eval(returnTypeColumn()) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctState" runat="server" Text='<%#returnItemState(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[2])%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="ProductionDate" SortExpression="ProductionDate">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#(convertDate(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[3]).Substring(0,10)) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Category Name" SortExpression="Category Name">
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctCategoryName" runat="server" Text='<%# returnCategoryName(Convert.ToInt32(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[4])) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Publisher Name" SortExpression="Publisher Name">
                    <ItemTemplate>
                        <asp:Label ID="LabelDistinctPublisherName" runat="server" Text='<%#returnPublisherName(Convert.ToInt32(returnItem(Convert.ToInt32(Eval(returnPrimaryKey())))[5])) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
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















        <div>
            <div style="float: left; width: 20%">
                <asp:CheckBox ID="CheckBoxListAll" runat="server" AutoPostBack="True"
                    OnCheckedChanged="ListAll_CheckedChanged"
                    Text="LIST ALL" />
            </div>
            <div style="float: left; width: 20%">
                <asp:CheckBox ID="CheckBoxListBooks" runat="server" AutoPostBack="True"
                    OnCheckedChanged="ListBooks_CheckedChanged"
                    Text="LIST BOOKS" />
            </div>
            <div style="float: left; width: 20%">
                <asp:CheckBox ID="CheckBoxListJournals" runat="server" AutoPostBack="True"
                    OnCheckedChanged="ListJournals_CheckedChanged"
                    Text="LIST JOURNALS" />
            </div>
            <div style="float: left; width: 20%">
                <asp:CheckBox ID="CheckBoxListNewspapers" runat="server" AutoPostBack="True"
                    OnCheckedChanged="ListNewspapers_CheckedChanged"
                    Text="LIST NEWSPAPERS" />
            </div>
            <div style="float: left; width: 20%">
                <asp:CheckBox ID="CheckBoxListVideos" runat="server" AutoPostBack="True"
                    OnCheckedChanged="ListVideos_CheckedChanged"
                    Text="LIST VIDEOS" />
            </div>
        </div>
    </div>
</asp:Content>

