{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.7                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2017                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}

{literal}
    <script type="text/javascript">
        CRM.$(function($) {
            CRM.$('#crm-recently-viewed').parent().crmSnippet();
            CRM.$("#crm-recently-viewed").parent().parent().find("h2:first-child span.crm_blocktitle").append("<a href='#' id='crt-clear-recent-items' title='Clear Recent Items'><i class=\"crm-i fa-refresh\"  ></i></a>");

            CRM.$("#crt-clear-recent-items").click(function () {
                $('#crm-recently-viewed').parent().crmSnippet({
                    url: CRM.url('civicrm/clear-recent-items', '{reset: 1}')
                }).crmSnippet("refresh");
            });
        });
    </script>
    <style>
        #crt-clear-recent-items {
            margin-left:5px;
            color: #7d7d7d;
        }
        #crt-clear-recent-items:hover{
            color: #3b3b3b;
        }
    </style>
{/literal}
