<?php  // Moodle configuration file — EXAMPLE (no secrets)

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mariadb';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'CHANGE_ME_RDS_OR_HOST';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'CHANGE_ME';
$CFG->dbpass    = 'CHANGE_ME';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '3306',
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_unicode_ci',
);

$CFG->wwwroot   = 'https://aulavirtual.campusvirtual.conred.gob.gt';
$CFG->dataroot  = '/var/moodledata'; // o mount EFS p.ej. /mnt/efs/moodledata
$CFG->admin     = 'admin';
$CFG->slasharguments = 0;

$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');
