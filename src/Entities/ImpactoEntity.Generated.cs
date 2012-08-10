using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class ImpactoEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt32 IdImpacto { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        #endregion

        #region " Relacionamentos "

        public virtual VeiculoEntity Veiculo { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdImpacto == default(System.UInt32);
        }
    }
}