<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="BorrowList.aspx.cs" Inherits="WebLibraryApplication.BorrowList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%;margin-top:30px">
        <asp:GridView ID="GridViewAdmin" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"
            AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="True" OnRowCommand="GridViewAdmin_RowCommand">

            <Columns>
                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="Select" CommandArgument='<%# Eval("UserId") %>' Visible='<%#controlExtendButton(Eval("ReturnDate").ToString().Substring(0,10)) %>' CommandName="ExtendTime" runat="server">ExtendTime</asp:LinkButton>
                        <asp:LinkButton ID="ReturnItem" CommandArgument='<%# Eval("UserId") %>' Visible='<%# controlReturning(Eval("ReceiveDate").ToString().Substring(0,10),Eval("ReturnDate").ToString().Substring(0,10),convertUserIdToMemberId(Convert.ToInt32( Eval("UserId"))),Convert.ToInt32(Eval("ItemId")),returnCurDate()) %>' CommandName="ReturnItem" runat="server">ReturnItem</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbExtend" CommandArgument='<%# Eval("ReturnDate") %>' CommandName="Extend" runat="server">Extend</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("ReturnDate") %>' CommandName="CancelUpdate" runat="server">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                    <ItemTemplate>
                        <asp:Label ID="LabelUserName" runat="server" Text='<%#returnUserName(Convert.ToInt32 (Eval("UserId"))) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Item Name" SortExpression="ItemName">
                    <ItemTemplate>
                        <asp:Label ID="LabelName" runat="server" Text='<%# returnItemName(Convert.ToInt32(Eval("ItemId"))) %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="LabelEditName" runat="server" Text='<%# returnItemName(Convert.ToInt32(Eval("ItemId"))) %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Receive Date" SortExpression="ReceiveDate">
                    <ItemTemplate>
                        <asp:Label ID="LabelReceive" runat="server" Text='<%#Eval("ReceiveDate").ToString().Substring(0,10) %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="LabelRecieve" runat="server" Text='<%#Eval("ReceiveDate").ToString().Substring(0,10) %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Return Date" SortExpression="ReturnDate">
                    <ItemTemplate>
                        <asp:Label ID="LabelReturn" runat="server" Text='<%#Eval("ReturnDate").ToString().Substring(0,10) %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlReturnTime" runat="server">
                            <asp:ListItem>1 Week</asp:ListItem>
                            <asp:ListItem>2 Weeks</asp:ListItem>
                            <asp:ListItem>3 Weeks</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
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
