package com.spring.puppy.boastboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.puppy.boastboard.mapper.IBoastBoardMapper;
import com.spring.puppy.command.BoastBoardVO;
import com.spring.puppy.command.FileVO;
import com.spring.puppy.util.PageVO;

@Service
public class BoastBoardService implements IBoastBoardService {

	@Autowired
	private IBoastBoardMapper mapper;

	@Override
	public void boastRegist(BoastBoardVO vo) {
		mapper.boastRegist(vo);
	}
	@Override  
	public void fileRegist(FileVO fvo) {
		mapper.fileRegist(fvo);
	}

	@Override
	public List<BoastBoardVO> getList(PageVO vo) {

		List<BoastBoardVO> list = mapper.getList(vo);

		for(BoastBoardVO article : list) {
			//현재 시간 읽어오기
			long now = System.currentTimeMillis();
			//각 게시물들의 작성시간 읽어오기 (밀리초)
			long regTime = article.getRegdate().getTime();

			//이틀이 지나지 않았는지 비교해서 newMark를 true로 처리
			if(now - regTime < 60 * 60 * 24 * 2 * 1000) {
				article.setNewMark(true);
			}
		}   
		return list;
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public BoastBoardVO getContent(int bbno) {
		return mapper.getContent(bbno);
	}

	@Override
	public BoastBoardVO getCount(int like_cnt) {
		return null;
	}

	public static List<BoastBoardVO> listAll(String search_option, String keyword, Object start, Object end) {
		return null;
	}

	@Override
	public void update(BoastBoardVO vo) {
		
	}



	@Override
	public FileVO getFile(int bbno) {
		return mapper.getFile(bbno);
	}

	@Override
	public int getBbno() {

		return mapper.getBbno();
	}
	//
	@Override
	public BoastBoardVO getTotal(int bno) {
		//	// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int bno) {
		//	mapper.delete(bno);

	}
	@Override
	public void likeup(int bbno) {
		mapper.likeup(bbno);

	}
	@Override
	public void likedown(int bbno) {
		mapper.likedown(bbno);
	}
	@Override
	public void likeSave(String id, int bbno) {
		mapper.likeSave(id, bbno);
	}
	@Override
	public int likeCheck(String id, int bbno) {
		return mapper.likeCheck(id, bbno);
	}
	@Override
	public void likeDelete(String id, int bbno) {
		mapper.likeDelete(id, bbno);

	}
	@Override
	public int updateView_cnt(int bbno) {
		return mapper.updateView_cnt(bbno);
	}

}
