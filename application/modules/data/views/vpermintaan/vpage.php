<section class="mb-5 pb-4 mt-4">
    <?php echo $this->session->flashdata('message'); ?>
    <div id="errSuccess"></div>
    <div class="row" id="formParent">
        <div class="col-xl-12 col-md-12 mb-xl-0 mb-4">
            <div class="card card-cascade narrower z-depth-1">
                <div class="view view-cascade gradient-card-header blue-gradient-rgba narrower py-1 mx-4 mb-3 d-flex justify-content-between align-items-center">
                    <h5 class="white-text font-weight-normal mt-2">
                        <i class="fas fa-table"></i>
                        List Data Permintaan
                    </h5>
                    <div class="clearfix">
                        <a type="button" href="<?php echo site_url(isset($siteUri) ? $siteUri : '#'); ?>" class="btn btn-white btn-rounded waves-effect waves-light px-3 py-2 font-weight-bold" name="button"><i class="fas fa-sync-alt"></i> Refresh Data</a>
                        <?php
                        if ($this->app_loader->is_tpa()) { ?>
                            <button type="button" class="btn btn-success waves-effect waves-light px-3 py-2 font-weight-bold" id="btnAdd"><i class="fas fa-plus-circle"></i> Tambah Baru</button>
                        <?php } else 
                        ?>
                    </div>
                </div>
                <div class="card-body mb-0">
                    <div class="table-responsive-md">
                        <table cellspacing="0" class="table table-striped table-borderless table-hover table-sm" id="tblList" width="100%">
                            <thead>
                                <tr>
                                    <th width="3%" class="font-weight-bold">#</th>
                                    <th width="10%" class="font-weight-bold">Tanggal</th>
                                    <th width="20%" class="font-weight-bold">No Faktur</th>
                                    <th width="20%" class="font-weight-bold">Catatan</th>
                                    <th width="8%" class="font-weight-bold">Status</th>
                                    <th width="17%" class="font-weight-bold">Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="modalEntryForm" tabindex="-1" role="dialog" aria-labelledby="modalEntryLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg" id="frmEntry">
        <div class="modal-content">
            <div class="modal-header aqua-gradient-rgba">
                <h4 class="modal-title heading lead white-text font-weight-bold"><i class="fas fa-edit"></i> Form Entri Permintaan Barang</h4>
                <button type="button" class="close btnClose" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
            <?php echo form_open(site_url(isset($siteUri) ? $siteUri.'/create' : ''), array('id' => 'formEntry', 'class='=>'needs-validated', 'novalidate'=>'')); ?>
            <div class="modal-body">
                <div id="errEntry"></div>
                <?php echo form_hidden('tokenId', ''); ?>
                <div class="form-row mb-3">
                    <div class="col-12 col-md-6 required">
                        <label for="no_faktur_req" class="control-label font-weight-bolder">No Faktur<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="no_faktur_req" id="no_faktur_req" placeholder="No Faktur" value="<?php echo $this->input->post('no_faktur_req', TRUE); ?>" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="col-12 col-md-6 required">
                        <label for="tanggal_req" class="control-label font-weight-bolder">Tanggal Permintaan <span class="text-danger">*</span></label>
                        <input placeholder="Pilih Tanggal" type="date" id="tanggal_req" name="tanggal_req" class="form-control">
                        <div class="invalid-feedback"></div>
                    </div>
                </div>
                <div class="form-row mb-3">
                    <div class="col-12 col-md-12">
                        <label for="catatan" class="control-label font-weight-bolder">Catatan</label>
                        <textarea class="form-control" id="catatan" name="catatan" placeholder="Catatan Pembelian"><?php echo $this->input->post('catatan', TRUE); ?></textarea>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-blue-grey waves-effect waves-light px-3 py-2 font-weight-bold btnClose"><i class="fas fa-times"></i> Close</button>
                <button type="submit" class="btn btn-primary waves-effect waves-light px-3 py-2 font-weight-bold" name="save" id="save"><i class="fas fa-check"></i> Submit</button>
            </div>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>

