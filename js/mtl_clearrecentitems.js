CRM.$(function ($) {
    CRM.$('#crm-recently-viewed').parent().crmSnippet();
    CRM.$("#crm-recently-viewed").parent().parent().find("h2:first-child span.crm_blocktitle").append("<a href='#' id='crt-clear-recent-items' title='Clear Recent Items'><i class=\"crm-i fa-refresh\"  ></i></a>");

    CRM.$("#crt-clear-recent-items").click(function () {
        $('#crm-recently-viewed').parent().crmSnippet({
            url: CRM.url('civicrm/clear-recent-items', '{reset: 1}')
        }).crmSnippet("refresh");
    });
});