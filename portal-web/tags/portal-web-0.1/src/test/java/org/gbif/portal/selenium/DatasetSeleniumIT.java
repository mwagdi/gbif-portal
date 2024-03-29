package org.gbif.portal.selenium;

import org.junit.Ignore;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import static org.junit.Assert.assertEquals;

public class DatasetSeleniumIT extends SeleniumTestBase {

  /**
   * This test uses the dataset page to search for all datasets, clicks on the second one and verifies that
   * the details page for the selected dataset is shown.
   */
  @Test
  @Ignore
  public void testSearchForAnyDataset() {
    getUrl(getBaseUrl());
    driver.findElement(By.linkText("Datasets")).click();
    driver.findElement(By.cssSelector("button.search_button")).click();
    WebElement element = driver.findElement(By.xpath("//div[@class='result' and position() = 2]/h2/a"));
    String sourceName = element.getText();
    element.click();
    String targetName = driver.findElement(By.xpath("//div[@id='infoband']/div/h1")).getText();
    assertEquals("Link target and dataset name must be the same", sourceName, targetName);
  }

}
