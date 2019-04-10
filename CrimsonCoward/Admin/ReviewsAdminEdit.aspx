<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ReviewsAdminEdit.aspx.cs" Inherits="CrimsonCoward.Admin.ReviewsAdminEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <asp:Literal runat="server" ID="Notifications"></asp:Literal>
        </div>
        <div class="panel-body">
            <h1 class="Title">Reviews Edit</h1>
            <div class="row" style="margin-top: 20px;">
                <div class="col-lg-6">
                    <asp:Label Text="" ID="lblID" runat="server" Visible="false" />

                    <div class="form-group">
                        <label>Image</label>
                        <asp:FileUpload runat="server" CssClass="form-control" ID="uplImage" />
                        <asp:Label Text="" ID="lblImage" CssClass="label-danger" runat="server" />
                    </div>

                    <div class="form-group">
                        <label>Active</label>
                        <asp:CheckBox runat="server" ID="chkActive" Checked="true" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row">
                        <asp:Image runat="server" Width="100%" ID="imgview" Visible="false" />
                    </div>
                    <div class="row">
                        <asp:Image runat="server" Width="50%" ID="logoView" Visible="false" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>