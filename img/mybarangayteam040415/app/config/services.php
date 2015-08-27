<?php

use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
//use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Mvc\Model\Metadata\Memory as MetaDataAdapter;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\Mvc\Dispatcher as Dispatcher;
//use Phalcon\Security as Security;
//use Phalcon\UserPlugin\Plugin\Security as Security;
//use Phalcon\UserPlugin\Auth\Auth as Auth;


use Facebook\FacebookSession as FacebookSession;
use Facebook\FacebookRedirectLoginHelper as FacebookRedirectLoginHelper;
use Facebook\FacebookRequest as FacebookRequest;
use Facebook\FacebookResponse;
use Facebook\FacebookSDKException;
use Facebook\FacebookRequestException;
use Facebook\FacebookAuthorizationException;
use Facebook\GraphObject;
use Facebook\GraphLocation as GraphLocation;
use Facebook\Entities\AccessToken;
use Facebook\HttpClients\FacebookCurlHttpClient;
use Facebook\HttpClients\FacebookHttpable;

use Google\Client;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set('url', function () use ($config) {
    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);

    return $url;
}, true);

/**
 * Setting up the view component
 */
$di->set('view', function () use ($config) {

    $view = new View();

    $view->setViewsDir($config->application->viewsDir);

    $view->registerEngines(array(
#        '.volt' => function ($view, $di) use ($config) {

#            $volt = new VoltEngine($view, $di);

#            $volt->setOptions(array(
#                'compiledPath' => $config->application->cacheDir,
#                'compiledSeparator' => '_'
#            ));

#            return $volt;
#        },
        '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
    ));

    return $view;
}, true);

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->set('db', function () use ($config) {
    return new DbAdapter(array(
        'host' => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname' => $config->database->dbname
    ));
});

/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->set('modelsMetadata', function () {
    return new MetaDataAdapter();
});

$di->set('modelsManager', function() {
      return new Phalcon\Mvc\Model\Manager();
 });

/**
 * Start the session the first time some component request the session service
 */
$di->set('session', function () {
    $session = new SessionAdapter();
    $session->start();
    return $session;
});


$di->set('fbSetDefault', function () use ($config) {
	//$fbSession = new FacebookSession();
	return FacebookSession::setDefaultApplication($config->facebook->appId,$config->facebook->secret);
});

$di->set('fbGraphLocation', function () {
	return new GraphLocation();
});

$di->set('fbRedirectLoginHelper', function () use ($config) {
	return new FacebookRedirectLoginHelper($config->facebook->redirect);
});

$di->set('fbRequest', function () {
	return new FacebookRequest();
});

$di->set('googleClient', function () use ($config) {
	$client = new Google_Client();
	$client->setApplicationName("MyBarangay");
	$client->setDeveloperKey($config->google->devKey);
	$client->setClientId($config->google->appId);
	$client->setClientSecret($config->google->secret);
	$client->setRedirectUri($config->google->redirect);
    $scope[] = 'https://www.googleapis.com/auth/plus.me';
    $scope[] = 'https://www.googleapis.com/auth/userinfo.email';
    $scope[] = 'https://www.googleapis.com/auth/userinfo.profile';
    $client->setScopes($scope);	
	return $client;
});


#$di->set('security', function(){

#    $security = new Phalcon\Security();

#    //Set the password hashing factor to 12 rounds
#    $security->setWorkFactor(12);

#    return $security;
#}, true);

#$di->set('auth', function () {
#    return new \Phalcon\UserPlugin\Auth\Auth();
#});

#$di->set('acl', function() {
#        return new \Phalcon\UserPlugin\Acl\Acl();
#});


$di->set('dispatcher', function() use ($di) {
        $eventsManager = $di->getShared('eventsManager');
        
       // $security = new \Phalcon\UserPlugin\Plugin\Security($di);
        $fbSession = new Facebook\FacebookSession($di);
        $eventsManager->attach('dispatch', $fbSession);

        $dispatcher = new Dispatcher();
        $dispatcher->setEventsManager($eventsManager);
        return $dispatcher;
});

$di->set('flash', function(){
		$flash = new \Phalcon\Flash\Session(array(
		    'error' => 'alert alert-danger',
		    'success' => 'alert alert-success',
		    'notice' => 'alert alert-info',
		    'warning' => 'alert alert-warning'
		    ));
		return $flash;
});

$di->set('config', function () use ($config) {
    return $config;
});

$di->set('mail', function(){
    return new Mail();
});


