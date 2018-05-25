namespace csi3370parksofficial
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Linq;
    using System.Web;
    using System.Web.DynamicData;
    using System.Web.ModelBinding;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using csi3370parksofficial.BLL;
    using csi3370parksofficial.Models;
    using Microsoft.Ajax.Utilities;

    public partial class Search : System.Web.UI.Page
    {
        private ParksOfficialdbEntities db = new ParksOfficialdbEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
        }

        protected void btnShowAdvancedPanel_Click(object sender, EventArgs e)
        {
            pnlAdvanced.Visible = !pnlAdvanced.Visible;
        }

        protected void btnClear_OnServerClick(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
        }

        protected void btnClearFilters_OnServerClick(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            ddlCounty.SelectedIndex = 0;
            ddlFilterByParkType.SelectedIndex = 0;
            ddlFacilities.SelectedIndex = 0;
        }

        protected void gvParks_OnCallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {
            e.DataMethodsObject = new ParkBL();
        }

        protected void ddlParkTypes_OnCallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {
            e.DataMethodsObject = new ParkTypesBl();
        }

        protected void rptFacilities_OnCallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {
            e.DataMethodsObject = new BLL.Facilities();
        }

    }
}