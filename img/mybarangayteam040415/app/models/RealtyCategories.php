<?php

class RealtyCategories extends \Phalcon\Mvc\Model
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
    public $created;

    /**
     *
     * @var string
     */
    public $modified;

    /**
     *
     * @var integer
     */
    public $user_id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $realty_type_id;

    public function initialize()
    {
         $this->belongsTo("realty_type_id", "RealtyTypes", "id");
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id',
            'created' => 'created',
            'modified' => 'modified',
            'user_id' => 'user_id',
            'name' => 'name',
            'realty_type_id' => 'realty_type_id'
        );
    }

}
