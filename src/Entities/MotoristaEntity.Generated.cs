using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class MotoristaEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual int IdMotorista { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'DataNasc' é obrigatório.")]
        [DisplayName("DataNasc")]
        public virtual DateTime DataNasc { get; set; }
        
        [Required(ErrorMessage = "O campo 'EstadoCivil' é obrigatório.")]
        [DisplayName("EstadoCivil")]
        public virtual int EstadoCivil { get; set; }
        
        [Required(ErrorMessage = "O campo 'Cnh' é obrigatório.")]
        [StringLength(16, ErrorMessage = "O campo 'Cnh' suporta no máximo 48 caracteres.")]
        [DisplayName("Cnh")]
        public virtual string Cnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'CategoriaCnh' é obrigatório.")]
        [DisplayName("CategoriaCnh")]
        public virtual int CategoriaCnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'UfExpedicaoCnh' é obrigatório.")]
        [StringLength(2, ErrorMessage = "O campo 'UfExpedicaoCnh' suporta no máximo 6 caracteres.")]
        [DisplayName("UfExpedicaoCnh")]
        public virtual string UfExpedicaoCnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'ProntuarioCnh' é obrigatório.")]
        [StringLength(16, ErrorMessage = "O campo 'ProntuarioCnh' suporta no máximo 48 caracteres.")]
        [DisplayName("ProntuarioCnh")]
        public virtual string ProntuarioCnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'ValidadeExameChn' é obrigatório.")]
        [DisplayName("ValidadeExameChn")]
        public virtual DateTime ValidadeExameChn { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual BratEntity Brat { get; set; }

        public virtual PessoaEntity Pessoa { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdMotorista == default(int);
        }
    }
}