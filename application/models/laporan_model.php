<?php
defined('BASEPATH') or exit('No direct script access allowed');

class laporan_model extends CI_Model
{
	function get_all_laporan()
	{
		return $this->db->get('laporan')->result();
	}
	public function tambah_laporan($data)
	{
		// Menyimpan data program ke dalam tabel 'program'
		$this->db->insert('laporan', $data);
	}

	public function updateprogram($id, $data)
	{
		// Mengupdate data program berdasarkan ID
		$this->db->where('id_program', $id);
		$this->db->update('program', $data);
	}

	public function updateLaporan($id,$data) {
		$this->db->where('id_laporan',$id);
		$this->db->update('laporan',$data);
	}

	public function hapusLaporan($id) {
		$this->db->where('id_laporan',$id);
		$this->db->delete('laporan');
	}

	public function hapusprogram($id)
	{
		// Menghapus data program berdasarkan ID
		$this->db->where('id_program', $id);
		$this->db->delete('program');
	}

	public function getLaporan($id)
	{
		// Mengambil semua data program dari tabel 'program'
		$this->db->where('id_laporan', $id);
		$query = $this->db->get('laporan');
		return $query->row();
	}
}
