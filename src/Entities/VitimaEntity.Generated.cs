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
        public virtual int IdVitima { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'DataNasc' é obrigatório.")]
        [DisplayName("DataNasc")]
        public virtual DateTime DataNasc { get; set; }

        [Required(ErrorMessage = "O campo 'TipoFerimento' é obrigatório.")]
        [DisplayName("TipoFerimento")]
        public virtual int TipoFerimento { get; set; }

        [StringLength(50, ErrorMessage = "O campo 'Remocao' suporta no máximo 150 caracteres.")]
        [DisplayName("Remocao")]
        public virtual string Remocao { get; set; }

        #endregion

        #region " Relacionamentos "

        public virtual BratEntity Brat { get; set; }

        public virtual PessoaEntity Pessoa { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdVitima == default(int);
        }
    }
}