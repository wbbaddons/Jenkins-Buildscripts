#!/usr/bin/php
<?php
$check = null;
$check = function ($folder) use (&$check) {
	if (is_file($folder)) {
		if (substr($folder, -4) === '.php') {
			passthru('php -l '.escapeshellarg($folder), $code);
			if ($code != 0) exit($code);
		}
		
		return;
	}
	$files = glob($folder.'/*');
	foreach ($files as $file) {
		$check($file);
	}
};
echo "
Checking PHP for Syntax Errors
------------------------------
";
if (file_exists('file')) $check('file');
if (file_exists('files')) $check('files');
