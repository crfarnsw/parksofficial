using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using csi3370parksofficial.Models;

namespace csi3370parksofficial.BLL
{
    public class Facilities
    {
        ParksOfficialdbEntities db = new ParksOfficialdbEntities();

        public IQueryable<Facility> GetFacilities()
        {
            return db.Facilities.OrderBy(p => p.FacilityName);
        }
    }
}