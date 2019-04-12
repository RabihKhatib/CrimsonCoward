using CrimsonCoward.DAL;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace CrimsonCoward.Admin
{
    public partial class ReviewsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                ReviewsGridView.DataSource = db.Reviews.ToList();
                ReviewsGridView.DataBind();
            }
        }

        protected void ReviewsGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Response.Redirect("~/Admin/ReviewsAdminEdit.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName == "del")
            {
                DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
                Guid _id = new Guid(e.CommandArgument.ToString());
                Reviews review = db.Reviews.Where(x => x.Id == _id).FirstOrDefault();
                db.Reviews.Remove(review);
                db.SaveChanges();
                ReviewsGridView.DataSource = db.Reviews.ToList();
                ReviewsGridView.DataBind();
            }
        }

        protected void isActive_CheckedChanged(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            CheckBox check = (CheckBox)sender;
            string checkId = check.Attributes["reviewid"];

            if (checkId != null)
            {
                Guid id = new Guid(checkId);
                Reviews reviews = db.Reviews.Where(x => x.Id == id).FirstOrDefault();
                db.Reviews.Remove(reviews);
                db.SaveChanges();
                if (reviews.IsActive == true)
                {
                    reviews.IsActive = false;
                }
                else
                {
                    reviews.IsActive = true;
                }
                db.Reviews.Add(reviews);
                db.SaveChanges();
            }
        }
    }
}