package gs.web.qna.dao;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:/**/context-datasource.xml")

public class QnaDAOTest {
	Logger log = Logger.getLogger(QnaDAO.class);

	@Test
	public void crud(){
		
	}
	
}
