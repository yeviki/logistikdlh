<?php (defined('BASEPATH')) or exit('No direct script access allowed');

/**
 * Description of mata diklat class
 *
 * @author Yogi "solop" Kaputra
 */

class Permintaan extends SLP_Controller
{
    protected $_vwName  = '';
    protected $_uriName = '';
    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('model_permintaan' => 'mPermintaan', 'master/model_master' => 'mmas'));
        $this->_vwName = 'vpermintaan';
        $this->_uriName = 'data/permintaan';
    }

    private function validasiDataValue()
    {
        $this->form_validation->set_rules('no_faktur_req', 'No Faktur', 'required|trim');
        $this->form_validation->set_rules('tanggal_req', 'Tanggal Permintaan', 'required|trim');
        $this->form_validation->set_rules('catatan', 'Catatan', 'required|trim');
        validation_message_setting();
        if ($this->form_validation->run() == FALSE)
            return false;
        else
            return true;
    }

    public function index()
    {
        $this->breadcrumb->add('Dashboard', site_url('home'));
        $this->breadcrumb->add('Data', '#');
        $this->breadcrumb->add('Permintaan', site_url($this->_uriName));
        $this->session_info['page_name']        = 'Permintaan';
        $this->session_info['siteUri']          = $this->_uriName;
        $this->session_info['page_js']            = $this->load->view($this->_vwName . '/vjs', array('siteUri' => $this->_uriName), true);
        $this->session_info['data_barang']        = $this->mmas->getDataStok();
        $this->template->build($this->_vwName . '/vpage', $this->session_info);
    }

    public function listview()
    {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $data = array();
            $session = $this->app_loader->current_account();
            if (isset($session)) {
                $dataList = $this->mPermintaan->get_datatables();
                $no = $this->input->post('start');
                foreach ($dataList as $key => $dl) {

                    // Check Status Pengajuan Permintaan Barang
                    $data_status = $this->mPermintaan->getDataDetailPermintaan($dl['id_permintaan']);
                    $statusReq  = !empty($data_status) ? $data_status['status_req'] : 0;
                    if ($statusReq == 2) {
                        $setButton              = 'disabled';
                        $setButtonVerfikator    = '';
                        $setStatus              = 'Proses Pengajuan';
                        $setIcon                = 'fas fa-lock';
                        $setDetailPermin        = '';
                        $setRequest             = '';
                    } else if ($statusReq == 3) {
                        $setButton              = '';
                        $setStatus              = 'Update Stok';
                        $setIcon                = 'fas fa-truck-loading';
                        $setDetailPermin        = 'btnSetPermintaan';
                        $setRequest             = 'btnUpdateStok';
                    } else if ($statusReq == 4) {
                        $setButtonVerfikator    = 'disabled';
                        $setButton              = '';
                        $setStatus              = 'Done';
                        $setIcon                = 'fas fa-lock';
                        $setDetailPermin        = 'btnSetPermintaan';
                        $setRequest             = '';
                    } else {
                        $setButton              = '';
                        $setButtonVerfikator    = '';
                        $setStatus              = 'Ajukan Permintaan';
                        $setIcon                = 'fas fa-unlock';
                        $setDetailPermin        = 'btnSetPermintaan';
                        $setRequest             = 'btnRequest';
                    }

                    // Tombol Hak Akses Admin TPA
                    if ($this->app_loader->is_tpa()) {
                        $button = '<button type="button" class="btn btn-purple btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light ' . $setRequest . '" ' . $setButton . ' data-id="' . $this->encryption->encrypt($dl['id_permintaan']) . '" data-jd="' . $dl['no_faktur_req'] . '" data-st="' . $dl['status_req'] . '" title="' . $setStatus . '"><i class="' . $setIcon . '"></i> ' . $setStatus . '</button>
                    
                        <button type="button" class="btn btn-purple btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light ' . $setDetailPermin . '" ' . $setButton . ' data-id="' . $this->encryption->encrypt($dl['id_permintaan']) . '" data-jd="' . $dl['no_faktur_req'] . '" data-st="' . $dl['status_req'] . '" title="Tambah Barang"><i class="fas fa-cart-plus"></i></button>
                        
                        <button type="button" class="btn btn-orange btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnEdit" data-id="' . $this->encryption->encrypt($dl['id_permintaan']) . '" title="Edit data"><i class="fas fa-pencil-alt"></i></button>
                        
    
                        <button type="button" class="btn btn-danger btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnDelete" data-id="' . $this->encryption->encrypt($dl['id_permintaan']) . '" title="Hapus data"><i class="fas fa-trash-alt"></i></button>';
                    } else {
                        // Tombol Hak Akses Administrator UPTD
                        $button = '<button type="button" class="btn btn-purple btn-sm px-2 py-1 my-0 mx-0 waves-effect waves-light btnVerifikasi" ' . $setButtonVerfikator . ' data-id="' . $this->encryption->encrypt($dl['id_permintaan']) . '" data-jd="' . $dl['no_faktur_req'] . '" data-st="' . $dl['status_req'] . '" data-tgl="' . $dl['tanggal_req'] . '"  data-tpa="' . $dl['nama_tpa'] . '" title="Lihat Permintaan"><i class="fas fa-cart-plus"></i> Lihat Permintaan</button>';
                    }

                    $no++;
                    $row = array();
                    $row[] = $no;
                    $row[] = $dl['tanggal_req'];
                    $row[] = $dl['no_faktur_req'];
                    $row[] = $dl['catatan'];
                    $row[] = convert_stat_req($dl['status_req']);
                    $row[] = $button;
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

    public function create()
    {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            if (!empty($session)) {
                if ($this->validasiDataValue() == FALSE) {
                    $result = array('status' => 'RC404', 'message' => $this->form_validation->error_array(), 'csrfHash' => $csrfHash);
                } else {
                    $data = $this->mPermintaan->insertData();
                    if ($data['response'] == 'ERROR') {
                        $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses insert data baru dengan faktur ' . $data['nama'] . ' gagal, karena ditemukan faktur yang sama'), 'csrfHash' => $csrfHash);
                    } else if ($data['response'] == 'SUCCESS') {
                        $result = array('status' => 'RC200', 'message' => 'Proses insert data baru dengan faktur ' . $data['nama'] . ' sukses', 'csrfHash' => $csrfHash);
                    }
                }
            } else {
                $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses insert data baru gagal, mohon coba kembali'), 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    public function details()
    {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            $contId   = $this->input->post('token', TRUE);
            if (!empty($contId) and !empty($session)) {
                $data = $this->mPermintaan->getDataDetail($this->encryption->decrypt($contId));
                $row = array();
                $row['no_faktur_req']        = !empty($data) ? $data['no_faktur_req'] : '';
                $row['tanggal_req']            = !empty($data) ? $data['tanggal_req'] : '';
                $row['catatan']                = !empty($data) ? $data['catatan'] : '';
                $result = array('status' => 'RC200', 'message' => $row, 'csrfHash' => $csrfHash);
            } else {
                $result = array('status' => 'RC404', 'message' => array(), 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    public function update()
    {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            $contId   = escape($this->input->post('tokenId', TRUE));
            if (!empty($session) and !empty($contId)) {
                if ($this->validasiDataValue() == FALSE) {
                    $result = array('status' => 'RC404', 'message' => $this->form_validation->error_array(), 'csrfHash' => $csrfHash);
                } else {
                    $data = $this->mPermintaan->updateData();
                    if ($data['response'] == 'ERROR') {
                        $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses update data gagal, karena data tidak ditemukan'), 'csrfHash' => $csrfHash);
                    } else if ($data['response'] == 'ERRDATA') {
                        $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses update data dengan faktur ' . $data['nama'] . ' gagal, karena ditemukan faktur yang sama'), 'csrfHash' => $csrfHash);
                    } else if ($data['response'] == 'SUCCESS') {
                        $result = array('status' => 'RC200', 'message' => 'Proses update data dengan faktur ' . $data['nama'] . ' sukses', 'csrfHash' => $csrfHash);
                    }
                }
            } else {
                $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses update data gagal, mohon coba kembali'), 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    public function delete()
    {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            $session  = $this->app_loader->current_account();
            $csrfHash = $this->security->get_csrf_hash();
            $contId   = escape($this->input->post('tokenId', TRUE));
            if (!empty($session) and !empty($contId)) {
                $data = $this->mPermintaan->deleteData();
                if ($data['response'] == 'ERROR') {
                    $result = array('status' => 'RC404', 'message' => 'Proses delete data gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
                } else if ($data['response'] == 'ERRDATA') {
                    $result = array('status' => 'RC404', 'message' => 'Proses delete data dengan faktur ' . $data['nama'] . ' gagal, karena data sedang digunakan', 'csrfHash' => $csrfHash);
                } else if ($data['response'] == 'SUCCESS') {
                    $result = array('status' => 'RC200', 'message' => 'Proses delete data dengan faktur ' . $data['nama'] . ' sukses', 'csrfHash' => $csrfHash);
                }
            } else {
                $result = array('status' => 0, 'message' => 'Proses delete data gagal, mohon coba kembali', 'csrfHash' => $csrfHash);
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($result));
        }
    }

    //------------------------------------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------------------------------------//

    // Fungsi Pengajuan Permintaan Barang
    public function rules_permintaan($name = null)
    {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            if ($name == 'new-permintaan')
                $this->permintaanCreate();
            else if ($name == 'set-detail')
                $this->deleteDetail();
            else if ($name == 'set-request')
                $this->ajukanPermintaan();
            else if ($name == 'update-stok')
                $this->rulesUpdateStok();
            else
                $this->permintaanData();
        }
    }

    private function permintaanData()
    {
        $session    = $this->app_loader->current_account();
        $csrfHash   = $this->security->get_csrf_hash();
        $dataID     = $this->encryption->decrypt(escape($this->input->get('token', TRUE)));
        if (!empty($dataID) and !empty($session)) {
            $data = $this->mPermintaan->getDataListDetailPermintaan($dataID);
            $matadiklat = array();
            foreach ($data as $q) {
                $isi['id_detail_permintaan']     = $this->encryption->encrypt($q['id_detail_permintaan']) . '####' . $q['status_det_req'];
                $isi['nm_barang']                 = $q['nm_barang'];
                $isi['satuan']                     = $q['satuan'];
                $isi['qty_req']                 = $q['qty_req'];
                $isi['subtotal']                 = !empty($q) ? $q['qty_req'] : 0;
                $isi['acctotal']                 = !empty($q) ? $q['qty_acc'] : 0;
                if ($q['status_req'] == 3 || $q['status_req'] == 4) {
                    $isi['qty_acc']                 = $q['qty_acc'];
                } else {
                    $isi['qty_acc']                 = '';
                }
                $isi['status']                     = convert_stat_detail_req($q['status_det_req']);
                $matadiklat[$q['no_faktur_req']][] = $isi;
            }
            $result = array('status' => 'RC200', 'message' => $matadiklat, 'csrfHash' => $csrfHash);
        } else {
            $result = array('status' => 'RC404', 'message' => array(), 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    private function validasiDataValueDetail()
    {
        $this->form_validation->set_rules('id_barang', 'Barang', 'required|trim');
        $this->form_validation->set_rules('qty_req', 'Jumlah', 'required|trim');
        validation_message_setting();
        if ($this->form_validation->run() == FALSE)
            return false;
        else
            return true;
    }

    private function permintaanCreate()
    {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $modId    = escape($this->input->post('tokenDetail', TRUE));
        if (!empty($session) and !empty($modId)) {
            if ($this->validasiDataValueDetail() == FALSE) {
                $result = array('status' => 'RC404', 'message' => $this->form_validation->error_array(), 'kode' => $modId, 'csrfHash' => $csrfHash);
            } else {
                $data = $this->mPermintaan->insertDetailPermintaan();
                if ($data['response'] == 'ERROR') {
                    $result = array('status' => 'RC404', 'message' => 'Proses insert data gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
                } else if ($data['response'] == 'SUCCESS') {
                    $result = array('status' => 'RC200', 'message' => 'Proses insert data sukses', 'kode' => $modId, 'csrfHash' => $csrfHash);
                } else if ($data['response'] == 'PENGAJUAN') {
                    $result = array('status' => 'RC404', 'message' => 'Pengajuan permintaan barang sudah dilakukan, tidak bisa menambah permintaan barang lagi', 'kode' => $modId, 'csrfHash' => $csrfHash);
                } else if ($data['response'] == 'STOK') {
                    $result = array('status' => 'RC404', 'message' => 'Stok barang kosong', 'kode' => $modId, 'csrfHash' => $csrfHash);
                } else if ($data['response'] == 'MELEBIHI') {
                    $result = array('status' => 'RC404', 'message' => 'Permintaan melebihi stok yang tersedia', 'kode' => $modId, 'csrfHash' => $csrfHash);
                }
            }
        } else {
            $result = array('status' => 'RC404', 'message' => array('isi' => 'Proses insert data gagal, mohon coba kembali'), 'kode' => $modId, 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    private function deleteDetail()
    {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $modId    = escape($this->input->post('tokenId', TRUE));
        // die($modId);
        if (!empty($session) and !empty($modId)) {
            $data = $this->mPermintaan->deleteDetail();
            if ($data['response'] == 'ERROR') {
                $result = array('status' => 'RC404', 'message' => 'Proses data permintaan barang gagal, karena data tidak ditemukan', 'csrfHash' => $csrfHash);
            } else if ($data['response'] == 'SUCCESS') {
                $result = array('status' => 'RC200', 'message' => 'Hapus permintaan barang dengan faktur ' . $data['nama'] . ' sukses', 'kode' => $modId, 'csrfHash' => $csrfHash);
            } else if ($data['response'] == 'STOK') {
                $result = array('status' => 'RC404', 'message' => 'Proses data permintaan barang dengan faktur ' . $data['nama'] . ' gagal, stok sudah terupdate', 'kode' => $modId, 'csrfHash' => $csrfHash);
            } else if ($data['response'] == 'PENGAJUAN') {
                $result = array('status' => 'RC404', 'message' => 'Pengajuan permintaan barang sudah dilakukan, tidak bisa menambah/menghapus permintaan barang', 'kode' => $modId, 'csrfHash' => $csrfHash);
            }
        } else {
            $result = array('status' => 'RC404', 'message' => 'Proses data permintaan barang gagal, mohon coba kembali', 'kode' => $modId, 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    // Fungsi Tombol Pengajuan Permintaan Barang
    private function ajukanPermintaan()
    {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $modId    = escape($this->input->post('tokenId', TRUE));
        // die($modId);
        if (!empty($session) and !empty($modId)) {
            $data = $this->mPermintaan->requestBarang();
            if ($data['response'] == 'ERROR') {
                $result = array('status' => 'RC404', 'message' => 'Proses pengajuan permintaan barang gagal, pastikan detail permintaan barang sudah diisi', 'csrfHash' => $csrfHash);
            } else if ($data['response'] == 'SUCCESS') {
                $result = array('status' => 'RC200', 'message' => 'Proses pengajuan permintaan barang dengan faktur ' . $data['nama'] . ' sukses', 'csrfHash' => $csrfHash);
            } else if ($data['response'] == 'PENGAJUAN') {
                $result = array('status' => 'RC404', 'message' => 'Pengajuan permintaan barang sedang diproses', 'csrfHash' => $csrfHash);
            }
        } else {
            $result = array('status' => 'RC404', 'message' => 'Proses pengajuan permintaan barang gagal, mohon coba kembali', 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }


    // Fungsi Tombol Update Stok Barang Pada TPA
    private function rulesUpdateStok()
    {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $tokenPermin   = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        $statusRq   = $this->input->post('statusRq', TRUE);
        if (!empty($session) and !empty($tokenPermin)) {
            if ($statusRq == 4) {
                $result = array('status' => 'RC404', 'message' => 'Proses update stok barang gagal, stok sudah diupdate', 'csrfHash' => $csrfHash);
            } else {
                $data = $this->mPermintaan->updateStokTPA();
                if ($data['response'] == 'ERROR') {
                    $result = array('status' => 'RC404', 'message' => 'Proses update stok barang gagal, stok sudah terupdate', 'csrfHash' => $csrfHash);
                } else 
                if ($data['response'] == 'SUCCESS') {
                    $result = array('status' => 'RC200', 'message' => 'Proses update stok barang berhasil', 'csrfHash' => $csrfHash);
                }
            }
        } else {
            $result = array('status' => 'RC404', 'message' => 'Proses update stok barang gagal, mohon coba kembali', 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    //------------------------------------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------------------------------------//
    //------------------------------------------------------------------------------------------------------------------------------------//

    // Verifikasi permintaan barang
    public function rules_verifikasi($name = null)
    {
        if (!$this->input->is_ajax_request()) {
            exit('No direct script access allowed');
        } else {
            if ($name == 'new-rules')
                $this->rulesCreate();
            else
                $this->tampilData();
        }
    }

    private function tampilData()
    {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $dataID     = $this->encryption->decrypt(escape($this->input->get('token', TRUE)));
        if (!empty($session)) {
            $data = $this->mPermintaan->getDataPermintaan($dataID);
            $rules = array();
            foreach ($data as $q) {
                $isi['id_detail_permintaan']         = $q['id_detail_permintaan'];
                $isi['nm_barang']                     = $q['nm_barang'];
                $isi['qty_req']                     = $q['qty_req'];
                $isi['qty_acc']                     = !empty($q) ? $q['qty_acc'] : 0;
                $isi['total_req']                     = !empty($q) ? $q['qty_req'] : 0;
                $rules[] = $isi;
            }
            $result = array('status' => 'RC200', 'message' => $rules, 'csrfHash' => $csrfHash);
        } else {
            $result = array('status' => 'RC404', 'message' => array(), 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }

    private function rulesCreate()
    {
        $session  = $this->app_loader->current_account();
        $csrfHash = $this->security->get_csrf_hash();
        $tokenPermin   = $this->encryption->decrypt(escape($this->input->post('tokenPermin', TRUE)));
        $check_data    = $this->mPermintaan->checkStatusPermintaan($tokenPermin);
        $status_req    = !empty($check_data) ? $check_data['status_req'] : 0;
        if (!empty($session) and !empty($tokenPermin)) {
            if ($status_req != 2) {
                $result = array('status' => 'RC404', 'message' => 'Peringatan!!, Data sedang dalam verifikasi', 'csrfHash' => $csrfHash);
            } else {
                $data = $this->mPermintaan->insertDataPersetujuan();
                if ($data['response'] == 'ERROR') {
                    $result = array('status' => 'RC404', 'message' => 'Proses simpan data persetujuan barang gagal, karena isi tidak lengkap', 'csrfHash' => $csrfHash);
                } else 
                if ($data['response'] == 'SUCCESS') {
                    $result = array('status' => 'RC200', 'message' => 'Proses simpan data persetujuan barang berhasil', 'csrfHash' => $csrfHash);
                }
            }
        } else {
            $result = array('status' => 'RC404', 'message' => 'Proses simpan data persetujuan barang gagal, mohon coba kembali', 'csrfHash' => $csrfHash);
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($result));
    }
}

// This is the end of fungsi class
