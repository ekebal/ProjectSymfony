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

    public function getAction(Request $request)
    {
    	// on recupére un objet  doctrine , on indique ou se situe l'entité  concercé 
        // 
        //$request = $this->getRequest();
            $listarticles = $this->getDoctrine()
                ->getRepository('IkbalBlogBundle:Articles') ->findAll();


        $articles  = $this->get('knp_paginator')->paginate(
        $listarticles, /* query NOT result */
        $request->query->get('page', 1)
        /*page number*/,
        6/*limit per page*/);

              //  findAllPagineEtTrie($page, 5);
             /*   $pagination = array(
                'page' => $page,
                'nbPages' => ceil(count($articles) / 5),
                'nomRoute' => 'index',
                'paramsRoute' => array()
                );*/
            
            return $this->render('IkbalBlogBundle:blog:index.html.twig',array(
                'articles' => $articles
                //'pagination'=>$pagination
            ));         
                  
    }

       /**
     
     *
     * @Route("/index1", name="index1")
     */

   public function InsertAction()
   {
        for ($i= 1; $i <= 10; $i++) 
        { 
            $article = new Articles();
            $article->setTitle('Article'. $i .'eme');
            $article->setAuthor('Hero!');
             $article->setDate(new \DateTime());
            $article->setContent('Contenue contenu'.$i.'eme');
            $article->setPicture('image');
           
            $em = $this->getDoctrine()->getManager();
            $em->persist($article);
          
        }
              $em->flush();
        
        return new Response('Saved new product with id '.$article->getId());

   }
   /**
   *
     * @Route("/{id}", name="showArticle")
     */
     public function showAction($id,Request $request)
        {
       $id=$request->query->get('id');

              $article = $this->getDoctrine()->getRepository('IkbalBlogBundle:Articles')->find($id);
      if(!$article) {
            // il n'y a pas d'article correspondant => erreur 404 ou redirection ou ce que tu veux ... 
      }
      return $this->render('IkbalBlogBundle:blog:showArticle.html.twig', array('article' => $article));
        }
}
