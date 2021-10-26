<script type="text/javascript">
    <!--  custom js  -->
    $.fn.modal.Constructor.prototype.enforceFocus = function() {};
    let csrfName  = '<?php echo $this->security->get_csrf_token_name(); ?>';
    let site      = '<?php echo site_url(isset($siteUri) ? $siteUri : ''); ?>';
    let msg       = new alertMessage();
    let jumlah = 0;
    const swalAlert = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-primary',
            cancelButton: 'btn btn-danger',
        },
        buttonsStyling: false
    });
    function run_waitMe(el) {
        el.waitMe({
            effect: 'facebook',
            text: 'Please wait...',
            bg: 'rgba(255,255,255,0.7)',
            color: '#000',
            maxSize: 100,
            waitTime: -1,
            textPos: 'vertical',
            source: '',
            fontSize: '',
            onClose: function(el) {}
        });
    }
    $(document).ready(function(e) {
        getDataList();
    });
    function getDataList() {
        $('#tblList').dataTable({
            "pagingType": "full_numbers",
            "destroy": true,
            "processing":true,
            "language": {
                "loadingRecords": '&nbsp;',
                "processing": 'Loading data...'
            },
            "serverSide": true,
            "ordering": false,
            "ajax": {
                "url": site + '/listview',
                "type": "POST",
                "data": {
                    "<?php echo $this->security->get_csrf_token_name(); ?>" : $('input[name="'+csrfName+'"]').val()
                },
            },
            "columnDefs": [
                {
                    "targets": [ 0 ], //first column
                    "orderable": false, //set not orderable
                    "className": 'text-center'
                },
                {
                    "targets": [ -1, -2 ], //last column
                    "orderable": false, //set not orderable
                    "className": 'text-center'
                },
            ],
        });
        $('#tblList_filter input').addClass('form-control').attr('placeholder','Search Data');
        $('#tblList_length select').addClass('form-control');
    }
    //panggil form Entri
    $(document).on('click', '#btnAdd', function(e){
        formReset();
        $('#modalEntryForm').modal({
            backdrop: 'static'
        });
    });
    //close form entri
    $(document).on('click', '.btnClose', function(e) {
        formReset();
        $('#modalEntryForm').modal('toggle');
    });
    function formReset() {
        $('#formEntry').attr('action', site + '/create');
        $('#errEntry').html('');
        $('form#formEntry').trigger('reset');
        $('form#formEntry').removeClass('was-validated');
    }
    $(document).on('submit', '#formEntry', function(e) {
        e.preventDefault();
        let postData = $(this).serialize();
        // get form action url
        let formActionURL = $(this).attr("action");
        $("#save").html('<i class="spinner-grow spinner-grow-sm mr-2" role="status" aria-hidden="true"></i> DIPROSES...');
        $("#save").addClass('disabled');
        run_waitMe($('#frmEntry'));
        swalAlert.fire({
            title: 'Konfirmasi',
            text: 'Apakah anda ingin menyimpan data ini ?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '<i class="fas fa-check"></i> Ya, lanjutkan',
            cancelButtonText: '<i class="fas fa-times"></i> Tidak, batalkan',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: formActionURL,
                    type: "POST",
                    data: postData,
                    dataType: "json",
                }).done(function(data) {
                    $('input[name="'+csrfName+'"]').val(data.csrfHash);
                    if(data.status == 'RC404') {
                        $('#formEntry').addClass('was-validated');
                        swalAlert.fire({
                            title: 'Gagal Simpan',
                            text: 'Proses simpan data gagal, silahkan diperiksa kembali',
                            icon: 'error',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errEntry').html(msg.error('Silahkan dilengkapi data pada form inputan dibawah'));
                                $.each(data.message, function(key,value){
                                    if(key != 'isi')
                                        $('input[name="'+key+'"], select[name="'+key+'"]').closest('div.required').find('div.invalid-feedback').text(value);
                                    else {
                                        $('#pesanErr').html(value);
                                    }
                                });
                                $('#frmEntry').waitMe('hide');
                            }
                        })
                    } else {
                        $('#frmEntry').waitMe('hide');
                        $('#modalEntryForm').modal('toggle');
                        swalAlert.fire({
                            title: 'Berhasil Simpan',
                            text: data.message,
                            icon: 'success',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errSuccess').html(msg.success(data.message));
                                getDataList();
                            }
                        })
                    }
                }).fail(function() {
                    $('#errEntry').html(msg.error('Harap periksa kembali data yang diinputkan'));
                    $('#frmEntry').waitMe('hide');
                }).always(function() {
                    $("#save").html('<i class="fas fa-check"></i> SUBMIT');
                    $("#save").removeClass('disabled');
                });
            } else if (result.dismiss === Swal.DismissReason.cancel ) {
                swalAlert.fire({
                    title: 'Batal Simpan',
                    text: 'Proses simpan data telah dibatalkan',
                    icon: 'error',
                    confirmButtonText: '<i class="fas fa-check"></i> Oke',
                }).then((result) => {
                    if (result.value) {
                        $('#frmEntry').waitMe('hide');
                        $("#save").html('<i class="fas fa-check"></i> SUBMIT');
                        $("#save").removeClass('disabled');
                    }
                })
            }
        })
    });
    $(document).on('click', '.btnEdit', function(e){
        formReset();
        $('#formEntry').attr('action', site + '/update');
        var token = $(this).data('id');
        $('#modalEntryForm').modal({
            backdrop: 'static'
        });
        getDataKontrol(token);
    });
    function getDataKontrol(token) {
        run_waitMe($('#frmEntry'));
        $.ajax({
            type: 'POST',
            url: site + '/details',
            data: {'token' : token, '<?php echo $this->security->get_csrf_token_name(); ?>' : $('input[name="'+csrfName+'"]').val()},
            dataType: 'json',
            success: function(data) {
                $('input[name="'+csrfName+'"]').val(data.csrfHash);
                if(data.status == 'RC200') {
                    $('input[name="tokenId"]').val(token);
                    $('#no_faktur_buy').val(data.message.no_faktur_buy);
                    $('#tgl_pembelian').val(data.message.tgl_pembelian);
                    $('#catatan').val(data.message.catatan);
                }
                $('#frmEntry').waitMe('hide');
            }
        });
    }
    $(document).on('click', '.btnDelete', function(e){
        e.preventDefault();
        let postData = {
            'tokenId': $(this).data('id'),
            '<?php echo $this->security->get_csrf_token_name(); ?>' : $('input[name="'+csrfName+'"]').val()
        };
        $(this).html('<i class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></i>');
        $(this).addClass('disabled');
        run_waitMe($('#formParent'));
        swalAlert.fire({
            title: 'Konfirmasi',
            text: 'Apakah anda ingin menghapus data ini ?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '<i class="fas fa-check"></i> Ya, lanjutkan',
            cancelButtonText: '<i class="fas fa-times"></i> Tidak, batalkan',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: site + '/delete',
                    type: "POST",
                    data: postData,
                    dataType: "json",
                }).done(function(data) {
                    $('input[name="'+csrfName+'"]').val(data.csrfHash);
                    if(data.status == 'RC404') {
                        swalAlert.fire({
                            title: 'Gagal Hapus',
                            text: data.message,
                            icon: 'error',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errSuccess').html(msg.error(data.message));
                            }
                        })
                    } else {
                        swalAlert.fire({
                            title: 'Berhasil Hapus',
                            text: data.message,
                            icon: 'success',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errSuccess').html(msg.success(data.message));
                                getDataList();
                            }
                        })
                    }
                    $('#formParent').waitMe('hide');
                }).fail(function() {
                    $('#errSuccess').html(msg.error('Harap periksa kembali data yang akan dihapus'));
                    $('#formParent').waitMe('hide');
                }).always(function() {
                    $('.btnDelete').html('<i class="fas fa-trash-alt"></i>');
                    $('.btnDelete').removeClass('disabled');
                });
            } else if (result.dismiss === Swal.DismissReason.cancel ) {
                swalAlert.fire({
                    title: 'Batal Hapus',
                    text: 'Proses hapus data telah dibatalkan',
                    icon: 'error',
                    confirmButtonText: '<i class="fas fa-check"></i> Oke',
                }).then((result) => {
                    if (result.value) {
                        $('#formParent').waitMe('hide');
                        $('.btnDelete').html('<i class="fas fa-trash-alt"></i>');
                        $('.btnDelete').removeClass('disabled');
                    }
                })
            }
        })
    });

    $(document).on('click', '.btnCloseMataDik', function(e) {
        let id = $(this).closest('div.modal').attr('id');
        formResetDetail();
        $('#'+id).modal('toggle');
        if(id == 'modalDetailPembelian') {
            $('#formSettingMataDiklat').hide();
        }
    });

    function formResetDetail() {
        $('#status').select2().val('1').trigger("change");
        $('#formDetailPembelian').attr('action', site + '/create');
        $('#errSuccess').html('');
        $('#errRules').html('');
        $('form#formDetailPembelian').trigger('reset');
        $('form#formDetailPembelian').removeClass('was-validated');
    }

    //panggil form Rule
    $(document).on('click', '.btnSetPembelian', function(e) {
        $('#modalDetailPembelian').modal({
            backdrop: 'static'
        });
        let token = $(this).data('id');
        let label = $(this).data('jd');
        $('input[name="tokenDetail"]').val(token);
        $('.lblDetail').text(label);
        getDataListPembelian(token);
    });
    $(document).on('click', '.btnDetail', function (e) {
        $('#formSettingMataDiklat').slideToggle('slow');
        $('#formEntry').attr('action', site + '/set-detail');
        $('form#formDetailPembelian .select-all').select2().val('').trigger("change");
        $('form#formDetailPembelian #status_rules').select2().val('1').trigger("change");
    });
    $(document).on('submit', '#formDetailPembelian', function(e) {
        e.preventDefault();
        let postData = $(this).serialize();
        // get form action url
        let formActionURL = $(this).attr("action");
        $("#saveJadwal").html('<i class="spinner-grow spinner-grow-sm mr-2" role="status" aria-hidden="true"></i> DIPROSES...');
        $("#saveJadwal").addClass('disabled');
        run_waitMe($('#frmDetailPem'));
        swalAlert.fire({
            title: 'Konfirmasi',
            text: 'Apakah anda ingin menyimpan data ini ?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '<i class="fas fa-check"></i> Ya, lanjutkan',
            cancelButtonText: '<i class="fas fa-times"></i> Tidak, batalkan',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: formActionURL + '/new-pembelian',
                    type: "POST",
                    data: postData,
                    dataType: "json",
                }).done(function(data) {
                    $('input[name="'+csrfName+'"]').val(data.csrfHash);
                    if(data.status == 'RC404') {
                        $('#formDetailPembelian').addClass('was-validated');
                        swalAlert.fire({
                            title: 'Gagal Simpan',
                            text: 'Proses simpan data gagal, silahkan diperiksa kembali',
                            icon: 'error',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errDiklat').html(msg.error('Silahkan dilengkapi data pada form inputan dibawah'));
                                $.each(data.message, function(key,value){
                                    if(key != 'isi')
                                        $('input[name="'+key+'"], select[name="'+key+'"]').closest('div.required').find('div.invalid-feedback').text(value);
                                    else {
                                        $('#pesanErr').html(value);
                                    }
                                });
                                $('#frmDetailPem').waitMe('hide');
                            }
                        })
                    } else {
                        $('#frmDetailPem').waitMe('hide');
                        swalAlert.fire({
                            title: 'Berhasil Simpan',
                            text: data.message,
                            icon: 'success',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errDiklat').html(msg.success(data.message));
                                $('#formSettingMataDiklat').slideToggle();
                                getDataListPembelian(data.kode);
                                getDataList();
                            }
                        })
                    }
                }).fail(function() {
                    $('#errDiklat').html(msg.error('Harap periksa kembali data yang diinputkan'));
                    $('#frmDetailPem').waitMe('hide');
                }).always(function() {
                    $("#saveJadwal").html('<i class="fas fa-check"></i> SUBMIT');
                    $("#saveJadwal").removeClass('disabled');
                });
            } else if (result.dismiss === Swal.DismissReason.cancel ) {
                swalAlert.fire({
                    title: 'Batal Simpan',
                    text: 'Proses simpan data telah dibatalkan',
                    icon: 'error',
                    confirmButtonText: '<i class="fas fa-check"></i> Oke',
                }).then((result) => {
                    if (result.value) {
                        $('#frmDetailPem').waitMe('hide');
                        $("#saveJadwal").html('<i class="fas fa-check"></i> SUBMIT');
                        $("#saveJadwal").removeClass('disabled');
                    }
                })
            }
        })
    });
    function getDataListPembelian(token) {
        let html = '';
        $.ajax({
            type: 'GET',
            url: site + '/rules-pembelian',
            data: {'token' : token, '<?php echo $this->security->get_csrf_token_name(); ?>' : $('input[name="'+csrfName+'"]').val()},
            dataType: 'json',
            success: function(data) {
                $('input[name="'+csrfName+'"]').val(data.csrfHash);
                if(data.status = 'RC200') {
                    if(Object.keys(data.message).length > 0) {
                        jumlah = 0;
                        $.each(data.message, function(key, val){
                            // html += ' <tr class="table-info"><td colspan="8"><strong>Nama Kontrol : '+key+'</strong></td></tr>';
                            let no = 1;
                            $.each(val, function(row, v) {
                                html += '<tr>';
                                    html += '<td class="text-center">'+
                                                '<div class="custom-control custom-checkbox ml-2">'+
                                                    '<input type="checkbox" class="custom-control-input" name="checkid[]" id="checkid_'+key.toLowerCase().replace(' ','_')+'_'+no+'" class="checkid" value="'+v['id_detail_pembelian']+'">'+
                                                    '<label class="custom-control-label" for="checkid_'+key.toLowerCase().replace(' ','_')+'_'+no+'"></label>'+
                                                '</div>'+
                                            '</td>';
                                    html += '<td class="text-center">'+no+'.</td>';
                                    html += '<td>'+v['nm_barang']+'</td>';
                                    html += '<td class="text-left">'+v['satuan']+'</td>';
                                    html += '<td class="text-left">'+v['qty_barang']+'</td>';
                                    html += '<td class="text-left">'+v['harga_barang']+'</td>';
                                    html += '<td class="text-left">'+v['total_harga']+'</td>';
                                    html += '<td class="text-center">'+v['status']+'</td>';
                                html += '</tr>';
                                no++;
                                jumlah += parseInt(v['subtotal']);

                            });
                        });
                        $("#jumlah").html('Rp. '+NumberDenganKoma(jumlah));
                    } else
                        html = '<tr><td colspan="10"><i>Tidak Ada Data</i></td></tr>';
                        
                } else
                    html = '<tr><td colspan="10"><i>Tidak Ada Data</i></td></tr>';
                $('#tblDetail > tbody').html(html);
            }

        });
    }

    // Handle click on "check all" control
    $(document).on('click', '#checkAll', function(){
        $('#tblDetail > tbody input[type="checkbox"]').prop('checked', this.checked).trigger('change');
    });
    // Handle click on "checked" control
    $(document).on('change', '#tblDetail > tbody input[type="checkbox"]', function (e) {
        let rowCount = $('#tblDetail > tbody input[type="checkbox"]').length;
        let n = $('#tblDetail > tbody input[type="checkbox"]').filter(':checked').length;
        if(n > 0) {
            $('#eventButoon').show();
            $('#btnDeleteDetail').removeAttr('disabled');
            $('#btnUpdateStok').removeAttr('disabled');
        } else {
            $('#eventButoon').hide();
            $('#btnDeleteDetail').attr('disabled', '');
            $('#btnUpdateStok').attr('disabled', '');
        }
        $(this).is(':checked') ? $(this).closest('tr').addClass('table-active') : $(this).closest('tr').removeClass('table-active');
        if(rowCount !== n)
            $('#checkAll').prop('checked', '');
        else
            $('#checkAll').prop('checked', 'checked');
    });
    // Handle click on "tr" control
    $(document).on('click', '#tblDetail > tbody > tr', function(){
        let n = $(this).find('input[type="checkbox"]');
        n.prop('checked', (n.is(':checked')) ? false : true).trigger('change');
    });
    //btn delete rules
    $(document).on('click', '#btnDeleteDetail', function (e){
        e.preventDefault();
        let token = $('input[name="tokenDetail"]').val();
        let rules = [];
        $.each($('#tblDetail > tbody input[type="checkbox"]:checked'), function(){
            rules.push($(this).val());
        });
        const postData = {
            'tokenId': token,
            'detailId': rules,
            'flag'   : '<?= $this->encryption->encrypt('DR'); ?>',
            '<?php echo $this->security->get_csrf_token_name(); ?>': $('input[name="' + csrfName + '"]').val()
        };
        // get form action url
        $(this).html('<i class="spinner-grow spinner-grow-sm mr-2" role="status" aria-hidden="true"></i> DIPROSES...');
        $(this).addClass('disabled');
        run_waitMe($('#frmDetailPem'));
        swalAlert.fire({
            title: 'Konfirmasi',
            text: 'Apakah anda ingin menghapus data ini ?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '<i class="fas fa-check"></i> Ya, lanjutkan',
            cancelButtonText: '<i class="fas fa-times"></i> Tidak, batalkan',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: site + '/rules-pembelian/set-detail',
                    type: 'POST',
                    data: postData,
                    dataType: "json",
                }).done(function(data) {
                    $('input[name="'+csrfName+'"]').val(data.csrfHash);
                    if(data.status == 'RC404') {
                        swalAlert.fire({
                            title: 'Gagal Hapus',
                            text: 'Proses hapus data gagal, silahkan diperiksa kembali',
                            icon: 'error',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errDiklat').html(msg.error(data.message));
                                $('#frmDetailPem').waitMe('hide');
                            }
                        })
                    } else {
                        $('#frmDetailPem').waitMe('hide');
                        swalAlert.fire({
                            title: 'Berhasil Hapus',
                            text: data.message,
                            icon: 'success',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errDiklat').html(msg.success(data.message));
                                getDataListPembelian(data.kode);
                                getDataList();
                            }
                        })
                    }
                }).fail(function() {
                    $('#errDiklat').html(msg.error('Harap periksa kembali data yang dihapus'));
                    $('#frmDetailPem').waitMe('hide');
                }).always(function() {
                    $("#btnDeleteDetail").html('<i class="fas fa-trash-alt"></i> DELETE JADWAL');
                    $("#btnDeleteDetail").removeClass('disabled');
                });
            } else if (result.dismiss === Swal.DismissReason.cancel ) {
                swalAlert.fire({
                    title: 'Batal Hapus',
                    text: 'Proses hapus data telah dibatalkan',
                    icon: 'error',
                    confirmButtonText: '<i class="fas fa-check"></i> Oke',
                }).then((result) => {
                    if (result.value) {
                        $('#frmDetailPem').waitMe('hide');
                        $("#btnDeleteDetail").html('<i class="fas fa-trash-alt"></i> DELETE JADWAL');
                        $("#btnDeleteDetail").removeClass('disabled');
                    }
                })
            }
        })
    });
    //btn update status aktif
    $(document).on('click', '#btnUpdateStok', function (e){
        e.preventDefault();
        let token = $('input[name="tokenDetail"]').val();
        let rules = [];
        $.each($('#tblDetail > tbody input[type="checkbox"]:checked'), function(){
            rules.push($(this).val());
        });
        const postData = {
            'tokenId': token,
            'detailId': rules,
            'flag'   : '<?= $this->encryption->encrypt('AR'); ?>',
            '<?php echo $this->security->get_csrf_token_name(); ?>': $('input[name="' + csrfName + '"]').val()
        };
        // get form action url
        $(this).html('<i class="spinner-grow spinner-grow-sm mr-2" role="status" aria-hidden="true"></i> DIPROSES...');
        $(this).addClass('disabled');
        run_waitMe($('#frmDetailPem'));
        swalAlert.fire({
            title: 'Konfirmasi',
            text: 'Data yang sudah update stok tidak akan bisa dihapus! Apakah anda ingin update data stok ini ke gudang ?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '<i class="fas fa-check"></i> Ya, lanjutkan',
            cancelButtonText: '<i class="fas fa-times"></i> Tidak, batalkan',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: site + '/rules-pembelian/set-detail',
                    type: 'POST',
                    data: postData,
                    dataType: "json",
                }).done(function(data) {
                    $('input[name="'+csrfName+'"]').val(data.csrfHash);
                    if(data.status == 'RC404') {
                        swalAlert.fire({
                            title: 'Gagal Update',
                            text: 'Proses update status data gagal, silahkan diperiksa kembali',
                            icon: 'error',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errDiklat').html(msg.error(data.message));
                                $('#frmDetailPem').waitMe('hide');
                            }
                        })
                    } else {
                        $('#frmDetailPem').waitMe('hide');
                        swalAlert.fire({
                            title: 'Berhasil Update',
                            text: data.message,
                            icon: 'success',
                            confirmButtonText: '<i class="fas fa-check"></i> Oke',
                        }).then((result) => {
                            if (result.value) {
                                $('#errDiklat').html(msg.success(data.message));
                                getDataListPembelian(data.kode);
                            }
                        })
                    }
                }).fail(function() {
                    $('#errDiklat').html(msg.error('Harap periksa kembali data yang diupdate'));
                    $('#frmDetailPem').waitMe('hide');
                }).always(function() {
                    $("#btnUpdateStok").html('<i class="fas fa-check"></i> UPDATE STOK');
                    $("#btnUpdateStok").removeClass('disabled');
                });
            } else if (result.dismiss === Swal.DismissReason.cancel ) {
                swalAlert.fire({
                    title: 'Batal Update',
                    text: 'Proses update status data telah dibatalkan',
                    icon: 'error',
                    confirmButtonText: '<i class="fas fa-check"></i> Oke',
                }).then((result) => {
                    if (result.value) {
                        $('#frmDetailPem').waitMe('hide');
                        $("#btnUpdateStok").html('<i class="fas fa-check"></i> UPDATE STOK');
                        $("#btnUpdateStok").removeClass('disabled');
                    }
                })
            }
        })
    });

    $(document).on('keypress keyup', '.nominal',function (e) {
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
      return false;
    }
    });

    $(document).on('change input keyup', '.hitung', function(e){
        var hargaBarang = $('#harga_barang').val();
        var qtyBarang = $('#qty_barang').val();
        var totalHarga = Math.round(hargaBarang*qtyBarang).toString();
        $('#total_harga').val(totalHarga);
        // $('#biaya').val(biaya);
    });

    function NumberDenganKoma(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
</script>