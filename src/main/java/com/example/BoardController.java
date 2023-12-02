package com.example;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
@Controller
public class BoardController {
    @Autowired
    private BoardServiceImpl boardServiceImpl;
    @RequestMapping(value = "/posts", method = RequestMethod.GET)
    public String boardList(Model model){
        model.addAttribute("boardServiceImpl", boardServiceImpl);
        model.addAttribute("list", boardServiceImpl.getBoardList());
        return "posts";
    }
    @RequestMapping(value = "/addpostform", method = RequestMethod.GET)
    public String addPost(){
        return "addform";
    }
    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addPostOK(BoardVO vo){
        if (boardServiceImpl.insertBoard(vo) == 0)
            System.out.println("데이터 추가 실패");
        else
            System.out.println("데이터 추가 성공!!!");
        return "redirect:posts";
    }
    @RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id")int id, Model model){
        BoardVO boardVO = boardServiceImpl.getBoard(id);
        model.addAttribute("u", boardVO);
        return "editform";
    }
    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editPostOK(BoardVO vo){
        if(boardServiceImpl.updateBoard(vo)==0)
            System.out.println("데이터 수정 실패");
        else
            System.out.println("데이터 수정 성공!!!");
        return "redirect:posts";
    }
    @RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
    public String deletePostOK(@PathVariable("id") int id){
        if(boardServiceImpl.deleteBoard(id)==0)
            System.out.println("데이터 삭제 실패");
        else
            System.out.println("데이터 삭제 성공!!!");
        return "redirect:/board/posts";
    }
}
