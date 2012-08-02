using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class BairroEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt16 IdBairro { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Descricao' ? obrigat?rio.")]
        [StringLength(150, ErrorMessage = "O campo 'Descricao' suporta no m?ximo 150 caracteres.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual MunicipioEntity IdMunicipio { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdBairro == default(System.UInt16);
        }
    }
}