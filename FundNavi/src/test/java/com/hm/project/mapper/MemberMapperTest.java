package com.hm.project.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.MemberVO;
import com.hm.project.front.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTest {
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private DataSource ds;

	@Test
	public void testRead() {

		MemberVO vo = mapper.read("test_r1");

		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
		
	}
	
	@Test
	public void testInsertMember() {
		String sql = "INSERT INTO teamd_member(userid, userpw, name, "
				+ "auth, nickname, phone, address) VALUES (?,?,?,?,?,?,?) ";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "testest");
			pstmt.setString(2, pwencoder.encode("1234"));
			pstmt.setString(3, "tester");
			pstmt.setString(4, "ROLE_ADMIN");
			pstmt.setString(5, "tester");
			pstmt.setString(6, "tester");
			pstmt.setString(7, "tester");
			pstmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try { pstmt.close(); }catch(Exception e) {}
			}
			if(con != null) {
				try { con.close(); }catch(Exception e) {}
			}
			
		}
	}
}

