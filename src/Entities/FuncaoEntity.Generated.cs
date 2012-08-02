using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class FuncaoEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt16 IdFuncao { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Descricao' ? obrigat?rio.")]
        [StringLength(90, ErrorMessage = "O campo 'Descricao' suporta no m?ximo 90 caracteres.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        #endregion

        public override bool IsNew()
        {
            return IdFuncao == default(System.UInt16);
        }
    }
}