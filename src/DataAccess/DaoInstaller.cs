using Castle.MicroKernel;
using Castle.MicroKernel.Registration;
using Castle.Windsor;
using TopDown.TopFramework.DataAccess;
using Castle.MicroKernel.SubSystems.Configuration;

namespace Brato.DataAccess
{
    public class DaoInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(
                AllTypes.FromAssemblyContaining(this.GetType())
                    .BasedOn(typeof(IDao<,>))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces())
                    .BasedOn(typeof(IDao<>))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces())
                    .BasedOn(typeof(IDao))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces()));
        }
    }
}