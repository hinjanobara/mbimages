<?php

class BusinessAsubCategories extends \Phalcon\Mvc\Model
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
     * @var integer
     */
    public $business_sub_category_id;

    /**
     *
     * @var string
     */
    public $name;

    public function initialize()
    {
         $this->belongsTo("business_sub_category_id", "BusinessSubCategories", "id");
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
            'business_sub_category_id' => 'business_sub_category_id', 
            'name' => 'name'
        );
    }

}
