namespace csi3370parksofficial.BLL
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.ModelBinding;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using csi3370parksofficial.Models;

    public class ParkTypesBl
    {
        private ParksOfficialdbEntities db = new ParksOfficialdbEntities();

        public IQueryable<ParkType> GetParkTypes()
        {
            return db.ParkTypes;
        }
    }
}