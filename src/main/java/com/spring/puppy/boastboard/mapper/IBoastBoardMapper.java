package com.spring.puppy.boastboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.puppy.command.BoastBoardVO;
import com.spring.puppy.command.FileVO;
import com.spring.puppy.util.PageVO;

public interface IBoastBoardMapper {
	
	//�� ���
	void boastRegist(BoastBoardVO vo);
		
	//�� ���
	List<BoastBoardVO> getList(PageVO vo);
	
	int getTotal(PageVO vo);
	
	//�� �󼼺���
	BoastBoardVO getContent(int bbno);
	
	//���ƿ䴩����
	BoastBoardVO getCount(int like_cnt);

	
	//수정
	void update(BoastBoardVO vo);
	
//	//삭제
//	void delete(int bno);

	void fileRegist(FileVO fvo);
	//파일 얻기
	FileVO getFile(int bbno);
	//글번호 얻기
	int getBbno();
	//파일 테이블 얻기
	
	//좋아요 업데이트
	void likeup(int bbno);
	void likedown(int bbno);
	
	//좋아요 정보 저장
	void likeSave(@Param("id") String id,@Param("bbno") int bbno);
	//좋아요 정보 삭제
	void likeDelete(@Param("id") String id,@Param("bbno") int bbno);
	//좋아요 체크
	int likeCheck(@Param("id") String id,@Param("bbno") int bbno);
	
	//조회수 올리기
	public int updateView_cnt(int bbno);
}
