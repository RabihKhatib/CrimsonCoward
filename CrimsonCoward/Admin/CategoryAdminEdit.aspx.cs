using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;
using System.IO;

namespace CrimsonCoward.Admin
{
    public partial class CategoryAdminEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Params["id"] != null)
                {
                    loadData(Request.Params["id"]);
                }
            }
        }

        private void loadData(string p)
        {
            Guid _id;
            if (Guid.TryParse(p, out _id))
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                FoodCategory data = db.FoodCategories.Where(x => x.Id == _id).FirstOrDefault();
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();
                    txtName.Text = data.Name;
                    txtTitle.Text = data.Description;
                    
                }
            }
        }

        private FoodCategory FillCat()
        {
            FoodCategory data = new FoodCategory();

            Guid _id = Guid.NewGuid();
            data.Id = _id;
            data.Name = txtName.Text;
            data.Description = txtTitle.Text;
            return data;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            if (Request.Params["id"] != null)
            {
                var id = Guid.Parse(Request.Params["id"]);
                var Cat = db.FoodCategories.Where(x => x.Id == id).FirstOrDefault();
                db.FoodCategories.Remove(Cat);
            }
            FoodCategory data = FillCat();
            db.FoodCategories.Add(data);
            db.SaveChanges();
            Response.Redirect("~/Admin/CategoryAdmin.aspx");
        }
    }
}