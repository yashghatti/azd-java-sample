package ca.yashghatti.sbt.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/")
    public ResponseEntity index() {
        return ResponseEntity.ok("<h1>Java AZD Tester v1.0 - yashghatti</h1>");
    }

}
