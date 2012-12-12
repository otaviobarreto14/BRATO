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
        public virtual int IdVeiculo { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'NomeProprietario' � obrigat�rio.")]
        [StringLength(50, ErrorMessage = "O campo 'NomeProprietario' suporta no m�ximo 150 caracteres.")]
        [DisplayName("NomeProprietario")]
        public virtual string NomeProprietario { get; set; }
        
        [Required(ErrorMessage = "O campo 'TipoVeiculo' � obrigat�rio.")]
        [DisplayName("TipoVeiculo")]
        public virtual int TipoVeiculo { get; set; }
        
        [Required(ErrorMessage = "O campo 'Placa' � obrigat�rio.")]
        [StringLength(7, ErrorMessage = "O campo 'Placa' suporta no m�ximo 21 caracteres.")]
        [DisplayName("Placa")]
        public virtual string Placa { get; set; }
        
        [Required(ErrorMessage = "O campo 'Fabricante' � obrigat�rio.")]
        [DisplayName("Fabricante")]
        public virtual int Fabricante { get; set; }
        
        [Required(ErrorMessage = "O campo 'Modelo' � obrigat�rio.")]
        [DisplayName("Modelo")]
        public virtual int Modelo { get; set; }
        
        [Required(ErrorMessage = "O campo 'Ano' � obrigat�rio.")]
        [DisplayName("Ano")]
        public virtual int Ano { get; set; }
        
        [Required(ErrorMessage = "O campo 'Cor' � obrigat�rio.")]
        [DisplayName("Cor")]
        public virtual short Cor { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual BratEntity Brat { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdVeiculo == default(int);
        }
    }
}