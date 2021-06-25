package com.example.Study.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	
	public int setInsert(MemberVO vo)throws Exception{
		System.out.println("44444service:"+vo);
		return memberMapper.setInsert(vo);
	}
	
	public MemberVO getSelect(MemberVO vo)throws Exception{
		return memberMapper.getSelect(vo);
	}
	
	public MemberVO memberidCheck(MemberVO vo)throws Exception{
		return memberMapper.memberidCheck(vo);
	}
	
	public int setUpdate(MemberVO vo)throws Exception{
		return memberMapper.setUpdate(vo);
	}
	
	public int setDelete(MemberVO vo)throws Exception{
		return memberMapper.setDelete(vo);
	}
}
