using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Brato.UserInterface.Models
{
    public class ConsultarPolicialModel
    {
        public bool ConsultarPolicial { get; set; }
        public string Matricula { get; set; }
        public string Nome { get; set; }
        public string Batalhao { get; set; }
    }
}