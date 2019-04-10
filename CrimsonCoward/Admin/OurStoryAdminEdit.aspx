<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" ValidateRequest="false" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="OurStoryAdminEdit.aspx.cs" Inherits="CrimsonCoward.Admin.OurStoryAdminEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <div class="panel-heading">
            <asp:Literal runat="server" ID="Notifications"></asp:Literal>
        </div>
        <div class="panel-body">
            <h1 class="Title">Edit Our Story</h1>
            <div class="row" style="margin-top: 20px;">
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Our Story Text</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="Body" TextMode="MultiLine" ValidateRequestMode="Disabled" />
                    </div>
                    <div class="form-group">
                        <asp:Button Text="Save" CssClass="form-control" ID="OSbtnSave" runat="server" OnClick="OSbtnSave_Click" />
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
            </div>
        </div>
    </div>
</asp:Content>