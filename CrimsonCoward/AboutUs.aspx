<%@ Page Title="About Us | CrimsonCoward - Real Estate Consultancy And Brokerage In Lebanon" Language="C#" MasterPageFile="~/CrimsonCoward.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="CrimsonCoward.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h1 class="Title">About Us</h1>
        <br />
        <div class="about">

            <div class="col-lg-12">
                <div class="project">
                    <div class="row" style="position: relative">

                        <div class="col-lg-4" style="margin-bottom: 40px">
                            <asp:Image ImageUrl="~/img/homebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                            <br />
                            <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> is the winner of the Best Real Estate Agency in Lebanon for the year 2012 in the International Property Awards.</span>
                        </div>

                        <div class="col-lg-4" style="margin-bottom: 40px">
                            <asp:Image ImageUrl="~/img/globebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                            <br />
                            <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> is one of the few companies that provide a full-service in the Lebanese and International real estate market.</span>
                        </div>

                        <div class="col-lg-4" style="margin-bottom: 40px">
                            <asp:Image ImageUrl="~/img/agentbadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                            <br />
                            <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> offers its clients a high level of professional real estate brokerage, property management and consulting services. </span>
                        </div>
                    </div>
                    <div class="row" style="position: relative">

                        <div class="col-lg-8" style="margin-bottom: 40px">
                            <asp:Image ImageUrl="~/img/housebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                            <br />
                            <span style="display: block; margin-left: auto; margin-right: auto; width: 85%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span> is committed to building value through the high level services it provides to its clients and community. We are dedicated to obtaining the most favorable results for our clients while developing constructive, long-term and mutually rewarding relationships.</span>
                        </div>

                        <div class="col-lg-4" style="margin-bottom: 40px">
                            <asp:Image ImageUrl="~/img/notebadge.png" runat="server" Style="display: block; margin-left: auto; margin-right: auto" />
                            <br />
                            <span style="display: block; margin-left: auto; margin-right: auto; width: 63%; border-top: solid 1px darkgray; padding-top: 15px; color: black"><span style="color: #D12229">CrimsonCoward</span>  grants information and performance that is accurate, responsive, independent and confidential</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <!-- Heading and para -->
                    <div class="block-heading-two">
                        <h3><span>WHY CHOOSE US?</span></h3>
                    </div>
                    <p style="border-top: solid 1px darkgray; padding-top: 15px; padding-bottom: 15px">CrimsonCoward provides full-fledged services that tackle the dual aspect of the industry; our professionals are split into two highly dedicated teams, one that focuses on marketing and sales strategies for sellers, the other working tirelessly to meet the demands of our clients. Whether selling, renting or buying, CrimsonCoward is the answer to your real estate needs.</p>
                </div>

                <div class="col-md-6">
                    <!-- Heading and para -->
                    <div class="block-heading-two">
                        <h3><span>OUR TEAM</span></h3>
                    </div>
                    <p style="border-top: solid 1px darkgray; padding-top: 15px; padding-bottom: 15px">Our team forms a wide network of certified agents with insider knowledge and an established reputation in their communities. Each agent at CrimsonCoward provides personalized real estate solutions, connecting the right buyer with the right seller, the ideal renter with the ideal tenant, and customers with their dream homes.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>