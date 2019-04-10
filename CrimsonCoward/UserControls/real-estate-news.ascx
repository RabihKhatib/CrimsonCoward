<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="real-estate-news.ascx.cs"
    Inherits="CrimsonCoward.UserControls.real_estate_news" %>
<table id="tblNews" border="0" cellpadding="0" cellspacing="0" width="100%" class="sectionContent">
    <tr>
        <td class="title">REAL ESTATE NEWS
        </td>
    </tr>
    <tr>
        <td valign="top" height="265">
            <table cellpadding="0" cellspacing="0" class="tblContent bgcontent" style="border-radius: 0px 0px 5px 5px !important;">
                <tr>
                    <td height="265">
                        <div id="NewsContent">
                            <ul id="NewsList">
                                <asp:Repeater runat="server" ID="rptNews" DataSourceID="NewsObjectDataSource">
                                    <ItemTemplate>
                                        <li><span><a href='<%# ResolveUrl("~/") + "news-detail.aspx?id=" + Eval("Id") %>'>
                                            <%# Eval("title") %></a></span><br />
                                            <p>
                                                <%# Eval("subTitle") %>
                                            </p>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="more">
                        <asp:HyperLink NavigateUrl="~/news.aspx?news=local" runat="server">
            previous articles</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;
        </td>
    </tr>
</table>