<%@ Page Title="Contact Us | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="CrimsonCoward.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="Title" runat="server">
            <asp:Literal Text="Contact US" ID="PageTitle" runat="server" /></h1>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-6">

                    <span runat="server" id="ContactText" style="float: left; color: black; font: 18px; font-weight: bold;">Zahia Kaddoura Street, Khatchadourian Bld,<br />
                        1st floor, Down Town Beirut, Lebanon<br />
                        <span style="color: red">P.O. Box:</span> 175 315 Beirut, Lebanon<br />
                        <span style="color: red">T /F</span> +961 1 993399 (ext.101)<br />
                        <span style="color: red">M</span> +961 70 600670
                        <br />
                        info@pbm-leb.com
                    </span>

                    <div class="alert alert-success hidden" id="contactSuccess">
                        <strong>Success!</strong> Your message has been sent to us.
                    </div>
                    <div class="alert alert-error hidden" id="contactError">
                        <strong>Error!</strong> There was an error sending your message.
                    </div>
                    <div class="clear"></div>
                    <div class="contact-form">
                        <!--NOTE: Update your email Id in "contact_me.php" file in order to receive emails from your contact form-->

                        <div name="sentMessage" id="contactForm">
                            <h3>
                                <asp:Literal ID="Prl" runat="server" /></h3>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:TextBox CssClass="form-control" ID="txtName" placeholder="Full Name" runat="server" />
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Required" CssClass="color-red" ControlToValidate="txtName" runat="server" />
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:TextBox CssClass="form-control" ID="txtEmail" placeholder="Email" runat="server" />
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Required" CssClass="color-red" ControlToValidate="txtEmail" runat="server" />
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:TextBox CssClass="form-control" ID="txtPhone" placeholder="Phone ex:70600670" runat="server" />
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="txtMessage" placeholder="Message" Height="200px" />
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Required" CssClass="color-red" ControlToValidate="txtMessage" runat="server" />
                                </div>
                            </div>
                            <div id="success"></div>
                            <!-- For success/fail messages -->
                            <asp:LinkButton Style="float: right" Text="Submit" Width="100px" CssClass="btn btn-success pull-left" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" /><br />
                        </div>
                    </div>
                </div>
                <div class="col-md-6" runat="server" id="map">
                    <iframe width="100%"
                        height="450"
                        frameborder="0" style="border: 0"
                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAc_M_kWLeLkrZ7rUfL_orpAaBJB9b4ogY&q=CrimsonCoward : Real Estate in Lebanon-Apartments for Sale in Lebanon-Apartment for rent in Lebanon" allowfullscreen></iframe>
                </div>
                <div class="col-md-6" runat="server" id="PropertyDetails" visible="false">
                    <div>
                        <div style="margin-bottom: 40px">
                            <div class="imgContainer" style="width: 100%; background: lightgray; height: 280px; overflow: hidden; position: relative; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);">
                                <a style="overflow: hidden; height: 100%; width: 100%; display: flex" href='<%=ResolveUrl("~/") +(prop.PropertyType.ToString().Contains("-") ? prop.PropertyType.ToString().Replace(" ","").Split('-')[0] : prop.PropertyType) + "/" + (!string.IsNullOrEmpty(prop.Qadaa.ToString())?prop.Qadaa:"Qadaa") + "/" + (!string.IsNullOrEmpty(prop.District.ToString())?prop.District:"District" )+ "/" + prop.PRL %>'
                                    title='<%= (prop.Department != null && !string.IsNullOrEmpty(prop.Department.ToString())) ? prop.Department + " - " + prop.District : (prop.PropertyType.ToString().Contains("-") ? prop.PropertyType.ToString().Replace(" ", "").Split('-')[1] : prop.PropertyType) + " for " + prop.PropertyFor + " in " + prop.District%>'>
                                    <asp:Image ID="imgSrc" CssClass="CenteredImage"
                                        Style="position: absolute; left: -100%; right: -100%; top: -100%; bottom: -100%; margin: auto; min-width: 100%; min-height: 100%; background-color: darkgray; box-shadow: 0 0 5px 0 rgba(0,0,0,0.1);" runat="server" AlternateText='<%= prop.PropertyType + " for " +  prop.PropertyFor %>' />
                                    <div class="PriceTag" style="background-color: #d12229 !important;"><%= prop.PropertyFor.ToString().ToLower().Contains("rent") && prop.PropertyFor.ToString().ToLower().Contains("sale") ? string.Format("{0:###,###,##0}",prop.SalePrice)+" USD<br />" +string.Format("{0:###,###,##0}",prop.RentPrice)+ " / year" :prop.PropertyFor.ToString().ToLower().Contains("rent")? string.Format("{0:###,###,##0}",prop.RentPrice)+ " USD / year" : string.Format("{0:###,###,##0}",prop.SalePrice)+" USD" %></div>
                                </a>
                            </div>

                            <span style="color: #000000; font-weight: bold !important; height: 170px !important; overflow-wrap: break-word; font-size: 20px; display: block; box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.1); padding: 15px; text-transform: uppercase"><span style="color: #d12229"><%=prop.PropertyType +" for "+prop.PropertyFor%></span><br />
                                <span style="font-weight: normal"><%=" in "+prop.Neighborhood  %></span>

                                <%-- <span style="font-weight: normal; font-size: 18px;height:65px !important;display:block;overflow:hidden; ">
                                            <%= Eval("Web_GuideDescription").ToString()%>
                                        </span>--%>
                                <div style="position: absolute; left: 30px;">
                                    <div style="width: 100%; margin-left: auto; margin-right: auto; padding: 5px; padding-left: 0px !important">
                                        <span style="margin: 15px" runat="server" id="Bedrooms">
                                            <span style="color: #d12229"><%=prop.TotalBedrooms %></span>
                                            <asp:Image ImageUrl="~/img/bedrooms.png" runat="server" />
                                        </span>
                                        <span style="margin: 15px" runat="server" id="Bathrooms">

                                            <span style="color: #d12229"><%=prop.Bathrooms %></span>
                                            <asp:Image ImageUrl="~/img/bathrooms.png" runat="server" />
                                        </span>
                                        <span style="margin: 15px; margin-left: 0px !important" runat="server" id="Parking">
                                            <span style="color: #d12229"><%=prop.Parkings %></span>
                                            <asp:Image ImageUrl="~/img/parking.png" runat="server" />
                                        </span>
                                    </div>
                                    <span style="font-weight: normal; font-size: 18px" runat="server" id="Size">
                                        <span style="font-weight: bold;">Size: </span><%=prop.Size %> m2
                                    </span>
                                    <div class="clear"></div>
                                    <span style="font-weight: normal; font-size: 18px">
                                        <span style="font-weight: bold;">Ref #: </span><%=prop.PRL %>
                                    </span>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>