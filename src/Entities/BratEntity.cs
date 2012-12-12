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

        public virtual UfEntity UF { get; set; }
        public virtual MunicipioEntity Municipio { get; set; }
        public virtual BairroEntity Bairro { get; set; }
        public virtual LogradouroEntity Logradouro { get; set; }
    }
}