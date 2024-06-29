<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Case Problem 4

   Cairn Camping Store XSLT Style Sheet
   Author: Nicholas Mowry 
   Date: 6/29/2024  

   Filename:         camping.xsl
   Supporting Files: 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
   <!-- Template to match the root element -->
   <xsl:template match="/">
      <html>
         <head>
            <title>Cairn Camping Store Report</title>
            <link rel="stylesheet" type="text/css" href="styles.css"/>
         </head>
         <body>
            <h1>Cairn Camping Store</h1>
            <!-- Apply template to sort customers by name -->
            <xsl:apply-templates select="customers/customer">
               <xsl:sort select="name"/>
            </xsl:apply-templates>
         </body>
      </html>
   </xsl:template>
   
   <!-- Template to match each customer -->
   <xsl:template match="customer">
      <div class="customer">
         <h2>
            <xsl:value-of select="name"/>
         </h2>
         <table class="customer-info">
            <tr>
               <td>Customer ID:</td>
               <td><xsl:value-of select="@cid"/></td>
            </tr>
            <tr>
               <td>Address:</td>
               <td><xsl:value-of select="street"/></td>
            </tr>
            <tr>
               <td></td>
               <td><xsl:value-of select="city"/>, <xsl:value-of select="state"/> <xsl:value-of select="zip"/></td>
            </tr>
         </table>
         <!-- Apply template to sort orders by order ID -->
         <xsl:apply-templates select="orders/order">
            <xsl:sort select="@oid" order="descending"/>
         </xsl:apply-templates>
      </div>
   </xsl:template>
   
   <!-- Template to match each order -->
   <xsl:template match="order">
      <table class="order">
         <tr>
            <td colspan="2">
               <strong>Order ID: <xsl:value-of select="@oid"/></strong><br/>
               Date: <xsl:value-of select="date"/>
            </td>
         </tr>
         <tr>
            <th>Item ID</th>
            <th>Item Description</th>
            <th>Quantity</th>
         </tr>
         <!-- Apply template to sort items by quantity (descending) and then by item ID (ascending) -->
         <xsl:apply-templates select="item">
            <xsl:sort select="qty" data-type="number" order="descending"/>
            <xsl:sort select="@iid"/>
         </xsl:apply-templates>
      </table>
   </xsl:template>
   
   <!-- Template to match each item -->
   <xsl:template match="item">
      <tr>
         <td><xsl:value-of select="@iid"/></td>
         <td><xsl:value-of select="description"/></td>
         <td><xsl:value-of select="qty"/></td>
      </tr>
   </xsl:template>
   
</xsl:stylesheet>
