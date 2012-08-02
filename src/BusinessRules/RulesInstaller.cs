using Castle.MicroKernel;
using Castle.MicroKernel.Registration;
using Castle.Windsor;
using TopDown.TopFramework.BusinessRules;
using Castle.MicroKernel.SubSystems.Configuration;

namespace Brato.BusinessRules
{
    public class RulesInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Register(
                AllTypes.FromAssemblyContaining(this.GetType())
                    .BasedOn(typeof(IRules<,>))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces())
                    .BasedOn(typeof(IRules<>))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces())
                    .BasedOn(typeof(IRules))
                        .Configure(c => c.LifeStyle.Transient)
                        .WithService.Select((t, baseType) => t.GetInterfaces()));
        }
    }
}