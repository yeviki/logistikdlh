<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Description of mata diklat class
 *
 * @author Yogi "solop" Kaputra
 */

class Pembelian extends SLP_Controller {
    protected $_vwName  = '';
    protected $_uriName = '';
    public function __construct() {
        parent::__construct();
        $this->load->model(array('model_pembelian' => 'mPembelian', 'master/model_master' => 'mmas'));
        $this->_vwName = 'vpembelian';
        $this->_uriName = 'data/pembelian';
    }

    private function validasiDataValue() {
        $this->form_validation->set_rules('no_faktur_buy', 'No Faktur', 'required|trim');
        $this->form_validation->set_rules('tgl_pembelian', 'Tanggal Pembelian', 'required|trim');
        $this->form_validation->set_rules('catatan', 'Catatan', 'required|trim');
        validation_message_setting();
        if($this->form_validation->run() == FALSE)
            return false;
        else
            return true;
    }

    public function index() {
        $this->breadcrumb->add('Dashboard', site_url('home'));
        $this->breadcrumb->add('Data', '#');
        $this->breadcrumb->add('Pembelian', site_url($this->_uriName));
        $this->session_info['page_name']        = 'Pembelian';
        $this->session_info['siteUri']          = $this->_uriName;
        $this->session_info['page_js']	        = $this->load->view($this->_vwName.'/vjs', array('siteUri'=>$this->_uriName), true);
        $this->session_info['data_barang']	    = $this->mmas->getDataBarang();
        $this->template->build($this->_vwName.'/vpage', $this->session_info);
    }

