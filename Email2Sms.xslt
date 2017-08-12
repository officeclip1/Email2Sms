﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="Sms">
    <body>
      <html>
        <div style="font-weight:bold">
          List of Email SMS Providers:
        </div>
        <ul>
          <li>Replace n with your phone number</li>
          <li>Your provider may charge a fee for receiving Sms</li>
          <li>This list is captured from various websites and there is no guarantee that this will work.
          Please check with your provider</li>
        </ul>
        <div>
          Last Updated: <xsl:value-of select="LastUpdated"/>
        </div>
        <table cellspacing="2" cellpadding="2" border="1">
          <tr>
            <th>
              Provider
            </th>
            <th>
              Email
            </th>
            <th>
              Size
            </th>
            <th>
              Website
            </th>
            <th>
              Notes
            </th>
          </tr>
        <xsl:apply-templates select="SmsCountries/SmsCountry|SmsCountries/SmsCountry/SmsItems/SmsItem"/>
        </table>
      </html>
    </body>
  </xsl:template>

  <xsl:template match="SmsCountries/SmsCountry">
    <tr>
      <td colspan="5" style="background-color:lightgray">
        <xsl:value-of select="@Country"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="SmsCountries/SmsCountry/SmsItems/SmsItem">
    <tr>
      <td style="padding-left:20px">
        <xsl:value-of select="@Company"/>
      </td>
      <td>
        <xsl:value-of select="@Email"/>
      </td>
      <td>
        <xsl:value-of select="@Size"/>
      </td>
      <td>
        <xsl:value-of select="@Website"/>
      </td>
      <td>
        <xsl:value-of select="@Notes"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>