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

namespace App\Ext\Core;

use Zion\Core\Controller as ControllerZion;
use Base\Sistema\Organograma\OrganogramaController;
use App\Ext\Twig\Carregador;
use App\Ext\Exception\ExceptionClass;
use App\Notificacao\Notificacao;
use App\Dashboard\DashboardClass;
use Zion\Email\Email;
use Zion\Exportacao\PDF;

class Controller extends ControllerZion
{

    public function __construct()
    {
        parent::__construct();
    }

    public function layout($namespace = '')
    {
        return new Carregador($namespace);
    }

    protected function getNotificacoes()
    {

        $usuarioCod = $_SESSION['usuarioCod'];
        $acao = \filter_input(INPUT_POST, 'acao');

        $notificacao = new Notificacao();

        if ($acao == 'limpaNotificacao') {

            $notificacaoCod = filter_input(\INPUT_POST, 'id');

            $notificacao->limpaNotificacao($notificacaoCod, $usuarioCod);

            return $this->jsonSucesso(true);
        } elseif ($acao == 'getNumeroNotificacoes') {
            return $this->jsonSucesso($notificacao->getNumeroNotificacoes($usuarioCod));
        } else {

            $notificacoesConteudo = $this->layout()->render('notificacao.html.twig', ['notificacoes' => $notificacao->getUltimasNotificacoes($usuarioCod)]);

            if ($notificacoesConteudo) {
                return $this->jsonSucesso($notificacoesConteudo);
            } else {
                return $this->jsonErro("Erro ao processar sua solicitação.");
            }
        }
    }

    protected function setOrganogramaCod()
    {

        $cod = \filter_input(\INPUT_GET, 'a');
        $_SESSION['organogramaCod'] = $cod;
        return $_SESSION['organogramaCod'];
    }

    protected function resetOrganogramaCod()
    {

        $org = new OrganogramaController();
        $getDadosUsuario = $org->getDadosUsuario();
        $_SESSION['organogramaCod'] = $getDadosUsuario['organogramacod'];
        return true;
    }

    protected function getSuggestOrganograma()
    {

        try {

            $dashboardClass = new DashboardClass();
            $ret = $dashboardClass->getSuggestOrganograma();
            return \json_encode($ret);
        } catch (\Exception $e) {

            return \json_encode(array(array('id' => '0', 'value' => 'erro', 'label' => $e->getMessage())));
        }
    }

    protected function reportBug()
    {

        $tData = \filter_input(\INPUT_POST, 'techinicalData');
        $mensagem = \filter_input(\INPUT_POST, 'mensagemUsuario');
        $dadosException = \json_decode($tData, true);
        $mailer = new Email();

        $emailMsg = $this->layout()->render('bugReporterEmail.html.twig', ['exception' => $dadosException,
            'mensagem' => $mensagem,
            'nomeUsuario' => $_SESSION['pessoaFisicaNome']
        ]);

        $mailer->enviarEmail($_SESSION['usuarioLogin'], "Relatório de erro do sistema.", $emailMsg, "noreply");

        return $this->layout()->render('erro.html.twig', ['reportBug' => true]);
    }

    protected function imprimir()
    {
        new \Zion\Acesso\Acesso('imprimir');

        $dados = \json_decode($this->filtrar(), true);
        
        $pdf = new PDF();
        
        $tituloRelatorio    = (\filter_input(\INPUT_GET, 'sisUFC') ? $pdf->getUsuarioFiltroNome(\filter_input(\INPUT_GET, 'sisUFC')) : NULL);
        
        $nomeModulo = (new \Base\Sistema\Modulo\ModuloClass())->getDadosModulo(MODULO)['modulonomemenu'];

        if(\count($dados) > 0){
            return $this->layout()->render('impressao_grid_html.html.twig', ['grid'             => \json_decode($dados['retorno'], true), 
                                                                             'logo'             => 'http:' . \SIS_URL_BASE . 'Storage/logo_exemplo.jpg', 
                                                                             'modulo'           => $nomeModulo,
                                                                             'dataRelatorio'    => date("d/m/Y \à\s H:i:s"),
                                                                             'titulo'           => $tituloRelatorio
                                                                            ]);
        } else {
            return $this->jsonErro('Nenhum dado a ser exibido!');
        }
    }
    
    protected function salvarPDF()
    {
        new \Zion\Acesso\Acesso('salvarPDF');

        $pdf = new \Zion\Exportacao\PDF();

        $dados = \json_decode($this->filtrar(), true);

        $orientacao = (\filter_input(\INPUT_GET, 'orientacao') ?: \filter_input(\INPUT_POST, 'orientacao'));
        
        return $pdf->impressaoGridPDF($dados, 'relatorio.css', \SIS_DIR_DEFAULT_BASE .'Tema/Vendor/Pixel/1.3.0/stylesheets/', $this, 'http:' . \SIS_URL_BASE . 'Storage/logo_exemplo.jpg', $orientacao);

    }
    
    public function getExceptionHandler($exId)
    {
        
        $e = new ExceptionClass();
        
        $exception = $e->getException($exId); 
        $pre = '<p><pre>' . $exception['exceptiondesc'] . '</pre></p>';
        $url = '<a href=' . \SIS_URL_BASE_MANUAL . '/?eid='.$exId.' target=_blank>Saiba mais</a>';         
        
        throw new \Exception('<strong>' . $exception['exceptiontit'] . '</strong>&nbsp;&nbsp;Exception Id: ' . $exId . $pre . $url);
    
    }

}
