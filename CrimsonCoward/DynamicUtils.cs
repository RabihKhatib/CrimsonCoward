
using System.IO;
using System.Web.UI.WebControls;

namespace CrimsonCoward
{
    public class DynamicUtils
    {
        public string uploadimage(FileUpload uplImage)
        {

            string filepath = string.Empty;
            string savepath = string.Empty;
            string virtualfolder = string.Empty;
            filepath = System.Web.HttpContext.Current.Server.MapPath("./") + "images";
            if (uplImage.PostedFile.ContentLength == 0)
            {
                savepath = "~/images/blankimg.gif";
                return savepath;
            }
            else
            {
                string filename = string.Empty;
                filename = Path.GetFileName(uplImage.PostedFile.FileName);
                string extention = GetExtension(filename);
                if (extention == "jpg" || extention == "gif" || extention == "jpeg" || extention == "bmp" || extention == "png")
                {
                    savepath = "~/Admin/images/" + filename; //foldername
                    uplImage.PostedFile.SaveAs(filepath + "/" + filename);
                    return savepath;
                }

                else
                    return null;
            }

        }

        public string GetExtension(string FileName)

        {
            string[] split = FileName.Split('.');
            string Extension = split[split.Length - 1];
            return Extension;
        }
    }
}