package org.gbif.portal.action;

import org.gbif.api.model.registry.Contact;
import org.gbif.api.model.registry.Endpoint;
import org.gbif.api.model.registry.Identifier;
import org.gbif.api.model.registry.NetworkEntityComponents;
import org.gbif.api.model.registry.Tag;
import org.gbif.api.service.registry.NetworkEntityService;
import org.gbif.api.vocabulary.ContactType;
import org.gbif.api.vocabulary.Country;
import org.gbif.api.vocabulary.EndpointType;
import org.gbif.api.vocabulary.IdentifierType;
import org.gbif.api.vocabulary.Language;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

import javax.validation.Valid;

import com.google.common.collect.Lists;
import com.google.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class AdminBaseAction<T extends NetworkEntityService, K extends NetworkEntityComponents> extends BaseAction {

  protected static final Logger LOG = LoggerFactory.getLogger(AdminBaseAction.class);


  protected UUID id;
  protected int componentIndex;
  protected String component;

  @Valid
  Contact contact;

  @Valid
  Endpoint endpoint;

  @Valid
  Tag tag;

  @Valid
  Identifier identifier;

  @Inject
  protected T wsClient;

  public String contactAdd() {
    LOG.debug("Adding new contact");
    getContacts().add(contact);
    return SUCCESS;
  }

  public String contactEdit() {
    LOG.debug("Edit existing contact");
    // TODO: call the client to edit the contact. Not making the call as we have pending issues to solve at:
    // http://dev.gbif.org/issues/browse/POR-213
    return SUCCESS;
  }

  public String contactEditPrepare() {
    // TODO: use the prepareable interceptor if possible
    prepareComponents();
    // get the contact to edit
    int currentIndex = 0;
    for (Contact currentContact : getContacts()) {
      if (currentIndex++ == getComponentIndex()) {
        contact = currentContact;
        break;
      }
    }
    return SUCCESS;
  }

  protected void createMembers(UUID memberKey) {
    // add contacts
    if (getContacts() != null) {
      for (Contact contact : getContacts()) {
        LOG.debug("WS add contact to entity with UUID: [{}]", memberKey);
        wsClient.add(memberKey, contact);
      }
    }

    // add endpoints
    if (getEndpoints() != null) {
      for (Endpoint endpoint : getEndpoints()) {
        wsClient.add(memberKey, endpoint);
      }
    }

    // add tags
    if (getTags() != null) {
      for (Tag tag : getTags()) {
        wsClient.add(memberKey, tag);
      }
    }

    // add identifiers
    if (getIdentifiers() != null) {
      for (Identifier identifier : getIdentifiers()) {
        wsClient.add(memberKey, identifier);
      }
    }
  }

  public String endpointAdd() {
    LOG.debug("Adding new endpoint");
    getEndpoints().add(endpoint);
    return SUCCESS;
  }

  /**
   * @return the componentIndex.
   */
  public int getComponentIndex() {
    return componentIndex;
  }

  /**
   * @return the contact.
   */
  public Contact getContact() {
    return contact;
  }

  public List<Contact> getContacts() {
    return (List<Contact>) session.get("contacts");
  }

  /**
   * Return a map of contact types. <key> is the enum name and <value> is the i18n name.
   * 
   * @return
   */
  public Map<String, String> getContactTypes() {
    Map<String, String> contactTypes = new HashMap<String, String>();
    for (ContactType contactType : ContactType.TYPES) {
      contactTypes.put(contactType.name(), getText("enum.contacttype." + contactType));
    }
    return contactTypes;
  }

  /**
   * @return the endpoint.
   */
  public Endpoint getEndpoint() {
    return endpoint;
  }

  public List<Endpoint> getEndpoints() {
    return (List<Endpoint>) session.get("endpoints");
  }

  /**
   * Return a map of endpoint types. <key> is the enum name and <value> is the i18n name.
   * 
   * @return
   */
  public Map<String, String> getEndpointTypes() {
    Map<String, String> endpointTypes = new HashMap<String, String>();
    for (EndpointType endpointType : EndpointType.TYPES) {
      endpointTypes.put(endpointType.name(), getText("enum.endpointtype." + endpointType));
    }
    return endpointTypes;
  }

  public abstract K getEntity();

  /**
   * @return the id.
   */
  public UUID getId() {
    return id;
  }

  /**
   * @return the identifier.
   */
  public Identifier getIdentifier() {
    return identifier;
  }

  public List<Identifier> getIdentifiers() {
    return (List<Identifier>) session.get("identifiers");
  }

  /**
   * Return a map of identifier types. <key> is the enum name and <value> is the i18n name.
   * 
   * @return
   */
  public Map<String, String> getIdentifierTypes() {
    Map<String, String> identifierTypes = new HashMap<String, String>();
    for (IdentifierType identifierType : IdentifierType.TYPES) {
      identifierTypes.put(identifierType.name(), getText("enum.identifiertype." + identifierType));
    }
    return identifierTypes;
  }

  public Map<String, String> getLanguages() {
    Map<String, String> languages = new TreeMap<String, String>();
    for (Language language : Language.LANGUAGES) {
      // TODO: internationalize language names?
      languages.put(language.name(), language.name());
    }
    return languages;
  }

  /**
   * @return the officialCountries.
   */
  public List<Country> getOfficialCountries() {
    return Country.OFFICIAL_COUNTRIES;
  }

  /**
   * @return the tag.
   */
  public Tag getTag() {
    return tag;
  }

  public List<Tag> getTags() {
    return (List<Tag>) session.get("tags");
  }


  public String identifierAdd() {
    LOG.debug("Adding new identifier");
    getIdentifiers().add(identifier);
    return SUCCESS;
  }


  public String prepareAddEntity() {

    NetworkEntityComponents entity = getEntity();

    // admin is editing metadata or components of an existing entity
    if (entity != null) {
      session.put("contacts", entity.getContacts());
      session.put("endpoints", entity.getEndpoints());
      session.put("tags", entity.getTags());
      session.put("identifiers", entity.getIdentifiers());
    }
    // admin is creating a new entity along with all its components
    else {
      session.put("contacts", Lists.newArrayList());
      session.put("endpoints", Lists.newArrayList());
      session.put("tags", Lists.newArrayList());
      session.put("identifiers", Lists.newArrayList());
    }

    contact = new Contact();
    endpoint = new Endpoint();
    tag = new Tag();
    identifier = new Identifier();

    return SUCCESS;
  }


  public String prepareComponents() {

    NetworkEntityComponents entity = getEntity();

    // admin is editing metadata or components of an existing entity
    if (entity != null) {
      session.put("contacts", entity.getContacts());
      session.put("endpoints", entity.getEndpoints());
      session.put("tags", entity.getTags());
      session.put("identifiers", entity.getIdentifiers());
    }
    // admin is creating a new entity along with all its components
    else {
      if (session.get("contacts") == null) {
        session.put("contacts", Lists.newArrayList());
      }
      if (session.get("endpoints") == null) {
        session.put("endpoints", Lists.newArrayList());
      }
      if (session.get("tags") == null) {
        session.put("tags", Lists.newArrayList());
      }
      if (session.get("identifiers") == null) {
        session.put("identifiers", Lists.newArrayList());
      }
    }

    contact = new Contact();
    endpoint = new Endpoint();
    tag = new Tag();
    identifier = new Identifier();

    return SUCCESS;
  }


  /**
   * @param component the component to set.
   */
  public void setComponent(String component) {
    this.component = component;
  }


  /**
   * @param componentIndex the componentIndex to set.
   */
  public void setComponentIndex(int componentIndex) {
    this.componentIndex = componentIndex;
  }


  /**
   * @param contact the contact to set.
   */
  public void setContact(Contact contact) {
    this.contact = contact;
  }


  /**
   * @param endpoint the endpoint to set.
   */
  public void setEndpoint(Endpoint endpoint) {
    this.endpoint = endpoint;
  }


  /**
   * @param id the id to set.
   */
  public void setId(UUID id) {
    this.id = id;
  }


  /**
   * @param identifier the identifier to set.
   */
  public void setIdentifier(Identifier identifier) {
    this.identifier = identifier;
  }


  /**
   * @param tag the tag to set.
   */
  public void setTag(Tag tag) {
    this.tag = tag;
  }


  public String tagAdd() {
    LOG.debug("Adding new tag");
    if (id != null) {
      wsClient.add(id, tag);
      // get the entity's tags
      session.put("tags", getEntity().getTags());
    } else {
      // entity does not exists yet, add the tag to the session
      // user is possibly creating a new organization in the same step
      getTags().add(tag);
    }
    return SUCCESS;
  }


  public String tagDelete() {
    // TODO: use the prepareable interceptor if possible
    prepareComponents();
    List<Tag> tags = new ArrayList<Tag>();
    Tag tagToDelete = null;
    int currentIndex = 0;
    for (Tag currentTag : getTags()) {
      if (currentIndex++ == getComponentIndex()) {
        tagToDelete = currentTag;
        continue;
      }
      tags.add(currentTag);
    }
    // tag should be deleted from the entity as well
    if (id != null) {
      LOG.debug("Deleting a tag");
      wsClient.delete(id, tagToDelete);
    }
    session.put("tags", tags);

    return SUCCESS;
  }
}
