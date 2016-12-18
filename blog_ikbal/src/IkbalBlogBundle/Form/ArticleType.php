<?php
namespace IkbalBlogBundle\Form;

use Ivory\CKEditorBundle\Form\Type\CKEditorType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class ArticleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->setMethod('POST')
         ->add('title')
         ->add('url')
         ->add('picture')
         ->add('content', CKEditorType::class)
         ->add('save', SubmitType::class);
    }
}


?>