<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="latest-properties.ascx.cs"
    Inherits="CrimsonCoward.UserControls.latest_properties" %>
<asp:UpdatePanel ID="upd1" runat="server">
    <ContentTemplate>
        <table border="0" cellpadding="0" cellspacing="0" id="latestProp">
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="27">
                                <asp:DataPager ID="DataPager2" runat="server" PagedControlID="latestList" PageSize="3">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowPreviousPageButton="true" ShowNextPageButton="false"
                                            PreviousPageImageUrl="~/images/arrow_left.png" ButtonType="Image" FirstPageText=""
                                            LastPageText="" NextPageText="" PreviousPageText="" RenderDisabledButtonsAsLabels="false" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                            <td width="40"></td>
                            <asp:ListView ID="latestList" runat="server" DataSourceID="LatestPropsObjectDataSource"
                                OnItemDataBound="rptLatestProps_ItemDataBound">
                                <ItemTemplate>
                                    <td width="101">
                                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# ResolveUrl("~/") + (Eval("PropertyType").ToString().Trim() + "-" + Eval("PropertyFor") + "-" + Eval("District") + "-" + Eval("PRL") + ".aspx").Replace("_", "-").Replace("/", "-").Replace("  ", "-").Replace(" ", "-").Replace("\"", "").Replace("&", "").ToLower()%>'
                                            runat="server">
                                            <asp:Image ID="Image1" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?Id=" + Eval("PRL") + "&secImg=footer" %>'
                                                Height="60" Width="100" runat="server" AlternateText='<%# Eval("PropertyType") + " for " +  Eval("PropertyFor") %>' />
                                        </asp:HyperLink>
                                    </td>
                                    <td width="10"></td>
                                    <td width="150">
                                        <asp:HiddenField ID="hdnDistrict" runat="server" Value='<%# Eval("District") %>' />
                                        <%# Eval("PropertyType")%>
                                            for
                                            <%# Eval("PropertyFor")%>
                                            in
                                            <asp:Label ID="lblNeighborhood" Text='<%# Eval("Neighborhood") %>' runat="server" /><br />
                                        Size:
                                            <%# Eval("Size") %>m2<br />
                                        Price:
                                            <%# string.Format("$ {0:###,###,##0}", (Eval("PropertyFor").ToString().ToLower().Contains("rent") ? Eval("RentPrice") : Eval("saleprice"))) + (Eval("PropertyFor").ToString().ToLower().Contains("rent") ? " / year" : "")%>
                                        <br />
                                        Ref#:
                                            <%# Eval("PRL") %>
                                    </td>
                                    <td width="40"></td>
                                </ItemTemplate>
                            </asp:ListView>
                </td>
                <td width="27">
                    <asp:DataPager ID="DataPager3" runat="server" PagedControlID="latestList" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ShowPreviousPageButton="false" ShowNextPageButton="true"
                                NextPageImageUrl="~/images/arrow_right.png" ButtonType="Image" FirstPageText=""
                                LastPageText="" NextPageText="" PreviousPageText="" RenderDisabledButtonsAsLabels="false" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
        </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>