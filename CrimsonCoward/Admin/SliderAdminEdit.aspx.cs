using CrimsonCoward.DAL;
using System;
using System.IO;
using System.Linq;

namespace CrimsonCoward.Admin
{
    public partial class SliderAdminEdit : System.Web.UI.Page
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
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            int _id = int.Parse(p);
            Slider slider = db.Sliders.Where(x => x.Id == _id).FirstOrDefault();

            if (slider != null)
            {
                DAL.Image data = db.Images.Where(x => x.Id == slider.ImageId).FirstOrDefault();
                if (data != null)
                {
                    lblID.Text = data.Id.ToString();

                    if (!string.IsNullOrEmpty(data.FILE_LOCATION))
                    {
                        imgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?SliderId=" + _id + "&secImg=HomeTips";
                        imgview.Visible = true;
                    }
                }
            }
        }

        private DAL.Image fillSliders()
        {
            DAL.Image data = new DAL.Image();
            if (uplImage.HasFile)
            {
                try
                {
                    DynamicUtils dUtils = new DynamicUtils();
                    string target = dUtils.uploadimage(uplImage);
                    if (uplImage.FileName.Split('.')[1].ToLower() == "jpeg" || uplImage.FileName.Split('.')[1].ToLower() == "jpg" || uplImage.FileName.Split('.')[1].ToLower() == "png" || uplImage.FileName.Split('.')[1].ToLower() == "gif")
                    {
                        Session["image"] = Path.GetFileName(uplImage.FileName);
                        data.Name = uplImage.FileName.Split('.')[0].ToLower();
                        data.Ext = uplImage.FileName.Split('.')[1].ToLower();
                        data.Desc = "slider";
                        //data.File = uplImage.FileBytes;
                        data.FILE_LOCATION = target;
                    }
                    else
                    {
                        lblImage.Text = "Upload status: Only JPEG/JPG/PNG/GIF files are accepted!";
                        return data;
                    }
                }
                catch (Exception ex)
                {
                    lblImage.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            return data;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL.CrimsonCowardEntities db = new DAL.CrimsonCowardEntities();
            if (Request.Params["id"] != null)
            {
                int id = int.Parse(Request.Params["id"]);
                Slider slider = db.Sliders.Where(x => x.Id == id).FirstOrDefault();
                DAL.Image image = db.Images.Where(x => x.Id == slider.ImageId).FirstOrDefault();
                db.Images.Remove(image);
                db.Sliders.Remove(slider);
            }
            DAL.Image data = fillSliders();
            db.Images.Add(data);
            db.SaveChanges();
            db.Sliders.Add(new Slider { ImageId = data.Id, Active = chkActive.Checked });
            db.SaveChanges();
            Response.Redirect("~/Admin/SliderAdmin.aspx");
        }
    }
}