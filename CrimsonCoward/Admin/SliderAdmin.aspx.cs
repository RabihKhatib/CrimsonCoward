using CrimsonCoward.DAL;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace CrimsonCoward.Admin
{
    public partial class SliderAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            SlidersGridView.DataSource = db.Sliders.ToList();
            SlidersGridView.DataBind();
        }

        protected void SlidersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/SliderAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                int _id = int.Parse(e.CommandArgument.ToString());
                Slider slider = db.Sliders.Where(x => x.Id == _id).FirstOrDefault();
                DAL.Image image = db.Images.Where(x => x.Id == slider.ImageId).FirstOrDefault();
                db.Images.Remove(image);
                db.Sliders.Remove(slider);
                db.SaveChanges();
                SlidersGridView.DataSource = db.Sliders.ToList();
                SlidersGridView.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/SliderAdminEdit.aspx");
        }
    }
}