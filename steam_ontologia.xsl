<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE rdf:RDF [
    <!ENTITY owl "http://www.w3.org/2002/07/owl#" >
    <!ENTITY xsd "http://www.w3.org/2001/XMLSchema#" >
    <!ENTITY rdfs "http://www.w3.org/2000/01/rdf-schema#" >
    <!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#" >
    <!ENTITY steam-ontologia "http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#" >
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xml:base="http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontology"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns:ex="http://www.di.uminho.pt/jcr/XML/rdf/ex2#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:steam-ontologia="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <rdf:RDF xmlns="http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#"
            xml:base="http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia"
            xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
            xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
            xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
            xmlns:steam-ontologia="http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#">
            <owl:Ontology
                rdf:about="http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia"/>



            <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Object Properties
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->




            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Classifica -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;Classifica">
                <rdfs:domain rdf:resource="&steam-ontologia;Classificação"/>
                <owl:inverseOf rdf:resource="&steam-ontologia;TemClassificação"/>
                <rdfs:range rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Edita -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;Edita">
                <rdfs:domain rdf:resource="&steam-ontologia;Editora"/>
                <owl:inverseOf rdf:resource="&steam-ontologia;TemEditora"/>
                <rdfs:range rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Produz -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;Produz">
                <rdfs:domain rdf:resource="&steam-ontologia;Produtora"/>
                <rdfs:range rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemCategoria -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;TemCategoria">
                <rdfs:range rdf:resource="&steam-ontologia;Categoria"/>
                <owl:inverseOf rdf:resource="&steam-ontologia;TemJogo"/>
                <rdfs:domain rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemClassificação -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;TemClassificação">
                <rdfs:range rdf:resource="&steam-ontologia;Classificação"/>
                <rdfs:domain rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemEditora -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;TemEditora">
                <rdfs:range rdf:resource="&steam-ontologia;Editora"/>
                <rdfs:domain rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemJogo -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;TemJogo">
                <rdfs:domain rdf:resource="&steam-ontologia;Categoria"/>
                <rdfs:range rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemProdutora -->

            <owl:ObjectProperty rdf:about="&steam-ontologia;TemProdutora">
                <rdfs:range rdf:resource="&steam-ontologia;Produtora"/>
                <owl:inverseOf rdf:resource="&steam-ontologia;Produz"/>
                <rdfs:domain rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>
            
            
            <owl:ObjectProperty rdf:about="&steam-ontologia;TemLíngua">
                <rdfs:range rdf:resource="&steam-ontologia;Língua"/>
                <owl:inverseOf rdf:resource="&steam-ontologia;ÉLínguaEm"/>
                <rdfs:domain rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>
            
            <owl:ObjectProperty rdf:about="&steam-ontologia;TemLíngua">
                <rdfs:domain rdf:resource="&steam-ontologia;Língua"/>
                <owl:inverseOf rdf:resource="&steam-ontologia;TemLíngua"/>
                <rdfs:range rdf:resource="&steam-ontologia;VideoJogo"/>
            </owl:ObjectProperty>




            <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Data properties
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->




            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#LançadoEm -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;LançadoEm"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#PreçoComPromoção -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;PreçoComPromoção">
                <rdfs:subPropertyOf rdf:resource="&steam-ontologia;TemPromoção"/>
            </owl:DatatypeProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#PreçoSemPromoção -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;PreçoSemPromoção">
                <rdfs:subPropertyOf rdf:resource="&steam-ontologia;TemPromoção"/>
            </owl:DatatypeProperty>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemClassificaçãoMetascore -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;TemClassificaçãoMetascore"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemNome -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;TemNome"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemPreço -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;TemPreço"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemPromoção -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;TemPromoção"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemReviewsNegativas -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;TemReviewsNegativas"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#TemReviewsPositivas -->

            <owl:DatatypeProperty rdf:about="&steam-ontologia;TemReviewsPositivas"/>
            
            <owl:DatatypeProperty rdf:about="&steam-ontologia;TemLigação"/>



            <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Classes
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->




            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Categoria -->

            <owl:Class rdf:about="&steam-ontologia;Categoria"/>
            
            
            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Língua -->
            
            <owl:Class rdf:about="&steam-ontologia;Língua"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Classificação -->

            <owl:Class rdf:about="&steam-ontologia;Classificação"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Editora -->

            <owl:Class rdf:about="&steam-ontologia;Editora"/>


            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#Produtora -->

            <owl:Class rdf:about="&steam-ontologia;Produtora"/>



            <!-- http://www.semanticweb.org/jpereira/ontologies/2015/6/steam-ontologia#VideoJogo -->

            <owl:Class rdf:about="&steam-ontologia;VideoJogo"/>



            <!-- 
    ///////////////////////////////////////////////////////////////////////////////////////
    //
    // Individuals
    //
    ///////////////////////////////////////////////////////////////////////////////////////
     -->
            <xsl:for-each select="//categorias/value[not(.=preceding::value)]">
                <owl:NamedIndividual rdf:about="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}">
                    <rdf:type rdf:resource="&steam-ontologia;Categoria"/>
                    <TemNome rdf:datatype="&xsd;string"><xsl:value-of select="."></xsl:value-of></TemNome>
                </owl:NamedIndividual>
            </xsl:for-each>
            
            <xsl:for-each select="//editoras[not(.=preceding::editoras)]">
                <owl:NamedIndividual rdf:about="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}">
                    <rdf:type rdf:resource="&steam-ontologia;Editora"/>
                    <TemNome rdf:datatype="&xsd;string"><xsl:value-of select="."></xsl:value-of></TemNome>
                </owl:NamedIndividual>
            </xsl:for-each>
            
            <xsl:for-each select="//produtoras[not(.=preceding::produtoras)]">
                <owl:NamedIndividual rdf:about="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}">
                    <rdf:type rdf:resource="&steam-ontologia;Produtora"/>
                    <TemNome rdf:datatype="&xsd;string"><xsl:value-of select="."></xsl:value-of></TemNome>
                </owl:NamedIndividual>
            </xsl:for-each>
            
            <xsl:for-each select="//linguas/value[not(.=preceding::value)]">
                <owl:NamedIndividual rdf:about="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}">
                    <rdf:type rdf:resource="&steam-ontologia;Língua"/>
                    <TemNome rdf:datatype="&xsd;string"><xsl:value-of select="."></xsl:value-of></TemNome>
                </owl:NamedIndividual>
            </xsl:for-each>
            
            <xsl:for-each select="//classificacoes/value[not(.=preceding::value)]">
                <owl:NamedIndividual rdf:about="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}">
                    <rdf:type rdf:resource="&steam-ontologia;Classificação"/>
                    <TemNome rdf:datatype="&xsd;string"><xsl:value-of select="."></xsl:value-of></TemNome>
                </owl:NamedIndividual>
            </xsl:for-each>
            
            <xsl:for-each select="//item">
                <owl:NamedIndividual rdf:about="&steam-ontologia;{translate(nome, translate(nome,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}">
                    <rdf:type rdf:resource="&steam-ontologia;VideoJogo"/>
                    <TemNome rdf:datatype="&xsd;string"><xsl:value-of select="nome"></xsl:value-of></TemNome>
                    
                    <xsl:for-each select="./categorias/value">
                        <TemCategoria rdf:resource="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}"/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./linguas/value">
                        <TemLíngua rdf:resource="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}"/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./classificacoes/value">
                        <TemClassificação rdf:resource="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}"/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./editora">
                        <TemEditora rdf:resource="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}"/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./produtora">
                        <TemProdutora rdf:resource="&steam-ontologia;{translate(., translate(.,'ABCDEFGHIJLMNOPQRSTUVXYZabcdefghijlmnopqrstuvxzyKk1234567890wW',''), '')}"/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./preco_com_desconto">
                        <PreçoComPromoção rdf:datatype="&xsd;float"><xsl:value-of select="replace(.,',','.')"></xsl:value-of></PreçoComPromoção>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./preco_sem_desconto">
                        <PreçoSemPromoção rdf:datatype="&xsd;float"><xsl:value-of select="replace(.,',','.')"></xsl:value-of></PreçoSemPromoção>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./desconto">
                        <TemPromoção rdf:datatype="&xsd;int"><xsl:value-of select="."></xsl:value-of></TemPromoção>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./preco">
                        <TemPreço rdf:datatype="&xsd;float"><xsl:value-of select="replace(.,',','.')"></xsl:value-of></TemPreço>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./link">
                        <TemLigação rdf:datatype="&xsd;string"><xsl:value-of select="."></xsl:value-of></TemLigação>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./comentarios_negativos">
                        <TemReviewsNegativas rdf:datatype="&xsd;int"><xsl:value-of select="."></xsl:value-of></TemReviewsNegativas>
                    </xsl:for-each>
                    
                    <xsl:for-each select="./comentarios_positivos">
                        <TemReviewsPositivas rdf:datatype="&xsd;int"><xsl:value-of select="."></xsl:value-of></TemReviewsPositivas>
                    </xsl:for-each>
                    
                </owl:NamedIndividual>
            </xsl:for-each>

        </rdf:RDF>

    </xsl:template>

 

    <xsl:template match="text()" priority="-1"/>

</xsl:stylesheet>
