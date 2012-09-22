using System;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class PessoaEntity : AuditableEntity
    {
        public PessoaEntity()
            : base()
        {
        }

        public virtual UfEntity UF { get; set; }
        public virtual MunicipioEntity Municipio { get; set; }
        public virtual BairroEntity Bairro { get; set; }
        public virtual LogradouroEntity Logradouro { get; set; }
        public virtual string Complemento { get; set; }
        public virtual string Numero { get; set; }
    }
}