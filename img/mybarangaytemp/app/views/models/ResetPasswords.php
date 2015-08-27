<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class ResetPasswords extends \Phalcon\Mvc\Model
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
    public $email;

    /**
     *
     * @var string
     */
    public $token;

    /**
     *
     * @var string
     */
    public $used;



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
            'email' => 'email',
            'token' => 'token',
            'used'  => 'used'
        );
    }

}
