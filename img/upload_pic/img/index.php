<?php

error_reporting(E_ALL);

try {

    /**
     * Read the configuration
     */
    $config = include __DIR__ . "/../app/config/config.php";

    /**
     * Read auto-loader
     */
    include __DIR__ . "/../app/config/loader.php";
    
	include __DIR__ . "/../app/library/fb_autoload.php";
    include __DIR__ . "/../app/library/google_autoload.php"; 
	 
    /**
     * Read services
     */
    include __DIR__ . "/../app/config/services.php";
    
    /**
     * Read routers
     */
    include __DIR__ . "/../app/config/routes.php";
   
#    include __DIR__ . "/../app/plugins/UserPlugin/Plugin/Security.php";
#    include __DIR__ . "/../app/plugins/UserPlugin/Auth/Auth.php";
#    include __DIR__ . "/../app/plugins/UserPlugin/Connectors/BaseFacebook.php";
#    include __DIR__ . "/../app/plugins/UserPlugin/Connectors/FacebookConnector.php";

    /**
     * Handle the request
     */
    $application = new \Phalcon\Mvc\Application($di);

    echo $application->handle()->getContent();

} catch (\Exception $e) {
    echo $e->getMessage();
}
