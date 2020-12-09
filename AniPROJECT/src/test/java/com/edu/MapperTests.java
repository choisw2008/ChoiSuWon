package com.edu;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.edu.board.domain.BoardDTO;
import com.edu.board.mapper.BoardMapper;

@SpringBootTest
class MapperTests {

	@Autowired
	private BoardMapper boardMapper;

	@Test
	public void testOfInsert() throws Exception {
		BoardDTO board = new BoardDTO();
		board.setSubject("1번 게시글 제목");
		board.setContent("1번 게시글 내용");
		board.setWriter("테스터");

		int result = boardMapper.boardInsert(board);
		System.out.println("결과는 " + result + "입니다.");
	}
	
	@Test
	public void testMultipleInsert() throws Exception {
		for (int i = 2; i <= 50; i++) {
			BoardDTO board = new BoardDTO();
			board.setSubject(i + "번 게시글 제목");
			board.setContent(i + "번 게시글 내용");
			board.setWriter(i + "번 게시글 작성자");
			boardMapper.boardInsert(board);
		}
	}
}
