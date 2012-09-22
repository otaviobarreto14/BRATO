using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class MunicipioEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt16 IdMunicipio { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Descricao' é obrigatório.")]
        [StringLength(50, ErrorMessage = "O campo 'Descricao' suporta no máximo 150 caracteres.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual UfEntity Uf { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdMunicipio == default(System.UInt16);
        }
    }
}