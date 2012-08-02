<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div style="padding: 12px;">
    <span id="toolbar" class="ui-widget-header ui-corner-all"><span id="repeat">
        <button id="novo">
            novo</button>
        <button id="editar">
            editar</button>
        <button id="excluir">
            excluir</button>
        <button id="cancelar">
            cancelar</button>
        <button id="salvar">
            salvar</button>
        <button id="voltar">
            voltar</button>
        <button id="continuar">
            continuar</button>
        <button id="exportarExcel">
            exportar excel</button>
        <button id="limpar">
            limpar</button>
    </span></span>
</div>
<style type="text/css">
    #toolbar
    {
        padding: 8px 3px;
        z-index: 50;
    }
    .ui-button
    {
        font-size: 9px;
    }
</style>
