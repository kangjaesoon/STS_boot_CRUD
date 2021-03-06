package com.example.Study.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.Study.util.Pager;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> getList(Pager pager)throws Exception;
	//count
	public Long getTotalCount(Pager pager)throws Exception;
	//Select
	public BoardVO getSelect(BoardVO boardVO)throws Exception;
	//Delete
	public int setDelete(BoardVO boardVO)throws Exception;
	//Update
	public int setUpdate(BoardVO boardVO)throws Exception;
	//Insert
	public int setInsert(BoardVO boardVO)throws Exception;

}
