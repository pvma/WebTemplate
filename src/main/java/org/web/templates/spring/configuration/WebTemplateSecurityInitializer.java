package org.web.templates.spring.configuration;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class WebTemplateSecurityInitializer extends AbstractSecurityWebApplicationInitializer {
	public WebTemplateSecurityInitializer() {
		super(WebTemplateSecurityConfiguration.class);
	}
}
