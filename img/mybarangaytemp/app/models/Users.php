<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Users extends \Phalcon\Mvc\Model
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
    public $first_name;

    /**
     *
     * @var string
     */
    public $middle_name;

    /**
     *
     * @var string
     */
    public $last_name;

    /**
     *
     * @var string
     */
    public $gender;

    /**
     *
     * @var string
     */
    public $birthday;

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
    public $email;

    /**
     *
     * @var string
     */
    public $password;

    /**
     *
     * @var string
     */
    public $mobile;



    // public function initialize()
    // {
    //      $this->belongsTo("member_id", "Members", "id");
    //      $this->hasMany("id", "Reviews", "member_id");
    //      $this->hasMany("id", "Jobs", "member_id");
    //      $this->hasMany("id", "Realties", "member_id");
    //      $this->hasMany("id", "Automotives", "member_id");
    // }

    /**
     * Validations and business logic
     */
    public function validation()
    {

        $this->validate(
            new Email(
                array(
                    'field'    => 'email',
                    'required' => true,
                )
            )
        );
        if ($this->validationHasFailed() == true) {
            return false;
        }
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
            'first_name' => 'first_name', 
            'middle_name' => 'middle_name', 
            'last_name' => 'last_name', 
            'gender' => 'gender', 
            'birthday' => 'birthday', 
            'street' => 'street', 
            'city' => 'city', 
            'country_id' => 'country_id', 
            'email' => 'email',
            'password' => 'password', 
            'mobile' => 'mobile'
        );
    }

}
