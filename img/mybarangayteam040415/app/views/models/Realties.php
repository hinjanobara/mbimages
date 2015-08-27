<?php


class Events extends \Phalcon\Mvc\Model
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
    public $price;

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
     * @var string
     */
    public $country_id;

    /**
     *
     * @var string
     */
    public $realty_category_id;

    /**
     *
     * @var integer
     */
    public $realty_type_id;

    /**
     *
     * @var integer
     */
    public $realty_condition_id;

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
    public $house_area;

    /**
     *
     * @var integer
     */
    public $last_area;

    /**
     *
     * @var integer
     */
    public $bedrooms;

    /**
     *
     * @var integer
     */
    public $bathrooms;

    /**
     *
     * @var integer
     */
    public $parking;

    /**
     *
     * @var integer
     */
    public $pets_allowed;

    /**
     *
     * @var integer
     */
    public $details;

    /**
     *
     * @var integer
     */
    public $view_hits;


    public function initialize()
    {
        $this->belongsTo("realty_category_id", "RealtyCategories", "id");
        $this->belongsTo("realty_type_id", "RealtyTypes", "id");
        $this->belongsTo("realty_condition_id", "RealtyConditions", "id");
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
            'price' => 'price',
            'street' => 'street',
            'city' => 'city',
            'country_id' => 'country_id',
            'lat' => 'lat',
            'lng' => 'lng',
            'realty_category_id' => 'realty_category_id',
            'realty_type_id' => 'realty_type_id',
            'realty_condition_id' => 'realty_condition_id',
            'house_area' => 'house_area',
            'lot_area' => 'lot_area',
            'bathrooms' => 'bathrooms',
            'bedrooms' => 'bedrooms',
            'parking' => 'parking',
            'pets_allowed' => 'pets_allowed',
            'details' => 'details',
            'view_hits' => 'view_hits'
        );
    }

}