<div class="modal fade" id="modalDetailPermintaan" tabindex="-1" role="dialog" aria-labelledby="modalDetailPermintaanLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl" id="frmDetailPem">
        <div class="modal-content">
            <div class="modal-header aqua-gradient-rgba">
                <h4 class="modal-title heading lead white-text font-weight-bold"><i class="fas fa-cart-plus"></i> Detail Permintaan</h4>
                <button type="button" class="close btnClosePermintaan" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 col-md-12 clearfix mb-3">
                        <div class="float-left">
                            <button class="btn btn-success waves-effect waves-light px-3 py-2 mx-0 font-weight-bold btnDetail" type="button"><i class="fas fa-plus-circle"></i> Tambah Permintaan</button>
                        </div>
                        <div class="float-right" style="display: none;" id="eventButoon">
                            <button class="btn btn-danger waves-effect waves-light px-3 py-2 mx-0 font-weight-bold" type="button" id="btnDeleteDetail" disabled=""><i class="fas fa-trash-alt"></i> Delete Permintaan</button>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <div id="errNotifikasi"></div>
                    </div>
                    <div class="col-12 col-md-12 clearfix mb-3" id="formSettingPermintaan" style="display: none;">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="heading font-weight-bolder mb-3"><i class="fas fa-pencil-alt"></i> Form Entry Detail Permintaan <span class="lblMod"></span></h5>
                                <?php echo form_open(site_url(isset($siteUri) ? $siteUri.'/rules-permintaan' : ''), array('id' => 'formDetailPermintaan', 'class='=>'needs-validated', 'novalidate'=>'')); ?>
                                <?php echo form_hidden('tokenDetail', ''); ?>
                                <?php echo form_hidden('statRequest', ''); ?>
                                <div class="form-row mb-3 ">
                                    <div class="col-12 col-md-10 required">
                                        <label for="id_barang" class="control-label font-weight-bolder">Nama Barang <span class="text-danger">*</span></label>
                                        <?php echo form_dropdown('id_barang', isset($data_barang) ? $data_barang : array(''=>'Pilih Data'), $this->input->post('id_barang', TRUE), 'class="form-control select-all" id="id_barang" required="" style="width: 100% "');?>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col-12 col-md-2 required">
                                        <label for="qty_req" class="control-label font-weight-bolder">Permintaan<span class="text-danger">*</span></label>
                                        <input type="text" class="form-control nominal" name="qty_req" id="qty_req" placeholder="Jumlah" value="<?php echo $this->input->post('qty_req', TRUE); ?>" required>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-12 col-12">
                                        <button type="submit" class="btn btn-primary waves-effect waves-light px-3 py-2 mx-0 font-weight-bold" id="saveJadwal"><i class="fas fa-check"></i> Submit</button>
                                        <button type="button" class="btn btn-danger waves-effect waves-light px-3 py-2 mx-0 font-weight-bold btnDetail"><i class="fas fa-times"></i> Cancel</button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-responsive-md">
                    <p class="note note-warning"><strong>Note:</strong> Jika ada penambahan jumlah item yang sama silahkan hapus terlebih dahulu item yang sudah ada pada list permintaan. Permintaan yang telah dikirim tidak dapat lagi diubah <a class="font-weight-bold">Terima Kasih</a>
                    </p> 
                    <h5 class="heading font-weight-bold"><i class="fas fa-list"></i> Detail Permintaan No Faktur <span class="lblDetail"></span></h5>
                    <table cellspacing="0" class="table table-striped table-borderless table-hover table-sm" id="tblDetail" width="100%">
                        <thead>
                            <tr>
                                <th width="2%" class="text-center">
                                    <div class="custom-control custom-checkbox ml-2">
                                        <input type="checkbox" class="custom-control-input" id="checkAll">
                                        <label class="custom-control-label" for="checkAll"></label>
                                    </div>
                                </th>
                                <th width="3%" class="font-weight-bold text-center">No.</th>
                                <th width="50%" class="font-weight-bold">Barang</th>
                                <th class="font-weight-bold text-left">Satuan</th>
                                <th class="font-weight-bold text-center">Permintaan</th>
                                <th class="font-weight-bold text-center">Persetujuan</th>
                                <th class="font-weight-bold text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <th colspan="4"><h4>Total Permintaan</h4></th>
                                <th class="font-weight-bold text-center"><h4><span id="reqJumlah"></span></h4></th>
                                <th class="font-weight-bold text-center"><h4><span id="accJumlah"></span></h4></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <hr>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-blue-grey waves-effect waves-light px-3 py-2 mx-0 font-weight-bold btnClosePermintaan"><i class="fas fa-times"></i> Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalRulesForm" tabindex="-1" role="dialog" aria-labelledby="modalRulesLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl" id="frmRules">
        <div class="modal-content">
            <div class="modal-header aqua-gradient-rgba">
                <h4 class="modal-title heading lead white-text font-weight-bold"> Verifikasi Permintaan </h4>
                <button type="button" class="close btnCloseRules" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 col-md-12">
                        <div id="errNotifikasi"></div>
                    </div>
                    <div class="col-md-12">
                        <div class="pull-left">
                            <div class="table-responsive">
                                <table class="table table-condensed">
                                <h3 class="text-center">Formulir Verifikasi Permintaan Barang TPA</strong> 
                                </h3>
                                <tbody>
                                    <tr>
                                    <td  width="13%">No Faktur</td>
                                    <td> : &nbsp; <a class="text-left"id="lblNoFak"></a></td>
                                    </tr>
                                    <tr>
                                    <td>Tanggal</td>
                                    <td> : &nbsp; <a class="text-left"id="lblTanggal"></a></td>
                                    </tr>
                                    <tr>
                                    <td>Nama TPA</td>
                                    <td> : &nbsp; <a class="text-left"id="lblTPA"></a></td>
                                    </tr>
                                    <tr>
                                    <td>Ketentuan</td>
                                    <td><p><u>Petunjuk Pengisian</u>:</p>
                                        <ol style="text-align:justify;">
                                            <li>Silahkan isi persetujuan barang berdasarkan permintaan TPA;</li>
                                            <li>Jika menolak permintaan silahkan mengisi nominal [0] pada kolom persetujuan;</li>
                                            <li>Jika permintaan barang dirasa tidak sesuai dengan kebutuhan TPA saat ini, pihak UPTD bisa mengurangi permintaan TPA dengan cara mengisi nominal/jumlah dibawah permintaan pengajuan dari TPA;</li>
                                            <li>Setelah mengisi nominal/jumlah pada kolom persetujuan silahkan klik tombol simpan;</li>
                                            <li>Setelah proses simpan nominal/jumlah yang telah di setujui tidak bisa dilakukan perubahan data, harap periksa kembali sebelum klik tombol simpan;</li>
                                        </ol>
                                        <!-- <ul>
                                            <li>Sangat Baik (86 s/d 100)</li>
                                            <li>Baik (71 s/d 85)</li>
                                            <li>Cukup (56 s/d 70)</li>
                                            <li>Kurang (&lt; dari 55)</li>
                                        </ul> -->
                                    </td>
                                    </tr>
                                </tbody>
                                </table>
                            </div>     
                        </div>
                    </div>
                </div>
                <div class="table-responsive-md">
                    <h5 class="heading font-weight-bold"><i class="fas fa-list"></i> Detail Permintaan Barang </h5>
                    <?php echo form_open('', array('id' => 'formPermintaan', 'class='=>'needs-validated', 'novalidate'=>'')); ?>
                        <?php echo form_hidden('tokenPermin', ''); ?>
                        <?php echo form_hidden('nofaktur', ''); ?>
                        <table cellspacing="0" class="table table-striped table-borderless table-hover table-sm" id="tblPermintaan" width="100%">
                            <thead>
                                <tr>
                                    <th width="10%" class="font-weight-bold text-center">No.</th>
                                    <th width="50%" class="font-weight-bold">Nama Barang</th>
                                    <th width="50%" class="font-weight-bold text-center">Permintaan</th>
                                    <th width="15%" class="font-weight-bold text-center">Persetujuan</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="2"><h5>Total Permintaan</h5></th>
                                    <th class="font-weight-bold text-center"><h5><span id="jumlah_req"></span></h5></th>
                                    <th></th>
                                </tr>
                            </tfoot>
                        </table>
                    <?php echo form_close(); ?>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-blue-grey waves-effect waves-light px-3 py-2 mx-0 font-weight-bold btnCloseRules"><i class="fas fa-times"></i> Close</button>
                <button type="button" class="btn btn-primary waves-effect waves-light px-3 py-2 font-weight-bold" id="btnSavePersetujuan"><i class="fas fa-check"></i> Simpan Persetujuan</button>
            </div>
        </div>
    </div>
</div>