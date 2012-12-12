using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class EnderecoEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual int IdEndereco { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [StringLength(7, ErrorMessage = "O campo 'Numero' suporta no máximo 21 caracteres.")]
        [DisplayName("Numero")]
        public virtual string Numero { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual ComplementoEntity IdComplemento { get; set; }

        public virtual LogradouroEntity IdLogradouro { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdEndereco == default(int);
        }
    }
}