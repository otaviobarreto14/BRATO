using System;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class PolicialEntity : AuditableEntity
    {
        public PolicialEntity()
            : base()
        {
        }

        public virtual string BatalhaoFormatted
        {
            get
            {
                if (Batalhao != 0)
                    return EnumHelper.GetEnumDescription(Batalhao);
                else
                    return "";
            }
        }

        public virtual string StatusFormatted
        {
            get
            {
                if (Status == "A")
                    return "Ativo";
                else
                    return "Inativo";
            }
        }
    }
}