<?php
// src/AppBundle/Entity/User.php

namespace IkbalBlogBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    public function __construct()
    {
        parent::__construct();
        // your own logic
    }
    /**
 * @Route("/Login", name="wx_exchange_login")
 * @Template("IkbalBlogBundle:User:login.html.twig")
 * User log up - Open to public
 * Authenticates users to the system
 */
public function loginAction()
{
    return $this->render('WXExchangeBundle:User:login.html.twig');
}
}