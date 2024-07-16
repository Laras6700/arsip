<?php

class laporan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('laporan_model');
		$this->load->model('model_surat');
		$this->load->model('program_model');
		$this->load->helper('form');
		$this->load->library('form_validation');
		  // Membuat folder uploads jika belum ada
		  $folderPath = './uploads';
		  if (!is_dir($folderPath)) {
			  mkdir($folderPath, 0777, true);
		  }
	}

	public function index()
	{
		$data['laporan'] = $this->laporan_model->get_all_laporan();

		if ($this->session->userdata('level') == 1) {
			$data['user'] = 'admin ketua';
		} elseif ($this->session->userdata('level') == 2) {
			$data['user'] = 'admin';
		} elseif ($this->session->userdata('level') == 3) {
			$data['user'] = 'member';
		}

		$this->load->view('templates/header', $data);
		$this->load->view('laporan/index', $data);
		$this->load->view('templates/footer');
	}

	public function create()
	{
		$this->form_validation->set_rules('tanggal', 'Tanggal', 'required');
		$this->form_validation->set_rules('kegiatan', 'Kegiatan', 'required');
		$this->form_validation->set_rules('tempat', 'Tempat', 'required');
		$this->form_validation->set_rules('penanggung_jawab', 'Penanggung Jawab', 'required');
		$this->form_validation->set_rules('status', 'Status', 'required');
	

		if ($this->form_validation->run() === FALSE) {
			if ($this->session->userdata('level') == 1) {
				$data['user'] = 'admin ketua';
			} elseif ($this->session->userdata('level') == 2) {
				$data['user'] = 'admin';
			} elseif ($this->session->userdata('level') == 3) {
				$data['user'] = 'member';
			}


			$this->load->view('templates/header', $data);
			$this->load->view('laporan/create', $data);
			$this->load->view('templates/footer');
		} else {
			$data = array(
				'tanggal' => $this->input->post('tanggal'),
				'kegiatan' => $this->input->post('kegiatan'),
				'tempat' => $this->input->post('tempat'),
				'penanggung_jawab' => $this->input->post('penanggung_jawab'),
				'status' => $this->input->post('status'),

			);

			// Handle file upload
			$config['upload_path'] = './uploads/';
			$config['allowed_types'] = 'gif|jpg|jpeg|png';
			$config['max_size'] = 2048; // 2MB
			$this->load->library('upload', $config);

			if (!$this->upload->do_upload('gambar')) {
				$error = array('error' => $this->upload->display_errors());
				$this->load->view('templates/header', $data);
				$this->load->view('laporan/create', $error);
				$this->load->view('templates/footer');
			} else {
				$file_data = $this->upload->data();
				$data['gambar'] = $file_data['file_name'];

				$this->laporan_model->tambah_laporan($data);
				$this->session->set_flashdata('message', 'Data berhasil ditambah');
				redirect('laporan');
			}
		}
	}

	public function edit($id)
	{

		$this->form_validation->set_rules('tanggal', 'Tanggal', 'required');
		$this->form_validation->set_rules('kegiatan', 'Kegiatan', 'required');
		$this->form_validation->set_rules('tempat', 'Tempat', 'required');
		$this->form_validation->set_rules('penanggung_jawab', 'Penanggung Jawab', 'required');
		$this->form_validation->set_rules('status', 'Status', 'required');

			if ($this->form_validation->run() === FALSE) {
				$data['program'] = $this->program_model->getprogram($id);
				if ($this->session->userdata('level') == 1) {
					$data['user'] = 'admin ketua';
				} elseif ($this->session->userdata('level') == 2) {
					$data['user'] = 'admin';
				} elseif ($this->session->userdata('level') == 3) {
					$data['user'] = 'member';
				}

				$data['laporan'] = $this->laporan_model->getLaporan($id);

				$this->load->view('templates/header', $data);
				$this->load->view('laporan/edit', $data);
				$this->load->view('templates/footer');
			} else {
				$data = array(
					'tanggal' => $this->input->post('tanggal'),
					'kegiatan' => $this->input->post('kegiatan'),
					'tempat' => $this->input->post('tempat'),
					'penanggung_jawab' => $this->input->post('penanggung_jawab'),
					'status' => $this->input->post('status'),
				);

				// Handle file upload
				$config['upload_path'] = './uploads/';
				$config['allowed_types'] = 'gif|jpg|jpeg|png';
				$config['max_size'] = 2048; // 2MB
				$this->load->library('upload', $config);

				if (!$this->upload->do_upload('gambar')) {
					$error = array('error' => $this->upload->display_errors());
					$this->load->view('templates/header', $data);
					$this->load->view('laporan/create', $error);
					$this->load->view('templates/footer');
				} else {
					$file_data = $this->upload->data();
					$data['gambar'] = $file_data['file_name'];
	
					$this->laporan_model->updateLaporan($id,$data);
					$this->session->set_flashdata('message', 'Data berhasil ditambah');
					redirect('laporan');
				}
			}
		}

		public function delete($id)
		{
			$this->laporan_model->hapusLaporan($id);

			$this->session->set_flashdata('message', 'data berhasil dihapus');
			redirect('laporan');
		}
	}

