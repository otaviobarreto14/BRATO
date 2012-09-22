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

        [Required(ErrorMessage = "O campo 'NumBrat' é obrigatório.")]
        [DisplayName("NumBrat")]
        public virtual System.UInt32 NumBrat { get; set; }
        
        [Required(ErrorMessage = "O campo 'DataAcidente' é obrigatório.")]
        [DisplayName("DataAcidente")]
        public virtual DateTime DataAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'HoraAcidente' é obrigatório.")]
        [DisplayName("HoraAcidente")]
        public virtual string HoraAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'CondTempo' é obrigatório.")]
        [DisplayName("CondTempo")]
        public virtual System.UInt16 CondTempo { get; set; }
        
        [Required(ErrorMessage = "O campo 'TipoSinalizacao' é obrigatório.")]
        [DisplayName("TipoSinalizacao")]
        public virtual System.UInt16 TipoSinalizacao { get; set; }
        
        [Required(ErrorMessage = "O campo 'TipoAcidente' é obrigatório.")]
        [DisplayName("TipoAcidente")]
        public virtual System.UInt16 TipoAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'Circunstancia' é obrigatório.")]
        [DisplayName("Circunstancia")]
        public virtual System.UInt16 Circunstancia { get; set; }
        
        [Required(ErrorMessage = "O campo 'Descricao' é obrigatório.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }
        
        [DisplayName("FotoAcidente")]
        public virtual System.SByte? FotoAcidente { get; set; }
        
        [Required(ErrorMessage = "O campo 'Croqui' é obrigatório.")]
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