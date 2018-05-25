namespace csi3370parksofficial.BLL
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Linq;
    using System.Web;
    using System.Web.ModelBinding;
    using System.Web.UI.WebControls;
    using csi3370parksofficial.Models;
    using Microsoft.Ajax.Utilities;

    public class ParkFacilitiesBL
    {
        private ParksOfficialdbEntities db = new ParksOfficialdbEntities();

        public IQueryable<ParkFacility> GetParkFacilities([QueryString] int? parkId)
        {
            return db.ParkFacilities.Where(p => p.ParkID == parkId);
        }
    }
}