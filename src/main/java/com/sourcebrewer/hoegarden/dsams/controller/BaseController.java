package com.sourcebrewer.hoegarden.dsams.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class BaseController {
	public static final String BREADCRUMB_FLAG = "breadcrumbFlag";
	public static final String PAGE_TITLE = "pageTitle";
	public static final String BREADCRUMB_FLAG_FIRST = "breadcrumbFlagFirst";

	public String getUsername() {
		String userName = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			Object principal = auth.getPrincipal();
			if (principal instanceof UserDetails) {
				userName = ((UserDetails) principal).getUsername();
			} else {
				userName = principal.toString();
			}
		}
		return userName;
	}
}
