using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using csi3370parksofficial.Models;

namespace csi3370parksofficial
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            MetaModel DefaultModel = new MetaModel();
            DefaultModel.RegisterContext(new Microsoft.AspNet.DynamicData.ModelProviders.EFDataModelProvider(
                    () => new ParksOfficialdbEntities()),
                new ContextConfiguration { ScaffoldAllTables = false });
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}