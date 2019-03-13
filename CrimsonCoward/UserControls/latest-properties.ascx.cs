using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrimsonCoward.UserControls
{
    public partial class latest_properties : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        protected void rptLatestProps_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Label lblNeighborhood = (Label)e.Item.FindControl("lblNeighborhood");
            HiddenField hdnDistrict = (HiddenField)e.Item.FindControl("hdnDistrict");

            if (hdnDistrict.Value.ToLower() == "achrafieh")
            {
                lblNeighborhood.Text = "Achrafieh";
            }
        }
    }
}