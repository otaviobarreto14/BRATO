using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Brato.Entities;

namespace Brato.UserInterface.Models
{
    public class RelatorioModel
    {
        public RelatorioModel()
        {

        }
        #region Localidade
        public string UF { get; set; }
        public string Município { get; set; }
        public string Bairro { get; set; }
        public string Logradouro { get; set; }
        #endregion

        #region Acidente
        public CondTempoEnum CondicaoTempo { get; set; }
        public SinalizacaoEnum Sinalizacao { get; set; }
        public TipoAcidenteEnum TipoAcidente { get; set; }
        public CircunstanciaEnum Circunstancia { get; set; }
        public bool ComVitimas { get; set; }
        public int IdadeVitima { get; set; }
        public SexoEnum SexoVitima { get; set; }        
        public FerimentosEnum FerimentosVitima { get; set; }
        #endregion

        #region Veiculo
        public string TipoVeiculo { get; set; }
        public string Fabricante { get; set; }
        public string Modelo { get; set; }
        //3.6.	Tipo de Veiculo {Todos, Carro, Motocicleta, Caminhão, Ônibus};
        //3.7.	Fabricante {Todos, Chevrolet, Fiat, Ford, Honda e etc.};
        //3.8.	Modelo {Todos, Corsa, Uno, Fiesta, City e etc.};
        #endregion

        #region Motorista
        public int IdadeMotorista { get; set; }
        public SexoEnum SexoMotorista { get; set; }
        public EstadoCivilEnum EstadoCivilMotorista { get; set; }
        public CategoriaCNH CategoriaCnh { get; set; }
        #endregion

        #region Policial
        public string NomePolicial { get; set; }
        public string MatriculaPolicial { get; set; }
        public BatalhaoEnum BatalhaoPolicial { get; set; }
        #endregion

    }
}