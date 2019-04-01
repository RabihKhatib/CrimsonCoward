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
                            <asp:Image runat="server" class="sliderimg" Style="max-height: 680px; min-height:500px;" ImageUrl='<%# ResolveUrl("~/") + "Thumbnail.aspx?id=" + Eval("Id") + "&secImg=HomeTips&r="+Guid.NewGuid()  %>' />
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
Los Angeles native and Nashville inspired, Crimson Coward is dedicated to bringing the Nashville Hot Chicken phenomenon to the heart of Downey.  Our expertise for great quality and flavorful food is inspired by our time spent, meeting real Nashville chefs, and exploring the greatest eateries and hot chicken joints in Nashville.         </p>
        <p class="text" style="padding-bottom: 20px;">
Here at Crimson Coward, we pride ourselves in serving chicken that does not compromise quality and flavor.  Our chicken and food redefine quality and is made from the freshest  ingredients.  We only serve premium, all-natural, Non-GMO chicken, from some of the most reputable farms in California. We only carry all natural, antibiotic & hormone free chicken, and our signature sides are all made fresh daily. 
        </p>
        <p class="text" style="padding-bottom: 20px;">
The Crimson family is proud to bring authentic Nashville hot chicken to the heart of Downey, and Los Angeles area.

        </p>
    </section>
    <section id="article" style="position: relative;">
        <div id="article1" class="col-lg-6 article">
            <div class="CenteredImage">
                <h2 style="color: white;">HOURS OF OPERATION</h2>
                <h3 style="color: white;">Sunday - Thursday 11am to 10pm<br />
                    Friday - Saturday 11am to midnight</h3>
            </div>
        </div>

        <div id="article2" class="col-lg-6 article">
            <div class="CenteredImage">
                <h3 style="color: white;">10405 Lakewood Blvd
                    <br />
                    Downey CA 90241</h3>
            </div>
        </div>
    </section>
    <section id="foodmenu" style="position: relative; margin-bottom: 15px;">
        <div class=" col-lg-8 CenteredImage">
            <img src="assets/CC_Assets_Titles_MENU.png" alt="Alternate Text" />
        </div>
        <div class=" col-lg-8 CenteredImage">
            <img src="assets/MenuText.jpg" alt="Alternate Text" style="margin-bottom: 20px; max-width: 100%;" />
        </div>
        <div class="col-lg-8 CenteredImage" style="text-align: left; margin-bottom: 15px;">
            <asp:Repeater ID="rptMenuCat" runat="server">
                <ItemTemplate>
                    <div class="col-lg-6">
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
                        <asp:Repeater ID="rptMenuFood" DataSource="<%# GetFoodList(Container.DataItem) %>" runat="server">
                            <ItemTemplate>
                                <table style="margin-bottom: 15px;">
                                    <tr>
                                        <td  class="foodsample"><span style="float: left; font-weight: bold; font-size: 14pt;"><%# Eval("Name")%></span>
                                             <span  <%# "HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())? "":"hidden"     %> style="float: left; font-size: 11pt;padding-top:2px; padding-left:20px;text-transform:initial !important;"><%# Eval("Description")%></span>

                                        </td>
                                        <td class="line" <%# Eval("Price").ToString() == "0"||"HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())?"hidden":"" %>>&nbsp;</td>
                                        <td class="price" <%# Eval("Price").ToString() == "0"||"HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())?"hidden":"" %>>
                                            <span style="font-size:16pt; float: right; "><%# decimal.Parse(Eval("Price").ToString()).ToString("G29")  %></span>
                                        </td>
                                       
                                            
                                   
                                    </tr>

                                    <tr class="fooddesc">
                                        <td colspan="4"  <%# "HEAT LEVEL".Equals(DataBinder.Eval(Container.Parent.Parent, "DataItem.Name").ToString().ToUpper())? "hidden":""     %>>
                                            <span style="float: left; font-size: 11pt; vertical-align: top; line-height: 11pt;"><%# Eval("Description")%></span> </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                        <img src="assets/Dots.jpg" width="70%" alt="Alternate Text" style="padding-top:5px; padding-bottom:20px"/>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
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
                <h2 style="display: inline; color: #E9B244;">MATTERS THE MOST</h2>
                <br />
                <h4 style="display: inline; color: #333;">Our customers recommend us with a rating of </h4>
                <h4 style="display: inline; color: #E9B244;">4.8/5</h4>
                <h4 style="display: inline; color: #333;">... And they speak best!</h4>
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
                        <asp:Button Text="SEND" Style="margin-bottom:30px; background-color: #842522; width: 15%; font-weight: bold; height: 30px; border-radius: 3px 4px; border-style: none; color: white" ID="btnReview" runat="server" OnClick="btnReview_Click" />
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
                                                    <div class="col-xs-9" style="pointer-events: none; text-align:left;">
                                                        <div class="description">
                                                            <div> <%# Eval("Text") %></div>
                                                            <div style="font-weight:bold;"><%# Eval("Title") %> </div>
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
        <div id="map1" class="col-lg-12 " style="padding: 0px; height: 300px">
            <div class="col-md-12 newsbox" style="padding-left: 0px !important; padding-right: 0px !important; background-color: darkgray">
                <%-- <iframe width="100%" height="300px"
                    frameborder="0" style="border: 0"
                    src="https://www.google.com/maps/embed/v1/place?key=*********************&q=CrimsonCoward" allowfullscreen></iframe>--%>
                <div class="mapouter">
                    <div class="gmap_canvas">
                        <iframe width="100%" height="300px" id="gmap_canvas" src="https://maps.google.com/maps?q=10405+Lakewood+Blvd,+Downey,+CA+90241&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                        <%--<a href="https://www.pureblack.de"></a>--%>
                    </div>
                    <style>
                        .mapouter {
                            text-align: right;
                            height: 300px;
                            width: 100%;
                        }

                        .gmap_canvas {
                            overflow: hidden;
                            background: none !important;
                            height: 300px;
                            width: 100%;
                        }
                    </style>
                </div>
            </div>
        </div>
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
                    <h3 style="color: white; font-weight: bold;">DO YOU NEED ANY HELP?</h3>
                </div>
            </div>
            <div class="col-lg-12 ">
               <div class="col-lg-4 col-xs-12 phone" style="text-align: center">
                    <h5 style="color: white; font-weight: lighter">“We're always a click away!.”</h5>
                    <asp:HyperLink NavigateUrl="mailTo:alihijazi@crimsoncoward.com" Text="CONTACT US!" BackColor="White" BorderStyle="None" Style="border-radius: 5px;" Font-Bold="true" ForeColor="#842522" Width="140px" Height="22px" runat="server" />

                    <div class="clear"></div>
                    <img imageheight="33px" src="~/assets/footer_Facebook.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                    <img imageheight="33px" src="~/assets/footer_Insta.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                    <img imageheight="33px" src="~/assets/footer_Snap.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                </div>
                <div class="col-lg-push-1 col-lg-4 col-xs-12" style="text-align: center">

                    <h4 style="color: white;">HOURS OF OPERATION</h4>
                <h5 style="color: white;">Sunday - Thursday 11am to 10pm<br />
                    Friday - Saturday 11am to midnight</h5>
                    <h5 style="color: white;">10405 Lakewood Blvd
                    <br />
                        Downey CA 90241</h5>
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
                    <asp:HyperLink NavigateUrl="mailTo:alihijazi@crimsoncoward.com" Text="CONTACT US!" BackColor="White" BorderStyle="None" Style="border-radius: 5px;" Font-Bold="true" ForeColor="#842522" Width="140px" Height="22px" runat="server" />

                    <div class="clear"></div>
                    <img imageheight="33px" src="~/assets/footer_Facebook.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
                    <img imageheight="33px" src="~/assets/footer_Insta.png" style="margin-top: 20px; margin-bottom: 5px;" runat="server" />
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

