<?php

class Countries extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $country;

    /**
     *
     * @var string
     */
    public $nationality;

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'country' => 'country', 
            'nationality' => 'nationality'
        );
    }

}
