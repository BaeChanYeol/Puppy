package com.spring.puppy.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.CartVO;
import com.spring.puppy.command.OrderVO;
import com.spring.puppy.command.ProductVO;
import com.spring.puppy.product.mapper.IProductMapper;

@Service
public class ProductService implements IProductService{
	
	@Autowired
	private IProductMapper mapper;

	@Override
	public List<ProductVO> productList() {
		return mapper.productList();
	}

	@Override
	public ProductVO getContent(int pno) {
		return mapper.getContent(pno);
		
	}


	@Override
	public void regist(CartVO vo) {
		mapper.regist(vo);
		
	}

	@Override
	public List<CartVO> cartList() {
		return mapper.cartList();
	}

	@Override
	public void delete(CartVO vo) {
		mapper.delete(vo);
		
	}

	@Override
	public int cartCheck(CartVO vo) {
		
		return mapper.cartCheck(vo);
	}

	@Override
	public void orderRegist(OrderVO vo) {
		mapper.orderRegist(vo);
		
	}

	@Override
	public List<CartVO> orderList() {
		return mapper.orderList();
	}

	@Override
	public ProductVO selectByPnum(int pnum) {
		return mapper.selectByPnum(pnum);
	}

}
