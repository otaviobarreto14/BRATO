using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class UfEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual string Uf { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        #endregion

        public override bool IsNew()
        {
            return Uf == default(string);
        }
    }
}