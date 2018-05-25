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

    public class ParkBL
    {
        private ParksOfficialdbEntities db = new ParksOfficialdbEntities();

        public string GetParkNameById(int parkId)
        {
            var item = db.Parks.Find(parkId);
            return item.ParkName;
        }

        public string GetParkAddressById(int parkId)
        {
            var park = db.Parks.Find(parkId);
            return park.ParkAddress;
        }

        public string GetParkWebsite(int parkId)
        {
            var park = db.Parks.Find(parkId);
            return park.ParkWebsite;
        }
        
        public IQueryable<Park> GetParks([Control] string ddlFilterByParkType, [Control] string txtSearch, [Control] string ddlCounty, [Control] string ddlFacilities)
        {
            var query = db.Parks.Include(p => p.ParkType)
                                .Include(p => p.Events)
                                .Include(p => p.ParkFacilities)
                                .ToList();

            // Park type filter
            if (int.TryParse(ddlFilterByParkType, out int parkTypeId))
            {
                if (parkTypeId != 0)
                {
                    query = query.Where(p => p.ParkTypeID == parkTypeId).ToList();
                }
            }

            // Park County filter
            if (!ddlCounty.Equals("None"))
            {
                query = query.Where(p => p.ParkCounty == ddlCounty).ToList();
            }

            // Park Facilities filter
            if (!ddlFacilities.Equals("0"))
            {
                query = query.Where(
                    p => p.ParkFacilities.Any(n => n.FacilityID == int.Parse(ddlFacilities))).ToList();
            }

            // Text box filtering
            if (!txtSearch.IsNullOrWhiteSpace())
            {
                if (int.TryParse(txtSearch, out int zipcodeResult))
                {
                    query = query.Where(p => p.ParkZipCode == zipcodeResult).ToList();
                }
                else
                {
                    query = query.Where(p => p.ParkName.ToLower().Contains(txtSearch.ToLower())).ToList();
                    if (!query.Any())
                    {
                        query = db.Parks.Where(p => p.ParkCity.ToLower().Contains(txtSearch.ToLower())).ToList();
                    }
                }
            }

            return query.OrderBy(p => p.ParkCounty).AsQueryable();
        }
    }
}