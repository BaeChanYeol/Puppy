package com.spring.puppy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping("/reserve")
	public void reserve() {}

	@GetMapping("/professional")
	public void professional() {}
	
	@GetMapping("/sitemap")
	public void sitemap() {}
	
	@GetMapping("/pickupService")
	public void pickupService() {}
	
	@GetMapping("/notice")
	public void notice() {}
	
	
	@GetMapping("/service/grooming")
	public void grooming() {}
	
	@GetMapping("/service/hotel")
	public void hotel() {}
	
	@GetMapping("/service/medicalCenter")
	public void medicalCenter() {}
	
	@GetMapping("/service/preschool")
	public void preschool() {}
	
	@GetMapping("/service/studio")
	public void studio() {}
	
	
}
