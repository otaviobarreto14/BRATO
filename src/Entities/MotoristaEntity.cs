using System;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class MotoristaEntity : AuditableEntity
    {
        public MotoristaEntity()
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

        public virtual string ValidadeExameChnFormatted
        {
            get
            {
                return ValidadeExameChn.ToString("dd/MM/yyyy");
            }
        }
    }
}