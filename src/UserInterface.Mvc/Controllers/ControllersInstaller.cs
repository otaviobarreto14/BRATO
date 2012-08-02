using Castle.MicroKernel;
using Castle.MicroKernel.Registration;
using Castle.Windsor;
using Castle.MicroKernel.SubSystems.Configuration;
using TopDown.TopFramework.WebUserInterfaceHelper.Mvc;

namespace Brato.UserInterface.Controllers
{
    public class ControllersInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(
                AllTypes.FromAssemblyContaining(this.GetType())
                    .BasedOn(typeof(IController<,>))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces())
                    .BasedOn(typeof(IController))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces()));
        }
    }
}