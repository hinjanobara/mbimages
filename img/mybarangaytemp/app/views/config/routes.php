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

    
        
        return $router;
    });
