using System.Collections.Generic;
using System.Linq;
using System.Web.Services;

namespace CrimsonCoward
{
    /// <summary>
    /// Summary description for AutoComplete
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
    // [System.Web.Script.Services.ScriptService]
    public class AutoComplete : System.Web.Services.WebService
    {
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string[] GetRegions(string prefixText, int count)
        {
            List<string> Locations = new List<string>();
            List<string> Countries = new List<string>();
            //foreach (string Country in RealEstateProperty.GetAllCountries())
            //{
            //    Locations.Add(Country);
            //    List<String> lstQadaaByCountry = RealEstateProperty.GetAllQadaasByCountry(Country);
            //    lstQadaaByCountry = lstQadaaByCountry.Select(r => Country+", "+r).ToList();
            //    Locations.AddRange(lstQadaaByCountry);

            //    List<string> Qadaas = new List<string>();
            //CrimsonCowardEntities db = new CrimsonCowardEntities();
            //var props = db.RealEstateProperties.Select(x=>x.Qadaa).ToList();
            //foreach (string Qadaa in props)
            //{
            //    Locations.Add(Qadaa);

            //    var Districts = db.RealEstateProperties.Where(x => x.Country == "Lebanon" && x.Qadaa == Qadaa).Select(x=>x.District).ToList();
            //    foreach (var district in Districts)
            //    {
            //        Locations.Add(Qadaa + ", " + district);
            //        var Neighborhoods = db.RealEstateProperties.Where(x => x.Country == "Lebanon" && x.Qadaa == Qadaa && x.District == district).Select(x=>x.Neighborhood).ToList();
            //        foreach (string neighborhood in Neighborhoods)
            //        {
            //            Locations.Add(Qadaa + ", " + district + ", " + neighborhood);
            //        }
            //    }
            //}

            return Locations.Where(r => r != "").Distinct().ToArray();
        }
    }
}