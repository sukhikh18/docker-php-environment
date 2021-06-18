<?require_once($_SERVER['DOCUMENT_ROOT'] . "/bitrix/modules/main/include/prolog_before.php");

var_dump(\Bitrix\Main\UserFieldTable::getList()->fetchAll());