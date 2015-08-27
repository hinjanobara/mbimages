<?php

class BusinessCategoryListUpdates extends \Phalcon\Mvc\Model
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
    public $business_update_id;

    /**
     *
     * @var string
     */
    public $business_category_id;

     public function initialize()
    {
         $this->belongsTo("business_update_id", "BusinessUpdates", "id");
         $this->belongsTo("business_category_id", "BusinessCategories", "id");
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
            'business_update_id' => 'business_update_id',
            'business_category_id' => 'business_category_id'
        );
    }

}
