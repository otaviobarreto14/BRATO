using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class TestemunhaEntity
    {
        #region " Identificador da classe "

        [EntityId]
        public virtual System.UInt32 IdTestemunha { get; set; }
        [EntityId]
        public virtual System.UInt32 IdBrat { get; set; }

        #endregion

        #region " Propriedades publicas da classe "

        #endregion

        #region " Relacionamentos "

        public virtual BratEntity Brat { get; set; }

        public virtual PessoaEntity Pessoa { get; set; }

        #endregion

        public override bool IsNew()
        {
            return IdTestemunha == default(System.UInt32);
        }
    }
}