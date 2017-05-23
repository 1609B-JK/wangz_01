package com.jk.service;

import com.jk.po.Book;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tianming on 2017/5/15.
 */
public interface BookService {
    List<Book> findBookList(Book book);

    boolean insertBook(Book book);

    boolean updateBook(Book book);

    Book getBookById(Book book);

    boolean deleteBookById(Integer id);
}
