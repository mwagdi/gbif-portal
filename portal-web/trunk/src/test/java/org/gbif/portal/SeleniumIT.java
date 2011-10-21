package org.gbif.portal;

import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

public class SeleniumIT {

  private WebDriver driver;
  private final String baseUrl;

  public SeleniumIT() {
    baseUrl = "http://localhost:" + System.getProperty("jetty.port", "8080");
  }

  @Before
  public void setUp() throws Exception {
    driver = new HtmlUnitDriver();
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testFoo() throws Exception {
    driver.get(baseUrl);
    driver.findElement(By.linkText("Datasets")).click();
    driver.findElement(By.cssSelector("button.search_button")).click();
    driver.findElement(By.xpath("//*[contains(.,'CATE Araceae')]"));
  }

  @After
  public void tearDown() throws Exception {
    if (driver != null) {
      driver.quit();
    }
  }
}
