using System;
using System.Web.Routing;
using System.Web.Security;

namespace CrimsonCoward
{
    public class Global : System.Web.HttpApplication
    {
        private void Application_Start(object sender, EventArgs e)
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
            RouteTable.Routes.MapPageRoute("login", "login/", "~/login.aspx");
            RouteTable.Routes.MapPageRoute("defaultRoute", "{*value}", "~/login.aspx");
        }

        private void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        private void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        private void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }

        private void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends.
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer
            // or SQLServer, the event is not raised.
        }
    }
}