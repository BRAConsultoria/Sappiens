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

/**
 * \Pixel\Form\FormValida
 * @author Feliphe "O Retaliador" Bueno - feliphezion@gmail.com
 * @since 09/10/2014
 * @version 1.0
 * @copyright 2014
 * 
 * Validação automatizada dos formulários
 *
 */

namespace App\Ext\Form;

use Zion\Form\Exception\FormException;
use Zion\Validacao\Valida;
use App\Accounts\Login\LoginClass;

class FormValida extends \Zion\Form\FormValida
{

    private $texto;

    /**
     * FormValida::__construct()
     * Construtor
     * 
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
        $valida = Valida::instancia();

        $this->texto = $valida->texto();

    }

    /**
     * FormValida::validar()
     * Detecta o tipo de input a ser validado, seta informações básicas necessárias para a validação.
     * 
     * @param Zion\Form $form Instância de uma classe de formulário com as configurações do input a ser validado.
     * @return bool True, em caso de input válido, void otherwise.
     * @throws \Zion\Form\Exception\InvalidArgumeException se $form não for uma instância válida de uma das classes de formulário.
     */
    public function validars($formInput)
    {
        return $this->validaFormInput($formInput);
    }

    /**
     * FormValida::validaFormInputTexto()
     * Valida input do tipo Texto
     * 
     * @param \Zion\Form\FormInputTexto $input Instância da classe \Zion\Form\FormInputTexto com as configurações do input a ser validado.
     * @return bool True, em caso de input válido, void otherwise.
     * @throws \Zion\Form\Exception\FormException se algum erro for encontrado na validação do input.
     */
    public function validar($formInput)
    {
        
        $attrs = parent::getAtributos($formInput);

        if (!\in_array('valor', $attrs)) {
            return true;
        }

        $userValue = $formInput->getValor();
        $identifica = $formInput->getIdentifica();

        $acao = \strtoupper($formInput->getAcao());


        if ($acao == 'SENHA' and $formInput->getNome() == 'validaSenhaUser') {
            $loginClass = new LoginClass();
            if ($loginClass->validaSenhaUsuario($_SESSION['usuarioCod'], $userValue) === false) {
                throw new FormException($identifica . ": Você deve informar corretamente sua <br />senha para concluir estas alterações!");
            }
        }

        parent::validar($formInput);

        return true;
    }

}
