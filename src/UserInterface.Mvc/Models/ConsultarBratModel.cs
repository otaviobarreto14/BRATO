using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Brato.UserInterface.Models
{
    public class ConsultarBratModel
    {
        public bool BuscarPorCpf { get; set; }
        public string Cpf { get; set; }
        public string NumeroBrat { get; set; }
    }
}