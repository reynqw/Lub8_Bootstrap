package com.example.website.service;

import com.example.website.entity.Book;
import com.example.website.entity.BorrowedBook;
import com.example.website.repository.BookRepository;
import com.example.website.repository.BorrowedBookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LibraryService {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private BorrowedBookRepository borrowedBookRepository;

    public LibraryService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    public Book addBook(Book book) {
        if (book.getTitle() == null || book.getTitle().trim().isEmpty()) {
            throw new RuntimeException("Book title cannot be empty");
        }
        if (book.getAutor() == null || book.getAutor().trim().isEmpty()) {
            throw new RuntimeException("Book author cannot be empty");
        }
        book.setDeleted(false);
        return bookRepository.save(book);
    }

    public Book updateBook(Long id, Book updatedBook) {
        Book existingBook = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found"));
        
        if (updatedBook.getTitle() == null || updatedBook.getTitle().trim().isEmpty()) {
            throw new RuntimeException("Book title cannot be empty");
        }
        if (updatedBook.getAutor() == null || updatedBook.getAutor().trim().isEmpty()) {
            throw new RuntimeException("Book author cannot be empty");
        }
        
        existingBook.setTitle(updatedBook.getTitle());
        existingBook.setAutor(updatedBook.getAutor());
        return bookRepository.save(existingBook);
    }

    public void deleteBook(Long id) {
        Book book = bookRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Book not found"));
        book.setDeleted(true);
        bookRepository.save(book);
    }
}