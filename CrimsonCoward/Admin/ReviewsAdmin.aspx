<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ReviewsAdmin.aspx.cs" EnableEventValidation="false" Inherits="CrimsonCoward.Admin.ReviewsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            Reviews
        </div>
        <div class="panel-body">
            <asp:GridView ID="ReviewsGridView" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" OnRowCommand="ReviewsGridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="data_ID" HeaderText="data_ID" SortExpression="data_ID" Visible="False" />
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>

                            <asp:Label ID="reviewTitle" style="border-width:0px" Text='<%# Eval("Title") %>' runat="server" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Review">
                        <ItemTemplate>

                            <asp:Label ID="reviewText"  style="border-width:0px" Text='<%# Eval("Text") %>' runat="server" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rating">
                        <ItemTemplate>
                            <asp:Label ID="reviewRating" Enabled="false" style="border-width:0px;" Text='<%# Eval("Rating") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:checkbox Checked='<%# Eval("IsActive") %>' id="isActive" runat="server" reviewid='<%# Eval("Id") %>' AutoPostBack="true"  oncheckedchanged="isActive_CheckedChanged"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
