using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Collections.Generic;
using Brato.Entities;
using Brato.Entities.DTO;

namespace Brato.Reports
{
    public partial class RelGerencialReport : DevExpress.XtraReports.UI.XtraReport
    {
        public RelGerencialReport()
        {
            InitializeComponent();
        }

        public RelGerencialReport(IList<BratDTO> brats)
        {
            InitializeComponent();
            var binder = new ReportBinder<BratDTO>(this);
            this.DataSource = brats;
            binder.BindText(lblNumBrat, c => c.NumBrat);
            binder.BindDate(lblData, c => c.Data);
            binder.BindText(lblHora, c => c.Hora);
            binder.BindText(lblCondTempo, c => c.CondTempo);
            binder.BindText(lblTipoSinalizacao, c => c.TipoSinalizacao);
            binder.BindText(lblNumVitimas, c => c.NumVitimas);
            binder.BindText(lblNumVeiculos, c => c.NumVeiculos);
            binder.BindText(lblNumTestemunhas, c => c.NumTestemunha);

            lblTotalAcidentes.Text = brats.Count.ToString();
            lblDataExecucao.Text = string.Format("{0} - {1}:{2}:{3}", DateTime.Now.ToShortDateString(), DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);


        }

    }
}
