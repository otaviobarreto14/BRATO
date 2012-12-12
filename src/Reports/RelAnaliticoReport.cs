using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using Brato.Entities.DTO;
using System.Collections.Generic;
using Brato.Entities;
using System.Linq;

namespace Reports
{
    public partial class RelAnaliticoReport : DevExpress.XtraReports.UI.XtraReport
    {
        public RelAnaliticoReport()
        {
            InitializeComponent();
        }

        public RelAnaliticoReport(IList<BratEntity> brats)
        {

            InitializeComponent();
            //Condição TEMPO
            lblTotalBomTempo.Text = brats.Where(b => b.CondTempo == (int)CondTempoEnum._Bom).Count().ToString();
            lblTotalNubladoTempo.Text = brats.Where(b => b.CondTempo == (int)CondTempoEnum._Nublado).Count().ToString();
            lblTotalChuvosoTempo.Text = brats.Where(b => b.CondTempo == (int)CondTempoEnum._Chuvoso).Count().ToString();
            lblTotalTempo.Text = brats.Count().ToString();

            //Tipo de Sinalização
            lblTotalBoaSinalizacao.Text = brats.Where(b => b.TipoSinalizacao == (int)SinalizacaoEnum._Boa).Count().ToString();
            lblTotalDeficienteSinalizacao.Text = brats.Where(b => b.TipoSinalizacao == (int)SinalizacaoEnum._Deficiente).Count().ToString();
            lblTotalAusenteSinalizacao.Text = brats.Where(b => b.TipoSinalizacao == (int)SinalizacaoEnum._SemSinalizacao).Count().ToString();
            lblTotalSinalizacao.Text = brats.Count().ToString();


            //Tipo Acidente
            lblTotalAbalroamento.Text = brats.Where(b => b.TipoAcidente == (int)TipoAcidenteEnum._Abalroamento).Count().ToString();
            lblTotalAtropelamento.Text = brats.Where(b => b.TipoAcidente == (int)TipoAcidenteEnum._Atropelamento).Count().ToString();
            lblTotalCapotamento.Text = brats.Where(b => b.TipoAcidente == (int)TipoAcidenteEnum._Capotamento).Count().ToString();
            lblTotalChoque.Text = brats.Where(b => b.TipoAcidente == (int)TipoAcidenteEnum._Choque).Count().ToString();
            lblTotalColisao.Text = brats.Where(b => b.TipoAcidente == (int)TipoAcidenteEnum._Colisão).Count().ToString();
            lblTotalTombamento.Text = brats.Where(b => b.TipoAcidente == (int)TipoAcidenteEnum._Tombamento).Count().ToString();
            lblTotalTipoAcidente.Text = brats.Count().ToString();
        }

        public void BindChartDataSource<T>(XRChart chart, IList<T> dataSource, string serieName, string xAxisProperty = "xAxis", string yAxisProperty = "yAxis")
        {
            chart.GetSeriesByName(serieName).DataSource = dataSource;
            chart.GetSeriesByName(serieName).ArgumentDataMember = xAxisProperty;
            chart.GetSeriesByName(serieName).ValueDataMembers[0] = yAxisProperty;
        }

    }
}
