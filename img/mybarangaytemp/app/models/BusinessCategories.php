<?php

class BusinessCategories extends \Phalcon\Mvc\Model
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
    public $main_title;

    /**
     *
     * @var string
     */
    public $sub_title;

    /**
     *
     * @var string
     */
    public $title;

    /**
     *
     * @var string
     */
    public $unique_word;

    public function initialize()
    {
         $this->hasMany("id", "BusinessCategoryLists", "business_category_id");
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
            'main_title' => 'main_title',
            'title' => 'title', 
            'sub_title' => 'sub_title',
            'unique_word' => 'unique_word'
        );
    }

}
