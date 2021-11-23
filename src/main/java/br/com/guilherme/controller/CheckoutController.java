package br.com.guilherme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {


    @GetMapping()
    public String open() {
        return "checkout/checkout";
    }


}
