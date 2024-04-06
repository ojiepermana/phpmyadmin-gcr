<?php
$cfg['blowfish_secret'] = '72937429sdfsf7s98f8sss9f7s9f9sf6f9s8'; // Set this to a secret passphrase

/**
 * Servers configuration
 */
$i = 0;

/**
 * First server
 */
$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['socket'] = '/cloudsql/permana:asia-southeast2:moggy'; // Replace with your actual socket path
$cfg['Servers'][$i]['connect_type'] = 'socket';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

// Optionally, the 'host' parameter can be set to 'localhost' or left as an empty string if using socket connections
// $cfg['Servers'][$i]['host'] = 'localhost';

/**
 * phpMyAdmin configuration storage settings.
 */

// Other settings can go here

/* End of servers configuration */

/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

// You can add more configuration settings as needed
?>
