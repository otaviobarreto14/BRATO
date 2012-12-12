using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Brato.Entities;
using TopDown.TopFramework.BusinessRules;
using Brato.Entities.DTO;
using System.IO;
using Brato.UserInterface.Models;
using System.Linq.Expressions;
using TopDown.TopFramework.Common.Extensions;
using System.Collections;
using Reports;

namespace Brato.UserInterface.Controllers
{
    public class RelatorioController : Controller
    {
        public ActionResult RelAnalitico()
        {
            return View();
        }
        public ActionResult RelGerencial()
        {
             var policial = RulesManager.CreateByEntity<PolicialEntity>().FindAll(p => p.Matricula == User.Identity.Name && p.Status == "A").FirstOrDefault();
             if (policial == null)
                 return RedirectToAction("Login", "Acesso");
             else
             {
                 return View();
             }
        }
        public ActionResult RelPolicial()
        {
            var policial = RulesManager.CreateByEntity<PolicialEntity>().FindAll(p => p.Matricula == User.Identity.Name && p.Status == "A").FirstOrDefault();
            if (policial == null)
                return RedirectToAction("Login", "Acesso");
            else
            {

                return View();
            }
        }

        public ActionResult RelGerencialReport()
        {
            IList<BratEntity> lstBrat = RulesManager.CreateByEntity<BratEntity, int>().FindAll(p => p.Temp == "D").ToList();
            IList<BratDTO> lstDto = ConverterBratEmDto(lstBrat);

            RelAnaliticoReport rpt = new RelAnaliticoReport(lstBrat);
            string folder = Guid.NewGuid().ToString().Substring(10).Replace("-", "");
            var path = Server.MapPath("~");
            var caminhoCompleto = Path.Combine(path, folder);
            Directory.CreateDirectory(caminhoCompleto);

            rpt.ExportToPdf(caminhoCompleto + "\\1232.pdf");
            rpt.ExportToXls(caminhoCompleto + "\\1232.xls");

            return null;
        }

        private static IList<BratDTO> ConverterBratEmDto(IList<BratEntity> lstBrat)
        {
            IList<BratDTO> lstDto = new List<BratDTO>();
            foreach (var brat in lstBrat)
            {
                BratDTO dto = new BratDTO();
                dto.CondTempo = EnumHelper.GetEnumDescription<CondTempoEnum>(brat.CondTempo);
                dto.Data = brat.DataAcidente;
                dto.Hora = brat.HoraAcidente;
                dto.NumBrat = brat.NumBrat.ToString();
                dto.NumTestemunha = RulesManager.CreateByEntity<TestemunhaEntity, int>().FindAll(c => c.Brat.IdBrat == brat.IdBrat).Count();
                dto.NumVeiculos = RulesManager.CreateByEntity<VeiculoEntity, int>().FindAll(c => c.Brat.IdBrat == brat.IdBrat).Count();
                dto.NumVitimas = RulesManager.CreateByEntity<VitimaEntity, int>().FindAll(c => c.Brat.IdBrat == brat.IdBrat).Count();
                dto.TipoSinalizacao = EnumHelper.GetEnumDescription<SinalizacaoEnum>(brat.TipoSinalizacao);
                lstDto.Add(dto);
            }
            return lstDto;
        }

