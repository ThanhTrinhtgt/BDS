<?php
/**
 * Luu constant
 */

define('SERVER_NAME', 'localhost');
if (in_array($_SERVER['REMOTE_ADDR'], ['127.0.0.1', '::1'])) {\
    define('SQL_USERNAME', 'admin');
    define('SQL_DATABASE', 'bds');
    define('SQL_PASSWORD', '(i/Ec7-[h0zAm_Hd');
} else {
    define('SQL_USERNAME', 'revie641_bds');
    define('SQL_PASSWORD', 'Thanh544');
    define('SQL_DATABASE', 'revie641_bds');
}
