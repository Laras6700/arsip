<div id="wrapper">
	<!-- Sidebar -->

	<?php $this->load->view('templates/sidebar'); ?>
	<!-- End of Sidebar -->
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
		<!-- Main Content -->
		<div id="content">
			<!-- Topbar -->
			<?php $this->load->view('templates/topbar'); ?>

			<!-- End of Topbar -->
			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-4 text-gray-800">Otomatisasi Jadwal</h1>
				<div class="card card-success">
					<div class="card-body">

						<?php if ($user == 'admin ketua' || $user == 'admin') { ?>
							<div class="row">
								<div class="col-md-3">
									<a href="<?= base_url('jadwal/create') ?>" class="btn btn-primary"><i class="fas fa-plus"></i> Tambah data </a>
								</div>
							</div>
						<?php } else {
						} ?>
						<br>
						<div class="table-responsive">
							<?php if ($this->session->flashdata('message')) : ?>
								<div class="alert alert-success">
									<strong>Berhasil</strong>
									<p><?= $this->session->flashdata('message'); ?></p>
								</div>
							<?php endif ?>
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>No.</th>
										<th>Tanggal</th>
										<th>Kegiatan</th>
										<th>Tempat</th>
										<th>Sasaran</th>
										<th>Waktu</th>
										<th>Keterangan</th>
										<th>Penanggung Jawab</th>
										<th>No.Hp</th>
										<?php if ($user == 'admin ketua' || $user == 'admin') { ?>
										<th>Aksi</th>
										<?php } else {
											} ?>
									</tr>
								</thead>
								<tbody>
									<?php $no = 1;
									foreach ($jadwal as $sm) : ?>
										<tr>
											<td><?= $no++; ?></td>
											<td><?= $sm->tanggal; ?></td>
											<td><?= $sm->kegiatan; ?></td>
											<td><?= $sm->tempat; ?></td>
											<td><?= $sm->sasaran; ?></td>
											<td><?= $sm->waktu; ?></td>
											<td><?= $sm->keterangan; ?></td>
											<td><?= $sm->penanggung_jawab; ?></td>
											<td><?= $sm->no_hp; ?></td>
											<?php if ($user == 'admin ketua' || $user == 'admin') { ?>
												<td>
													<a href="<?= base_url('jadwal/edit/' . $sm->id_jadwal) ?>"><span class="badge badge-warning d-block">Edit</span></a>
													<br>
													<a onclick="return confirm('Apakah anda yakin?')" href=" <?= base_url('jadwal/delete/' . $sm->id_jadwal) ?>"><span class="badge badge-danger d-block">Hapus</span></a>
												</td>
											<?php } else {
											} ?>
										</tr>
									<?php endforeach; ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- End of Main Content -->
		<!-- modal tambah -->
		<?php $this->load->view('admin/ekstra/modal'); ?>
		<!-- Footer -->
		<?php $this->load->view('templates/copyright') ?>
		<!-- End of Footer -->
	</div>
	<!-- End of Content Wrapper -->
</div>
