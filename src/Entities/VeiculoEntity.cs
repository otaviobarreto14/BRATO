using System;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class VeiculoEntity : AuditableEntity
    {
        public VeiculoEntity()
            : base()
        { 
        }
        public virtual bool TemAvarias { get; set; }
        public virtual bool TemImpacto { get; set; }
    }
}