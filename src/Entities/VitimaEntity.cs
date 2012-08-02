using System;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class VitimaEntity : AuditableEntity
    {
        public VitimaEntity()
            : base()
        { 
        }

        public virtual string DataNascFormatted
        {
            get
            {
                return DataNasc.ToString("dd/MM/yyyy");
            }
        }
    }
}