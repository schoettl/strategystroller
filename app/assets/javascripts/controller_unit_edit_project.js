var TAB_PROJECT_RESOLUTIONS = 2;
var TAB_PROJECT_CALCULATION = 3;
var TAB_PROJECT_STATUS = 4;


$(function() {

    $('#tabs').tabs({
        //disabled: [TAB_PROJECT_RESOLUTIONS, TAB_PROJECT_CALCULATION, TAB_PROJECT_STATUS] // TODO this line should be NO comment in production!
    });

    $('.date-field').datepicker({
        format: "yyyy-mm-dd"
    });

    $('.chosen-select').chosen();

    enableAppropriateTabs();

    $('#project_is_project').click(function() {
        enableProjectTabs(this.checked);
    });

/*
    $('#document_table tbody').on('dblclick', 'tr', function() {
        alert('download file: ' + $(this).text());
    });

    var uploadUrl = '../documents';
    var options = {iframe: {url: uploadUrl}}; // relativ -> controller_unit/project/:project_id/documents
    var zone = new FileDrop('document_drop_zone', options);

    zone.event('send', function(files) {
        files.each(function(file) {
            file.event('done', function(xhr) {
                alert('Done uploading ' + this.name + ',' +
                ' response:\n\n' + xhr.responseText);
            });

            file.event('error', function(e, xhr) {
                alert('Error uploading ' + this.name + ': ' +
                xhr.status + ', ' + xhr.statusText);
            });

            file.sendTo(uploadUrl);
        });
    });

    // <iframe> uploads are special - handle them.
    zone.event('iframeDone', function(xhr) {
        alert('Done uploading via <iframe>, response:\n\n' + xhr.responseText);
    });

    // Toggle multiple file selection in the File Open dialog.
    fd.addEvent(fd.byID('zbasicm'), 'change', function(e) {
        zone.multiple((e.currentTarget || e.srcElement).checked);
    }); */
});

function enableAppropriateTabs() {
    if ($('#project_is_project').prop('checked')) {
        enableProjectTabs(true);
    }
    if (true) { // TODO Only when request for updates...
        $('#tabs').tabs('enable', TAB_PROJECT_STATUS);
    }
}

function enableProjectTabs(flag) {
    var method = flag ? 'enable' : 'disable';
    $('#tabs').tabs(method, TAB_PROJECT_RESOLUTIONS)
              .tabs(method, TAB_PROJECT_CALCULATION);
}

