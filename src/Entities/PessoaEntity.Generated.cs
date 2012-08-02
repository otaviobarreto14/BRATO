using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class PessoaEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt32 IdPessoa { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Nome' ? obrigat?rio.")]
        [StringLength(150, ErrorMessage = "O campo 'Nome' suporta no m?ximo 150 caracteres.")]
        [DisplayName("Nome")]
        public virtual string Nome { get; set; }
        
        [StringLength(33, ErrorMessage = "O campo 'Cpf' suporta no m?ximo 33 caracteres.")]
        [DisplayName("Cpf")]
        public virtual string Cpf { get; set; }
        
        [Required(ErrorMessage = "O campo 'Sexo' ? obrigat?rio.")]
        [StringLength(3, ErrorMessage = "O campo 'Sexo' suporta no m?ximo 3 caracteres.")]
        [DisplayName("Sexo")]
        public virtual string Sexo { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual EnderecoEntity IdEndereco { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdPessoa == default(System.UInt32);
        }
    }
}