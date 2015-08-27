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

				
		return $router;
	});
