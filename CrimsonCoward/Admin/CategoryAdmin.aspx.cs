using CrimsonCoward.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace CrimsonCoward.Admin
{
    public partial class CategoryAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            CatGridView.DataSource = db.FoodCategories.ToList();
            CatGridView.DataBind();
        }

        protected void CatGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/CategoryAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                CrimsonCowardEntities db = new CrimsonCowardEntities();
                Guid _id = Guid.Parse(e.CommandArgument.ToString());

                List<FoodMenu> items = db.FoodMenus.Where(x => x.CategoryID == _id).ToList();
                db.FoodMenus.RemoveRange(items);
                FoodCategory foodcat = db.FoodCategories.Where(x => x.Id == _id).FirstOrDefault();
                db.FoodCategories.Remove(foodcat);
                db.SaveChanges();
                CatGridView.DataSource = db.FoodCategories.ToList();
                CatGridView.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CategoryAdminEdit.aspx");
        }
    }
}