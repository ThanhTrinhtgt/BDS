<?php

function autoload($className)
{
    $className = ltrim($className, '\\');
    $fileName  = '';
    $namespace = '';
    if ($lastNsPos = strrpos($className, '\\')) {
        $namespace = substr($className, 0, $lastNsPos);
        $className = substr($className, $lastNsPos + 1);
        $fileName  = str_replace('\\', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;
    }
    
    $fileName .= str_replace('_', DIRECTORY_SEPARATOR, $className);

    if (file_exists(dirname(dirname(__DIR__)) . '\\' . $fileName . '.php')) {
        include_once dirname(dirname(__DIR__)) . '\\' . $fileName . '.php';
    }
}

spl_autoload_register('autoload');