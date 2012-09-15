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

        [Required(ErrorMessage = "O campo 'Nome' é obrigatório.")]
        [StringLength(60, ErrorMessage = "O campo 'Nome' suporta no máximo 180 caracteres.")]
        [DisplayName("Nome")]
        public virtual string Nome { get; set; }

        [Required(ErrorMessage = "O campo 'Batalhao' é obrigatório.")]
        [DisplayName("Batalhão")]
        public virtual BatalhaoEnum Batalhao { get; set; }

        [Required(ErrorMessage = "O campo 'Senha' é obrigatório.")]
        [StringLength(8, ErrorMessage = "O campo 'Senha' suporta no máximo 24 caracteres.")]
        [DisplayName("Senha")]
        public virtual string Senha { get; set; }

        [Required(ErrorMessage = "O campo 'Status' é obrigatório.")]
        [StringLength(1, ErrorMessage = "O campo 'Status' suporta no máximo 3 caracteres.")]
        [DisplayName("Status")]
        public virtual string Status { get; set; }

        #endregion

        #region " Relacionamentos "

        [Required(ErrorMessage = "O campo 'Perfil' é obrigatório.")]
        [DisplayName("Perfil")]
        public virtual PerfilEntity IdPerfil { get; set; }

        #endregion

        public override bool IsNew()
        {
            return Matricula == default(string);
        }
    }
}