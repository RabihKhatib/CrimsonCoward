using CrimsonCoward.DAL;
using System;
using System.Linq;

namespace CrimsonCoward.Admin
{
    public partial class OpHoursAdminEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }

        private void loadData()
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            Article article = db.Articles.Where(x => x.position == "operation").FirstOrDefault();

            if (article != null)
            {
                Body.Text = article.Body;
            }
        }

        protected void OSbtnSave_Click(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            Article story = db.Articles.Where(x => x.position == "operation").FirstOrDefault();
            db.Articles.Remove(story);

            db.Articles.Add(new Article { Id = 4, Body = Body.Text, position = "operation", description = "Operation hours" });
            db.SaveChanges();
            Response.Redirect("~/Admin/OpHoursAdminEdit.aspx");
        }
    }
}