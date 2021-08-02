<?php (defined('BASEPATH')) OR exit('No direct script access allowed');

/**
 * Description of home class
 *
 * @author Yogi "solop" Kaputra
 */

class Home extends SLP_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->session_info['page_name'] = "Home";
        $this->session_info['page_css']	 = '';
        $this->session_info['page_js']	 = '';
        $this->template->build('vpage', $this->session_info);
    }
}

// This is the end of home clas
