package com.jk.service.impl;

import com.jk.mapper.BookMapper;
import com.jk.po.Book;
import com.jk.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by tianming on 2017/5/15.
 */
@Service
public class BookServiceImpl implements BookService{
    @Autowired
    private BookMapper bookMapper;
    public List<Book> findBookList(Book book) {
        return bookMapper.findBookList(book);
    }

    public boolean insertBook(Book book) {
        return bookMapper.insertBook(book);
    }

    public boolean updateBook(Book book) {
        return bookMapper.updateBook(book);
    }

    public Book getBookById(Book book) {
        return bookMapper.getBookById(book);
    }

    public boolean deleteBookById(Integer id) {
        return bookMapper.deleteBookById(id);
    }
}
