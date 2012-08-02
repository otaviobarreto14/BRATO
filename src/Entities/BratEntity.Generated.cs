using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class BratEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt32 IdBrat { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'NumBrat' ? obrigat?rio.")]
        [DisplayName("NumBrat")]
        public virtual System.UInt32 NumBrat { get; set; }
        
        [Required(ErrorMessage = "O campo 'DataAcidente' ? obrigat?rio.")]
        [DisplayName("DataAcidente")]
        public virtual DateTime DataAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'HoraAcidente' ? obrigat?rio.")]
        [DisplayName("HoraAcidente")]
        public virtual System.TimeSpan HoraAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'CondTempo' ? obrigat?rio.")]
        [DisplayName("CondTempo")]
        public virtual System.UInt16 CondTempo { get; set; }
        
        [Required(ErrorMessage = "O campo 'TipoSinalizacao' ? obrigat?rio.")]
        [DisplayName("TipoSinalizacao")]
        public virtual System.UInt16 TipoSinalizacao { get; set; }
        
        [Required(ErrorMessage = "O campo 'TipoAcidente' ? obrigat?rio.")]
        [DisplayName("TipoAcidente")]
        public virtual System.UInt16 TipoAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'Circunstancia' ? obrigat?rio.")]
        [DisplayName("Circunstancia")]
        public virtual System.UInt16 Circunstancia { get; set; }
        
        [Required(ErrorMessage = "O campo 'Descricao' ? obrigat?rio.")]
        [StringLength(65535, ErrorMessage = "O campo 'Descricao' suporta no m?ximo 65535 caracteres.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        [DisplayName("FotoAcidente")]
        public virtual System.SByte? FotoAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'Croqui' ? obrigat?rio.")]
        [DisplayName("Croqui")]
        public virtual System.Byte[] Croqui { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual EnderecoEntity IdEndereco { get; set; }

        public virtual PolicialEntity Matricula { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdBrat == default(System.UInt32);
        }
    }
}