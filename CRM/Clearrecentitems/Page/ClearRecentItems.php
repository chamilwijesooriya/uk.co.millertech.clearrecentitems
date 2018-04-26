<?php

use CRM_Clearrecentitems_ExtensionUtil as E;

class CRM_Clearrecentitems_Page_ClearRecentItems extends CRM_Core_Page
{

    public function run()
    {
        // if not ajax request, do nothing
        if (CRM_Utils_Request::retrieve('snippet', 'String') != 'json') CRM_Utils_System::redirect();;

        $contactID = CRM_Core_Session::getLoggedInContactID();

        // this was necessary to delete items for wordpress, no need for drupal
        $recentItems = CRM_Utils_Recent::get();
        foreach ($recentItems as $recentItem){
            CRM_Utils_Recent::del($recentItem);
        }

        // delete all recent list
        // clear store values
        CRM_Core_Session::singleton()->set(CRM_Utils_Recent::STORE_NAME, NULL);
        $this->assign('recentlyViewed', NULL);

        // add current contact to recent list
        if (!empty($contactID)) {
            $defaults = array();
            $params = array('id' => $contactID);
            CRM_Contact_BAO_Contact::retrieve($params, $defaults);

            // add the current contact
            $recentOther = array();
            if ((CRM_Core_Session::singleton()->get('userID') == $contactID) ||
                CRM_Contact_BAO_Contact_Permission::allow($contactID, CRM_Core_Permission::EDIT)
            ) {
                $recentOther['editUrl'] = CRM_Utils_System::url('civicrm/contact/add', 'reset=1&action=update&cid=' . $contactID);
            }

            if ((CRM_Core_Session::singleton()->get('userID') != $contactID) && CRM_Core_Permission::check('delete contacts')) {
                $recentOther['deleteUrl'] = CRM_Utils_System::url('civicrm/contact/view/delete', 'reset=1&delete=1&cid=' . $contactID);
            }

            CRM_Utils_Recent::add($defaults['display_name'],
                CRM_Utils_System::url('civicrm/contact/view', 'reset=1&cid=' . $contactID),
                $contactID,
                $defaults['contact_type'],
                $contactID,
                $defaults['display_name'],
                $recentOther
            );

            $this->assign('recentlyViewed', CRM_Utils_Recent::get());
        }

        parent::run();
    }

}
