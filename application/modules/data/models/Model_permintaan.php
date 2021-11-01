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
        return $this->db->count_all_results('data_permintaan');
    }

    private function _get_datatables_query() {
        $this->db->select('a.id_permintaan,
                            a.no_faktur_req,
                            a.tanggal_req,
                            a.catatan
                            ');
        $this->db->from('data_permintaan a');
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
                'id_tpa'            => '0',
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
                            b.id_detail_permintaan,
                            b.id_barang,
                            b.qty_req,
                            b.qty_acc,
                            b.id_status_req,
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
    public function getDataDetailPembelian($id_permintaan) {
        $this->db->select('a.id_permintaan,
                            a.no_faktur_req,
                            a.tanggal_req,
                            b.id_detail_permintaan,
                            b.id_barang,
                            b.qty_req,
                            b.qty_acc,
                            b.id_status_req,
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
        return $query->row_array();
    }

    public function checkGudang($id){
        $this->db->where('id_barang', abs($id));
        $query = $this->db->get('data_barang');
        return $query->row_array();
    }

    /* Fungsi untuk insert data */
    public function insertDetailPembelian() {
        //get data
        $tahun          = gmdate('Y');
        $create_by      = $this->app_loader->current_account();
        $create_date    = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip      = $this->input->ip_address();
        
        $id_permintaan	    = $this->encryption->decrypt(escape($this->input->post('tokenDetail', TRUE)));
        $data = array(
            'id_permintaan'     => $id_permintaan,
            'id_barang'         => escape($this->input->post('id_barang', TRUE)),
            'qty_req'           => escape($this->input->post('qty_req', TRUE)),
            'qty_acc'           => '0',
            'id_status_req'     => '0',
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

    /* Fungsi untuk update data */
    public function updateStokBarang() {
        //get data
        $id    = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        $flag  = $this->encryption->decrypt(escape($this->input->post('flag', TRUE)));
        $detailPembelian = escape($this->input->post('detailId', TRUE));
        //cek data by id
        $dataMD = $this->getDataDetailPembelian($id);
        $no_faktur_req = !empty($dataMD) ? $dataMD['no_faktur_req'] : '';
        if (count($dataMD) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            foreach ($detailPembelian as $key => $r) {
                list($idPembelian,$status) = explode('####',$r);
                
                $this->db->where('id_detail_permintaan', abs($this->encryption->decrypt($idPembelian)));
                $this->db->where('id_permintaan', abs($id));
                if($flag == "AR") {
                    if ($status==0) {
                        $this->db->update('detail_permintaan', array('id_status_req' => 1));
                    }
                } else if($flag == "DR") {
                    if ($status==0) {
                        $this->db->delete('detail_permintaan');
                    } else {
                        return array('response'=>'STOK', 'nama'=>$no_faktur_req);
                    }
                }
            }

            return array('response'=>'SUCCESS', 'nama'=>$no_faktur_req);
        }
    }
}

// This is the end of auth signin model
