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
                        <button type="button" class="btn btn-success waves-effect waves-light px-3 py-2 font-weight-bold" id="btnAdd"><i class="fas fa-plus-circle"></i> Tambah Baru</button>
                    </div>
                </div>
                <div class="card-body mb-0">
                    <div class="table-responsive-md">
                        <table cellspacing="0" class="table table-striped table-borderless table-hover table-sm" id="tblList" width="100%">
                            <thead>
                                <tr>
                                    <th width="3%" class="font-weight-bold">#</th>
                                    <th width="20%" class="font-weight-bold">Tanggal</th>
                                    <th width="40%" class="font-weight-bold">No Faktur</th>
                                    <th width="20%" class="font-weight-bold">Total Permintaan</th>
                                    <th width="12%" class="font-weight-bold">Action</th>
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
                        <label for="no_faktur_buy" class="control-label font-weight-bolder">No Faktur<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="no_faktur_buy" id="no_faktur_buy" placeholder="No Faktur Pembelian" value="<?php echo $this->input->post('no_faktur_buy', TRUE); ?>" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="col-12 col-md-6 required">
                        <label for="tgl_pembelian" class="control-label font-weight-bolder">Tanggal Permintaan <span class="text-danger">*</span></label>
                        <input placeholder="Pilih Tanggal" type="date" id="tgl_pembelian" name="tgl_pembelian" class="form-control">
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

<div class="modal fade" id="modalDetailPembelian" tabindex="-1" role="dialog" aria-labelledby="modalDetailPembelianLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl" id="frmDetailPem">
        <div class="modal-content">
            <div class="modal-header aqua-gradient-rgba">
                <h4 class="modal-title heading lead white-text font-weight-bold"><i class="fas fa-cart-plus"></i> Detail Pembelian</h4>
                <button type="button" class="close btnCloseMataDik" aria-label="Close">
                    <span aria-hidden="true" class="white-text">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 col-md-12 clearfix mb-3">
                        <div class="float-left">
                            <button class="btn btn-success waves-effect waves-light px-3 py-2 mx-0 font-weight-bold btnDetail" type="button"><i class="fas fa-plus-circle"></i> Tambah Pembelian</button>
                        </div>
                        <div class="float-right" style="display: none;" id="eventButoon">
                            <button class="btn btn-danger waves-effect waves-light px-3 py-2 mx-0 font-weight-bold" type="button" id="btnDeleteDetail" disabled=""><i class="fas fa-trash-alt"></i> Delete Barang</button>
                            <button class="btn btn-info waves-effect waves-light px-3 py-2 mx-0 font-weight-bold" type="button" id="btnUpdateStok" disabled=""><i class="fas fa-check"></i> Update Stok</button>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
                        <div id="errDiklat"></div>
                    </div>
                    <div class="col-12 col-md-12 clearfix mb-3" id="formSettingMataDiklat" style="display: none;">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="heading font-weight-bolder mb-3"><i class="fas fa-pencil-alt"></i> Form Entry Detail Pembelian <span class="lblMod"></span></h5>
                                <?php echo form_open(site_url(isset($siteUri) ? $siteUri.'/rules-pembelian' : ''), array('id' => 'formDetailPembelian', 'class='=>'needs-validated', 'novalidate'=>'')); ?>
                                <?php echo form_hidden('tokenDetail', ''); ?>
                                <div class="form-row mb-3 ">
                                    <div class="col-12 col-md-4 required">
                                        <label for="id_barang" class="control-label font-weight-bolder">Nama Barang <span class="text-danger">*</span></label>
                                        <?php echo form_dropdown('id_barang', isset($data_barang) ? $data_barang : array(''=>'Pilih Data'), $this->input->post('id_barang', TRUE), 'class="form-control select-all" id="id_barang" required=""');?>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col-12 col-md-2 required">
                                        <label for="qty_barang" class="control-label font-weight-bolder">Jumlah <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control nominal" name="qty_barang" id="qty_barang" placeholder="Jumlah" value="<?php echo $this->input->post('qty_barang', TRUE); ?>" required>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col-12 col-md-3 required">
                                        <label for="harga_barang" class="control-label font-weight-bolder">Harga <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control nominal hitung" name="harga_barang" id="harga_barang" placeholder="Harga" value="<?php echo $this->input->post('harga_barang', TRUE); ?>" required>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col-12 col-md-3 required">
                                        <label for="total_harga" class="control-label font-weight-bolder">Total Harga <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control nominal" name="total_harga" id="total_harga" placeholder="Harga" value="<?php echo $this->input->post('total_harga', TRUE); ?>" required>
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
                    <h5 class="heading font-weight-bold"><i class="fas fa-list"></i> Detail Pembelian No Faktur <span class="lblDetail"></span></h5>
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
                                <th class="font-weight-bold">Barang</th>
                                <th class="font-weight-bold text-left">Satuan</th>
                                <th class="font-weight-bold text-left">Jumlah</th>
                                <th class="font-weight-bold text-left"> Harga Barang</th>
                                <th class="font-weight-bold text-left"> Total Harga</th>
                                <th class="font-weight-bold text-center">Status Beli</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <th colspan="6"><h4>Total Pembelian</h4></th>
                                <th><h4><span id="jumlah"></span></h4></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <hr>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-blue-grey waves-effect waves-light px-3 py-2 mx-0 font-weight-bold btnCloseMataDik"><i class="fas fa-times"></i> Close</button>
            </div>
        </div>
    </div>
</div>