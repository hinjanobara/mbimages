<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class SocialProfiles extends \Phalcon\Mvc\Model
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
     * @var integer
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
     * @var integer
     */
    public $email;

    /**
     *
     * @var string
     */
    public $mobile;

    /**
     *
     * @var string
     */
    public $social_network;

    /**
     *
     * @var string
     */
    public $access_token;

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
            'member_id' => 'member_id',
            'social_id' => 'social_id',
            'profile_link' => 'profile_link', 
            'first_name' => 'first_name', 
            'middle_name' => 'middle_name', 
            'last_name' => 'last_name', 
            'gender' => 'gender', 
            'birthday' => 'birthday', 
            'street' => 'street', 
            'city' => 'city', 
            'country_id' => 'country_id', 
            'email' => 'email', 
            'mobile' => 'mobile', 
            'social_network' => 'social_network',
            'access_token'  => 'access_token'
        );
    }

}
