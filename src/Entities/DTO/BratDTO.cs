using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Brato.Entities.DTO
{
    public class BratDTO
    {
        public string NumBrat { get; set; }
        public DateTime Data { get; set; }
        public string Hora { get; set; }
        public string CondTempo { get; set; }
        public string TipoSinalizacao { get; set; }
        public int NumVitimas { get; set; }
        public int NumVeiculos { get; set; }
        public int NumTestemunha { get; set; }
    }
}
