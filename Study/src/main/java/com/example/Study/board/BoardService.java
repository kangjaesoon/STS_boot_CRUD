package com.example.Study.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Study.util.Pager;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	public List<BoardVO> getList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(boardMapper.getTotalCount(pager));
		System.out.println(boardMapper.getTotalCount(pager));
		return boardMapper.getList(pager);
	}
	
	public BoardVO getSelect(BoardVO boardVO) throws Exception {
		
		return boardMapper.getSelect(boardVO);
	}
	
	public int setDelete(BoardVO boardVO) throws Exception {
		return boardMapper.setDelete(boardVO);
	}
	
	public int setUpdate(BoardVO boardVO)throws Exception{
		return boardMapper.setUpdate(boardVO);
	}
	
	public int setInsert(BoardVO boardVO)throws Exception{
		return boardMapper.setInsert(boardVO);
	}
}
