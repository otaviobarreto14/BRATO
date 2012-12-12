using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class ComplementoEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual int IdComplemento { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Descricao' é obrigatório.")]
        [StringLength(50, ErrorMessage = "O campo 'Descricao' suporta no máximo 150 caracteres.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        #endregion

        public override bool IsNew()
        {
            return IdComplemento == default(int);
        }
    }
}