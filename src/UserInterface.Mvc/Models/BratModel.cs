using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Brato.Entities;

namespace Brato.UserInterface.Models
{
    public class BratModel
    {
        public string MunicipioAcidente { get; set; }
        public string DataAcidente { get; set; }
        public string HoraAcidente { get; set; }
        public string LocalAcidente { get; set; }
        public string CondicaoTempoAcidente { get; set; }
        public string SinalizacaoAcidente { get; set; }
        public string TipoAcidente { get; set; }
        public string DescricaoAcidente { get; set; }
        public IList<VeiculoEntity> Veiculos { get; set; }
        public IList<MotoristaEntity> Motoristas { get; set; }
        public IList<VitimaEntity> Vitimas { get; set; }
        public IList<TestemunhaEntity> Testemunhas { get; set; }
        public IList<string> LinkFotos { get; set; }
        public string LinkCroqui { get; set; }

        public string msgErro { get; set; }
        public bool Resultados { get; set; }
    }
}