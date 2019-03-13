<%@ Page Title="Login | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CrimsonCoward.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div style="width: 100%; text-align: center">
                    <asp:Login ID="Login1" runat="server">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="1" style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td class="Title center" style="width:200px !important" colspan="2">Log In</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label runat="server" style="color:black;" AssociatedControlID="UserName" ID="UserNameLabel">User Name:</asp:Label></td>
                                                <td>
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="UserName"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="Login1" ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label runat="server" style="color:black;" AssociatedControlID="Password" ID="PasswordLabel">Password:</asp:Label></td>
                                                <td>
                                                    <asp:TextBox runat="server" CssClass="form-control"  TextMode="Password" ID="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ValidationGroup="Login1" ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="1">
                                                    <asp:Label Text="Remember me" runat="server" />
                                                    <asp:CheckBox runat="server" style="color:black !important;" ID="RememberMe"></asp:CheckBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: #D12229;">
                                                    <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" ID="LoginButton"></asp:Button>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

