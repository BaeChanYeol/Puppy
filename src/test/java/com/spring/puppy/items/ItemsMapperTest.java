package com.spring.puppy.items;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.puppy.command.ProductVO;
import com.spring.puppy.product.mapper.IProductMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ItemsMapperTest {
	
	@Autowired
	private IProductMapper mapper;
	
	@Test
	public void registTest() {
		for(int i=1; i<=10 ; i++) {
			ProductVO vo = new ProductVO();
			vo.setCate("가구");
			vo.setOpt("하얀색/검은색");
			vo.setType("i");
			vo.setPname("2단 강아지 계단 "+i);
			vo.setPno(i);
			vo.setPrice(32000);
			mapper.productRegist(vo);
		}
		
		for(int i=11; i<=20 ; i++) {
			ProductVO vo = new ProductVO();
			vo.setCate("산책");
			vo.setOpt("소/중/대");;
			vo.setType("i");
			vo.setPname("강아지 목줄 "+i);
			vo.setPno(i);
			vo.setPrice(4800);
			mapper.productRegist(vo);
		}
		
		for(int i=1; i<=10 ; i++) {
			ProductVO vo = new ProductVO();
			vo.setCate("간식");
			vo.setOpt("딸기맛/포도맛/키위맛");
			vo.setType("s");
			vo.setPname("냠냠 "+i);
			vo.setPno(i);
			vo.setPrice(6300);
			mapper.productRegist(vo);
		}
		
		for(int i=11; i<=20 ; i++) {
			ProductVO vo = new ProductVO();
			vo.setCate("사료");
			vo.setOpt("1kg/3kg/5kg");;
			vo.setType("s");
			vo.setPname("강아지 건식사료 "+i);
			vo.setPno(i);
			vo.setPrice(4800);
			mapper.productRegist(vo);
		}
		
		for(int i=1; i<=10 ; i++) {
			ProductVO vo = new ProductVO();
			vo.setCate("의료");
			vo.setOpt("1번/2번");
			vo.setType("m");
			vo.setPname("강아지 산소발생기 "+i);
			vo.setPno(i);
			vo.setPrice(52000);
			mapper.productRegist(vo);
		}
		
		for(int i=11; i<=20 ; i++) {
			ProductVO vo = new ProductVO();
			vo.setCate("의료");
			vo.setOpt("1개/3개/5개");;
			vo.setType("m");
			vo.setPname("강아지 검사키트 "+i);
			vo.setPno(i);
			vo.setPrice(12000);
			mapper.productRegist(vo);
		}
		
		
	}

}
