using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;

namespace CrimsonCoward
{
    public partial class Default : System.Web.UI.Page
    {

        public void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["LatestNb"] == null)
            ViewState["LatestNb"] = 3;

            List<DAL.Image> lstImages = new List<DAL.Image>();
            List<DAL.Reviews> lstReviews = new List<Reviews>();
            List<DAL.FoodCategory> lstFoodCategory = new List<FoodCategory>();
            List<DAL.Article> lstArticle = new List<Article>();
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            var sliders = db.Sliders.Where(x => x.Active).ToList();

            lstImages = (from s in db.Sliders join i in db.Images on s.ImageId equals i.Id select i).ToList();
            lstReviews = db.Reviews.ToList();


            lstFoodCategory = db.FoodCategories.OrderBy(x=>x.catOrder).ToList();

            lstArticle = db.Article.ToList();

            if(lstArticle.Count > 0)
            {
                ourStoryTxt.Text = lstArticle.Where(x => x.position.Contains("center")).FirstOrDefault().Body;
            }

            if (lstImages.Count > 0)
            {
                rptBanner.DataSource = lstImages;
                rptBanner.DataBind();
            }
            if (lstReviews.Count > 0)
            {
                rptReviews.DataSource = lstReviews;
                rptReviews.DataBind();
            }
            if (lstFoodCategory.Count > 0)
            {
                rptMenuCat.DataSource = lstFoodCategory;
                rptMenuCat.DataBind();
            }
        }
protected void rptMenuCat_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int count = ((List<string>)rptMenuCat.DataSource).Count;
                if (e.Item.ItemIndex != 0 && e.Item.ItemIndex % 2 == 0 && e.Item.ItemIndex == count - 1)
                {
                    PlaceHolder PlaceHolder1 = e.Item.FindControl("PlaceHolder1") as PlaceHolder;
                    System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();
                    img.ImageUrl = "pholder.jpg";
                    TableCell td = new TableCell();
                    td.Controls.Add(img);
                    PlaceHolder1.Controls.Add(td);
                }
            }
        }

        protected List<DAL.FoodMenu> GetFoodList(object dataItem)
        {
            DAL.FoodCategory c = dataItem as DAL.FoodCategory;
            ICollection<DAL.FoodMenu> foodmenu = c.FoodMenus;
            return foodmenu.OrderBy(x => x.MENU_ORDER).ToList();
        }
        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            if(string.IsNullOrEmpty(hdnRating.Value))
            {
                lblReview.Text = "Please select star rating";
                lblReview.ForeColor = System.Drawing.Color.Red;
            }
            if (string.IsNullOrEmpty(txtReviewTitle.Text))
            {
                lblReview.Text = "Please enter your name";
                lblReview.ForeColor = System.Drawing.Color.Red;
            }
            if (string.IsNullOrEmpty(txtReviewTitle.Text))
            {
                lblReview.Text = "Please enter your review";
                lblReview.ForeColor = System.Drawing.Color.Red;
            }

            if (!string.IsNullOrEmpty(txtReviewTitle.Text) && !string.IsNullOrEmpty(txtReview.Text) && !string.IsNullOrEmpty(hdnRating.Value))
            {
                DAL.Reviews review = new Reviews
                {
                    Id = Guid.NewGuid(),
                    IsActive = false,
                    Date = DateTime.Now,
                    Text = txtReview.Text,
                    Rating = int.Parse(hdnRating.Value.Length>0?hdnRating.Value:"0"),
                    Title = txtReviewTitle.Text
                };
                db.Reviews.Add(review);
                db.SaveChanges();
                lblReview.Text = "Thank you for your review";
                lblReview.ForeColor = System.Drawing.Color.Green;
                txtReview.Text = "";
                txtReviewTitle.Text = "";
            }
        }
        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSubscribe.Text))
            {
                if (IsValidEmail(txtSubscribe.Text))
                {
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    Subscriber subsc = new Subscriber();
                    if (db.Subscribers.Where(x => x.email.ToLower() == txtSubscribe.Text.ToLower()).Count() > 0)
                    {
                        lblSubscribe.Text = "Dear " + txtSubscribe.Text + ". Your Email already exists";
                        lblSubscribe.ForeColor = System.Drawing.Color.Yellow;
                        return;
                    }
                    db.Subscribers.Add(new Subscriber() { email = txtSubscribe.Text });
                    db.SaveChanges();
                    lblSubscribe.Text = "Dear " + txtSubscribe.Text + ". Kindly note that your Email has been successfully added!";
                    lblSubscribe.ForeColor = System.Drawing.Color.White;
                }
                else
                {
                    lblSubscribe.Text = "Please enter a valid email address!";
                    lblSubscribe.ForeColor = System.Drawing.Color.Yellow;
                }

            }

        }
    }
}