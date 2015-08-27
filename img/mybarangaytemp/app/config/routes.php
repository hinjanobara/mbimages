<?php

    $di->set('router', function(){
        
    	$router = new \Phalcon\Mvc\Router();

        //Define a route
        $router->add(
            '/login',
            array(
                'controller' => 'member',
                'action'     => 'login'
            )
        );

        $router->add(
            '/logout',
            array(
                'controller' => 'member',
                'action'     => 'logout'
            )
        );

        $router->add(
            '/signup',
            array(
                'controller' => 'member',
                'action'     => 'signup'
            )
        );

        $router->add(
            'member',
            array(
                'controller' => 'member',
                'action'     => 'page'
            )
        );
        
        //Define admin route
		$router->add('/admin/:controller', array(
                'controller' => 1,
                'action' => 'admin_index'
        ));

        $router->add('/admin/:controller/view/:params', array(
                'controller' => 1,
                'action' => 'admin_view',
                'params' => 2
        ));

        $router->add('/admin/:controller/add', array(
                'controller' => 1,
                'action' => 'admin_add'
        ));

        $router->add('/admin/:controller/pending/:params', array(
                'controller' => 1,
                'action' => 'admin_pending',
                'params' => 2
        ));

        $router->add('/admin/login', array(
                'controller' => 'user',
                'action' => 'admin_login'
        ));

        $router->add('/admin/logout', array(
                'controller' => 'user',
                'action' => 'admin_logout'
        ));

        $router->add('/admin', array(
                'controller' => 'user',
                'action' => 'admin_login'
        ));

        $router->add('/admin/:controller/login', array(
                'controller' => 'user',
                'action' => 'admin_login'
        ));

        $router->add('/admin/user/login', array(
                'controller' => 'user',
                'action' => 'admin_login'
        ));

        $router->add('/advertiser/login', array(
                'controller' => 'member',
                'action' => 'advertiser_login'
        ));

        $router->add('/advertiser/signup', array(
                'controller' => 'member',
                'action' => 'advertiser_signup'
        ));

        $router->add('/advertiser/emailConfimation/:params/:params/:params', array(
                'controller' => 'member',
                'action' => 'advertiser_emailConfimation',
                'params' => 1,
                'params' => 2,
                'params' => 3
        ));

        $router->add('/search', array(
                'controller' => 'index',
                'action' => 'search'
        ));

				
		return $router;
	});
