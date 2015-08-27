<?php

class BusinessCategoryLists extends \Phalcon\Mvc\Model
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
    public $business_id;

    /**
     *
     * @var string
     */
    public $business_category_id;

     public function initialize()
    {
         $this->belongsTo("business_id", "Business", "id");
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
            'business_id' => 'business_id',
            'business_category_id' => 'business_category_id'
        );
    }

}
