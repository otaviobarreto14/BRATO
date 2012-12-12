using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Brato.BusinessRules
{
    public class DataRules
    {
        public DataRules()
        {

        }
        public virtual bool VerificarMaiorIdade(DateTime datanasc)
        {
            var dataAtual = DateTime.Now.Date;
            var dataMaiorIdade = datanasc.AddYears(18);
            if (dataMaiorIdade < dataAtual)
                return true;
            else
                return false;
        }
    }
}
