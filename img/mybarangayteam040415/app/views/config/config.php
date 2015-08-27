<?php

return new \Phalcon\Config(array(
    'database' => array(
        'adapter'     => 'Mysql',
        'host'        => 'localhost',
        'username'    => 'root',
        'password'    => 'MyBarangay012215',
        'dbname'      => 'mybarangay2',
        'charset'     => 'utf8'
    ),
    'application' => array(
        'controllersDir' => __DIR__ . '/../../app/controllers/',
        'modelsDir'      => __DIR__ . '/../../app/models/',
        'viewsDir'       => __DIR__ . '/../../app/views/',
        'pluginsDir'     => __DIR__ . '/../../app/plugins/',
        'libraryDir'     => __DIR__ . '/../../app/library/',
        'cacheDir'       => __DIR__ . '/../../app/cache/',
        'baseUri'        => '/mybarangayteam/',
    ),
    'mail' => array(
                'senderName' => 'MyBarangay',
                'senderEmail'   => 'noreply@mybarangay.com',
                'smtp' => array(
                        'server' => 'smtp.gmail.com',
                        'port'  => 465,
                        'security'  => 'ssl',
                        'username'  =>  'cakephpninja@gmail.com',
                        'password'  =>  'CakePHPSDR27MAHZ14'
                )
    ),
    'facebook' => array(
                 'appId' => '10152791908818500',
                 'secret' => 'c41c37dae70ccb53c8ed00c89f26de0a',
                 'redirect'	=>	'http://mybarangay.cloudapp.net/mybarangayteam/member/fbAuth'
    ),
    'google' => array(
                 'devKey' => 'AIzaSyAbpLPfBH8sNdVSzMULD_BZN9qrAqbL3V8',
                 'appId' => '155579594624-3c5g7n9sf7baegg498ol4a5j48v7gojf.apps.googleusercontent.com',
                 'secret' => 'zomXUNPe-5C6SUQ6miDCTD1U',
                 'redirect' =>  'postmessage'
    )
));
