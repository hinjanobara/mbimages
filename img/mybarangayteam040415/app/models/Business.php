<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Business extends \Phalcon\Mvc\Model
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
    public $member_id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $website;

    /**
     *
     * @var string
     */
    public $telephone;

    /**
     *
     * @var string
     */
    public $email;

    /**
     *
     * @var string
     */
    public $street;

    /**
     *
     * @var string
     */
    public $city;

    /**
     *
     * @var integer
     */
    public $country_id;

    /**
     *
     * @var string
     */
    public $lat;

    /**
     *
     * @var string
     */
    public $lng;

    /**
     *
     * @var string
     */
    public $opened;

    /**
     *
     * @var integer
     */
    public $business_category_id;

    /**
     *
     * @var string
     */
    public $business_info;

    /**
     *
     * @var integer
     */
    public $accepted_payment_id;

    /**
     *
     * @var integer
     */
    public $average_rate;

    /**
     *
     * @var integer
     */
    public $total_review;

    /**
     *
     * @var string
     */
    public $view_hits;

    public function initialize()
    {
        $this->hasMany("id", "BusinessCategoryLists", "business_id");
        $this->hasMany("id", "Reviews", "business_id");
        $this->hasMany("id", "BusinessImages", "business_id");
        $this->belongsTo("country_id", "Countries", "id");
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
            'member_id' => 'member_id', 
            'name' => 'name', 
            'website' => 'website',
            'email' => 'email',  
            'telephone' => 'telephone', 
            'street' => 'street', 
            'city' => 'city', 
            'country_id' => 'country_id',
            'lat' => 'lat',
            'lng' => 'lng',
            'opened' => 'opened', 
            'business_category_id' => 'business_category_id', 
            'business_info' => 'business_info', 
            'accepted_payment_id' => 'accepted_payment_id',
            'average_rate' => 'average_rate',
            'total_review' => 'total_review',
            'view_hits' => 'view_hits'
        );
    }

}
