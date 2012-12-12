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
        public virtual int IdFuncao { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Descricao' é obrigatório.")]
        [StringLength(30, ErrorMessage = "O campo 'Descricao' suporta no máximo 90 caracteres.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        #endregion

        public override bool IsNew()
        {
            return IdFuncao == default(int);
        }
    }
}