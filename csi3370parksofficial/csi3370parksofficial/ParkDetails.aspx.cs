namespace csi3370parksofficial
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using csi3370parksofficial.BLL;
    using csi3370parksofficial.Models;
    using Microsoft.Ajax.Utilities;

    public partial class ParkDetails : System.Web.UI.Page
    {
        private ParksOfficialdbEntities db = new ParksOfficialdbEntities();
        private ParkBL park = new ParkBL();
        private int parkId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["ParkID"] == null)
            {
                Response.Redirect("Search.aspx");
            }
            else
            {
                parkId = int.Parse(Request["ParkID"]);
                var parkName = park.GetParkNameById(parkId);
                var parkAddress = park.GetParkAddressById(parkId);
                lblParkName.Text = $"{parkName} {parkAddress}";
                address.Value = $"{parkName} {parkAddress}";
            }
        }

        protected void btnBack_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }

        protected void lblParkWebsite_OnClick(object sender, EventArgs e)
        {
            if (!Request["ParkID"].IsNullOrWhiteSpace())
            {
                string parkId = Request["ParkID"];
                Response.Redirect(park.GetParkWebsite(int.Parse(parkId)));
            }
        }

        protected void gvEvents_OnCallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {
            e.DataMethodsObject = new Events();
        }

        protected void lvParksFacilities_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {
            e.DataMethodsObject = new ParkFacilitiesBL();
        }
        
    }
}