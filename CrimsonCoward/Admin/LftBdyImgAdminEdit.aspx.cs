﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrimsonCoward.DAL;
using System.IO;

namespace CrimsonCoward.Admin
{
    public partial class LftBdyImgAdminEdit : System.Web.UI.Page
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
            Article lftImg = db.Article.Where(x => x.position == "left").FirstOrDefault();
          

            if (lftImg != null)
            {
             
                var data = db.Images.Where(x => x.Id == lftImg.imageId).FirstOrDefault();
                if (data != null)
                {                    
                    if (data.File != null)
                    {
                        lftimgview.ImageUrl = ResolveUrl("~/") + "Thumbnail.aspx?imageId=" + lftImg.imageId;
                        lftimgview.Visible = true;
                    }
                }
            }
        }

        private DAL.Image FillSliders()
        {
            DAL.Image data = new DAL.Image();
            if (uplImage.HasFile)
            {
                try
                {
                    if (uplImage.FileName.Split('.')[1].ToLower() == "jpeg" || uplImage.FileName.Split('.')[1].ToLower() == "jpg" || uplImage.FileName.Split('.')[1].ToLower() == "png" || uplImage.FileName.Split('.')[1].ToLower() == "gif")
                    {
                            Session["image"] = Path.GetFileName(uplImage.FileName);
                            data.Name = uplImage.FileName.Split('.')[0].ToLower();
                            data.Ext = uplImage.FileName.Split('.')[1].ToLower();
                            data.Desc = "Left Body";
                            data.File = uplImage.FileBytes;                                                       
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
                var lftImg = db.Article.Where(x => x.position == "left").FirstOrDefault();
                var image = db.Images.Where(x => x.Id == lftImg.imageId).FirstOrDefault();
                db.Images.Remove(image);
                db.Article.Remove(lftImg);
            DAL.Image data = FillSliders();
            db.Images.Add(data);
            db.SaveChanges();
            db.Article.Add(new Article { Id = 2, imageId = data.Id, position = "left", title = "Left Image Body" });
            db.SaveChanges();
            Response.Redirect("~/Admin/LftBdyImgAdminEdit.aspx");
        }
    }
}