using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class VeiculoEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt32 IdVeiculo { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'NomeProprietario' é obrigatório.")]
        [StringLength(50, ErrorMessage = "O campo 'NomeProprietario' suporta no máximo 150 caracteres.")]
        [DisplayName("NomeProprietario")]
        public virtual string NomeProprietario { get; set; }
        
        [Required(ErrorMessage = "O campo 'TipoVeiculo' é obrigatório.")]
        [DisplayName("TipoVeiculo")]
        public virtual System.UInt16 TipoVeiculo { get; set; }
        
        [Required(ErrorMessage = "O campo 'Placa' é obrigatório.")]
        [StringLength(7, ErrorMessage = "O campo 'Placa' suporta no máximo 21 caracteres.")]
        [DisplayName("Placa")]
        public virtual string Placa { get; set; }
        
        [Required(ErrorMessage = "O campo 'Fabricante' é obrigatório.")]
        [DisplayName("Fabricante")]
        public virtual System.UInt16 Fabricante { get; set; }
        
        [Required(ErrorMessage = "O campo 'Modelo' é obrigatório.")]
        [DisplayName("Modelo")]
        public virtual System.UInt16 Modelo { get; set; }
        
        [Required(ErrorMessage = "O campo 'Ano' é obrigatório.")]
        [DisplayName("Ano")]
        public virtual int Ano { get; set; }
        
        [Required(ErrorMessage = "O campo 'Cor' é obrigatório.")]
        [DisplayName("Cor")]
        public virtual short Cor { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual BratEntity Brat { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdVeiculo == default(System.UInt32);
        }
    }
}