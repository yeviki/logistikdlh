<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Description of mata diklat class
 *
 * @author Yogi "solop" Kaputra
 */

class Permintaan extends SLP_Controller {
    protected $_vwName  = '';
    protected $_uriName = '';
    public function __construct() {
        parent::__construct();
        $this->load->model(array('model_permintaan' => 'mPermintaan', 'master/model_master' => 'mmas'));
        $this->_vwName = 'vpermintaan';
        $this->_uriName = 'data/permintaan';
    }

    private function validasiDataValue() {
        $this->form_validation->set_rules('no_faktur_req', 'No Faktur', 'required|trim');
        $this->form_validation->set_rules('tanggal_req', 'Tanggal Permintaan', 'required|trim');
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
        $this->breadcrumb->add('Permintaan', site_url($this->_uriName));
        $this->session_info['page_name']        = 'Permintaan';
        $this->session_info['siteUri']          = $this->_uriName;
        $this->session_info['page_js']	        = $this->load->view($this->_vwName.'/vjs', array('siteUri'=>$this->_uriName), true);
        $this->session_info['data_barang']	    = $this->mmas->getDataStok();
        $this->template->build($this->_vwName.'/vpage', $this->session_info);
    }

    public function listview() {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $data = array();
            $session = $this->app_loader->current_account();
            if(isset($session)){
                $dataList = $this->mPermintaan->get_datatables();
                $no = $this->input->post('start');
                foreach ($dataList as $key => $dl) {
                    $no++;
                    $row = array();
                    $row[] = $no;
                    $row[] = $dl['tanggal_req'];
                    $row[] = $dl['no_faktur_req'];
                    $row[] = $dl['catatan'];
                    $row[] = '<button type="button" class="btn btn-orange btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnEdit" data-id="'.$this->encryption->encrypt($dl['id_permintaan']).'" title="Edit data"><i class="fas fa-pencil-alt"></i></button>

                    <button type="button" class="btn btn-purple btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnSetPembelian" data-id="'.$this->encryption->encrypt($dl['id_permintaan']).'" data-jd="'.$dl['no_faktur_req'].'" title="Tambah Barang"><i class="fas fa-cart-plus"></i></button>

                    <button type="button" class="btn btn-danger btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnDelete" data-id="'.$this->encryption->encrypt($dl['id_permintaan']).'" title="Hapus data"><i class="fas fa-trash-alt"></i></button>';
                    $data[] = $row;
                }
                $output = array(
                    "draw" => $this->input->post('draw'),
                    "recordsTotal" => $this->mPermintaan->count_all(),
                    "recordsFiltered" => $this->mPermintaan->count_filtered(),
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
                    $data = $this->mPermintaan->insertData();
                    if($data['response'] == 'ERROR') {
                        $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses insert data baru dengan faktur '.$data['nama'].' gagal, karena ditemukan faktur yang sama'), 'csrfHash' => $csrfHash);
                    } else if($data['response'] == 'SUCCESS') {
                        $result = array('status' => 'RC200', 'message' => 'Proses insert data baru dengan faktur '.$data['nama'].' sukses', 'csrfHash' => $csrfHash);
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
                $data = $this->mPermintaan->getDataDetail($this->encryption->decrypt($contId));
                $row = array();
                $row['no_faktur_req']	    = !empty($data) ? $data['no_faktur_req'] : '';
                $row['tanggal_req']	        = !empty($data) ? $data['tanggal_req'] : '';
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
                    $data = $this->mPermintaan->updateData();
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
                $data = $this->mPermintaan->deleteData();
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

    public function rules_permintaan($name=null) {
        if(!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            if($name == 'new-permintaan')
                $this->permintaanCreate();
            else if($name == 'set-detail')
                $this->pembelianUpdate();
            else
                $this->permintaanData();
        }
    }

    private function permintaanData() {
        $session    = $this->app_loader->current_account();
        $csrfHash   = $this->security->get_csrf_hash();
        $dataID     = $this->encryption->decrypt(escape($this->input->get('token', TRUE)));
        if(!empty($dataID) AND !empty($session)) {
            $data = $this->mPermintaan->getDataListDetailPembelian($dataID);
            $matadiklat = array();
            foreach ($data as $q) {
                $isi['id_detail_permintaan'] 	= $this->encryption->encrypt($q['id_detail_permintaan']).'####'.$q['id_status_req'];
                $isi['nm_barang'] 	            = $q['nm_barang'];
                $isi['satuan'] 		            = $q['satuan'];
                $isi['qty_req'] 		        = $q['qty_req'];
                $isi['subtotal'] 			    = $q['qty_req'];
                $isi['status'] 			        = convert_status_stok($q['id_status_req']);
                $matadiklat[$q['no_faktur_req']][] = $isi;
            }
            $result = array('status' => 'RC200', 'message' => $matadiklat, 'csrfHash' => $csrfHash);
        } else {
            $result = array('status' => 'RC404', 'message' => array(), 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    private function validasiDataValueDetail() {
        $this->form_validation->set_rules('id_barang', 'Barang', 'required|trim');
        $this->form_validation->set_rules('qty_req', 'Jumlah', 'required|trim');
        validation_message_setting();
        if($this->form_validation->run() == FALSE)
            return false;
        else
            return true;
    }

    private function permintaanCreate() {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $modId    = escape($this->input->post('tokenDetail', TRUE));
        $id_barang    = escape($this->input->post('id_barang', TRUE));
        $qty_req    = escape($this->input->post('qty_req', TRUE));
        if(!empty($session) AND !empty($modId)) {
            $dataCheck = $this->mPermintaan->checkStok($id_barang);
            if ($dataCheck['qty_stok'] == 0) {
                $result = array('status' => 'RC404', 'message' => 'Stok barang kosong', 'csrfHash' => $csrfHash);
            } else if ($qty_req > $dataCheck['qty_stok']) {
                $result = array('status' => 'RC404', 'message' => 'Permintaan melebihi stok yang tersedia', 'csrfHash' => $csrfHash);
            } else {
                if($this->validasiDataValueDetail() == FALSE) {
                    $result = array('status' => 'RC404', 'message' => $this->form_validation->error_array(), 'kode'=>$modId, 'csrfHash' => $csrfHash);
                } else {
                    $data = $this->mPermintaan->insertDetailPembelian();
                    if($data['response'] == 'ERROR') {
                        $result = array('status' => 'RC404', 'message' => 'Proses insert data gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
                    }  else if ($data['response'] == 'SUCCESS') {
                        $result = array('status' => 'RC200', 'message' => 'Proses insert data sukses', 'kode'=>$modId, 'csrfHash' => $csrfHash);
                    }
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
        // die($modId);
        if(!empty($session) AND !empty($modId)) {
            $data = $this->mPermintaan->updateStokBarang();
            if($data['response'] == 'ERROR') {
                $result = array('status' => 'RC404', 'message' => 'Proses '.(($flag == 'DR') ? 'hapus' : 'update status').' data permintaan barang gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
            } else if($data['response'] == 'SUCCESS') {
                $result = array('status' => 'RC200', 'message' => 'Proses '.(($flag == 'DR') ? 'hapus' : 'update status').' data permintaan barang dengan faktur '.$data['nama'].' sukses', 'kode'=>$modId, 'csrfHash' => $csrfHash);
            } else if($data['response'] == 'STOK') {
                $result = array('status' => 'RC404', 'message' => 'Proses '.(($flag == 'DR') ? 'hapus' : 'update status').' data permintaan barang dengan faktur '.$data['nama'].' gagal, stok sudah terupdate', 'kode'=>$modId, 'csrfHash' => $csrfHash);
            }
        } else {
            $result = array('status' => 'RC404', 'message' => 'Proses '.(($flag == 'DR') ? 'hapus' : 'update status').' data permintaan barang gagal, mohon coba kembali', 'kode'=>$modId, 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }
}

// This is the end of fungsi class
