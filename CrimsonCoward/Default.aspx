<%@ Page Title="CrimsonCoward" Language="C#"
    MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="CrimsonCoward.Default" EnableEventValidation="false" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">        menuID = "menu_home"</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section id="featured" style="position: relative; display: grid">
        <!-- Slider -->
        <div id="main-slider" class="flexslider">
            <div class="flex-caption">
            </div>
            <ul class="slides">
                <asp:Repeater runat="server" ID="rptBanner">
                    <ItemTemplate>
                        <li>
                            <asp:Image runat="server" class="sliderimg" Style="max-height: 680px; min-height: 500px;" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?id=" + Eval("Id") + "&secImg=HomeTips&r="+Guid.NewGuid()  %>' />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <!-- end slider -->
    </section>
    <section id="story" style="position: relative; display: grid;">
        <h3 class="title">
            <img src="assets/CC_Assets_Titles_OUR-STORY.png" alt="Our Story" /></h3>
        <p class="text">
            <asp:Label ID="ourStoryTxt" Style="display: block; text-align: center; font-weight: bold;" runat="server" />
        </p>
    </section>
    <section id="article" style="position: relative; overflow: hidden;">
        <div id="article1" class="col-lg-6 article" style="background-image: linear-gradient( rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url(<%=leftBody.ImageUrl%>)">
            <div class="CenteredImage" style="transform: translate(-75%, 0%);">
                <a target="_blank" href="https://www.toasttab.com/crimson-coward/">
                    <img src="assets/order-online-bckg.png" style="position: absolute; z-index: 1; width: 50%;" />
                    <img src="assets/order-online-text.png" style="position: absolute; z-index: 2; width: 50%;" />
                </a>
            </div>
        </div>

        <div id="article2" class="col-lg-6 article" style="background-image: linear-gradient( rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url(<%=rightBody.ImageUrl%>)">
            <div class="CenteredImage">
                <h3 style="color: white;">10405 Lakewood Blvd
                    <br />
                    Downey CA 90241</h3>
            </div>
        </div>
    </section>
    <section id="foodmenu" style="position: relative; margin-bottom: 15px; margin-top: 50px;">
        <div class=" col-lg-8 CenteredImage">
            <img src="assets/CC_Assets_Titles_MENU.png" alt="Alternate Text" />
        </div>
        <div class=" col-lg-8 CenteredImage" style="padding-bottom: 50px;">
            <img src="assets/MenuText.jpg" alt="Alternate Text" style="margin-bottom: 20px; max-width: 100%;" />
        </div>
        <div class="container" style="text-align: left; margin-bottom: 15px;">
            <div class="row menusep">
                <div class='col-md-6 col-lg-6 col-sm-12'>
                    <asp:Repeater ID="rptMenuCatSing" runat="server">
                        <ItemTemplate>
                            <div class='row'>
                                <div class='col-md-8 col-lg-10 col-sm-12'>
                                    <table style="margin-bottom: 15px;">
                                        <tr>
                                            <td class="foodcat">
                                                <span style="font-weight: bold; font-size: 24pt; color: #842522"><%# Eval("Name") %></span>
                                            </td>
                                        </tr>
                                        <tr class="description">
                                            <td>
                                                <span style="float: left; font-size: 11pt; vertical-align: top; line-height: 11px;"><%# Eval("Description") %></span>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Repeater ID="rptMenuFood" DataSource="<%# GetFoodList(Container.DataItem).OrderBy(x => x.MENU_ORDER).ToList() %>" runat="server">
                                        <ItemTemplate>
                                            <table style="margin-bottom: 15px;">
                                                <tr>
                                                    <td class="foodsample"><span style="float: left; font-weight: bold; font-size: 14pt;"><%# Eval("Name")%></span>
                                                        <span <%# "HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())? "":"hidden"     %> style="float: left; font-size: 11pt; padding-top: 2px; padding-left: 20px; text-transform: initial !important;"><%# Eval("Description")%></span>
                                                    </td>
                                                    <td class="line" <%# "0".Equals(Eval("Price"))||"HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())?"hidden":"" %>>&nbsp;</td>
                                                    <td class="price" <%# "0".Equals(Eval("Price")) ||"HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())?"hidden":"" %>>
                                                        <span style="font-size: 16pt; float: right;"><%# Eval("Price")%></span>
                                                    </td>
                                                </tr>
                                                <tr class="fooddesc">
                                                    <td colspan="4" <%# "HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())? "hidden":""     %>>
                                                        <span style="float: left; font-size: 11pt; vertical-align: top; line-height: 11pt;"><%# Eval("Description")%></span> </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <img src="assets/Dots.jpg" alt="Alternate Text" style="padding-top: 20px; padding-bottom: 35px; margin-left: auto; margin-right: auto; display: block;" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class='col-md-6 col-lg-6 col-sm-12 rightmenupadding'>
                    <asp:Repeater ID="rptMenuCat" runat="server">
                        <ItemTemplate>
                            <div class='row'>
                                <div class='col-md-8 col-lg-10 col-sm-12'>
                                    <table style="margin-bottom: 15px;">
                                        <tr>
                                            <td class="foodcat">
                                                <span style="font-weight: bold; font-size: 24pt; color: #842522"><%# Eval("Name") %></span>
                                            </td>
                                        </tr>
                                        <tr class="description">
                                            <td>
                                                <span style="float: left; font-size: 11pt; vertical-align: top; line-height: 11px;"><%# Eval("Description") %></span>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Repeater ID="rptMenuFood" DataSource="<%# GetFoodList(Container.DataItem).OrderBy(x => x.MENU_ORDER).ToList() %>" runat="server">
                                        <ItemTemplate>
                                            <table style="margin-bottom: 15px;">
                                                <tr>
                                                    <td class="foodsample"><span style="float: left; font-weight: bold; font-size: 14pt;"><%# Eval("Name")%></span>
                                                        <span <%# "HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())? "":"hidden"     %> style="float: left; font-size: 11pt; padding-top: 2px; padding-left: 20px; text-transform: initial !important;"><%# Eval("Description")%></span>
                                                    </td>
                                                    <td class="line" <%# "0".Equals(Eval("Price")) ||"HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())?"hidden":"" %>>&nbsp;</td>
                                                    <td class="price" <%# "0".Equals(Eval("Price")) ||"HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())?"hidden":"" %>>
                                                        <span style="font-size: 16pt; float: right;"><%# Eval("Price")  %></span>
                                                    </td>
                                                </tr>
                                                <tr class="fooddesc">
                                                    <td colspan="4" <%# "HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())? "hidden":""     %>>
                                                        <span style="float: left; font-size: 11pt; vertical-align: top; line-height: 11pt;"><%# Eval("Description")%></span> </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <img src="assets/Dots.jpg" width="70%" alt="Alternate Text" style="padding-top: 20px; padding-bottom: 35px; margin-left: auto; margin-right: auto; display: block;" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>

    <section id="banner" style="position: relative;">
        <div id="banner1" class="col-lg-12 article" style="height: 400px;">
            <img src="assets/CC_Assets_Titles_Follow-US.png" alt="Follow us" style="width: 100%" />
        </div>
    </section>
    <section id="ReviewsSection" style="position: relative;">

        <div id="Reviews" class="col-lg-8 CenteredImage" style="height: 335px;">
            <div id="ReviewsBox" style="min-height: 200px; box-shadow: 5px 10px 30px 10px #c7c6c6; border-radius: 20px; margin-left: auto; margin-right: auto; background-color: #f5f5f594;">
                <br />
                <h2 style="display: inline; color: #842522;">YOUR OPINION</h2>
                <h2 style="display: inline; color: #E9B244;">MATTERS</h2>
                <br />
                <br />
                <asp:TextBox placeholder="Your name" runat="server" ID="txtReviewTitle" CssClass="reviewcss" />
                <asp:TextBox placeholder="Type here" runat="server" ID="txtReview" CssClass="reviewcss" />
                <asp:HiddenField ID="hdnRating" ClientIDMode="Static" runat="server" />
                <br />
                <br />
                <div class="rating"></div>
                <br />
                <asp:UpdatePanel ID="up2" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblReview" Style="display: block; text-align: center; font-weight: bold;" runat="server" />
                        <asp:Button Text="SEND" Style="margin-bottom: 30px; background-color: #842522; width: 15%; font-weight: bold; height: 30px; border-radius: 3px 4px; border-style: none; color: white" ID="btnReview" runat="server" OnClick="btnReview_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </section>
    <section id="reviews" style="position: relative">
        <div id="reviews1" class="col-lg-12" style="min-height: 150px; margin-top: 5%; margin-bottom: 5%;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div id="testimonial-slider" class="owl-carousel">
                                <asp:Repeater runat="server" ID="rptReviews">
                                    <ItemTemplate>

                                        <div class="testimonial">

                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <div class="pic">
                                                        <img src="assets/CC_Assets_Testimonials_Chicken-Head.png" alt="Avatar">
                                                    </div>
                                                </div>
                                                <div class="col-xs-9" style="pointer-events: none; text-align: left;">
                                                    <div class="description">
                                                        <div><%# Eval("Text") %></div>
                                                        <div style="font-weight: bold;"><%# Eval("Title") %> </div>
                                                        <div class="reviewsRating" id="rating_<%# Eval("Id") %>">
                                                        </div>
                                                    </div>
                                                    <script>
                                                        $('#rating_<%# Eval("Id") %>').addRating({
                                                            max: 5,
                                                            disabled: true,

                                                            fieldName: 'rating_<%# Eval("Id") %>',
                                                            fieldId: 'rating_<%# Eval("Id") %>',
                                                            icon: 'star',
                                                            selectedRatings: '<%# Eval("Rating") %>'

                                                        });
                                           <%-- $("#rating_<%# Eval("Id") %>").find('.stars').unbind(); $("#rating_<%# Eval("Id") %>").find('.stars .star').unbind();--%>
                                            //$('owl-item').unbind();
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="map" style="position: relative;">
        <iframe src="https://www.google.com/maps/embed?key=AIzaSyDo7yOkXN6BP9UjJ16EUwqXFJ151YVbDd8&pb=!1m18!1m12!1m3!1d1654.9289251449945!2d-118.11998209946823!3d33.94478402133917!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2cd85f4471c67%3A0x70c4dbced4907f19!2s10405+Lakewood+Blvd%2C+Downey%2C+CA+90241%2C+USA!5e0!3m2!1sen!2slb!4v1554898596630!5m2!1sen!2slb" width="100%" height="300" frameborder="0" style="border: 0" allowfullscreen></iframe>
    </section>
    <section id="footer">
        <div style="background-color: #842522; display: inline-block; width: 100%; border-top: 10px solid #E9B244">
            <div class="col-lg-12">
                <div class="col-lg-12 CenteredImage" style="width: 60%; padding-top: 20px;">
                    <asp:UpdatePanel ID="up1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblSubscribe" ForeColor="White" Style="text-align: center; font-weight: bold;" runat="server" />
                            <asp:TextBox placeholder="ENTER EMAIL ADDRESS" Style="padding-left: 10px;" BorderStyle="None" Width="70%" Height="50px" runat="server" ID="txtSubscribe" CssClass="text"></asp:TextBox>
                            <asp:Button runat="server" OnClick="btnSubscribe_Click" ID="btnSubscribe" Width="25%" Height="50px" Text="STAY TUNED" BackColor="#E9B244" BorderStyle="None" ForeColor="White" Font-Bold="true" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="col-lg-12" style="text-align: center">
                <div class="col-lg-12 CenteredImage" style="width: 60%">
                    <h3 style="color: white; font-weight: bold;">NEED HELP?</h3>
                </div>
            </div>
            <div class="col-lg-12 ">
                <div class="col-lg-4 col-xs-12 phone" style="text-align: center">
                    <h5 style="color: white; font-weight: lighter">“We're always a click away!.”</h5>
                    <asp:HyperLink NavigateUrl="mailTo:hello@crimsoncoward.com" Text="CONTACT US!" BackColor="White" BorderStyle="None" Style="border-radius: 5px;" Font-Bold="true" ForeColor="#842522" Width="140px" Height="22px" runat="server" />

                    <div class="clear"></div>
                    <img imageheight="33px" src="~/assets/footer_Facebook.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                    <img imageheight="33px" src="~/assets/footer_Insta.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                    <img imageheight="33px" src="~/assets/footer_Snap.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                </div>
                <div class="col-lg-push-1 col-lg-4 col-xs-12" style="text-align: center">

                    <h4 style="color: white;">10405 Lakewood Blvd
                    <br />
                        Downey CA 90241</h4>
                    <h4 style="color: white;">HOURS OF OPERATION</h4>
                    <h5 style="color: white;">
                       <%=this.operationHours.Text%></h5>
                    <div>
                        <%--<a style="color: white; font-weight: bold" href="javascript:$('html, body').animate({ scrollTop: 0 }, 700);">HOME</a>&nbsp-&nbsp--%>
                        <h5><a style="color: white;" href="#">CRIMSON COWARD</a>&nbsp-&nbsp
                                <a style="color: white; font-weight: bold" href="javascript:$('html, body').animate({ scrollTop: $('#menu').position().top},700);">MENU</a>&nbsp-&nbsp
                                <a style="color: white; font-weight: bold" href="javascript:$('html, body').animate({ scrollTop: $('#story').position().top},700);">OUR STORY</a>&nbsp-&nbsp</h5>
                        <%-- <a style="color: white; font-weight: bold" href="javascript:$('html, body').animate({ scrollTop: $(document).height()},700);">CONTACT US</a>--%>
                    </div>
                </div>
                <div class="col-lg-4 col-xs-12 desktop" style="text-align: center">
                    <h5 style="color: white; font-weight: lighter">“We're always a click away!.”</h5>
                    <asp:HyperLink NavigateUrl="mailTo:hello@crimsoncoward.com" Text="CONTACT US!" BackColor="White" BorderStyle="None" Style="border-radius: 5px;" Font-Bold="true" ForeColor="#842522" Width="140px" Height="22px" runat="server" />

                    <div class="clear"></div>
                    <a target="_blank" style="height: 33px" href="https://www.facebook.com/crimsoncoward1/">
                        <img src="/assets/footer_Facebook.png" style="margin-top: 20px; margin-bottom: 5px;" />
                    </a>
                    <a target="_blank" style="height: 33px" href="https://www.instagram.com/crimsoncoward">
                        <img imageheight="33px" src="~/assets/footer_Insta.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                    </a>
                    <img imageheight="33px" src="~/assets/footer_Snap.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                </div>
                <div class="col-lg-pull-1 col-lg-4 col-xs-12 footerlogo" style="text-align: center;">
                    <img src="assets/footer_logo.png" width="60%" />
                    <br />
                    <h5 style="color: white">Copyright © <%=DateTime.Now.Year %> - CRIMSON COWARD - All Rights Reserved</h5>
                </div>
            </div>
        </div>
    </section>
</asp:Content>