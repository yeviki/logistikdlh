<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Description of mata diklat model
 *
 * @author Yogi "solop" Kaputra
 */

class Model_pembelian extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    /*Fungsi Get Data List*/
    var $search = array('no_faktur_buy');
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
        return $this->db->count_all_results('data_pembelian');
    }

    private function _get_datatables_query() {
        $this->db->select('id_pembelian,
                           no_faktur_buy,
                           tgl_pembelian,
                           catatan
                           ');
        $this->db->from('data_pembelian');
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
        $this->db->order_by('id_pembelian ASC');
    }

    /*Fungsi get data edit by id*/
    public function getDataDetail($id) {
        $this->db->where('id_pembelian', abs($id));
        $query = $this->db->get('data_pembelian');
        return $query->row_array();
    }

    /* Fungsi untuk insert data */
    public function insertData() {
        //get data
        $create_by      = $this->app_loader->current_account();
        $create_date    = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip      = $this->input->ip_address();
        $no_faktur_buy = escape($this->input->post('no_faktur_buy', TRUE));
        //cek nama matadiklat duplicate
        $this->db->where('no_faktur_buy', $no_faktur_buy);
        $qTot = $this->db->count_all_results('data_pembelian');
        if($qTot > 0)
            return array('response'=>'ERROR', 'nama'=>$no_faktur_buy);
        else {
            $data = array(
                'no_faktur_buy'     => $no_faktur_buy,
                'tgl_pembelian'     => escape($this->input->post('tgl_pembelian', TRUE)),
                'catatan'           => escape($this->input->post('catatan', TRUE)),
                'create_by'         => $create_by,
                'create_date'       => $create_date,
                'create_ip'         => $create_ip,
                'mod_by'            => $create_by,
                'mod_date'          => $create_date,
                'mod_ip'            => $create_ip
            );
            /*query insert*/
            $this->db->insert('data_pembelian', $data);
            return array('response'=>'SUCCESS', 'nama'=>$no_faktur_buy);
        }
    }

    /* Fungsi untuk update data */
    public function updateData() {
        //get data
        $create_by          = $this->app_loader->current_account();
        $create_date        = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip          = $this->input->ip_address();
        $id_pembelian	        = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        $no_faktur_buy          = escape($this->input->post('no_faktur_buy', TRUE));
        //cek data by id
        $data_search = $this->getDataDetail($id_pembelian);
        if(count($data_search) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            //cek data duplicate
            $this->db->where('no_faktur_buy', $no_faktur_buy);
            $this->db->where('id_pembelian !=', $id_pembelian);
            $qTot = $this->db->count_all_results('data_pembelian');
            if($qTot > 0)
                return array('response'=>'ERRDATA', 'nama'=>$no_faktur_buy);
            else {
                $data = array(
                    'no_faktur_buy'     => $no_faktur_buy,
                    'tgl_pembelian'     => escape($this->input->post('tgl_pembelian', TRUE)),
                    'catatan'           => escape($this->input->post('catatan', TRUE)),
                    'mod_by'            => $create_by,
                    'mod_date'          => $create_date,
                    'mod_ip'            => $create_ip
                );
                /*query update*/
                $this->db->where('id_pembelian', abs($id_pembelian));
                $this->db->update('data_pembelian', $data);
                return array('response'=>'SUCCESS', 'nama'=>$no_faktur_buy);
            }
        }
    }

    /* Fungsi untuk delete data */
    public function deleteData() {
        $id = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        //cek data by id
        $dataSearch = $this->getDataDetail($id);
        $no_faktur_buy = !empty($dataSearch) ? $dataSearch['no_faktur_buy'] : '';
        if (count($dataSearch) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            $this->db->where('id_pembelian', abs($id));
            $count = $this->db->count_all_results('det_pembelian');
            if ($count > 0)
                return array('response'=>'ERRDATA', 'nama'=>$no_faktur_buy);
            else {
                $this->db->where('id_pembelian', abs($id));
                $this->db->delete('data_pembelian');
                return array('response'=>'SUCCESS', 'nama'=>$no_faktur_buy);
            }
        }
    }


    /* get data list detail pembelian */
    public function getDataListDetailPembelian($id_pembelian) {
        $this->db->select('a.id_pembelian,
                            a.no_faktur_buy,
                            a.tgl_pembelian,
                            b.id_detail_pembelian,
                            b.id_barang,
                            b.qty_barang,
                            b.harga_barang,
                            b.id_status_barang,
                            c.nm_barang,
                            c.id_satuan,
                            c.id_kat_barang,
                            d.satuan,
                            e.kategori
                            ');
        $this->db->from('data_pembelian a');
        $this->db->join('detail_pembelian b', 'b.id_pembelian = a.id_pembelian', 'inner');
        $this->db->join('data_barang c', 'b.id_barang = c.id_barang', 'inner');
        $this->db->join('ref_satuan d', 'c.id_satuan = d.id_satuan', 'inner');
        $this->db->join('ref_kategori e', 'c.id_kat_barang = e.id_kat_barang', 'inner');
        $this->db->where('a.id_pembelian', abs($id_pembelian));
        $query = $this->db->get();
        return $query->result_array();
    }

    /*Fungsi get data edit by id*/
    public function getDataDetailPembelian($id) {
        $this->db->where('id_pembelian', abs($id));
        $query = $this->db->get('dt_diklat');
        return $query->row_array();
    }

    /* Fungsi untuk insert data */
    public function insertDetailPembelian() {
        //get data
        $tahun          = gmdate('Y');
        $create_by      = $this->app_loader->current_account();
        $create_date    = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip      = $this->input->ip_address();
        
        $id_pembelian	    = $this->encryption->decrypt(escape($this->input->post('tokenDetail', TRUE)));
        $data = array(
            'id_pembelian'      => $id_pembelian,
            'id_barang'         => escape($this->input->post('id_barang', TRUE)),
            'qty_barang'        => escape($this->input->post('qty_barang', TRUE)),
            'harga_barang'      => escape($this->input->post('harga_barang', TRUE)),
            'id_status_barang'  => '1',
            'create_by'         => $create_by,
            'create_date'       => $create_date,
            'create_ip'         => $create_ip,
            'mod_by'            => $create_by,
            'mod_date'          => $create_date,
            'mod_ip'            => $create_ip
        );
        $this->db->insert('detail_pembelian', $data);
        return array('response'=>'SUCCESS');
    }
}

// This is the end of auth signin model
