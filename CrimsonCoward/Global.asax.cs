using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;


namespace CrimsonCoward
{
    public class Global : System.Web.HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup

            MembershipUser mu = Membership.GetUser("Admin");
            if (mu == null)
            {
                mu = Membership.CreateUser("Admin", "P@ssw0rd", "hello@crimsoncoward.com");
            }
            if (!Roles.RoleExists("Admin"))
            {
                Roles.CreateRole("Admin");
            }
            bool userInRole = Roles.IsUserInRole(mu.UserName, "Admin");
            if (!userInRole)
            {
                Roles.AddUserToRole(mu.UserName, "Admin");
            }

            RouteTable.Routes.MapPageRoute("home", "", "~/Default.aspx");
            RouteTable.Routes.MapPageRoute("about", "AboutUs", "~/aboutUs.aspx");
            RouteTable.Routes.MapPageRoute("news", "News", "~/news.aspx");
            RouteTable.Routes.MapPageRoute("Blog", "Blog", "~/Blog.aspx");
            RouteTable.Routes.MapPageRoute("news details", "News/{title}/{ID}", "~/news-details.aspx");
            RouteTable.Routes.MapPageRoute("contact", "ContactUs", "~/contactUs.aspx");
            RouteTable.Routes.MapPageRoute("Intrested", "ContactUs/{Prl}", "~/contactUs.aspx");
            RouteTable.Routes.MapPageRoute("careers", "Careers", "~/careers.aspx");
            RouteTable.Routes.MapPageRoute("login", "login", "~/login.aspx");
            RouteTable.Routes.MapPageRoute("admin", "login", "~/login.aspx");

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }
    }
}