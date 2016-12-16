<?php
namespace IkbalBlogBundle\Controller;

use IkbalBlogBundle\Entity\ArticleRepository;
use IkbalBlogBundle\Entity\Articles;
use IkbalBlogBundle\Form\ArticleType;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Typse\DateType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;


class CrudController extends Controller
{

	/**
	*
	* @Route("/newAction", name="newaction")
	*/
	public function  newAction(Request $request)
    {

        $article = new Articles();
        $em = $this->getDoctrine()->getManager();
        $form = $this->createForm(ArticleType::class, $article);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid())
	        {
	        	$article = $form->getData();
	        	$article->setDate(new \DateTime());
	        	$em->persist($article);
	        	$em->flush();
	        	return $this->redirectToRoute('index');
	        }
        return $this->render('IkbalBlogBundle:blog:addNewArticle.html.twig', array(
        'form' => $form->createView(),
        ));
    }

	/**
	*
	* @Route("/DeleteAction/{id}", name="deleteaction")
	*/
     public function deleteaction($id)
		{
			$em = $this->getDoctrine()->getManager();
			$articleTomove = $em->getRepository('IkbalBlogBundle:Articles')->find($id);
			$em->remove($articleTomove);
			$em->flush(); 
		return $this->redirectToRoute('index');
		}
		/**
	*
	* @Route("/EditAction/{id}", name="EditAction")
	*/
	 public function EditAction(Request $request,$id)
		{
			$user=$this->getUser();
			$em = $this->getDoctrine()->getManager();
			$articleToedit = $em->getRepository('IkbalBlogBundle:Articles')->find($id);
			$form = $this->createForm(ArticleType::class, $articleToedit, array( 'action' => $this->generateUrl('EditAction', array('id' => $id) )));
        
       		 $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            // $form->getData() holds the submitted values
            
            $articleToedit = $form->getData();
       
            
            $em->flush();

				return $this->redirectToRoute('index');
			}
			return $this->render('IkbalBlogBundle:blog:editArticle.html.twig', array(
			'form' => $form->createView()));
		
		}
}

?>