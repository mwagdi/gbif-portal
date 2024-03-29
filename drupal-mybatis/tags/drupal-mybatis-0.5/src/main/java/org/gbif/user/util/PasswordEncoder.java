/*
 * Copyright 2007 The JA-SIG Collaborative. All rights reserved. See license
 * distributed with this file and available online at
 * http://www.uportal.org/license.html
 */
package org.gbif.user.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.validation.constraints.NotNull;

import com.google.common.base.Strings;


/**
 * Implementation of PasswordEncoder using message digest. Can accept any
 * message digest that the JDK can accept, including MD5 and SHA1. Returns the
 * equivalent Hash you would get from a Perl digest.
 *
 * Update Markus:
 * Taken from org.jasig.cas.authentication.handler.DefaultPasswordEncoder and slightly adapted to remove the
 * many dependencies cas-server-core comes with.
 *
 * @author Scott Battaglia
 * @author Stephen More
 * @version $Revision$ $Date$
 */
public final class PasswordEncoder {

  private static final char[] HEX_DIGITS =
    {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

  @NotNull
  private final String encodingAlgorithm;

  private final String characterEncoding;

  public PasswordEncoder(final String encodingAlgorithm) {
    this.encodingAlgorithm = encodingAlgorithm;
    this.characterEncoding = "UTF8";
  }

  public PasswordEncoder(final String encodingAlgorithm, String characterEncoding) {
    this.encodingAlgorithm = encodingAlgorithm;
    this.characterEncoding = characterEncoding;
  }

  public String encode(final String password) {
    if (password == null) {
      return null;
    }

    try {
      MessageDigest messageDigest = MessageDigest.getInstance(this.encodingAlgorithm);

      if (Strings.isNullOrEmpty(this.characterEncoding)) {
        messageDigest.update(password.getBytes());
      } else {
        messageDigest.update(password.getBytes(this.characterEncoding));
      }


      final byte[] digest = messageDigest.digest();

      return getFormattedText(digest);
    } catch (final NoSuchAlgorithmException e) {
      throw new SecurityException(e);
    } catch (final UnsupportedEncodingException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * Takes the raw bytes from the digest and formats them correct.
   *
   * @param bytes the raw bytes from the digest.
   *
   * @return the formatted bytes.
   */
  private String getFormattedText(byte[] bytes) {
    final StringBuilder buf = new StringBuilder(bytes.length * 2);

    for (int j = 0; j < bytes.length; j++) {
      buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
      buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
    }
    return buf.toString();
  }

}
