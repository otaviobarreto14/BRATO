using System.Web.Mvc;
using System.Web.Routing;
using TopDown.TopFramework.WebUserInterfaceHelper;
using TopDown.TopFramework.WebUserInterfaceHelper.Mvc;
using System.Globalization;

namespace Brato.UserInterface
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : BaseHttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("favicon.ico");

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Brat", action = "Index", id = "" }  // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            log4net.Config.XmlConfigurator.Configure();

            AreaRegistration.RegisterAllAreas();
            RegisterRoutes(RouteTable.Routes);

            ControllerBuilder.Current.SetControllerFactory(new BaseControllerFactory());

            ModelBinders.Binders.DefaultBinder = new LocalizedModelBinder(CultureInfo.CurrentCulture.Name);
        }
    }
}