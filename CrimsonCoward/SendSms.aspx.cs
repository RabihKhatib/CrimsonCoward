using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Web.UI;

namespace CrimsonCoward
{
    public partial class SendSms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username, pass, from, to, text;
            if (Request.Params["to"] != null && Request.Params["text"] != null)
            {
                username = ConfigurationManager.AppSettings["SMSusername"];
                pass = ConfigurationManager.AppSettings["SMSpass"];
                from = ConfigurationManager.AppSettings["SMSfrom"];
                to = Request.Params["to"];
                text = Request.Params["text"];

                string url = "https://globesms.net/smshub/api.php";

                //string too = "96176677988,96176677988,96176677988,96176677988,96176677988,96176677988,96176677988,96176677988,96176677988," +
                //    "96176677988,96176677988,96176677988,96176677988,96176677988,96176677988,96176677988,96176677988,96176677988,96176677988," +
                //    "96176677988,96176677988,96176677988,96176677988,96176677988,96176677988";

                // creates the post data for the POST request
                string postData = ("username=" + username + "&password=" + pass + "&action=sendsms&from=" + from + "&to=" + to + "&dlr=0&text=" + text);

                // create the POST request
                HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);
                webRequest.Method = "POST";
                webRequest.ContentType = "application/x-www-form-urlencoded";
                webRequest.ContentLength = postData.Length;

                // POST the data
                using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
                {
                    requestWriter2.Write(postData);
                }

                try
                {
                    //  This actually does the request and gets the response back
                    HttpWebResponse resp = (HttpWebResponse)webRequest.GetResponse();

                    string responseData = string.Empty;

                    using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
                    {
                        // dumps the HTML from the response into a string variable
                        responseData = responseReader.ReadToEnd();
                    }

                    //  Now, find the index of some word on the page that would be
                    //     displayed if the login was successful
                    int index = responseData.IndexOf("OK");

                    ScriptManager.RegisterClientScriptBlock(this, GetType(), UniqueID, "alert('Sent')", true);
                    return;
                }
                catch (Exception)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), UniqueID, "alert('SendError')", true);
                    return;
                }
            }
            else
            {
                Response.Redirect("~/");
            }
        }
    }
}