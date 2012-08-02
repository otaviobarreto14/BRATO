using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class RlPerfilFuncaoEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt16 IdPerfil { get; set; }
        [EntityId]
        public virtual System.UInt16 IdFuncao { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        #endregion

        #region " Relacionamentos "

        public virtual FuncaoEntity Funcao { get; set; }

        public virtual PerfilEntity Perfil { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdPerfil == default(System.UInt16);
        }
    }
}