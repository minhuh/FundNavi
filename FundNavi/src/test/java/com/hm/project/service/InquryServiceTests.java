package com.hm.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hm.project.domain.InquryVO;
import com.hm.project.front.service.InquryService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquryServiceTests {

   @Autowired
   private InquryService service;
   
//   @Test
//   public void testGet() {
//      log.info(service.get(83L));   
//   }
   
//   @Test
//   public void testGetList() {
//      service.getList().forEach(inqury -> log.info(inqury));
//      }
   
//   @Test
//   public void testRegister() {
//      InquryVO inqury = new InquryVO();
//      inqury.setTitle("페이징");
//      inqury.setReg_date(null);
//      inqury.setAttach("1.jpg");
//      inqury.setUserid("tester");
//      inqury.setContent("페이지 번호 페이지 번호 페이지 번호");
//      
//      service.register(inqury);   
//      log.info("생성된 게시물의 번호 : " + inqury.getInqury_num());
//   }
   
//   @Test
//   public void testUpdate() {
//      InquryVO inqury = service.get(111L);
//      if (inqury == null) {
//         return;
//      }
//      inqury.setRipple_date(null);
//      inqury.setRipple_content("화면에서 게시물을 수정한 후에 버튼을 통해서 수정을 요청합니다.");
//      inqury.setRipple_check("Y");
//      log.info("UPDATE RESULT: " + service.update(inqury));
//   }
   
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT: " + service.remove(32L));
//	}
   
}