<?php

/**
 *
 *    Sappiens Framework
 *    Copyright (C) 2014, BRA Consultoria
 *
 *    Website do autor: www.braconsultoria.com.br/sappiens
 *    Email do autor: sappiens@braconsultoria.com.br
 *
 *    Website do projeto, equipe e documentação: www.sappiens.com.br
 *   
 *    Este programa é software livre; você pode redistribuí-lo e/ou
 *    modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 *    publicada pela Free Software Foundation, versão 2.
 *
 *    Este programa é distribuído na expectativa de ser útil, mas SEM
 *    QUALQUER GARANTIA; sem mesmo a garantia implícita de
 *    COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 *    PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 *    detalhes.
 * 
 *    Você deve ter recebido uma cópia da Licença Pública Geral GNU
 *    junto com este programa; se não, escreva para a Free Software
 *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
 *    02111-1307, USA.
 *
 *    Cópias da licença disponíveis em /Sappiens/_doc/licenca
 *
 */

namespace App\Dashboard;

use Zion\Banco\Conexao;
use Zion\Layout\Html;
use App\Dashboard\DashboardClass;
use Pixel\Form\Form;
use Pixel\Form\FormJavaScript;

class DashboardForm
{

    private $con;
    private $dashboardClass;

    public function __construct()
    {

        $this->con = Conexao::conectar();
        $this->html = new Html();
        $this->dashboardClass = new DashboardClass();
    }

    public function getOrganogramaForm()
    {

        $buffer = '';

        if ($_SESSION['usuarioCod']) {

            $getDadosUsuario = $this->dashboardClass->getDadosUsuario();
            $form = $this->getOrganogramaPesquisarForm();

            $buffer = '';
            $buffer .= $this->html->abreTagAberta('li', array('class' => 'clearfix'));
            $buffer .= $this->html->abreTagAberta('form', array('id' => 'FormOrganograma', 'name' => 'FormOrganograma', 'class' => 'navbar-form clearfix'));
            $buffer .= $form->getFormHtml('organograma');

            if ($getDadosUsuario['organogramacod'] <> $_SESSION['organogramaCod']) {

                $buffer .= $this->html->abreTagAberta('div', array('style' => 'float:inherit; position:relative; margin-top:-37px; padding-right:15px;'));
                $buffer .= $this->html->abreTagAberta('a', array('href' => '#', 'title' => 'Redefinir organograma', 'onclick' => 'getControllerOrganograma(\'organogramaCod\', \'organograma\', \'resetOrganogramaCod\')', 'class' => 'close')) . '×' . $this->html->fechaTag('a');
                $buffer .= $this->html->fechaTag('div');
            }

            $buffer .= $this->html->fechaTag('form');
            $buffer .= $this->html->fechaTag('li');
            $buffer .= $form->javaScript(false, true)->getLoad(true);
            $buffer .= $this->getJSEstatico();
        }

        return $buffer;
    }

    /**
     * 
     * @return Form
     */
    public function getOrganogramaPesquisarForm()
    {

        $form = new Form();

        $form->config('FormOrganograma', 'GET')
                ->setNovalidate(true);

        $getDadosOrganograma = $this->dashboardClass->getDadosOrganograma($_SESSION['organogramaCod']);
        $organogramaNome = $getDadosOrganograma['organogramanome'];

        $campos[] = $form->suggest('organograma', 'organograma', false)
                ->setUrl(SIS_URL_BASE . 'Dashboard/')
                ->setParametros(['acao' => 'getSuggest'])
                ->setClassCss('clearfix')
                ->setPlaceHolder($organogramaNome)
                //->setHidden(true)
                //->setHiddenValue('organogramaCod')
                ->setOnSelect('getControllerOrganograma(\'organogramaCod\', \'organograma\', \'setOrganogramaCod\')')
                ->setLayoutPixel(false);

        return $form->processarForm($campos);
    }

    public function getJSEstatico()
    {

        $jsStatic = FormJavaScript::iniciar();

        return $jsStatic->getFunctions($jsStatic->setFunctions($this->getMeuJS()));
    }

    private function getMeuJS()
    {

        /*
         * * var a => recebe a id do campo que invocou o evento
         * * var b => recebe o elemento que sofrerá update
         * * var c => recebe o metodo
         */
        $buffer = '';
        $buffer .= 'function getControllerOrganograma(a,b,c){
                        var aa = $("#"+a).val();
                        $.ajax({type: "get", url: "' . SIS_URL_BASE . 'Dashboard/?acao="+c+"&a="+aa, dataType: "json", beforeSend: function() {
                            $("#"+b).html(\'<i class="fa fa-refresh fa-spin" style="margin-top:10px;"></i>\');
                        }}).done(function (ret) {
                            $("#"+b).html(ret.retorno);
                            location.reload();
                        }).fail(function () {
                            sisMsgFailPadrao();
                        });  
                    }';
        return $buffer;
    }

}
