using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Brato.UserInterface.Models
{
    public class RetornoRelatorioModel
    {
        public string LinkPdf { get; set; }
        public string LinkXls { get; set; }
        public string LinkRtf { get; set; }
        public bool Results { get; set; }
        public string Mensagem { get; set; }
    }
}