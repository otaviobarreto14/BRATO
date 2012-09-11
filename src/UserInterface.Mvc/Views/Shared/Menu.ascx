<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<link href="/Scripts/DropDownMenu/css/style.css" rel="stylesheet" type="text/css"
    media="screen, projection" />
<script src="/Scripts/DropDownMenu/js/hoverIntent.js" type="text/javascript"></script>
<script src="/Scripts/DropDownMenu/js/jquery.dropdown.js" type="text/javascript"></script>
<script src="/Scripts/DropDownMenu/js/jquery.dropdownPlain.js" type="text/javascript"></script>
<style type="text/css">
    .sub_menu
    {
        z-index: 99999;
    }
    
    .dropdown li, .dropdown li a
    {
        height: 100%;
    }
    .dropdown li a
    {
        line-height: 250%;
        text-align: center;
        border-right: 1px solid #333;
    }
</style>
<div id="divMenu" style="z-index: 999999; height: 100%">
    <ul class="dropdown" style="height: 100%">
        <li><a href="/Brat/IncBrat/">Cadastrar Brat</a></li>
        <li><a href="/Brat/Index/">Consultar Brat</a></li>
        <li><a href="">Relatórios</a>
            <ul class="sub_menu">
                <li><a href="">Relatório de Acidentes</a>
                    <ul class="sub_menu">
                        <li><a href="/Relatorio/RelAnalitico/">Estatísticos</a></li>
                        <li><a href="/Relatorio/RelGerencial/">Gerenciais</a></li>
                    </ul>
                </li>
                <li><a href="">Relatório de Policiais</a>
                    <ul class="sub_menu">
                        <li><a href="/Relatorio/RelPolicial/">Policiais Cadastrados</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="">Administração</a>
            <ul class="sub_menu">
                <li><a href="/Policial/IncPolicial/">Cadastrar Policial</a></li>
                <li><a href="/Policial/ConPolicial/">Consultar Policial</a></li>
            </ul>
        </li>
        <li><a href="/Acesso/Login/">Login</a></li>
    </ul>
</div>
