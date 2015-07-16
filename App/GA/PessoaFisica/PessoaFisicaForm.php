<?php

namespace App\GA\PessoaFisica;

use Pixel\Form\FormFiltro;
use Pixel\Form\Form;

class PessoaFisicaForm
{

    public function getFormFiltro()
    {
        $form = new FormFiltro();

        $form->config('sisFormFiltro');

        $campos[] = $form->suggest('pessoaFisicaNome', 'Nome', 'a')
                ->setTabela('pessoa_fisica')
                ->setCampoBusca('pessoaFisicaNome')
                ->setCampoDesc('pessoaFisicaNome');
        
        $campos[] = $form->cpf('pessoaFisicaCPF', 'CPF', 'a');
        
        $campos[] = $form->escolha('pessoaFisicaSexo', 'Sexo', 'a')
                    ->setArray([
                        'M' => "Masculino",
                        'F' => "Feminino"
                    ]);

        return $form->processarForm($campos);
    }

    /**
     * 
     * @return \Pixel\Form\Form
     */
    public function getFormManu($acao, $formCod = null)
    {
        $form = new Form();

        $form->setAcao($acao);

        $form->config('formManu' . $formCod, 'POST')
                ->setHeader('Cadastro de Produtos e Serviços');

        $campos[] = $form->hidden('cod')
                ->setValor($form->retornaValor('cod'));

        $campos[] = $form->texto('pessoaFisicaNome', 'Nome', true)
                ->setMaximoCaracteres(100)
                ->setValor($form->retornaValor('pessoaFisicaNome'));
        
        $campos[] = $form->cpf('pessoaFisicaCPF', 'CPF', true)
                        ->setValor($form->retornaValor('pessoaFisicaCPF'));

        $campos[] = $form->data('pessoaFisicaDataNascimento', 'Data de nascimento', true)
                        ->setValor($form->retornaValor('pessoaFisicaDataNascimento'));

        $campos[] = $form->escolha('pessoaFisicaSexo', 'Sexo', true)
                        ->setValor($form->retornaValor('pessoaFisicaSexo'))
                        ->setArray([
                            'M' => "Masculino",
                            'F' => "Feminino"
                        ]);

        if($acao === "alterar"){
            $campos[] = $form->upload('uploadPessoaFisicaFoto', 'Foto', 'IMAGEM')
                            ->setCodigoReferencia($formCod)
                            ->setMultiple(false)
                            ->setDimensoes([
                        'w263' => [
                            'largura' => 263,
                            'qualidade' => 70
                        ],
                        'w510' => [
                            'largura' => 510,
                            'qualidade' => 70
                        ],
                        'w100' => [
                            'largura' => 100,
                            'qualidade' => 70
                        ]]);
        }
        
        $campos[] = $form->botaoSalvarPadrao();

        $campos[] = $form->botaoDescartarPadrao();

        return $form->processarForm($campos);
    }

}
