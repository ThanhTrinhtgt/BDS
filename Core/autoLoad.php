<?php

function autoload($className)
{
    $sitePath = realpath(dirname(__FILE__) . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR) . DIRECTORY_SEPARATOR;
    $nameParts = explode('\\', $className);

    $filePath = $sitePath;

    foreach ($nameParts as $k => $name) {
        if (in_array($name, ['BDS'])) {
            continue;
        }

        $filePath .= $name;

        if ($k == count($nameParts) - 1) {
            $filePath .= '.php';
        } else {
            $filePath .= DIRECTORY_SEPARATOR;
        }
    }

    if (is_readable($filePath)) {
        include_once($filePath);

        return true;
    } else {
        return false;
    }
}

spl_autoload_register('autoload');