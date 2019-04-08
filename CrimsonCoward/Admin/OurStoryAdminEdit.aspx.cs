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
    public partial class OurStoryAdminEdit : System.Web.UI.Page
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
            Article article = db.Article.Where(x => x.position == "center").FirstOrDefault();
          

            if (article != null)
            {
                Body.Text = article.Body;
            }
        }

        protected void OSbtnSave_Click(object sender, EventArgs e)
        {
            
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            var story = db.Article.Where(x => x.position == "center").FirstOrDefault();
                db.Article.Remove(story);
            
            db.Article.Add(new Article { Id = 1, Body =  Body.Text, position = "center", description ="Our Story"});
            db.SaveChanges();
            Response.Redirect("~/Admin/OurStoryAdminEdit.aspx");
        }
    }
}