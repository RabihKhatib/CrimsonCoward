using CrimsonCoward.DAL;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace CrimsonCoward.Admin
{
    public partial class FoodMenuAdminEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                drpFoodCats.Items.Clear();
                drpFoodCats.DataSource = db.FoodCategories.ToList();
                drpFoodCats.DataTextField = "Name";
                drpFoodCats.DataValueField = "Id";
                drpFoodCats.DataBind();
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
                DAL.FoodMenu item = db.FoodMenus.Where(x => x.Id == _id).FirstOrDefault();
                if (item != null)
                {
                    lblID.Text = item.Id.ToString();
                    txtTitle.Text = item.Name;
                    txtDescription.Text = item.Description;
                    txtPrice.Text = item.Price.ToString();
                    drpFoodCats.SelectedValue = item.CategoryID.ToString();
                }
            }
        }

        private DAL.FoodMenu fillItems()
        {
            DAL.FoodMenu data = new DAL.FoodMenu();

            Guid _id = Guid.NewGuid();
            data.Id = _id;
            data.Name = txtTitle.Text;
            data.Description = txtDescription.Text;
            data.Price = string.IsNullOrEmpty(txtPrice.Text) ? "0" : txtPrice.Text;
            data.CategoryID = Guid.Parse(drpFoodCats.SelectedValue);

            return data;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            if (Request.Params["id"] != null)
            {
                Guid id = Guid.Parse(Request.Params["id"]);
                FoodMenu item = db.FoodMenus.Where(x => x.Id == id).FirstOrDefault();
                db.FoodMenus.Remove(item);
            }
            DAL.FoodMenu data = fillItems();
            db.FoodMenus.Add(data);
            db.SaveChanges();
            Response.Redirect("~/Admin/FoodMenuAdmin.aspx");
        }
    }
}