<?php

class MemberTransactions extends \Phalcon\Mvc\Model
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
    public $member_id;

    /**
     *
     * @var integer
     */
    public $payment_method_id;

    /**
     *
     * @var integer
     */
    public $transaction_type_id;

    /**
     *
     * @var string
     */
    public $reference;

    /**
     *
     * @var string
     */
    public $amount;


    public function initialize()
    {
         $this->belongsTo("user_id", "Users", "id");
         $this->belongsTo("member_id", "Members", "id");
         $this->belongsTo("payment_method_id", "PaymentMethods", "id");
         $this->belongsTo("transaction_type_id", "TransactionTypes", "id");
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
            'member_id' => 'member_id',
            'payment_method_id' => 'payment_method_id',
            'transaction_type_id' => 'transaction_type_id',
            'reference' => 'reference',
            'amount' => 'amount'
        );
    }

}
