package com.example.Study.util;

public class Pager {

	private Long curPage;  //현재 페이지(보여지는 페이지)
	private Long perPage;  // 10개

	private Long startRow;  //보여지는 게시글

	//page
	private Long startNum;  //10씩보여주는 게시글 중 첫번 째
	private Long lastNum;  //10씩보여주는 게시글 중 마지막

	private boolean pre;  //이전 버튼
	private boolean next;  // 다음 버튼

	//search
	private String kind;
	private String search;

	public void makeNum(Long totalCount) {  // 
		int perBlock=5; //페이지버튼 5개 ex)12345, 678910
		//1. totalCount
		if(totalCount==0) {
			totalCount=1l;

			System.out.println("if totalcount==0 , "+totalCount);
		}

		//2. totalCount를 이용해서 totalPage수 구하기
		Long totalPage = totalCount/this.getPerPage();  //
		System.out.println("totalpage=totalcount/this.getperpage() , " + totalPage + " " + totalCount+ " " + this.getPerPage());
		if(totalCount%this.getPerPage() != 0) {  //ex)11~19개일경우 ++로 2페이지
			totalPage++; //
			System.out.println("if totalcount%this.getPerPager() , " + totalCount + "  " + this.getPerPage());
		}
		//3. totalPage를 이용해서 totalBlock 수 구하기
		Long totalBlock = totalPage / perBlock;  //
		System.out.println("totalBlock = totalPage / perBlock , " + totalBlock + " " + totalPage + " " + perBlock);
		if(totalPage%perBlock !=0) {  //ex)게시물이 51개일경우 ++ 6
			totalBlock++; //2
		}

		//4. curPage를 이용해서 curBlock 구하기
		Long curBlock = this.getCurPage() / perBlock;  //
		System.out.println("curBlock = this.getCurPage() / perBlock; , " + " " + curBlock + " " + this.getCurPage() + " " + perBlock);
		if(this.curPage%perBlock !=0) {  
			curBlock++;  //1
		}

		//5. curBlock를 이용해서 startNum, lastNum 구하기
		this.startNum=(curBlock-1)*perBlock+1;  //
		this.lastNum=curBlock*perBlock;  //
		System.out.println(startNum + " , " + lastNum);

		//6. curBlock이 마지막(totalBlock)
		this.pre=true;
		this.next=true;
		if(curBlock==totalBlock) {
			lastNum = totalPage;
			System.out.println("curblock == totalblock , "+lastNum);
			this.next=false;
		}

		if(curBlock==1) {
			this.pre=false;
		}



	}

	public void makeRow() {
		// curPage 	 	startRow
		// 1			0
		// 2			10
		// 3			20
		this.startRow = (this.getCurPage()-1)*this.getPerPage(); //게시글 index 0, 10, 20, 30 ...
	}

	public Long getCurPage() {
		if(this.curPage == null || this.curPage==0) {
			this.curPage=1L;
		}
		return curPage;
	}

	public void setCurPage(Long curPage) {
		if(curPage == null || curPage==0) {
			this.curPage=1L;
		}else {
			this.curPage = curPage;
		}
	}

	public Long getPerPage() {
		if(this.perPage == null || this.perPage==0) {
			this.perPage=10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		if(perPage==null || perPage==0) {
			this.perPage=10L;
		}else {
			this.perPage = perPage;
		}
	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public String getKind() {
		if(this.kind==null) {
			this.kind="Title";
		}

		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		return search;
	}

	public void setSearch(String search) {
		if(this.search==null) {
			this.search="";
		}else {
			this.search=search;

		}

	}



}