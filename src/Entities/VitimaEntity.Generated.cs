using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class VitimaEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt32 IdVitima { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'DataNasc' ? obrigat?rio.")]
        [DisplayName("DataNasc")]
        public virtual DateTime DataNasc { get; set; }

        [Required(ErrorMessage = "O campo 'TipoFerimento' ? obrigat?rio.")]
        [DisplayName("TipoFerimento")]
        public virtual System.UInt16 TipoFerimento { get; set; }

        [StringLength(150, ErrorMessage = "O campo 'Remocao' suporta no m?ximo 150 caracteres.")]
        [DisplayName("Remocao")]
        public virtual string Remocao { get; set; }

        #endregion

        #region " Relacionamentos "

        public virtual BratEntity Brat { get; set; }

        public virtual PessoaEntity Pessoa { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdVitima == default(System.UInt32);
        }
    }
}