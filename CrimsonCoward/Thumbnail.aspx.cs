using CrimsonCoward.DAL;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;

namespace CrimsonCoward
{
    public partial class Thumbnail : System.Web.UI.Page
    {
        public void ResizeImage(double scaleFactor, Stream fromStream, Stream toStream)
        {
            System.Drawing.Image image = System.Drawing.Image.FromStream(fromStream);
            int newWidth = (int)(image.Width * scaleFactor);
            int newHeight = (int)(image.Height * scaleFactor);
            Bitmap thumbnailBitmap = new Bitmap(newWidth, newHeight);

            Graphics thumbnailGraph = Graphics.FromImage(thumbnailBitmap);
            thumbnailGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbnailGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbnailGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;

            Rectangle imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbnailGraph.DrawImage(image, imageRectangle);

            thumbnailBitmap.Save(toStream, image.RawFormat);

            thumbnailGraph.Dispose();
            thumbnailBitmap.Dispose();
            image.Dispose();
        }

        public System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxWidth, int maxHeight)
        {
            double ratioX = (double)maxWidth / image.Width;
            double ratioY = (double)maxHeight / image.Height;
            double ratio = Math.Min(ratioX, ratioY);
            int newWidth = (int)(image.Width * ratio);
            int newHeight = (int)(image.Height * ratio);
            Bitmap newImage = new Bitmap(newWidth, newHeight);
            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            return newImage;
        }

        public byte[] ImageToByteArray(System.Drawing.Image m_imageIn)
        {
            MemoryStream oMemoryStream = new MemoryStream();
            // ImageFormat could be other formats like bmp,gif,icon,png etc.
            m_imageIn.Save(oMemoryStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            return oMemoryStream.ToArray();
        }

        public System.Drawing.Image ByteArrayToImage(byte[] m_byteArrayIn)
        {
            MemoryStream oMemoryStream = new MemoryStream(m_byteArrayIn);
            System.Drawing.Image oImage = System.Drawing.Image.FromStream(oMemoryStream);
            return oImage;
        }

        private void Page_Load(object sender, System.EventArgs e)
        {
            byte[] b = new byte[] { };
            CrimsonCowardEntities db = new CrimsonCowardEntities();
            if (Request.Params["id"] != null)
            {
                int _id = int.Parse(Request.Params["id"]);
                DAL.Image img = db.Images.Where(x => x.Id == _id).FirstOrDefault();

                if (img != null)
                {
                    if (img.File == null || img.File.Length == 0)
                    {
                        b = File.ReadAllBytes(MapPath("~/assets/logo.png"));
                    }
                    else
                    {
                        b = img.File;
                    }
                }
                else
                {
                    b = File.ReadAllBytes(MapPath("~/assets/logo.png"));
                }
            }
            else if (Request.Params["SliderId"] != null)
            {
                int _id = int.Parse(Request.Params["SliderId"]);
                DAL.Slider slider = db.Sliders.Where(x => x.Id == _id).FirstOrDefault();
                DAL.Image img = db.Images.Where(x => x.Id == slider.ImageId).FirstOrDefault();
                if (img != null)
                {
                    if (img.File == null || img.File.Length == 0)
                    {
                        b = File.ReadAllBytes(MapPath("~/assets/logo.png"));
                    }
                    else
                    {
                        b = img.File;
                    }
                }
                else
                {
                    b = File.ReadAllBytes(MapPath("~/assets/logo.png"));
                }
            }
            else if (Request.Params["imageId"] != null)
            {
                int _id = int.Parse(Request.Params["imageId"]);
                DAL.Article article = db.Articles.Where(x => x.imageId == _id).FirstOrDefault();
                DAL.Image img = db.Images.Where(x => x.Id == article.imageId).FirstOrDefault();
                if (img != null)
                {
                    if (img.File == null || img.File.Length == 0)
                    {
                        b = File.ReadAllBytes(MapPath("~/assets/logo.png"));
                    }
                    else
                    {
                        b = img.File;
                    }
                }
                else
                {
                    b = File.ReadAllBytes(MapPath("~/assets/logo.png"));
                }
            }
            else
            {
                b = File.ReadAllBytes(MapPath("~/assets/logo.png"));
            }

            //}
            MemoryStream imageStream = new MemoryStream();
            MemoryStream imageStream1 = new MemoryStream(b);

            // create an image object, using the filename we just retrieved
            System.Drawing.Image image = System.Drawing.Image.FromStream(imageStream1);

            // create the actual thumbnail image
            System.Drawing.Image thumbnailImage = null;
            if (Request.Params["secImg"] == "footer")
            {
                thumbnailImage = ScaleImage(image, 100, 60);
                //thumbnailImage = image.GetThumbnailImage(100, 60, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
            }
            else if (Request.Params["secImg"] == "search")
            {
                thumbnailImage = ScaleImage(image, 150, 113);
                //thumbnailImage = image.GetThumbnailImage(150, 113, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
            }
            else if (Request.Params["secImg"] == "Latest")
            {
                thumbnailImage = ScaleImage(image, 370, 250);
                //thumbnailImage = image.GetThumbnailImage(370, 250, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
            }
            else if (Request.Params["secImg"] == "logo")
            {
                thumbnailImage = ScaleImage(image, 95, 95);
                //thumbnailImage = image.GetThumbnailImage(95, 95, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
            }
            else
            {
                thumbnailImage = ScaleImage(image, 400, 300);
                //thumbnailImage = image.GetThumbnailImage(400, 300, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
            }
            if (thumbnailImage != null)
            {
                thumbnailImage.Save(imageStream, System.Drawing.Imaging.ImageFormat.Png);
            }

            byte[] imageContent = new byte[imageStream.Length];
            imageStream.Position = 0;
            imageStream.Read(imageContent, 0, (int)imageStream.Length);

            // return byte array to caller with image type
            Response.ContentType = "image/png";
            Response.BinaryWrite(imageContent);
        }

        /// <summary>
        /// Required, but not used
        /// </summary>
        /// <returns>true</returns>
        public bool ThumbnailCallback()
        {
            return true;
        }

        // ... non-applicable infrastructure code removed for clarity ...
    }
}