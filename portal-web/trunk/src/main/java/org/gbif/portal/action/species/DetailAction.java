package org.gbif.portal.action.species;

import org.gbif.api.paging.Pageable;
import org.gbif.api.paging.PagingRequest;
import org.gbif.api.paging.PagingResponse;
import org.gbif.checklistbank.api.Constants;
import org.gbif.checklistbank.api.model.Checklist;
import org.gbif.checklistbank.api.model.ChecklistUsage;
import org.gbif.checklistbank.api.model.Identifier;
import org.gbif.checklistbank.api.model.NameUsage;
import org.gbif.checklistbank.api.model.SpeciesProfile;
import org.gbif.checklistbank.api.service.ChecklistService;
import org.gbif.checklistbank.api.service.ChecklistUsageService;
import org.gbif.checklistbank.api.service.DescriptionService;
import org.gbif.checklistbank.api.service.DistributionService;
import org.gbif.checklistbank.api.service.IdentifierService;
import org.gbif.checklistbank.api.service.ImageService;
import org.gbif.checklistbank.api.service.ReferenceService;
import org.gbif.checklistbank.api.service.SpeciesProfileService;
import org.gbif.checklistbank.api.service.VernacularNameService;
import org.gbif.portal.action.BaseAction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.UUID;

import com.google.inject.Inject;
import freemarker.template.utility.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DetailAction extends BaseAction {

  private static final Logger LOG = LoggerFactory.getLogger(DetailAction.class);

  @Inject
  private ChecklistUsageService usageService;
  @Inject
  private ChecklistService checklistService;
  @Inject
  private VernacularNameService vernacularNameService;
  @Inject
  private ReferenceService referenceService;
  @Inject
  private DescriptionService descriptionService;
  @Inject
  private IdentifierService identifierService;
  @Inject
  private ImageService imageService;
  @Inject
  private DistributionService distributionService;
  @Inject
  private SpeciesProfileService speciesProfileService;

  private Integer id;
  private Checklist checklist;
  private ChecklistUsage usage;
  private ChecklistUsage basionym;
  private LinkedList<NameUsage> related = new LinkedList<NameUsage>();
  private Map<UUID, Checklist> checklists = new HashMap<UUID, Checklist>();
  // TODO: remove the children property once the taxonomic browser is working via ajax
  private List<ChecklistUsage> children;

  // various pagesizes used
  private Pageable page20 = new PagingRequest(0, 20);
  private Pageable page10 = new PagingRequest(0, 10);
  private Pageable page7 = new PagingRequest(0, 7);


  @Override
  public String execute() {
    if (id == null) {
      LOG.error("No checklist usage id given");
      return ERROR;
    }
    usage = usageService.get(id, getLocale());
    if (usage == null) {
      return HTTP_NOT_FOUND;
    }

    // load usage details
    loadSharedUsageDetails();

    // is this a nub or simple checklist usage?
    if (Constants.NUB_TAXONOMY_KEY.equals(usage.getChecklistKey())) {
      loadNubUsageSpecifics();
    } else {
      loadChecklistUsageSpecifics();
    }

    // load checklist lookup map
    Set<UUID> cids = new HashSet<UUID>();
    for (NameUsage u : related) {
      cids.add(u.getChecklistKey());
    }
    for (UUID u : cids) {
      checklists.put(u, checklistService.get(u));
    }

    return SUCCESS;
  }

  private void loadSharedUsageDetails() {
    // checklist
    checklist = checklistService.get(usage.getChecklistKey());

    // basionym
    if (usage.getBasionymKey() != null) {
      basionym = usageService.get(usage.getBasionymKey(), getLocale());
    }

    // get children
    PagingResponse<ChecklistUsage> childrenResponse = usageService.listChildren(id, getLocale(), page20);
    children = childrenResponse.getResults();

    // get non nub related usages
    if (usage.getNubKey() != null) {
      PagingResponse<ChecklistUsage> relatedResponse =
        usageService.listByNubUsage(usage.getNubKey(), getLocale(), page7);
      for (ChecklistUsage u : relatedResponse.getResults()) {
        // ignore this usage
        if (!u.getKey().equals(usage.getKey())) {
          related.add(u);
        }
      }
    }

    // get synonyms
    PagingResponse<ChecklistUsage> synonymResponse = usageService.listSynonyms(id, getLocale(), page10);
    usage.setSynonyms(synonymResponse.getResults());

    // get identifier
    PagingResponse<Identifier> identifierResponse = identifierService.listByChecklistUsage(id, page10);
    usage.setIdentifiers(identifierResponse.getResults());
  }

  private void loadNubUsageSpecifics() {
    // get vernacular names
    usage.setVernacularNames(vernacularNameService.listByNubUsage(id, page10).getResults());
    // get references
    usage.setReferences(referenceService.listByNubUsage(id, page10).getResults());
    // get descriptions
    usage.setDescriptions(descriptionService.listByNubUsage(id, page10).getResults());
    // get distributions
    usage.setDistributions(distributionService.listByNubUsage(id, page10).getResults());
    // get images
    usage.setImages(imageService.listByNubUsage(id, page10).getResults());
  }

  private void loadChecklistUsageSpecifics() {
    // add nub as first related usage
    if (usage.getNubKey() != null) {
      related.addFirst(usageService.get(usage.getNubKey(), getLocale()));
    }
    // get vernacular names
    usage.setVernacularNames(vernacularNameService.listByChecklistUsage(id, page10).getResults());
    // get references
    usage.setReferences(referenceService.listByChecklistUsage(id, page10).getResults());
    // get descriptions
    usage.setDescriptions(descriptionService.listByChecklistUsage(id, page10).getResults());
    // get distributions
    usage.setDistributions(distributionService.listByChecklistUsage(id, page10).getResults());
    // get images
    usage.setImages(imageService.listByChecklistUsage(id, page10).getResults());
    // get species profiles
    PagingResponse<SpeciesProfile> speciesProfileResponse = speciesProfileService.listByChecklistUsage(id, page10);
    if (speciesProfileResponse != null) {
      List<SpeciesProfile> rawResults = speciesProfileResponse.getResults();
      if (rawResults.size() == 1) {
        usage.setSpeciesProfiles(rawResults);
      } else {
        // build one representative species profile to show to the view
        SpeciesProfile agg = new SpeciesProfile();
        SortedSet<String> habitats = new TreeSet<String>();
        SortedSet<String> lifeForms = new TreeSet<String>();
        SortedSet<String> livingPeriods = new TreeSet<String>();
        for (SpeciesProfile sp : rawResults) {
          agg.setAgeInDays(nullSafeMax(agg.getAgeInDays(), sp.getAgeInDays()));
          agg.setMassInGram(nullSafeMax(agg.getMassInGram(), sp.getMassInGram()));
          agg.setSizeInMillimeter(nullSafeMax(agg.getSizeInMillimeter(), sp.getSizeInMillimeter()));
          agg.setHybrid(nullSafeOr(agg.isHybrid(), sp.isHybrid()));
          agg.setMarine(nullSafeOr(agg.isMarine(), sp.isMarine()));
          agg.setTerrestrial(nullSafeOr(agg.isTerrestrial(), sp.isTerrestrial()));
          agg.setExtinct(nullSafeOr(agg.isExtinct(), sp.isExtinct()));

          if (sp.getHabitat() != null) habitats.add(StringUtil.capitalize(sp.getHabitat()));
          if (sp.getLifeForm() != null) lifeForms.add(StringUtil.capitalize(sp.getLifeForm()));
          if (sp.getLivingPeriod() != null) livingPeriods.add(StringUtil.capitalize(sp.getLivingPeriod()));
        }
        String habitatString = habitats.toString();
        if (habitatString.length() > 0) agg.setHabitat(habitatString.substring(1, habitatString.length() - 1));
        String lifeFormString = lifeForms.toString();
        if (lifeFormString.length() > 0) agg.setLifeForm(lifeFormString.substring(1, lifeFormString.length() - 1));
        String livingPeriodString = livingPeriods.toString();
        if (livingPeriodString.length() > 0) {
          agg.setLivingPeriod(livingPeriodString.substring(1, livingPeriodString.length() - 1));
        }

        // use terrestrial and marine to make the habitat string more useful
        String terrString = null;
        if (agg.isTerrestrial() != null && agg.isTerrestrial() && agg.isMarine() != null && agg.isMarine()) {
          terrString = "Terrestrial and Marine";
        } else if (agg.isTerrestrial() != null && agg.isTerrestrial()) {
          terrString = "Terrestrial";
        } else if (agg.isMarine() != null && agg.isMarine()) {
          terrString = "Marine";
        }
        if (terrString != null) {
          if (agg.getHabitat() == null) {
            agg.setHabitat(terrString);
          } else {
            agg.setHabitat(terrString + ": " + agg.getHabitat());
          }
        }
        List<SpeciesProfile> output = new ArrayList<SpeciesProfile>();
        output.add(agg);
        usage.setSpeciesProfiles(output);
      }
    }
  }


  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getId() {
    return id;
  }

  public Checklist getChecklist() {
    return checklist;
  }

  public ChecklistUsage getUsage() {
    return usage;
  }

  public ChecklistUsage getBasionym() {
    return basionym;
  }

  public List<ChecklistUsage> getChildren() {
    return children;
  }

  public List<NameUsage> getRelated() {
    return related;
  }

  public Map<UUID, Checklist> getChecklists() {
    return checklists;
  }

  public boolean isNub() {
    if (checklist != null && Constants.NUB_TAXONOMY_KEY.equals(checklist.getKey())) {
      return true;
    }
    return false;
  }

  private Integer nullSafeMax(Integer a, Integer b) {
    if (a == null) return b;
    if (b == null) return a;
    return Math.max(a, b);
  }

  private Boolean nullSafeOr(Boolean a, Boolean b) {
    if (a == null) return b;
    if (b == null) return a;
    return (a || b);
  }

  private String nullSafeConcat(String a, String b) {
    if (a == null) return b;
    if (b == null) return a;
    return a + ", " + b;
  }
}
