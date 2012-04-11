package org.gbif.portal.struts;

import java.util.Iterator;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Validateable;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.opensymphony.xwork2.validator.DelegatingValidatorContext;
import com.opensymphony.xwork2.validator.ValidatorContext;
import org.apache.bval.jsr303.ApacheValidationProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/*
 * This interceptor provides validation using the BVal validation framework
 */
public class ValidationInterceptor extends MethodFilterInterceptor {

  private static final Logger LOG = LoggerFactory.getLogger(ValidationInterceptor.class);

  ValidatorFactory validatorFactory = Validation.byProvider(ApacheValidationProvider.class).configure()
    .buildValidatorFactory();

  private Validator validator;

  @Override
  protected String doIntercept(ActionInvocation invocation) throws Exception {
    validator = validatorFactory.getValidator();
    Object action = invocation.getAction();

    if (LOG.isDebugEnabled()) {
      LOG.debug("Action class: [{}]", action);
    }

    // perform validation
    performValidation(action);

    return invocation.invoke();
  }

  /**
   * Performs the validation.
   * 
   * @param action current action class.
   */
  private void performValidation(Object action) {
    if (action instanceof Validateable) {
      // validates the action's class members which have been annotated.
      Set<ConstraintViolation<Object>> violations = validator.validate(action);
      Iterator iterator = violations.iterator();
      ValidatorContext validatorContext = new DelegatingValidatorContext(action);
      // iterate over all violations.
      while (iterator.hasNext()) {
        ConstraintViolation violation = (ConstraintViolation) iterator.next();
        String fieldName = violation.getPropertyPath().toString();
        String i18nMsg = fieldName + ".error";
        // adds the error to a given field. The error message is a i18n key so that it will be easy to internationalize.
        // the i18n key will take the form 'fieldName.error'.
        validatorContext.addFieldError(fieldName, i18nMsg);
      }
    }
  }
}
