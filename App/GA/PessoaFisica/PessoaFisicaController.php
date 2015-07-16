<?php

namespace App\GA\PessoaFisica;

use App\Ext\Core\Controller;
use Zion\Acesso\Acesso;
use Pixel\Grid\GridBotoes;
use Pixel\Filtro\FiltroForm;

class PessoaFisicaController extends Controller
{

    private $lojaRitoClass;
    private $lojaRitoForm;

    public function __construct()
    {
        parent::__construct();

        $this->lojaRitoClass = new PessoaFisicaClass();
        $this->lojaRitoForm = new PessoaFisicaForm();
    }

    protected function iniciar()
    {
        try {

            new Acesso('filtrar');

            $dados = [
                'botoes' => (new GridBotoes())->geraBotoes(),
                'grid' => $this->lojaRitoClass->filtrar($this->lojaRitoForm->getFormFiltro()),
                'filtro' => (new FiltroForm())->montaFiltro($this->lojaRitoForm->getFormFiltro())
            ];
        } catch (\Exception $ex) {

            return $this->layout()->render('erro.html.twig', ['exception' => $ex]);
        }

        return $this->layout()->render('base.html.twig', $dados);
    }

    protected function filtrar()
    {
        new Acesso('filtrar');

        $grid = $this->layout()->render('grid.html.twig', [
            'grid' => $this->lojaRitoClass->filtrar($this->lojaRitoForm->getFormFiltro())
        ]);

        return parent::jsonSucesso($grid);
    }

    protected function cadastrar()
    {
        new Acesso('cadastrar');

        $objForm = $this->lojaRitoForm->getFormManu('cadastrar');

        if ($this->metodoPOST()) {

            $objForm->validar();

            $this->lojaRitoClass->cadastrar($objForm);

            $retorno = 'true';
        } else {

            $retorno = $this->layout()->render('form_padrao.html.twig', [
                'form' => $objForm->montaForm()
            ]);
        }

        return parent::jsonSucesso($retorno);
    }

    protected function alterar()
    {
        new Acesso('alterar');

        if ($this->metodoPOST()) {

            $objForm = $this->lojaRitoForm->getFormManu('alterar', $this->postCod());

            $objForm->validar();

            $this->lojaRitoClass->alterar($objForm);

            $retorno = 'true';
        } else {

            $selecionados = $this->registrosSelecionados();

            $retorno = '';
            foreach ($selecionados as $cod) {

                $objForm = $this->lojaRitoClass->setValoresFormManu($cod, $this->lojaRitoForm);
                $retorno .= $this->layout()->render('form_padrao.html.twig', [
                    'form' => $objForm->montaForm()
                ]);
                $objForm->javaScript()->resetLoad();
            }
        }

        return parent::jsonSucesso($retorno);
    }

    protected function remover()
    {
        new Acesso('remover');

        $selecionados = $this->registrosSelecionados();
        $rSelecionados = \count($selecionados);
        $rApagados = 0;
        $mensagem = [];

        try {

            foreach ($selecionados as $cod) {

                $this->lojaRitoClass->remover($cod);

                $rApagados++;
            }
        } catch (\Exception $ex) {

            $mensagem[] = $ex->getMessage();
        }

        return \json_encode([
            'sucesso' => 'true',
            'selecionados' => $rSelecionados,
            'apagados' => $rApagados,
            'retorno' => \implode("\\n", $mensagem)]);
    }

    protected function visualizar()
    {
        new Acesso('visualizar');

        $selecionados = $this->registrosSelecionados();

        $retorno = '';
        foreach ($selecionados as $cod) {

            $objForm = $this->lojaRitoClass->setValoresFormManu($cod, $this->lojaRitoForm);
            $retorno .= $this->layout()->render('form_padrao.html.twig', [
                'form' => $objForm->montaForm(true)
            ]);
            $objForm->javaScript()->resetLoad();
        }

        return parent::jsonSucesso($retorno);
    }
}