        public ActionResult FiltrarRelatórioEstatistico(RelatorioModel model)
        {
            Expression<Func<BratEntity, bool>> filtroBrat = (b => b.Temp == "D");


            #region Acidente
            if (!string.IsNullOrEmpty(model.Bairro))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.IdBairro.Descricao == model.Bairro);
            if (!(model.Circunstancia == null || model.Circunstancia == 0))
                filtroBrat = filtroBrat.And(b => b.Circunstancia == (int)model.Circunstancia);
            if (!(model.CondicaoTempo == null || model.CondicaoTempo == 0))
                filtroBrat = filtroBrat.And(b => b.CondTempo == (int)model.CondicaoTempo);
            if (!string.IsNullOrEmpty(model.Logradouro))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.Descricao == model.Logradouro);
            if (!string.IsNullOrEmpty(model.Município))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Descricao == model.Município);
            if (!(model.Sinalizacao == null || model.Sinalizacao == 0))
                filtroBrat = filtroBrat.And(b => b.TipoSinalizacao == (int)model.Sinalizacao);
            if (!string.IsNullOrEmpty(model.UF))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Uf.Uf == model.UF);
            if (!(model.TipoAcidente == null || model.TipoAcidente == 0))
                filtroBrat = filtroBrat.And(b => b.TipoAcidente == (int)model.TipoAcidente);
            #endregion

            var lstfiltroBrat = RulesManager.CreateByEntity<BratEntity, int>().FindAll(filtroBrat).ToList();
            IList<BratEntity> lstBrats = new List<BratEntity>();
            foreach (var brat in lstfiltroBrat)
            {
                bool adicionar = false;
                Expression<Func<MotoristaEntity, bool>> filtroMotorista = (m => m.Brat.IdBrat == brat.IdBrat);
                Expression<Func<VeiculoEntity, bool>> filtroVeiculo = (v => v.Brat.IdBrat == brat.IdBrat);
                Expression<Func<VitimaEntity, bool>> filtroVitima = (v => v.Brat.IdBrat == brat.IdBrat);

                #region Motorista
                if (!(model.SexoMotorista == null || model.SexoMotorista == 0))
                    filtroMotorista = filtroMotorista.And(m => m.Pessoa.Sexo == ((int)model.SexoMotorista).ToString());
                if (model.IdadeMotorista != 0)
                    filtroMotorista = filtroMotorista.And(m => m.Brat.DataAcidente.Year - m.DataNasc.Year == model.IdadeMotorista);
                if (!(model.CategoriaCnh == null || model.CategoriaCnh == 0))
                    filtroMotorista = filtroMotorista.And(m => m.CategoriaCnh == (int)model.CategoriaCnh);
                if (!(model.EstadoCivilMotorista == null || model.EstadoCivilMotorista == 0))
                    filtroMotorista = filtroMotorista.And(m => m.EstadoCivil == (int)model.EstadoCivilMotorista);
                #endregion

                #region Vitima
                if (model.ComVitimas)
                {
                    if (!(model.FerimentosVitima == null || model.FerimentosVitima == 0))
                        filtroVitima = filtroVitima.And(v => v.TipoFerimento == (int)model.FerimentosVitima);
                    if (model.IdadeVitima != 0)
                        filtroVitima = filtroVitima.And(v => v.Brat.DataAcidente.Year - v.DataNasc.Year == model.IdadeVitima);
                    if (!(model.SexoVitima == null || model.SexoVitima == 0))
                        filtroVitima = filtroVitima.And(m => m.Pessoa.Sexo == ((int)model.SexoVitima).ToString());
                }
                #endregion

                #region Veiculo

                //if (!string.IsNullOrEmpty(model.Fabricante))
                //filtroVeiculo = filtroVeiculo.And(v => v.Fabricante == model.Fabricante
                //if (model.Modelo
                //model.TipoVeiculo

                #endregion

                var lstFiltroMotorista = RulesManager.CreateByEntity<MotoristaEntity, int>().FindAll(filtroMotorista).ToList();
                if (lstFiltroMotorista.Any())
                    adicionar = true;

                var lstFiltroVitima = RulesManager.CreateByEntity<VitimaEntity, int>().FindAll(filtroVitima).ToList();
                if (lstFiltroVitima.Any())
                    adicionar = true;

                var lstFiltroVeiculo = RulesManager.CreateByEntity<VeiculoEntity, int>().FindAll(filtroVeiculo).ToList();
                if (lstFiltroVeiculo.Any())
                    adicionar = true;

                if (adicionar)
                    lstBrats.Add(brat);
            }

            


            /////
            string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory.Trim('\\'), "RelatoriosAnaliticos");
            RetornoRelatorioModel mdl = new RetornoRelatorioModel();
            if (lstBrats.Any())
            {
                RelAnaliticoReport rpt = new RelAnaliticoReport(lstBrats);
                string folder = Guid.NewGuid().ToString().Substring(20).Replace("-", "");

                var caminhoCompleto = Path.Combine(path, folder);
                Directory.CreateDirectory(caminhoCompleto);

                rpt.ExportToPdf(caminhoCompleto + "\\relatorioAnaliticoBrato.pdf");
                rpt.ExportToXls(caminhoCompleto + "\\relatorioAnaliticoBrato.xls");
                rpt.ExportToRtf(caminhoCompleto + "\\relatorioAnaliticoBrato.rtf");


                mdl.LinkPdf = "/RelatoriosAnaliticos/" + folder + "/relatorioAnaliticoBrato.pdf";
                mdl.LinkXls = "/RelatoriosAnaliticos/" + folder + "/relatorioAnaliticoBrato.xls";
                mdl.LinkRtf = "/RelatoriosAnaliticos/" + folder + "/relatorioAnaliticoBrato.rtf";


                mdl.Mensagem = "O relatório foi processado. Voce pode visualizá-lo através dos links abaixo.";
                mdl.Results = true;
            }
            else
            {
                mdl.Mensagem = "Nenhum registro encontrado com os filtros informados.";
                mdl.Results = false;
            }
            return View("RetornoRelatorio", mdl);
            /////
            return View();
        }

        public ActionResult FiltrarRelatórioGerencial(RelatorioModel model)
        {
            Expression<Func<BratEntity, bool>> filtroBrat = (b => b.Temp == "D");


            #region Acidente
            if (!string.IsNullOrEmpty(model.Bairro))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.IdBairro.Descricao == model.Bairro);
            if (!(model.Circunstancia == null || model.Circunstancia == 0))
                filtroBrat = filtroBrat.And(b => b.Circunstancia == (int)model.Circunstancia);
            if (!(model.CondicaoTempo == null || model.CondicaoTempo == 0))
                filtroBrat = filtroBrat.And(b => b.CondTempo == (int)model.CondicaoTempo);
            if (!string.IsNullOrEmpty(model.Logradouro))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.Descricao == model.Logradouro);
            if (!string.IsNullOrEmpty(model.Município))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Descricao == model.Município);
            if (!(model.Sinalizacao == null || model.Sinalizacao == 0))
                filtroBrat = filtroBrat.And(b => b.TipoSinalizacao == (int)model.Sinalizacao);
            if (!string.IsNullOrEmpty(model.UF))
                filtroBrat = filtroBrat.And(b => b.IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Uf.Uf == model.UF);
            if (!(model.TipoAcidente == null || model.TipoAcidente == 0))
                filtroBrat = filtroBrat.And(b => b.TipoAcidente == (int)model.TipoAcidente);
            #endregion

            var lstfiltroBrat = RulesManager.CreateByEntity<BratEntity, int>().FindAll(filtroBrat).ToList();
            IList<BratEntity> lstBrats = new List<BratEntity>();
            foreach (var brat in lstfiltroBrat)
            {
                bool adicionar = false;
                Expression<Func<MotoristaEntity, bool>> filtroMotorista = (m => m.Brat.IdBrat == brat.IdBrat);
                Expression<Func<VeiculoEntity, bool>> filtroVeiculo = (v => v.Brat.IdBrat == brat.IdBrat);
                Expression<Func<VitimaEntity, bool>> filtroVitima = (v => v.Brat.IdBrat == brat.IdBrat);

                #region Motorista
                if (!(model.SexoMotorista == null || model.SexoMotorista == 0))
                    filtroMotorista = filtroMotorista.And(m => m.Pessoa.Sexo == ((int)model.SexoMotorista).ToString());
                if (model.IdadeMotorista != 0)
                    filtroMotorista = filtroMotorista.And(m => m.Brat.DataAcidente.Year - m.DataNasc.Year == model.IdadeMotorista);
                if (!(model.CategoriaCnh == null || model.CategoriaCnh == 0))
                    filtroMotorista = filtroMotorista.And(m => m.CategoriaCnh == (int)model.CategoriaCnh);
                if (!(model.EstadoCivilMotorista == null || model.EstadoCivilMotorista == 0))
                    filtroMotorista = filtroMotorista.And(m => m.EstadoCivil == (int)model.EstadoCivilMotorista);
                #endregion

                #region Vitima
                if (model.ComVitimas)
                {
                    if (!(model.FerimentosVitima == null || model.FerimentosVitima == 0))
                        filtroVitima = filtroVitima.And(v => v.TipoFerimento == (int)model.FerimentosVitima);
                    if (model.IdadeVitima != 0)
                        filtroVitima = filtroVitima.And(v => v.Brat.DataAcidente.Year - v.DataNasc.Year == model.IdadeVitima);
                    if (!(model.SexoVitima == null || model.SexoVitima == 0))
                        filtroVitima = filtroVitima.And(m => m.Pessoa.Sexo == ((int)model.SexoVitima).ToString());
                }
                #endregion

                #region Veiculo

                //if (!string.IsNullOrEmpty(model.Fabricante))
                //filtroVeiculo = filtroVeiculo.And(v => v.Fabricante == model.Fabricante
                //if (model.Modelo
                //model.TipoVeiculo

                #endregion

                var lstFiltroMotorista = RulesManager.CreateByEntity<MotoristaEntity, int>().FindAll(filtroMotorista).ToList();
                if (lstFiltroMotorista.Any())
                    adicionar = true;

                var lstFiltroVitima = RulesManager.CreateByEntity<VitimaEntity, int>().FindAll(filtroVitima).ToList();
                if (lstFiltroVitima.Any())
                    adicionar = true;

                var lstFiltroVeiculo = RulesManager.CreateByEntity<VeiculoEntity, int>().FindAll(filtroVeiculo).ToList();
                if (lstFiltroVeiculo.Any())
                    adicionar = true;

                if (adicionar)
                    lstBrats.Add(brat);
            }

            IList<BratDTO> lstDto = ConverterBratEmDto(lstBrats);
            string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory.Trim('\\'), "RelatoriosGerenciais");
            RetornoRelatorioModel mdl = new RetornoRelatorioModel();
            if (lstDto.Any())
            {
                Reports.RelGerencialReport rpt = new Reports.RelGerencialReport(lstDto);
                string folder = Guid.NewGuid().ToString().Substring(20).Replace("-", "");

                var caminhoCompleto = Path.Combine(path, folder);
                Directory.CreateDirectory(caminhoCompleto);

                rpt.ExportToPdf(caminhoCompleto + "\\relatorioGerencialBrato.pdf");
                rpt.ExportToXls(caminhoCompleto + "\\relatorioGerencialBrato.xls");
                rpt.ExportToRtf(caminhoCompleto + "\\relatorioGerencialBrato.rtf");


                mdl.LinkPdf = "/RelatoriosGerenciais/" + folder + "/relatorioGerencialBrato.pdf";
                mdl.LinkXls = "/RelatoriosGerenciais/" + folder + "/relatorioGerencialBrato.xls";
                mdl.LinkRtf = "/RelatoriosGerenciais/" + folder + "/relatorioGerencialBrato.rtf";


                mdl.Mensagem = "O relatório foi processado. Voce pode visualizá-lo através dos links abaixo.";
                mdl.Results = true;
            }
            else
            {
                mdl.Mensagem = "Nenhum registro encontrado com os filtros informados.";
                mdl.Results = false;
            }
            return View("RetornoRelatorio", mdl);
        }
    }
}
