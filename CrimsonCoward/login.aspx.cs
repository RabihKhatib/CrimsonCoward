using System;

namespace CrimsonCoward
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect(ResolveUrl("~/") + "Admin/SliderAdmin.aspx");
            }
        }
    }
}