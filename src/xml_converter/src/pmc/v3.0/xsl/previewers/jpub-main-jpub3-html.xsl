<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:util="http://dtd.nlm.nih.gov/xsl/util" xmlns:mml="http://www.w3.org/1998/Math/MathML" exclude-result-prefixes="util xsl">

    <xsl:import href="../jpub/main/jpub3-html.xsl"/>
    <xsl:param name="path_img" select="'/'"/>
    <xsl:param name="css" select="''"/>
  <xsl:variable name="TXTLANG"/>
    <xsl:template match="graphic | inline-graphic">
        <xsl:apply-templates/>
        <img src="{$path_img}/{@xlink:href}.jpg">
            <xsl:for-each select="alt-text">
                <xsl:attribute name="alt">
                  <xsl:value-of select="normalize-space(.)"/>
                </xsl:attribute>
            </xsl:for-each>
           
        </img>
  </xsl:template>

  <xsl:template name="make-html-header">
    <head>
      <title>
        <xsl:variable name="authors">
          <xsl:call-template name="author-string"/>
        </xsl:variable>
        <xsl:value-of select="normalize-space($authors)"/>
        <xsl:if test="normalize-space($authors)">: </xsl:if>
        <xsl:value-of
          select="/article/front/article-meta/title-group/article-title[1]"/>
      </title>
      <style type="text/css">
        /*  Stylesheet for NLM/NCBI  Journal Publishing 3.0 Preview HTML
    January 2009

    ~~~~~~~~~~~~~~
    National Center for Biotechnology Information (NCBI)
    National Library of Medicine (NLM)
    ~~~~~~~~~~~~~~
*/


/* --------------- Page setup ------------------------ */

/* page and text defaults */

body { margin-left: 8%;
     margin-right: 8%;
     background-color: #f8f8f8 }


div > *:first-child, td > *:first-child { margin-top:0em }

div { margin-top: 0.5em }

div.front, div.footer { }

.back, .body { font-family: serif }


table.metadata td {
    vertical-align: top }

table.two-column td {
    width: 50% }


div.metadata-group { margin-top: 0.5em;
  font-family: sans-serif; font-size: 75% }

div.metadata-group > p, div.metadata-group > div { margin-top: 0.5em }

div.metadata-area * { margin: 0em }

div.metadata-area > div.metadata-area { margin-left: 1em; margin-top: 0em }
div.metadata-chunk > div.metadata-area { margin-left: 1em; margin-top: 0em }

div.metadata-chunk { margin-left: 1em }

div.branding { text-align: center }

div.document-title-notes {
   text-align: center;
   width: 60%;
   margin-left: auto;
   margin-right: auto
   }

/* rules */
hr.part-rule {
    color: red;
    width: 50%;
    margin-top: 1em;
    margin-bottom: 1em;
    }

hr.section-rule {
    color: black;
    width: 50%;
    margin-top: 1em;
    margin-bottom: 1em;
    }

/* superior numbers which are cross-references */
.xref {
    color: red;
    }
    
/* generated text */     
.generated { color: gray; }

.warning, tex-math {
    font-size:80%; font-family: sans-serif }

.warning {
    color: red }

.tex-math { color: green }

.data {
    color: black;
    }

.formula {
    font-family: sans-serif;
    font-size: 90% }
    
/* --------------- Titling levels -------------------- */


h1, h2, h3, h4, h5, h6 {
   display: block;
   margin-top: 0em;
   margin-bottom: 0.5em;
   font-family: helvetica, sans-serif;
   font-weight: bold;
   color: midnightblue;
  }
/* titling level 1: document title */
.document-title {
   text-align: center;
   }

/* callout titles appear in a left column (table cell)
   opposite what they head */
.callout-title { text-align: right;
  margin-top: 0.5em;
  margin-right: 1em;
  font-size: 140% }
  


div.section, div.back-section {
  margin-top: 1em; margin-bottom: 0.5em }

div.panel { background-color: white;
  font-size: 90%;
  border: thin solid black;
  padding-left: 0.5em; padding-right: 0.5em;
  padding-top: 0.5em; padding-bottom: 0.5em;
  margin-top: 0.5em; margin-bottom: 0.5em }

div.blockquote { font-size: 90%;
  margin-left: 1em; margin-right: 1em;
  margin-top: 0.5em; margin-bottom: 0.5em }

div.caption {
  margin-top: 0.5em; margin-bottom: 0.5em }

div.speech {
  margin-left: 1em; margin-right: 1em;
  margin-top: 0.5em; margin-bottom: 0.5em }

div.verse-group {
  margin-left: 1em;
  margin-top: 0.5em; margin-bottom: 0.5em }

div.verse-group div.verse-group {
  margin-left: 1em;
  margin-top: 0em; margin-bottom: 0em }

div.note { margin-top: 0em; margin-left: 1em;
  font-size: 85% }

.ref-label { margin-top: 0em; vertical-align: top }

.ref-content { margin-top: 0em; padding-left: 0.25em }

h5.label { margin-top: 0em; margin-bottom: 0em }

p { margin-top: 0.5em; margin-bottom: 0em }

p.first { margin-top: 0em }

p.verse-line, p.citation { margin-top: 0em; margin-bottom: 0em; margin-left: 2em; text-indent: -2em }

p.address-line { margin-top: 0em; margin-bottom: 0em; margin-left: 2em }

ul, ol { margin-top: 0.5em }

li { margin-top: 0.5em; margin-bottom: 0em }
li > p { margin-top: 0.2em; margin-bottom: 0em  }

table.def-list { border-spacing: 0.25em;
  border-top: thin solid black }

table.def-list td { vertical-align: top;
  border-bottom: thin solid black;
  padding-bottom: 0.5em }

table.def-list th { vertical-align: top;
  text-align: left;
  border-bottom: thin solid black;
  padding-bottom: 0.5em }

/* text decoration */
.label { font-weight: bold; font-family: sans-serif; font-size: 80% }

.monospace {
  font-family: monospace;
  }

.overline{
  text-decoration: overline;
  }
 
a       { text-decoration: none }
a:hover { text-decoration: underline }

/* ---------------- End ------------------------------ */


      </style>
      <!-- XXX check: any other header stuff? XXX -->
    </head>
  </xsl:template>
  	
</xsl:stylesheet>
	

