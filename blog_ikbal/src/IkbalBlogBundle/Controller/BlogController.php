<?php

namespace IkbalBlogBundle\Controller;

use IkbalBlogBundle\Entity\ArticleRepository;
use IkbalBlogBundle\Entity\Articles;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;


class BlogController extends Controller
{

    /**
    *
    * @Route("/", name="index")
    */
    public function indexAction(Request $request)
    {
        $listarticles = $this->getDoctrine()->getRepository('IkbalBlogBundle:Articles') ->findAll();

        $articles  = $this->get('knp_paginator')->paginate(
        $listarticles,$request->query->get('page', 1)/*page number*/,4);
        /*All articles  with number article  for eache page */
        return $this->render('IkbalBlogBundle:blog:index.html.twig',array(
        'articles' => $articles
    ));         

    }
    /**
    *
    * @Route("/post/{url}", name="post")
    */
    public function postAction($url)
    {
        /* show article by id */
        $article = $this->getDoctrine()->getRepository('IkbalBlogBundle:Articles')->findOneBy(array('url' => $url));
        return $this->render('IkbalBlogBundle:blog:postAction.html.twig', array('article' => $article));
    }
}
