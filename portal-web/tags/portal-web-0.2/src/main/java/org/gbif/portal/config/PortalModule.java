package org.gbif.portal.config;

import com.google.inject.AbstractModule;
import org.gbif.checklistbank.ws.client.guice.ChecklistBankWsClientModule;
import org.gbif.metrics.ws.client.guice.MetricsWsClientModule;
import org.gbif.occurrence.ws.client.guice.OccurrenceWsClientModule;
import org.gbif.occurrencestore.download.ws.client.guice.OccurrenceDownloadWsClientModule;
import org.gbif.registry.ws.client.guice.RegistryWsClientModule;
import org.gbif.user.guice.DrupalMyBatisModule;
import org.gbif.utils.file.properties.PropertiesUtil;

import java.io.IOException;
import java.util.Properties;

public class PortalModule extends AbstractModule {

  private static final String PROPERTIES_FILE = "application.properties";

  @Override
  protected void configure() {
    try {
      Properties properties = PropertiesUtil.loadProperties(PROPERTIES_FILE);

      install(new PrivatePortalModule(properties));

      // bind registry API
      install(new RegistryWsClientModule(properties, true, true));

      // bind drupal mybatis services
      install(new DrupalMyBatisModule(properties));

      // bind checklist bank api. Select either the mybatis or the ws-client api implementation:
      install(new ChecklistBankWsClientModule(properties));

      // bind the occurrence download service
      install(new OccurrenceDownloadWsClientModule(properties));

      // bind the occurrence service
      install(new OccurrenceWsClientModule(properties));

      // bind the metrics service
      install(new MetricsWsClientModule(properties));
    } catch (IllegalArgumentException e) {
      this.addError(e);
    } catch (IOException e) {
      this.addError(e);
    }
  }

}
