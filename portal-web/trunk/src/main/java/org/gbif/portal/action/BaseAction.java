package org.gbif.portal.action;

import org.gbif.api.model.common.User;
import org.gbif.api.vocabulary.Extension;
import org.gbif.api.vocabulary.Kingdom;
import org.gbif.api.vocabulary.Rank;
import org.gbif.portal.config.Config;
import org.gbif.portal.config.Constants;

import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.TreeMap;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import com.google.inject.Inject;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class BaseAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletContextAware {

  private static final Logger LOG = LoggerFactory.getLogger(BaseAction.class);
  protected Map<String, Object> session;
  protected HttpServletRequest request;
  protected ServletContext ctx;
  private static final List<Kingdom> KINGDOMS = ImmutableList.of(Kingdom.ANIMALIA, Kingdom.ARCHAEA, Kingdom.BACTERIA, Kingdom.CHROMISTA,
    Kingdom.FUNGI, Kingdom.PLANTAE, Kingdom.PROTOZOA, Kingdom.VIRUSES, Kingdom.INCERTAE_SEDIS);

  @Inject
  private Config cfg;

  /**
   * Checks whether a string starts with any of the prefixes specified
   * 
   * @return true if string matches against any prefix. false otherwise.
   */
  private static boolean containsPrefix(String propertyKey, String[] prefixes) {
    if (propertyKey != null) {
      for (String prefix : prefixes) {
        if (propertyKey.startsWith(prefix)) {
          return true;
        }
      }
    }
    return false;
  }

  /**
   * Returns the application's base url
   * 
   * @return the base url
   */
  public String getBaseUrl() {
    return cfg.getServerName() + ctx.getContextPath();
  }

  public Config getCfg() {
    return cfg;
  }

  /**
   * Returns the absolute url to the current page.
   * 
   * @return the absolute url
   */
  public String getCurrentUrl() {
    StringBuffer currentUrl = request.getRequestURL();
    if (request.getQueryString() != null) {
      currentUrl.append("?");
      currentUrl.append(request.getQueryString());
    }
    return currentUrl.toString();
  }

  /**
   * @return the currently logged in user.
   */
  public User getCurrentUser() {
    return (User) session.get(Constants.SESSION_USER);
  }

  public List<Extension> getExtensionEnum() {
    return Lists.newArrayList(Extension.values());
  }

  public List<Kingdom> getKingdomEnum() {
    return KINGDOMS;
  }

  public UUID getNubDatasetKey() {
    return org.gbif.api.model.checklistbank.Constants.NUB_TAXONOMY_KEY;
  }

  public List<Rank> getRankEnum() {
    return Rank.LINNEAN_RANKS;
  }

  /**
   * Returns a map representing properties from the resource bundle but just those
   * properties whose keys match one or more of the given prefixes.
   * 
   * @return a map which the matched properties
   */
  public Map<String, String> getResourceBundleProperties(String... prefix) {
    Map<String, String> bundleProps = new TreeMap<String, String>();
    ResourceBundle bundle = ResourceBundle.getBundle("resources", getLocale());
    // properties should be filtered out
    if (prefix != null && prefix.length != 0) {
      for (String key : bundle.keySet()) {
        // only add those properties whose key starts with one of the prefixes given
        if (containsPrefix(key, prefix)) {
          bundleProps.put(key, bundle.getString(key));
        }
      }
    } else { // just get all properties without any filtering at all
      for (String key : bundle.keySet()) {
        bundleProps.put(key, bundle.getString(key));
      }
    }
    return bundleProps;
  }

  protected HttpServletRequest getServletRequest() {
    return request;
  }

  /**
   * @return The HTTP session which may be null
   */
  protected Map<String, Object> getSession() {
    return session;
  }

  public Rank getSpeciesRank() {
    return Rank.SPECIES;
  }

  /**
   * @return true if an admin user is logged in.
   */
  public boolean isAdmin() {
    return getCurrentUser() != null && getCurrentUser().isAdmin();
  }

  @Override
  public void setServletContext(ServletContext context) {
    this.ctx = context;
  }

  @Override
  public void setServletRequest(HttpServletRequest request) {
    this.request = request;
  }

  @Override
  public void setSession(Map<String, Object> session) {
    this.session = session;
  }

}
