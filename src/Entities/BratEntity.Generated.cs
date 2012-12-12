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
        public virtual int IdBrat { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'NumBrat' � obrigat�rio.")]
        [DisplayName("NumBrat")]
        public virtual int NumBrat { get; set; }

        [Required(ErrorMessage = "O campo 'DataAcidente' � obrigat�rio.")]
        [DisplayName("DataAcidente")]
        public virtual DateTime DataAcidente { get; set; }

        [Required(ErrorMessage = "O campo 'HoraAcidente' � obrigat�rio.")]
        [DisplayName("HoraAcidente")]
        public virtual string HoraAcidente { get; set; }

        [Required(ErrorMessage = "O campo 'CondTempo' � obrigat�rio.")]
        [DisplayName("CondTempo")]
        public virtual int CondTempo { get; set; }

        [Required(ErrorMessage = "O campo 'TipoSinalizacao' � obrigat�rio.")]
        [DisplayName("TipoSinalizacao")]
        public virtual int TipoSinalizacao { get; set; }

        [Required(ErrorMessage = "O campo 'TipoAcidente' � obrigat�rio.")]
        [DisplayName("TipoAcidente")]
        public virtual int TipoAcidente { get; set; }

        [Required(ErrorMessage = "O campo 'Circunstancia' � obrigat�rio.")]
        [DisplayName("Circunstancia")]
        public virtual int Circunstancia { get; set; }

        [Required(ErrorMessage = "O campo 'Descricao' � obrigat�rio.")]
        [DisplayName("Descricao")]
        public virtual string Descricao { get; set; }

        [DisplayName("FotoAcidente")]
        public virtual Byte? FotoAcidente { get; set; }

        [Required(ErrorMessage = "O campo 'Croqui' � obrigat�rio.")]
        [DisplayName("Croqui")]
        public virtual Byte[] Croqui { get; set; }

        public virtual string Temp { get; set; }

        #endregion

        #region " Relacionamentos "

        public virtual EnderecoEntity IdEndereco { get; set; }

        public virtual PolicialEntity Matricula { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdBrat == default(int);
        }
    }
}