<%@ Page Title="" Language="C#" MasterPageFile="~/Library.Master" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="WebLibraryApplication.MemberList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%;margin-top:30px">
        <asp:GridView ID="GridViewAdmin" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"
            DataKeyNames="MemberId" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" ShowFooter="true">
            <Columns>
                <asp:TemplateField HeaderText="Operations">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("MemberId")%>' CommandName="EditRow" runat="server">Edit</asp:LinkButton>
                        <asp:LinkButton ID="lbDelete" OnClientClick="return confirm('Are you sure you want to delete this row');" CommandArgument='<%# Eval("MemberId")%>' CommandName="DeleteRow" runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("MemberId") %>' CommandName="UpdateRow" runat="server">Update</asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("MemberId") %>' CommandName="CancelUpdate" runat="server">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="MemberId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("MemberId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Bind("MemberId") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton CommandName="InsertRow" ID="lbInsert" ValidationGroup="Insert" runat="server">
                                    Insert
                        </asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxMemberName" Width="110px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Name %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelName" Width="80px" runat="server" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Name%>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtName" Width="110px" runat="server"></asp:TextBox>
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
                        <asp:DropDownList ID="ddlMemberInsertGender" runat="server">
                               <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertddlGender" runat="server" ErrorMessage="Gender is required" ControlToValidate="ddlMemberInsertGender" Text="*" InitialValue="Select Shelf Number" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxMemberAddress" Width="60px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Address %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelAddress" Width="30px" runat="server" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Address %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddress" Width="60px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertAddress" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Password" SortExpression="Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxMemberPassword" Width="60px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Password %>'></asp:TextBox>
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
                        <asp:TextBox ID="TextBoxMemberNickName" Width="60px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).NickName %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelNickName" runat="server" Width="30px" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).NickName %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNickName" Width="60px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertNickName" runat="server" ErrorMessage="NickName is required" ControlToValidate="txtNickName" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Online" SortExpression="Online">
                    <EditItemTemplate>
                        <asp:Label ID="LabelMemberOnline" runat="server" Text='<%# returnMemberOnline(Convert.ToBoolean(returnUserById(Convert.ToInt32( Eval("UserId"))).IsOnline))%>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelOnline" runat="server" Text='<%#returnMemberOnline(Convert.ToBoolean(returnUserById(Convert.ToInt32( Eval("UserId"))).IsOnline)) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="txtOnline" runat="server" Text=""></asp:Label>
                         </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="E-mail" SortExpression="Mail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxMemberMail" Width="100px" runat="server" Text='<%# returnUserById(Convert.ToInt32(Eval("UserId"))).Mail%>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelMail" runat="server" Width="100px" Text='<%#returnUserById(Convert.ToInt32(Eval("UserId"))).Mail %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMail" Width="100px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertMail" runat="server" ErrorMessage="Mail is required" ControlToValidate="txtMail" Text="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Faculty Name" SortExpression="FacultyName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlFacultyName" runat="server" SelectedValue='<%#Eval("FacultyName") %>'>
                            <asp:ListItem>Select Faculty</asp:ListItem>
                            <asp:ListItem>Buca Eğitim Fakültesi</asp:ListItem>
                            <asp:ListItem>Denizcilik Fakültesi</asp:ListItem>
                            <asp:ListItem>Edebiyat Fakültesi</asp:ListItem>
                            <asp:ListItem>Fen Fakültesi</asp:ListItem>
                            <asp:ListItem>Hukuk Fakültesi</asp:ListItem>
                            <asp:ListItem>İşletme Fakültesi</asp:ListItem>
                            <asp:ListItem>Mimarlık Fakültesi</asp:ListItem>
                            <asp:ListItem>Mühendislik Fakültesi</asp:ListItem>
                            <asp:ListItem>Tıp Fakültesi</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditFacultyName" runat="server" ErrorMessage="Faculty Name is required" ControlToValidate="ddlFacultyName" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelFacultyName" runat="server" Text='<%#Eval("FacultyName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlMemberInsertFacultyName" runat="server">
                            <asp:ListItem>Select Faculty</asp:ListItem>
                            <asp:ListItem>Buca Eğitim Fakültesi</asp:ListItem>
                            <asp:ListItem>Denizcilik Fakültesi</asp:ListItem>
                            <asp:ListItem>Edebiyat Fakültesi</asp:ListItem>
                            <asp:ListItem>Fen Fakültesi</asp:ListItem>
                            <asp:ListItem>Hukuk Fakültesi</asp:ListItem>
                            <asp:ListItem>İşletme Fakültesi</asp:ListItem>
                            <asp:ListItem>Mimarlık Fakültesi</asp:ListItem>
                            <asp:ListItem>Mühendislik Fakültesi</asp:ListItem>
                            <asp:ListItem>Tıp Fakültesi</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertFacultyName" runat="server" ErrorMessage="Faculty Name is required" ControlToValidate="ddlMemberInsertFacultyName" Text="*" InitialValue="Select Shelf Number" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Member Type" SortExpression="MemberType">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlMemberType" runat="server" SelectedValue='<%#Eval("MemberType") %>'>
                            <asp:ListItem>Select Member Type</asp:ListItem>
                            <asp:ListItem>Instructor</asp:ListItem>
                            <asp:ListItem>Student</asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditMemberType" runat="server" ErrorMessage="Member Type is required" ControlToValidate="ddlMemberType" Text="*">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelMemberType" runat="server" Text='<%#Eval("MemberType") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlMemberInsertType" runat="server" >
                             <asp:ListItem>Select Member Type</asp:ListItem>
                            <asp:ListItem>Instructor</asp:ListItem>
                            <asp:ListItem>Student</asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvInsertMemberType" runat="server" ErrorMessage="Member Type is required" ControlToValidate="ddlMemberInsertType" Text="*" InitialValue="Select Shelf Number" ValidationGroup="Insert">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

               

                 <asp:TemplateField HeaderText="Active" SortExpression="IsActive">
                    <EditItemTemplate>
                        <asp:Label ID="LabelEditIsActive" runat="server" Text='<%#Convert.ToBoolean(Eval("IsActive")) %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelIsActive" runat="server" Text='<%#Convert.ToBoolean(Eval("IsActive")) %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="LabelInsertIsActive" runat="server" Text="" ></asp:Label>
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
