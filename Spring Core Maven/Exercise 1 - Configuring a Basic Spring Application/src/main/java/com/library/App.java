package com.library;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.library.service.BookService;

public class App {

    public static void main(String[] args) {

        // Load the Spring Application Context
        ApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

        // Get the BookService bean from Spring
        BookService bookService =
                context.getBean("bookService", BookService.class);

        // Call the service method
        bookService.addBook();
    }
}