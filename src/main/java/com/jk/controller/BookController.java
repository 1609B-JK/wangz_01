package com.jk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jk.po.Book;
import com.jk.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by tianming on 2017/5/15.
 */
@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    @RequestMapping("/findBookList")
    public ModelAndView findBookList(ModelAndView mv,Book book, @RequestParam(defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum, 10);
        List<Book> bookList = bookService.findBookList(book);
        PageInfo<Book> pageInfo = new PageInfo<Book>(bookList);
        System.out.println(pageInfo.getPages());
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("book_list");
        return mv;
    }
    @RequestMapping("/toAddBook")
    public String toAddBook(){
        return "book_add";
    }
    @RequestMapping("/toUpdateBook")
    public ModelAndView toUpdateBook(Book book,ModelAndView mv){
        mv.addObject("book",bookService.getBookById(book));
        mv.setViewName("book_update");
        return mv;
    }
    @RequestMapping("/insertOrUpdateBook")
    @ResponseBody
    public boolean insertOrUpdateBook(Book book){
        if(book.getId()==null){
            return bookService.insertBook(book);
        }else{
            return bookService.updateBook(book);
        }
    }
    @RequestMapping("/deleteBookById")
    @ResponseBody
    public boolean deleteBookById(Integer id){
        return bookService.deleteBookById(id);
    }
}
