using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI.WebControls;
using csi3370parksofficial.Models;

namespace csi3370parksofficial.BLL
{
    public class Events
    {
        private ParksOfficialdbEntities db = new ParksOfficialdbEntities();

        public IQueryable<Event> GetEvents([QueryString] int? parkId)
        {
            var query = db.Events.Where(e => e.ParkID == parkId);
            return query;
        }

        public void InsertEvent([QueryString] int parkId, ModelMethodContext context)
        {
            var item = new Event();
            item.ParkID = parkId;
            context.TryUpdateModel(item);
            if (context.ModelState.IsValid)
            {
                using (db)
                {
                    db.Events.Add(item);
                    db.SaveChanges();
                }
            }
        }

        public void DeleteEvent(int eventId, ModelMethodContext ctx)
        {
            using (db)
            {
                var item = new Event { EventID= eventId };
                db.Entry(item).State = EntityState.Deleted;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    ctx.ModelState.AddModelError("",
                        String.Format("Item with id {0} no longer exists in the database.", ctx));
                }
            }
        }

    }
}