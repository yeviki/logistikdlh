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
    var $search = array('nm_barang');
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
        return $this->db->count_all_results('data_barang');
    }

    private function _get_datatables_query() {
        $this->db->select('id_barang,
                           nm_barang,
                           id_satuan,
                           id_kat_barang
                           ');
        $this->db->from('data_barang');
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
        $this->db->order_by('id_barang ASC');
    }

    /*Fungsi get data edit by id*/
    public function getDataDetail($id) {
        $this->db->where('id_barang', abs($id));
        $query = $this->db->get('data_barang');
        return $query->row_array();
    }

    /* Fungsi untuk insert data */
    public function insertData() {
        //get data
        $create_by      = $this->app_loader->current_account();
        $create_date    = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip      = $this->input->ip_address();
        $nm_barang = escape($this->input->post('nm_barang', TRUE));
        //cek nama matadiklat duplicate
        $this->db->where('nm_barang', $nm_barang);
        $qTot = $this->db->count_all_results('data_barang');
        if($qTot > 0)
            return array('response'=>'ERROR', 'nama'=>$nm_barang);
        else {
            $data = array(
                'nm_barang'         => $nm_barang,
                'id_satuan'         => escape($this->input->post('satuan', TRUE)),
                'id_kat_barang'     => escape($this->input->post('kategori', TRUE)),
                'create_by'         => $create_by,
                'create_date'       => $create_date,
                'create_ip'         => $create_ip,
                'mod_by'            => $create_by,
                'mod_date'          => $create_date,
                'mod_ip'            => $create_ip
            );
            /*query insert*/
            $this->db->insert('data_barang', $data);
            return array('response'=>'SUCCESS', 'nama'=>$nm_barang);
        }
    }

    /* Fungsi untuk update data */
    public function updateData() {
        //get data
        $create_by          = $this->app_loader->current_account();
        $create_date        = gmdate('Y-m-d H:i:s', time()+60*60*7);
        $create_ip          = $this->input->ip_address();
        $id_barang	        = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        $nm_barang          = escape($this->input->post('nm_barang', TRUE));
        //cek data by id
        $data_search = $this->getDataDetail($id_barang);
        if(count($data_search) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            //cek nama kontrol duplicate
            $this->db->where('nm_barang', $nm_barang);
            $this->db->where('id_barang !=', $id_barang);
            $qTot = $this->db->count_all_results('data_barang');
            if($qTot > 0)
                return array('response'=>'ERRDATA', 'nama'=>$nm_barang);
            else {
                $data = array(
                    'nm_barang'         => $nm_barang,
                    'id_satuan'         => escape($this->input->post('satuan', TRUE)),
                    'id_kat_barang'     => escape($this->input->post('kategori', TRUE)),
                    'mod_by'            => $create_by,
                    'mod_date'          => $create_date,
                    'mod_ip'            => $create_ip
                );
                /*query update*/
                $this->db->where('id_barang', abs($id_barang));
                $this->db->update('data_barang', $data);
                return array('response'=>'SUCCESS', 'nama'=>$nm_barang);
            }
        }
    }

    /* Fungsi untuk delete data */
    public function deleteData() {
        $id = $this->encryption->decrypt(escape($this->input->post('tokenId', TRUE)));
        //cek data by id
        $dataSearch = $this->getDataDetail($id);
        $nm_barang = !empty($dataSearch) ? $dataSearch['nm_barang'] : '';
        if (count($dataSearch) <= 0)
            return array('response'=>'ERROR', 'nama'=>'');
        else {
            $this->db->where('id_barang', abs($id));
            $count = $this->db->count_all_results('det_mata_diklat_wi');
            if ($count > 0)
                return array('response'=>'ERRDATA', 'nama'=>$nm_barang);
            else {
                $this->db->where('id_barang', abs($id));
                $this->db->delete('data_barang');
                return array('response'=>'SUCCESS', 'nama'=>$nm_barang);
            }
        }
    }
}

// This is the end of auth signin model
