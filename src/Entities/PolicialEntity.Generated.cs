using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class PolicialEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual string Matricula { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        [Required(ErrorMessage = "O campo 'Nome' ? obrigat?rio.")]
        [StringLength(180, ErrorMessage = "O campo 'Nome' suporta no m?ximo 180 caracteres.")]
        [DisplayName("Nome")]
        public virtual string Nome { get; set; }
        
        [Required(ErrorMessage = "O campo 'Batalhao' ? obrigat?rio.")]
        [DisplayName("Batalhao")]
        public virtual System.UInt16 Batalhao { get; set; }
        
        [Required(ErrorMessage = "O campo 'Senha' ? obrigat?rio.")]
        [StringLength(24, ErrorMessage = "O campo 'Senha' suporta no m?ximo 24 caracteres.")]
        [DisplayName("Senha")]
        public virtual string Senha { get; set; }
        
        [Required(ErrorMessage = "O campo 'Status' ? obrigat?rio.")]
        [StringLength(3, ErrorMessage = "O campo 'Status' suporta no m?ximo 3 caracteres.")]
        [DisplayName("Status")]
        public virtual string Status { get; set; }
        
        #endregion

        #region " Relacionamentos "

        public virtual PerfilEntity IdPerfil { get; set; }

        #endregion

        public override bool IsNew()
        {
            return Matricula == default(string);
        }
    }
}