    public function listview() {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $data = array();
            $session = $this->app_loader->current_account();
            if(isset($session)){
                $dataList = $this->mPembelian->get_datatables();
                $no = $this->input->post('start');
                foreach ($dataList as $key => $dl) {
                    $no++;
                    $row = array();
                    $row[] = $no;
                    $row[] = $dl['tgl_pembelian'];
                    $row[] = $dl['no_faktur_buy'];
                    $row[] = '<button type="button" class="btn btn-orange btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnEdit" data-id="'.$this->encryption->encrypt($dl['id_pembelian']).'" title="Edit data"><i class="fas fa-pencil-alt"></i></button>

                    <button type="button" class="btn btn-purple btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnSetPembelian" data-id="'.$this->encryption->encrypt($dl['id_pembelian']).'" data-jd="'.$dl['no_faktur_buy'].'" title="Tambah Barang"><i class="fas fa-cog"></i></button>

                    <button type="button" class="btn btn-danger btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnDelete" data-id="'.$this->encryption->encrypt($dl['id_pembelian']).'" title="Hapus data"><i class="fas fa-trash-alt"></i></button>';
                    $data[] = $row;
                }
                $output = array(
                    "draw" => $this->input->post('draw'),
                    "recordsTotal" => $this->mPembelian->count_all(),
                    "recordsFiltered" => $this->mPembelian->count_filtered(),
                    "data" => $data,
                );
            }
            //output to json format
            $this->output->set_content_type('application/json')->set_output(json_encode($output));
        }
    }

    public function create() {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            if(!empty($session)) {
                if($this->validasiDataValue() == FALSE) {
                    $result = array('status' => 'RC404', 'message' => $this->form_validation->error_array(), 'csrfHash' => $csrfHash);
                } else {
                    $data = $this->mPembelian->insertData();
                    if($data['response'] == 'ERROR') {
                        $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses insert data baru dengan nama '.$data['nama'].' gagal, karena ditemukan nama yang sama'), 'csrfHash' => $csrfHash);
                    } else if($data['response'] == 'SUCCESS') {
                        $result = array('status' => 'RC200', 'message' => 'Proses insert data baru dengan nama '.$data['nama'].' sukses', 'csrfHash' => $csrfHash);
                    }
                }
            } else {
                $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses insert data baru gagal, mohon coba kembali'), 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    public function details() {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            $contId   = $this->input->post('token', TRUE);
            if(!empty($contId) AND !empty($session)) {
                $data = $this->mPembelian->getDataDetail($this->encryption->decrypt($contId));
                $row = array();
                $row['no_faktur_buy']	    = !empty($data) ? $data['no_faktur_buy'] : '';
                $row['tgl_pembelian']	    = !empty($data) ? $data['tgl_pembelian'] : '';
                $row['catatan']	            = !empty($data) ? $data['catatan'] : '';
                $result = array('status' => 'RC200', 'message' => $row, 'csrfHash' => $csrfHash);
            } else {
                $result = array('status' => 'RC404', 'message' => array(), 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    public function update() {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            $contId   = escape($this->input->post('tokenId', TRUE));
            if(!empty($session) AND !empty($contId)) {
                if($this->validasiDataValue() == FALSE) {
                    $result = array('status' => 'RC404', 'message' => $this->form_validation->error_array(), 'csrfHash' => $csrfHash);
                } else {
                    $data = $this->mPembelian->updateData();
                    if($data['response'] == 'ERROR') {
                        $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses update data gagal, karena data tidak ditemukan'), 'csrfHash' => $csrfHash);
                    } else if($data['response'] == 'ERRDATA') {
                        $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses update data dengan faktur '.$data['nama'].' gagal, karena ditemukan faktur yang sama'), 'csrfHash' => $csrfHash);
                    } else if($data['response'] == 'SUCCESS') {
                        $result = array('status' => 'RC200', 'message' => 'Proses update data dengan faktur '.$data['nama'].' sukses', 'csrfHash' => $csrfHash);
                    }
                }
            } else {
                $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses update data gagal, mohon coba kembali'), 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    public function delete() {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            $contId   = escape($this->input->post('tokenId', TRUE));
            if(!empty($session) AND !empty($contId)) {
                $data = $this->mPembelian->deleteData();
                if($data['response'] == 'ERROR') {
                    $result = array('status' => 'RC404', 'message' => 'Proses delete data gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
                } else if($data['response'] == 'ERRDATA') {
                    $result = array('status' => 'RC404', 'message' => 'Proses delete data dengan faktur '.$data['nama'].' gagal, karena data sedang digunakan', 'csrfHash' => $csrfHash);
                } else if($data['response'] == 'SUCCESS') {
                    $result = array('status' => 'RC200', 'message' => 'Proses delete data dengan faktur '.$data['nama'].' sukses', 'csrfHash' => $csrfHash);
                }
            } else {
                $result = array('status' => 0, 'message' => 'Proses delete data gagal, mohon coba kembali', 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    public function rules_pembelian($name=null) {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            if($name == 'new-pembelian')
                $this->pembelianCreate();
            else if($name == 'set-jadwal')
                $this->pembelianUpdate();
            else
                $this->pembelianData();
        }
    }

    private function pembelianData() {
        $session    = $this->app_loader->current_account();
        $csrfHash   = $this->security->get_csrf_hash();
        $dataID     = $this->encryption->decrypt(escape($this->input->get('token', TRUE)));
        if(!empty($dataID) AND !empty($session)) {
            $data = $this->mPembelian->getDataListDetailPembelian($dataID);
            $matadiklat = array();
            foreach ($data as $q) {
                $isi['id_detail_pembelian'] 	= $this->encryption->encrypt($q['id_detail_pembelian']);
                $isi['nm_barang'] 	            = $q['nm_barang'];
                $isi['satuan'] 		            = $q['satuan'];
                $isi['qty_barang'] 		        = $q['qty_barang'];
                $isi['harga_barang'] 			= $q['harga_barang'];
                $isi['total_harga'] 			= $q['total_harga'];
                $isi['status'] 			        = convert_status($q['id_status_barang']);
                $matadiklat[$q['no_faktur_buy']][] = $isi;
            }
            $result = array('status' => 'RC200', 'message' => $matadiklat, 'csrfHash' => $csrfHash);
        } else {
            $result = array('status' => 'RC404', 'message' => array(), 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    private function validasiDataValueDetail() {
        $this->form_validation->set_rules('id_barang', 'Barang', 'required|trim');
        $this->form_validation->set_rules('qty_barang', 'Mata Diklat', 'required|trim');
        $this->form_validation->set_rules('harga_barang', 'Harga Barang', 'required|trim');
        $this->form_validation->set_rules('total_harga', 'Total Harga', 'required|trim');
        validation_message_setting();
        if($this->form_validation->run() == FALSE)
            return false;
        else
            return true;
    }

    private function pembelianCreate() {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $modId    = escape($this->input->post('tokenDetail', TRUE));
        if(!empty($session) AND !empty($modId)) {
            if($this->validasiDataValueDetail() == FALSE) {
                $result = array('status' => 'RC404', 'message' => $this->form_validation->error_array(), 'kode'=>$modId, 'csrfHash' => $csrfHash);
            } else {
                $data = $this->mPembelian->insertDetailPembelian();
                if($data['response'] == 'ERROR') {
                    $result = array('status' => 'RC404', 'message' => 'Proses insert data gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
                } else if($data['response'] == 'SUCCESS') {
                    $result = array('status' => 'RC200', 'message' => 'Proses insert data sukses', 'kode'=>$modId, 'csrfHash' => $csrfHash);
                }
            }
        } else {
            $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses insert data gagal, mohon coba kembali'), 'kode'=>$modId, 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    private function pembelianUpdate() {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $modId    = escape($this->input->post('tokenId', TRUE));
        $flag     = $this->encryption->decrypt(escape($this->input->post('flag', TRUE)));
        if(!empty($session) AND !empty($modId)) {
            $data = $this->mPembelian->updateDataMataDiklatWI();
            if($data['response'] == 'ERROR') {
                $result = array('status' => 'RC404', 'message' => 'Proses '.(($flag == 'DR') ? 'hapus' : 'update status').' data jadwal mata diklat gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
            } else if($data['response'] == 'SUCCESS') {
                $result = array('status' => 'RC200', 'message' => 'Proses '.(($flag == 'DR') ? 'hapus' : 'update status').' data jadwal mata diklat dengan judul '.$data['nama'].' sukses', 'kode'=>$modId, 'csrfHash' => $csrfHash);
            }
        } else {
            $result = array('status' => 'RC404', 'message' => 'Proses '.(($flag == 'DR') ? 'hapus' : 'update status').' data jadwal mata diklat gagal, mohon coba kembali', 'kode'=>$modId, 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }
}

// This is the end of fungsi class
