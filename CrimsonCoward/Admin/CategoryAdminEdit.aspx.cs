using CrimsonCoward.DAL;
using System;
using System.Linq;

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
            if (Guid.TryParse(p, out Guid _id))
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
                Guid id = Guid.Parse(Request.Params["id"]);
                FoodCategory Cat = db.FoodCategories.Where(x => x.Id == id).FirstOrDefault();
                db.FoodCategories.Remove(Cat);
            }
            FoodCategory data = FillCat();
            db.FoodCategories.Add(data);
            db.SaveChanges();
            Response.Redirect("~/Admin/CategoryAdmin.aspx");
        }
    }
}