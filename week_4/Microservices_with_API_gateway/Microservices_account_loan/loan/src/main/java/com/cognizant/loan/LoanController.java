package com.cognizant.loan;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoanController {
	@GetMapping("/loans/{number}")
	public Loan getLoan(@PathVariable String number) {
	    return new Loan(number, "home", 2500000, 22500, 120);
	}
}
