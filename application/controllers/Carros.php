<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Carros extends MY_Controller
{

    /**
     * author: Ramon Silva
     * email: silva018-mg@yahoo.com.br
     *
     */

    public function __construct()
    {
        parent::__construct();

        $this->load->model('carros_model');
        $this->data['menuCarros'] = 'carros';
    }

    public function index()
    {
        $this->gerenciar();
    }

    public function gerenciar()
    {
        if (!$this->permission->checkPermission($this->session->userdata('permissao'), 'vCarro')) {
            $this->session->set_flashdata('error', 'Você não tem permissão para visualizar carros.');
            redirect(base_url());
        }
        $this->load->library('pagination');

        $this->data['configuration']['base_url'] = site_url('carros/gerenciar/');
        $this->data['configuration']['total_rows'] = $this->carros_model->count('carros');

        $this->pagination->initialize($this->data['configuration']);

        $this->data['results'] = $this->carros_model->get('carros', '*', '', $this->data['configuration']['per_page'], $this->uri->segment(3));

        $this->data['view'] = 'carros/carros';
        return $this->layout();
    }

    public function adicionar()
    {
        if (!$this->permission->checkPermission($this->session->userdata('permissao'), 'aCarro')) {
            $this->session->set_flashdata('error', 'Você não tem permissão para adicionar carros.');
            redirect(base_url());
        }

        $this->load->library('form_validation');
        $this->data['custom_error'] = '';

        if ($this->form_validation->run('carros') == false) {
            $this->data['custom_error'] = (validation_errors() ? '<div class="form_error">' . validation_errors() . '</div>' : false);
        } else {
            $data = [
                'idClientes' => set_value('clientes_id'),
                'carro' => set_value('carro'),
                'placa' => set_value('placa'),
                'montadora' => set_value('montadora'),
                'anoFabricacao' => set_value('anoFabricacao'),
                'anoModelo' => set_value('anoModelo'),
                'cor' => set_value('cor'),
                'chassi' => set_value('chassi'),
                'municipio' => set_value('municipio'),
                'uf' => set_value('uf'),
                'status' => set_value('status'),
                'dataCadastro' => date('Y-m-d'),
                //'dataAlteracao' => date('Y-m-d'),
                //'dataCadastro' => date('Y-m-d'),
            ];

            if ($this->carros_model->add('carros', $data) == true) {
                $this->session->set_flashdata('success', 'Carro adicionado com sucesso!');
                log_info('Adicionou um cliente.');
                redirect(site_url('carros/'));
            } else {
                $this->data['custom_error'] = '<div class="form_error"><p>Ocorreu um erro.</p></div>';
            }
        }

        $this->data['view'] = 'carros/adicionarCarro';
        return $this->layout();
    }

    public function editar()
    {
        if (!$this->uri->segment(3) || !is_numeric($this->uri->segment(3))) {
            $this->session->set_flashdata('error', 'Item não pode ser encontrado, parâmetro não foi passado corretamente.');
            redirect('mapos');
        }

        if (!$this->permission->checkPermission($this->session->userdata('permissao'), 'eCarro')) {
            $this->session->set_flashdata('error', 'Você não tem permissão para editar carros.');
            redirect(base_url());
        }

        $this->load->library('form_validation');
        $this->data['custom_error'] = '';

        if ($this->form_validation->run('carros') == false) {
            $this->data['custom_error'] = (validation_errors() ? '<div class="form_error">' . validation_errors() . '</div>' : false);
        } else {
            $data = [
                'carro' => $this->input->post('carro'),
                'placa' => $this->input->post('placa'),
                'montadora' => $this->input->post('montadora'),
                'anoFabricacao' => $this->input->post('anoFabricacao'),
                'anoModelo' => $this->input->post('anoModelo'),
                'cor' => $this->input->post('cor'),
                'chassi' => $this->input->post('chassi'),
                'municipio' => $this->input->post('municipio'),
                'uf' => $this->input->post('uf'),
                'status' => $this->input->post('status'),
                'dataCadastro' => $this->input->post('dataCadastro'),
                'dataAlteracao' => $this->input->post('dataAlteracao'),
                //'fornecedor' => (set_value('fornecedor') == true ? 1 : 0),
            ];

            if ($this->carros_model->edit('carros', $data, 'idCarros', $this->input->post('idCarros')) == true) {
                $this->session->set_flashdata('success', 'Cliente editado com sucesso!');
                log_info('Alterou um cliente. ID' . $this->input->post('idCarros'));
                redirect(site_url('carros/editar/') . $this->input->post('idCarros'));
            } else {
                $this->data['custom_error'] = '<div class="form_error"><p>Ocorreu um erro</p></div>';
            }
        }

        $this->data['result'] = $this->carros_model->getById($this->uri->segment(3));
        $this->data['view'] = 'carros/editarCarro';
        return $this->layout();
    }

    public function visualizar()
    {
        if (!$this->uri->segment(3) || !is_numeric($this->uri->segment(3))) {
            $this->session->set_flashdata('error', 'Item não pode ser encontrado, parâmetro não foi passado corretamente.');
            redirect('mapos');
        }

        if (!$this->permission->checkPermission($this->session->userdata('permissao'), 'vCarro')) {
            $this->session->set_flashdata('error', 'Você não tem permissão para visualizar carros.');
            redirect(base_url());
        }
        // Talvez exita forma melhor de fazer isso, verificar
        $idClientes = $_SESSION['clientes']['idClientes'];
        //
        $this->data['custom_error'] = '';
        $this->data['result'] = $this->carros_model->getById($this->uri->segment(3));
        $this->data['results'] = $this->carros_model->getClienteByCarro($idClientes);
        $this->data['view'] = 'carros/visualizar';
        $_SESSION['clientes']['idClientes'] = null;
        return $this->layout();
    }

    public function excluir()
    {
        if (!$this->permission->checkPermission($this->session->userdata('permissao'), 'dCarro')) {
            $this->session->set_flashdata('error', 'Você não tem permissão para excluir carros.');
            redirect(base_url());
        }

        $id = $this->input->post('id');
        if ($id == null) {
            $this->session->set_flashdata('error', 'Erro ao tentar excluir carro.');
            redirect(site_url('carros/gerenciar/'));
        }

        $os = $this->carros_model->getAllOsByClient($id);
        if ($os != null) {
            $this->carros_model->removeClientOs($os);
        }

        // excluindo Vendas vinculadas ao cliente
        $vendas = $this->carros_model->getAllVendasByClient($id);
        if ($vendas != null) {
            $this->carros_model->removeClientVendas($vendas);
        }

        $this->carros_model->delete('carros', 'idCarros', $id);
        log_info('Removeu um carro. ID' . $id);

        $this->session->set_flashdata('success', 'Carro excluido com sucesso!');
        redirect(site_url('carros/gerenciar/'));
    }

    public function autoCompleteCliente()
    {
        if (isset($_GET['term'])) {
            $q = strtolower($_GET['term']);
            $this->carros_model->autoCompleteCliente($q);
        }
    }

    public function validaPlacaJaAssociadaACliente()
    {
        if (isset($_GET['term'])) {
            $q = strtolower($_GET['term']);
            $this->carros_model->validaPlacaJaAssociadaACliente($q);
        }
    }
}
