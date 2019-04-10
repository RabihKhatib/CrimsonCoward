using System;
using System.Web.UI.WebControls;

namespace CrimsonCoward.Admin
{
    public partial class PagesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void PagesGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/PagesAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                //CrimsonCowardEntities db = new CrimsonCowardEntities();
                //var page =
                //Data.Delete(int.Parse(e.CommandArgument.ToString()));
                //PagesGridView.DataBind();
            }
        }
    }
}