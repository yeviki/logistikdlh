<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Description of mata diklat model
 *
 * @author Yogi "solop" Kaputra
 */

class Model_permintaan extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /*Fungsi Get Data List*/
    var $search = array('no_faktur_req');
    public function get_datatables() {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
            $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function count_filtered() {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    public function count_all() {
        $this->db->select('a.id_permintaan,
                            a.no_faktur_req,
                            a.tanggal_req,
                            a.catatan,
                            a.status_req,
                            a.id_tpa,
                            b.nama_tpa
                            ');
        $this->db->from('data_permintaan a');
        $this->db->join('ms_tpa b', 'a.id_tpa = b.id_tpa', 'inner');
        if($this->app_loader->is_tpa()) {
            $this->db->where('a.id_tpa', $this->app_loader->current_tpaid());
        }
        return $this->db->count_all_results();
    }

    private function _get_datatables_query() {
        $this->db->select('a.id_permintaan,
                            a.no_faktur_req,
                            a.tanggal_req,
                            a.catatan,
                            a.status_req,
                            a.id_tpa,
                            b.nama_tpa
                            ');
        $this->db->from('data_permintaan a');
        $this->db->join('ms_tpa b', 'a.id_tpa = b.id_tpa', 'inner');
        
        if($this->app_loader->is_tpa()) {
            $this->db->where('a.id_tpa', $this->app_loader->current_tpaid());
        } else {
            $this->db->where('a.status_req', 2);
        }
        $i = 0;
        foreach ($this->search as $item) { // loop column
            if($_POST['search']['value']) { // if datatable send POST for search
                if($i===0) { // first loop
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                } else {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
                if(count($this->search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }
        $this->db->order_by('a.id_permintaan ASC');
    }

    /*Fungsi get data edit by id*/
    public function getDataDetail($id) {
        $this->db->where('id_permintaan', abs($id));
        $query = $this->db->get('data_permintaan');
        return $query->row_array();
    }

    /* Fungsi untuk insert data */
    public function insertData() {
        //get data
        $userLogin      = $this->app_loader->current_tpaid();
        $create_by      = $this->app_loader->current_account();
        $create_date    = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip      = $this->input->ip_address();
        $no_faktur_req  = escape($this->input->post('no_faktur_req', TRUE));
        //cek nama matadiklat duplicate
        $this->db->where('no_faktur_req', $no_faktur_req);
        $qTot = $this->db->count_all_results('data_permintaan');
        if($qTot > 0)
            return array('response'=>'ERROR', 'nama'=>$no_faktur_req);
        else {
            $data = array(
                'no_faktur_req'     => $no_faktur_req,
                'tanggal_req'       => escape($this->input->post('tanggal_req', TRUE)),
                'catatan'           => escape($this->input->post('catatan', TRUE)),
                'id_tpa'            => $userLogin,
                'status_req'        => '1',
                'create_by'         => $create_by,
                'create_date'       => $create_date,
                'create_ip'         => $create_ip,
                'mod_by'            => $create_by,
                'mod_date'          => $create_date,
                'mod_ip'            => $create_ip
            );
            /*query insert*/
            $this->db->insert('data_permintaan', $data);
            return array('response'=>'SUCCESS', 'nama'=>$no_faktur_req);
        }
    }

    /* Fungsi untuk update data */
    public function updateData() {
        //get data
        $create_by          = $this->app_loader->current_account();
        $create_date        = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip          = $this->input->ip_address();
        $id_permintaan	    = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        $no_faktur_req      = escape($this->input->post('no_faktur_req', TRUE));
        //cek data by id
        $data_search = $this->getDataDetail($id_permintaan);
        if(count($data_search) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            //cek data duplicate
            $this->db->where('no_faktur_req', $no_faktur_req);
            $this->db->where('id_permintaan !=', $id_permintaan);
            $qTot = $this->db->count_all_results('data_permintaan');
            if($qTot > 0)
                return array('response'=>'ERRDATA', 'nama'=>$no_faktur_req);
            else {
                $data = array(
                    'no_faktur_req'     => $no_faktur_req,
                    'tanggal_req'       => escape($this->input->post('tanggal_req', TRUE)),
                    'catatan'           => escape($this->input->post('catatan', TRUE)),
                    'id_tpa'            => '0',
                    'status_req'        => '1',
                    'mod_by'            => $create_by,
                    'mod_date'          => $create_date,
                    'mod_ip'            => $create_ip
                );
                /*query update*/
                $this->db->where('id_permintaan', abs($id_permintaan));
                $this->db->update('data_permintaan', $data);
                return array('response'=>'SUCCESS', 'nama'=>$no_faktur_req);
            }
        }
    }

    /* Fungsi untuk delete data */
    public function deleteData() {
        $id = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        //cek data by id
        $dataSearch = $this->getDataDetail($id);
        $no_faktur_req = !empty($dataSearch) ? $dataSearch['no_faktur_req'] : '';
        if (count($dataSearch) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            $this->db->where('id_permintaan', abs($id));
            $count = $this->db->count_all_results('detail_permintaan');
            if ($count > 0)
                return array('response'=>'ERRDATA', 'nama'=>$no_faktur_req);
            else {
                $this->db->where('id_permintaan', abs($id));
                $this->db->delete('data_permintaan');
                return array('response'=>'SUCCESS', 'nama'=>$no_faktur_req);
            }
        }
    }


    /* get data list detail pembelian */
    public function getDataListDetailPembelian($id_permintaan) {
        $this->db->select('a.id_permintaan,
                            a.no_faktur_req,
                            a.tanggal_req,
                            a.status_req,
                            b.id_detail_permintaan,
                            b.id_barang,
                            b.qty_req,
                            b.qty_acc,
                            b.status_det_req,
                            c.nm_barang,
                            c.id_satuan,
                            c.id_kat_barang,
                            d.satuan,
                            e.kategori
                            ');
        $this->db->from('data_permintaan a');
        $this->db->join('detail_permintaan b', 'b.id_permintaan = a.id_permintaan', 'inner');
        $this->db->join('data_barang c', 'b.id_barang = c.id_barang', 'inner');
        $this->db->join('ref_satuan d', 'c.id_satuan = d.id_satuan', 'inner');
        $this->db->join('ref_kategori e', 'c.id_kat_barang = e.id_kat_barang', 'inner');
        $this->db->where('a.id_permintaan', abs($id_permintaan));
        $query = $this->db->get();
        return $query->result_array();
    }

    /*Fungsi get data edit by id*/
    public function getDataDetailPermintaan($id_permintaan) {
        $this->db->select('a.id_permintaan,
                            a.no_faktur_req,
                            a.tanggal_req,
                            a.status_req,
                            a.id_tpa,
                            b.id_detail_permintaan,
                            b.id_barang,
                            b.qty_req,
                            b.qty_acc,
                            b.status_det_req,
                            c.nm_barang,
                            c.id_satuan,
                            c.id_kat_barang,
                            d.satuan,
                            e.kategori,
                            f.nama_tpa
                            ');
        $this->db->from('data_permintaan a');
        $this->db->join('detail_permintaan b', 'b.id_permintaan = a.id_permintaan', 'inner');
        $this->db->join('data_barang c', 'b.id_barang = c.id_barang', 'inner');
        $this->db->join('ref_satuan d', 'c.id_satuan = d.id_satuan', 'inner');
        $this->db->join('ref_kategori e', 'c.id_kat_barang = e.id_kat_barang', 'inner');
        $this->db->join('ms_tpa f', 'a.id_tpa = f.id_tpa', 'inner');
        $this->db->where('a.id_permintaan', abs($id_permintaan));
        $query = $this->db->get();
        return $query->row_array();
    }

    /*Fungsi cek stok barang*/
    public function checkStok($id) {
        $this->db->where('id_barang', abs($id));
        $query = $this->db->get('data_gudang');
        return $query->row_array();
    }

    /* Fungsi untuk insert data */
    public function insertDetailPembelian() {
        //get data
        $tahun          = gmdate('Y');
        $create_by      = $this->app_loader->current_account();
        $create_date    = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip      = $this->input->ip_address();
        $id_permintaan	= $this->encryption->decrypt(escape($this->input->post('tokenDetail', TRUE)));
        $statReq        = escape($this->input->post('statRequest', TRUE));
        $id_barang      = escape($this->input->post('id_barang', TRUE));
        $qty_req        = escape($this->input->post('qty_req', TRUE));
        
        $dataCheck = $this->mPermintaan->checkStok($id_barang);
        if ($statReq != 1) {
            return array('response'=>'PENGAJUAN');
        } else {
            if ($dataCheck['qty_stok'] == 0) {
                return array('response'=>'STOK');
            } else if ($qty_req > $dataCheck['qty_stok']) {
                return array('response'=>'MELEBIHI');
            } else {
            $data = array(
                'id_permintaan'     => $id_permintaan,
                'id_barang'         => escape($this->input->post('id_barang', TRUE)),
                'qty_req'           => escape($this->input->post('qty_req', TRUE)),
                'qty_acc'           => '0',
                'status_det_req'     => '0',
                'create_by'         => $create_by,
                'create_date'       => $create_date,
                'create_ip'         => $create_ip,
                'mod_by'            => $create_by,
                'mod_date'          => $create_date,
                'mod_ip'            => $create_ip
            );
            $this->db->insert('detail_permintaan', $data);
            return array('response'=>'SUCCESS');
            }
        }
    }

    /* Fungsi untuk delete detail permintaan */
    public function deleteDetail() {
        //get data
        $id    = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        $flag  = $this->encryption->decrypt(escape($this->input->post('flag', TRUE)));
        $detailPembelian = escape($this->input->post('detailId', TRUE));
        //cek data by id
        $dataMD = $this->getDataDetailPermintaan($id);
        $no_faktur_req = !empty($dataMD) ? $dataMD['no_faktur_req'] : '';
        $statusReq = !empty($dataMD) ? $dataMD['status_req'] : '';
        if (count($dataMD) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            foreach ($detailPembelian as $key => $r) {
                list($idPembelian,$status) = explode('####',$r);
                if ($statusReq != 1) {
                    return array('response'=>'PENGAJUAN', 'nama'=>$no_faktur_req);
                } else {
                    $this->db->where('id_detail_permintaan', abs($this->encryption->decrypt($idPembelian)));
                    $this->db->where('id_permintaan', abs($id));
                    if ($status == 0) {
                        $this->db->delete('detail_permintaan');
                    } 
                }
                
            }

            return array('response'=>'SUCCESS', 'nama'=>$no_faktur_req);
        }
    }

    /* Fungsi untuk pengajuan permintaan barang */
    public function requestBarang() {
        //get data
        $id    = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        //cek data by id
        $dataMD = $this->getDataDetailPermintaan($id);
        $no_faktur_req = !empty($dataMD) ? $dataMD['no_faktur_req'] : '';
        $statusReq = !empty($dataMD) ? $dataMD['status_req'] : '';
        if (count($dataMD) <= 0)
            return array('response'=>'ERROR');
        else {
            if ($statusReq==2) {
                return array('response'=>'PENGAJUAN', 'nama'=>$no_faktur_req);
            } else {
                $this->db->set('status_req', 2);
                $this->db->where('id_permintaan', abs($id));
                $this->db->update('data_permintaan');
    
                return array('response'=>'SUCCESS', 'nama'=>$no_faktur_req);
            }
        }
    }


    //---------------------------------------------------------------------------------------------------------------------------------//
    //---------------------------------------------------------------------------------------------------------------------------------//
    //---------------------------------------------------------------------------------------------------------------------------------//

    /* get data permintaan barang TPA */
    public function getDataPermintaan($id) {
        $this->db->select('a.id_detail_permintaan,
                           a.id_permintaan,
                           a.id_barang,
                           a.qty_req,
                           a.qty_acc,
                           a.status_det_req,
                           b.no_faktur_req,
                           b.tanggal_req,
                           b.id_tpa,
                           b.status_req,
                           c.nm_barang
                           ');
        $this->db->from('detail_permintaan a');
        $this->db->join('data_permintaan b', 'a.id_permintaan = b.id_permintaan', 'inner');
        $this->db->join('data_barang c', 'a.id_barang = c.id_barang', 'inner');
        $this->db->where('a.id_permintaan', $id);
        $query = $this->db->get();
        return $query->result_array();
    }

    /*Fungsi check status permintaan barang*/
    public function checkStatusPermintaan($id) {
        $this->db->select('a.id_permintaan,
						 a.no_faktur_req,
						 a.tanggal_req,
						 a.id_tpa,
						 a.status_req
                         ');
        $this->db->from('data_permintaan a');
        $this->db->where('a.id_permintaan', $id);
        $query = $this->db->get();
        return $query->row_array();
    }

    /*insert data persetujuan permintaan barang*/
    public function insertDataPersetujuan() {
        //get data
        $create_by              = $this->app_loader->current_account();
        $create_date            = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip              = $this->input->ip_address();
        $tahun                  = gmdate('Y');

        $id       = $this->encryption->decrypt(escape($this->input->post('tokenPermin', TRUE)));

        // $data = [];
        $detail_permintaan      = $this->input->post('detail_permintaan');
        $qty_acc                = $this->input->post('qty_acc');

        // Cek data qty_acc jika ada yang kosong
        // $cekKosong = FALSE;
        // foreach ($qty_acc as $key => $value) {
        //     $check_qty_acc = trim($value);
        //     if (empty($check_qty_acc)) {
        //         return array('response'=>'ERROR');
        //         $cekKosong = TRUE;
        //     } else {
        //         $cekKosong = FALSE;
        //     }
        // }

        // if($cekKosong == FALSE){
            foreach ($qty_acc as $key => $value) {

                // $data[$key][$persetujuan[$key]] = $value;
                    $this->db->where('id_detail_permintaan', $detail_permintaan[$key]);
                    $this->db->update('detail_permintaan', array('qty_acc' => $value));

                    $this->db->where('id_permintaan', abs($id));
                    $this->db->update('data_permintaan', array('status_req' => 3));
            }
            return array('response'=>'SUCCESS');
        // }
    }

    /*update stok permintaan barang*/
    public function checkLogistik($id) {
        $this->db->select('a.id_barang,
						 a.stok_logistik,
						 a.id_tpa
                         ');
        $this->db->from('data_distribusi a');
        $this->db->where('a.id_barang', $id);
        $query = $this->db->get();
        return $query->row_array();
    }
 
    public function updateStokTPA() {
        $id    = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        $dataCheck = $this->getDataPermintaan($id);
        // print_r($dataCheck);die;
        foreach ($dataCheck as $key => $value) {
            $checkDistribusi = function($id) {
                $check = $this->db->get_where('data_distribusi', ['id_barang' => $id]);
                if($check->num_rows() > 0) {
                    return true;
                } else {
                    return false;
                }
            };
        
            if($checkDistribusi($value['id_barang']) == true) {
                $this->db->set('stok_logistik', 'stok_logistik +'.$value['qty_acc'], false);
                $this->db->where('id_barang', $value['id_barang']);
                $this->db->update('data_distribusi');
            } else {
                $create_by              = $this->app_loader->current_account();
                $create_date            = gmdate('Y-m-d H:i:s', time()+60*60*7);
                $create_ip              = $this->input->ip_address();

                $this->db->insert('data_distribusi',
                [
                    'stok_logistik' => $value['qty_acc'],
                    'id_barang'     => $value['id_barang'],
                    'id_tpa'        => $value['id_tpa'],
                    'create_by'     => $create_by,
                    'create_date'   => $create_date,
                    'create_ip'     => $create_ip,
                    'mod_by'        => $create_by,
                    'mod_date'      => $create_date,
                    'mod_ip'        => $create_ip
                ]);
            }
        }
        return array('response'=>'SUCCESS');
    }
}

// This is the end of auth signin model
