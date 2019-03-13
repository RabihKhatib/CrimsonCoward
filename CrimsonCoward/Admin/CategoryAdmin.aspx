<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="CategoryAdmin.aspx.cs" enableEventValidation="false" Inherits="CrimsonCoward.Admin.CategoryAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">

        </div>
        <div class="panel-body">
            <h1 class="Title">Categories List</h1>
            <div class="row" style="margin-top:20px;">
                <div class="col-lg-6">
                    <div class="form-group">
                        <asp:Button CssClass="form-control" Text="Add New" ID="btnNew" runat="server" OnClick="btnNew_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="panel panel-default">
        <div class="panel-heading">
            Categories
        </div>
        <div class="panel-body">
                <asp:GridView ID="CatGridView"   CssClass="table table-hover table-striped"  runat="server" AutoGenerateColumns="False"  OnRowCommand="CatGridView_RowCommand">
        <Columns>
            <asp:BoundField DataField="data_ID" HeaderText="data_ID" SortExpression="data_ID"
                Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="title">
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="title">
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("Id") %>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="delLinkButton1" Text="Delete" CommandName="del" CommandArgument='<%# Eval("Id") %>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
    </div>
 </asp:Content>
