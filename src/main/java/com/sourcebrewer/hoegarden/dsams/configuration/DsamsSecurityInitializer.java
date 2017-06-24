package com.sourcebrewer.hoegarden.dsams.configuration;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class DsamsSecurityInitializer extends AbstractSecurityWebApplicationInitializer {
	public DsamsSecurityInitializer() {
		super(DsamsSecurityConfiguration.class);
	}
}
