using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Text;

namespace CrimsonCoward
{
    public class EmailHelper
    {
        public static void SendEmail(string to, string Subject, string body)
        {
            SendEmail(to, Subject, body, null, null);
        }

        public static void SendEmail(string to, string Subject, string body, string AttachementfileName, Stream Attachement)
        {
            try
            {
                if (ConfigurationManager.AppSettings["IsEmailTestMode"].ToBool())
                {
                    File.WriteAllText(ConfigurationManager.AppSettings["EmailTestLocation"] + Guid.NewGuid().ToString() + ".html", body);
                }
                else
                {
                    System.Net.Mail.SmtpClient smtpServer = new System.Net.Mail.SmtpClient
                    {
                        Host = ConfigurationManager.AppSettings["EmailSMTP"]
                    };
                    System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["EmailFrom"], to, Subject, body)
                    {
                        BodyEncoding = Encoding.UTF8
                    };
                    if (Attachement != null)
                    {
                        msg.Attachments.Add(new System.Net.Mail.Attachment(Attachement, AttachementfileName));
                    }

                    msg.IsBodyHtml = true;
                    msg.SubjectEncoding = Encoding.UTF8;
                    smtpServer.Send(msg);
                }
            }
            catch (Exception ex)
            {
                if (ConfigurationManager.AppSettings["RethrowEmailExceptions"].ToBool())
                {
                    throw ex;
                }
            }
        }

        public static void SendEmailListBased(string to, string Subject, string body, List<string> AttachementfileNames, List<Stream> Attachements)
        {
            try
            {
                if (ConfigurationManager.AppSettings["IsEmailTestMode"].ToBool())
                {
                    File.WriteAllText(ConfigurationManager.AppSettings["EmailTestLocation"] + Guid.NewGuid().ToString() + ".html", body);
                }
                else
                {
                    System.Net.Mail.SmtpClient smtpServer = new System.Net.Mail.SmtpClient
                    {
                        Host = ConfigurationManager.AppSettings["EmailSMTP"]
                    };
                    System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["EmailFrom"], to, Subject, body)
                    {
                        BodyEncoding = Encoding.UTF8
                    };
                    int i = 0;
                    foreach (Stream Attachement in Attachements)
                    {
                        if (Attachement != null)
                        {
                            msg.Attachments.Add(new System.Net.Mail.Attachment(Attachement, AttachementfileNames[i++]));
                        }
                    }
                    msg.IsBodyHtml = true;
                    msg.SubjectEncoding = Encoding.UTF8;
                    smtpServer.Send(msg);
                }
            }
            catch (Exception ex)
            {
                if (ConfigurationManager.AppSettings["RethrowEmailExceptions"].ToBool())
                {
                    throw ex;
                }
            }
        }
    }
}