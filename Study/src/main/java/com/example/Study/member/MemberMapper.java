package com.example.Study.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	public int setInsert(MemberVO vo)throws Exception;
	
	public MemberVO getSelect(MemberVO vo)throws Exception;
	
	public MemberVO memberidCheck(MemberVO vo)throws Exception;
	
	public int setUpdate(MemberVO vo)throws Exception;
	
	public int setDelete(MemberVO vo)throws Exception;
}
