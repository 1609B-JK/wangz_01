package com.jk.mapper;

import com.jk.po.Book;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Created by tianming on 2017/5/15.
 */
public interface BookMapper {
    @Select({"<script>","SELECT *", "FROM BOOK","<when test='name!=null'>where name like concat('%',#{name},'%')</when>", "</script>"})
    List<Book> findBookList(Book book);
    @Insert("insert into book values(null,#{name},#{author},#{type},#{price})")
    boolean insertBook(Book book);
    @Update("update book set name=#{name},author=#{author},type=#{type},price=#{price} where id=#{id}")
    boolean updateBook(Book book);
    @Select("select * from book where id=#{id}")
    Book getBookById(Book book);
    @Delete("delete from book where id=#{value}")
    boolean deleteBookById(Integer id);
}
