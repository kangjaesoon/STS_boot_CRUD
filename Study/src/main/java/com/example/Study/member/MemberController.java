package com.example.Study.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	
	@GetMapping("getSelect")
	@ResponseBody
	public String getSelect(MemberVO vo)throws Exception{
		String msg="";
		vo=memberService.getSelect(vo);
		if(vo==null) {
			msg = "비밀번호 불일치";
		}else {
			msg = "1";
		}
		System.out.println("정보수정 getselect  "+vo);
		return msg;
	}
	
	@GetMapping("memberLogin")
	public void memberLogin() throws Exception{
		
	}
	
	@PostMapping("memberLogin")
	@ResponseBody
	public String getSelect(MemberVO vo, HttpSession session)throws Exception{
		String msg;
		System.out.println("123123"+vo);
		vo = memberService.getSelect(vo);
		
		if(vo == null) {
			msg = "실패";
		}else {
			msg = "1";
			session.setAttribute("member", vo);
		}
		System.out.println("로그인 결과는  " + msg);
		
		return msg;
	}
	
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("memberJoin")
	public void memberJoin() throws Exception{
		
	}
	
	@PostMapping("memberJoin")
	public String memberJoin(MemberVO vo)throws Exception{
		System.out.println("123123123123"+vo);
		int result = memberService.setInsert(vo);
		System.out.println(vo);
		return "member/memberLogin";
	}
	
	@GetMapping("memberidCheck")
	@ResponseBody
	public String memberidCheck(MemberVO vo)throws Exception{
		String msg;
		System.out.println("ajax로 넘겨받은 아이디 값 "+vo.getId());
		vo = memberService.memberidCheck(vo);
		System.out.println("idcheck 결과 "+vo);
		if(vo==null) {
			msg = "1";
			
		}else {
			msg = "이미 존재하는 아이디";
		}
		System.out.println("idcehck result값 : "+msg);
		
		return msg;
	}
	
	@GetMapping("memberPage")
	public void memberPage()throws Exception{
		
	}
	
	@GetMapping("memberUpdate")
	public void memberUpdate()throws Exception{
		
	}
	
	@PostMapping("memberUpdate")
	public String memberUpdate(MemberVO vo, HttpSession session)throws Exception{
		
		int update = memberService.setUpdate(vo);
		
		session.setAttribute("member", vo);
		return "index";
	}
	
	@GetMapping("memberDelete")
	@ResponseBody
	public String memberDelete(MemberVO vo, HttpSession session)throws Exception{
		String msg;
		vo = memberService.getSelect(vo);
		if(vo == null) {
			msg = "비밀번호 틀림";
		}else {
			msg = "1";
			int result = memberService.setDelete(vo);
			session.invalidate();
		}
		
		return msg;
	}
}
