using System;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class BratEntity : AuditableEntity
    {
        public BratEntity()
            : base()
        { 
        }

        public virtual string DataAcidenteFormatted
        {
            get
            {
                return DataAcidente.ToString("dd/MM/yyyy");
            }
        }
    }
}