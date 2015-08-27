<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class BusinessUpdates extends \Phalcon\Mvc\Model
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
     * @var integer
     */
    public $business_id;

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
     * @var string
     */
    public $status;


    public function initialize()
    {
        $this->hasMany("id", "BusinessCategoryListUpdates", "business_update_id");
        $this->belongsTo("business_id", "Business", "id");
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
            'business_id' => 'business_id', 
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
            'business_info' => 'business_info', 
            'accepted_payment_id' => 'accepted_payment_id',
            'status' => 'status'
        );
    }

}
