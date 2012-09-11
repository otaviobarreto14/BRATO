using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class PerfilEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt16 IdPerfil { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Descricao' ? obrigat?rio.")]
        [StringLength(30, ErrorMessage = "O campo 'Descricao' suporta no m?ximo 60 caracteres.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        #endregion

        public override bool IsNew()
        {
            return IdPerfil == default(System.UInt16);
        }
    }
}