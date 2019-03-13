using CrimsonCoward.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrimsonCoward
{
    public partial class ContactUs : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.RouteData.Values.Count == 1)
            {
                if (Page.RouteData.Values["Prl"].ToString() != null && Page.RouteData.Values["Prl"].ToString().ToLower() != "Prl")
                {
                    PageTitle.Text = "Intrested in this property";
                    ContactText.Visible = false;
                    Prl.Text ="Ref#: "+ Page.RouteData.Values["Prl"].ToString();
                    map.Visible = false;
                    PropertyDetails.Visible = true;
                    CrimsonCowardEntities db = new CrimsonCowardEntities();
                    string _prl = Page.RouteData.Values["Prl"].ToString();
                }
                else
                {
                    PageTitle.Text = "Contact US";
                    ContactText.Visible = true;
                    Prl.Text = "Contact Form";
                    PropertyDetails.Visible = false;
                    map.Visible = true;
                }
            }
        }
        public static bool IsPhoneNumber(string number)
        {
            if (number.StartsWith("03") ||
                number.StartsWith("70") ||
                number.StartsWith("71") || 
                number.StartsWith("76") || 
                number.StartsWith("78") ||
                number.StartsWith("80") ||
                number.StartsWith("81"))
            {
                return Regex.Match(number, @"^([0-9]{8})$").Success;
            }
            else
            {
                return false;
            }
             
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
          
            if (Page.RouteData.Values["Prl"] != null && Page.RouteData.Values["Prl"].ToString().ToLower() != "Prl")
            {

                if (IsPhoneNumber(txtPhone.Text))
                {
                    string username, pass, from, to, text;
                    username = ConfigurationManager.AppSettings["SMSusername"];
                    pass = ConfigurationManager.AppSettings["SMSpass"];
                    from = ConfigurationManager.AppSettings["SMSfrom"];
                    to = txtPhone.Text;
                    text = "Thank you for submitting your request, we will contact you soon. For info: +961 1 99 33 99 - info@pbm-leb.com";

                    string url = "https://globesms.net/smshub/api.php";

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

                         
                    }
                    catch (Exception)
                    {

                        //ScriptManager.RegisterClientScriptBlock(this, GetType(), this.UniqueID, "alert('SendError')", true);
                        //return;
                    }
                }
             
                string body = GetEmail(Page.RouteData.Values["Prl"].ToString());
                EmailHelper.SendEmail(ConfigurationManager.AppSettings["EmailTo"],
                    "Contact Intrested In this Property " + Page.RouteData.Values["Prl"].ToString(), body);
            }
            else
            {
                string body = GetEmail(false);
                EmailHelper.SendEmail(ConfigurationManager.AppSettings["EmailTo"],
                              "New Contact Message", body);
            }
            Response.Write("<script type='text/javascript'>");
            Response.Write("alert('Dear " + txtName.Text + ". Kindly note that your Message has been Successfully received!');");
            //Response.Write("document.location.href='ContactUs.aspx';");
            Response.Write("</script>");
            EmailHelper.SendEmail(txtEmail.Text, "[Auto-Reply] Thank You For Your Email", "Dear Mr./ Ms. " + txtName.Text + "<br/>Thank you for submitting your request, we will be soon in contact with you <br/><br/> Best, ");
        }

        private string GetEmail(bool cust)
        {
            string emailBody = "";

            emailBody = File.ReadAllText(string.Format("{0}email\\message.htm", AppDomain.CurrentDomain.BaseDirectory));

            emailBody = emailBody.Replace("[FULL NAME]", txtName.Text);
            emailBody = emailBody.Replace("[PHONE]", txtPhone.Text);
            emailBody = emailBody.Replace("[EMAIL]", txtEmail.Text);
            emailBody = emailBody.Replace("[MESSAGE]", txtMessage.Text);
            emailBody = emailBody.Replace("[DATE]", DateTime.Now.ToShortDateString());
            return emailBody;
        }
        private string GetEmail(string Prl)
        {
            string emailBody = "";

            emailBody = File.ReadAllText(string.Format("{0}email\\messagePrl.htm", AppDomain.CurrentDomain.BaseDirectory));

            emailBody = emailBody.Replace("[PRL]", Prl);
            emailBody = emailBody.Replace("[FULL NAME]", txtName.Text);
            emailBody = emailBody.Replace("[PHONE]", txtPhone.Text);
            emailBody = emailBody.Replace("[EMAIL]", txtEmail.Text);
            emailBody = emailBody.Replace("[MESSAGE]", txtMessage.Text);
            emailBody = emailBody.Replace("[DATE]", DateTime.Now.ToShortDateString());
            return emailBody;
        }
    }
}