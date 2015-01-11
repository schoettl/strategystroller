var TAB_PROJECT_RESOLUTIONS = 2;
var TAB_PROJECT_CALCULATION = 3;
var TAB_PROJECT_STATUS = 4;


$(function() {

    $('#tabs').tabs({
        disabled: [TAB_PROJECT_RESOLUTIONS, TAB_PROJECT_CALCULATION, TAB_PROJECT_STATUS]
    });

    $('.date-field').datepicker({
        format: "yyyy-mm-dd"
    });

    $('.chosen-select').chosen();

    enableAppropriateTabs();

    $('#project_is_project').click(function() {
        enableProjectTabs(this.checked);
    });
});

function enableAppropriateTabs() {
    if ($('#project_is_project').prop('checked')) {
        enableProjectTabs(true);
    }
    if ($('#updates-requested').data('flag')) {
        $('#tabs').tabs('enable', TAB_PROJECT_STATUS);
    }
}

function enableProjectTabs(flag) {
    var method = flag ? 'enable' : 'disable';
    $('#tabs').tabs(method, TAB_PROJECT_RESOLUTIONS)
              .tabs(method, TAB_PROJECT_CALCULATION);
}

