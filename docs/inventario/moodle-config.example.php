# Moodle `config.php` (plantilla — sin secretos)

```php
<?php
unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mariadb'; // o 'mysqli' / auroramysql según target
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'CHANGE_ME_RDS_ENDPOINT';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'CHANGE_ME';
$CFG->dbpass    = 'CHANGE_ME'; // preferible inyectar desde secreto
$CFG->prefix    = 'mdl_';
$CFG->dboptions = [
  'dbpersist' => 0,
  'dbport' => 3306,
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_unicode_ci',
];

$CFG->wwwroot   = 'https://aulavirtual.campusvirtual.conred.gob.gt';
$CFG->dataroot  = '/mnt/efs/moodledata'; // o /var/moodledata
$CFG->admin     = 'admin';
$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');
```
