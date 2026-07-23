package com.library;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.library.service.BookService;

public class LibraryManagementApplication {

    public static void main(String[] args) {

        // Load Spring Application Context
        ApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

        // Get BookService bean from Spring Container
        BookService bookService =
                context.getBean("bookService", BookService.class);

        // Test Dependency Injection
        bookService.addBook();
    }
}