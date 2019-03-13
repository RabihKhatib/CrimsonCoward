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
    public partial class ReviewsAdminEdit : System.Web.UI.Page
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

        private void loadData(string pp)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            Guid _id = new Guid(pp);
            Reviews reviews = db.Reviews.Where(x => x.Id == _id).FirstOrDefault();
          

            if (reviews != null)
            {
             
                var data = db.Images.Where(x => x.Id == reviews.ImageID).FirstOrDefault();
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();
                    
                    if (data.File != null)
                    {
                        imgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?ReviewsId=" + _id + "&secImg=HomeTips";
                        imgview.Visible = true;
                    }
                }
            }
        }
    }
}