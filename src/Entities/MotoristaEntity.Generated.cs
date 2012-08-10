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
        public virtual System.UInt32 IdMotorista { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'DataNasc' ? obrigat?rio.")]
        [DisplayName("DataNasc")]
        public virtual DateTime DataNasc { get; set; }
        
        [Required(ErrorMessage = "O campo 'EstadoCivil' ? obrigat?rio.")]
        [DisplayName("EstadoCivil")]
        public virtual System.UInt16 EstadoCivil { get; set; }
        
        [Required(ErrorMessage = "O campo 'Cnh' ? obrigat?rio.")]
        [StringLength(48, ErrorMessage = "O campo 'Cnh' suporta no m?ximo 48 caracteres.")]
        [DisplayName("Cnh")]
        public virtual string Cnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'CategoriaCnh' ? obrigat?rio.")]
        [DisplayName("CategoriaCnh")]
        public virtual System.UInt32 CategoriaCnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'UfExpedicaoCnh' ? obrigat?rio.")]
        [StringLength(6, ErrorMessage = "O campo 'UfExpedicaoCnh' suporta no m?ximo 6 caracteres.")]
        [DisplayName("UfExpedicaoCnh")]
        public virtual string UfExpedicaoCnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'ProntuarioCnh' ? obrigat?rio.")]
        [StringLength(48, ErrorMessage = "O campo 'ProntuarioCnh' suporta no m?ximo 48 caracteres.")]
        [DisplayName("ProntuarioCnh")]
        public virtual string ProntuarioCnh { get; set; }
        
        [Required(ErrorMessage = "O campo 'ValidadeExameChn' ? obrigat?rio.")]
        [DisplayName("ValidadeExameChn")]
        public virtual DateTime ValidadeExameChn { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual BratEntity Brat { get; set; }

        public virtual PessoaEntity Pessoa { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdMotorista == default(System.UInt32);
        }
    }
}