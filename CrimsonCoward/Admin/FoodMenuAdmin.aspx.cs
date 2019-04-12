using CrimsonCoward.DAL;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace CrimsonCoward.Admin
{
    public partial class FoodMenuAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            FoodGridView.DataSource = db.FoodMenus.OrderBy(x => new { x.CategoryID, x.MENU_ORDER }  ).ToList();
            FoodGridView.DataBind();
        }

        protected void FoodGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/FoodMenuAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                Guid _id = Guid.Parse(e.CommandArgument.ToString());
                FoodMenu item = db.FoodMenus.Where(x => x.Id == _id).FirstOrDefault();
                db.FoodMenus.Remove(item);
                db.SaveChanges();
                FoodGridView.DataSource = db.FoodMenus.ToList();
                FoodGridView.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/FoodMenuAdminEdit.aspx");
        }
    }
}