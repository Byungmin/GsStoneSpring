package gs.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import gs.common.dao.AbstractDAO;

@SuppressWarnings("unchecked")
@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {

	public List<Map<String, Object>> openIntro() {
		return (List<Map<String, Object>>)selectList("admin.openIntro");
	}

	public List<Map<String, Object>> openCustomer() {
		return (List<Map<String, Object>>)selectList("admin.openCustomer");
	}

	public Map<String, Object> detailCustomerQna(String IDX) {
		return (Map<String, Object>)selectOne("admin.detailCustomerQna", IDX);
	}

	public List<Map<String, Object>> selectFileList(String iDX) {
		return (List<Map<String, Object>>)selectList("admin.fileCustomerQna", iDX);
	}

	public void deleteQna(Map<String, Object> commandMap) {
		update("admin.deleteQna", commandMap);
	}

	public void introChangeNowShowing(Map<String, Object> map) {
		update("admin.introChangeNowShowing", map);
	}

	public void introShowingAllN() {
		update("admin.introShowingAllN", null);
	}

	public void insertIntro(Map<String, Object> map) {
		insert("admin.insertIntro", map);
	}

	public void insertIntroFile(Map<String, Object> map) {
		insert("admin.insertFile",map);
	}

	public List<Map<String, Object>> openFileIntro() {
		return (List<Map<String, Object>>)selectList("admin.openFileIntro");
	}

	public void insertItem(Map<String, Object> map) {
		insert("admin.insertItem", map);
	}

	public void insertItemFile(Map<String, Object> map) {
		insert("admin.insertItemFile", map);
	}

	public List<Map<String, Object>> getItemList() {
		return (List<Map<String, Object>>)selectList("admin.getItemList");
	}

	public Map<String, Object> getItemDetail(String IDX) {
		return (Map<String, Object>)selectOne("admin.getItemDetail", IDX);
	}
	
	public List<Map<String, Object>> selectItemFileList(String IDX) {
		return (List<Map<String, Object>>)selectList("admin.selectItemFileList", IDX);
	}

	public void updateItem(Map<String, Object> map) {
		update("admin.updateItem", map);
	}

	public void deleteFileList(Map<String, Object> map) {
		update("admin.deleteFileList", map);
	}

	public void updateItemFile(Map<String, Object> tempMap) {
		update("admin.updateItemFile", tempMap);
	}

	public void deletePicture(String iDX) {
		update("admin.deletePicture", iDX);
	}

	public void insertCatalouge(Map<String, Object> map) {
		insert("admin.insertCatalouge", map);
	}

	public void insertCatalougeFile(Map<String, Object> map) {
		insert("admin.insertCatalougeFile", map);
	}

	public List<Map<String, Object>> openCatalogue() {
		return (List<Map<String, Object>>)selectList("admin.openCatalogue");
	}
	
	public Map<String, Object> openCatalogueFile(int boardIDX) {
		return (Map<String, Object>)selectOne("admin.openCatalogueFile", boardIDX);
	}

	public Map<String, Object> getCatalogueDetail(String IDX) {
		return (Map<String, Object>)selectOne("admin.getCatalogueDetail", IDX);
	}

	public List<Map<String, Object>> selectCatalogueFileList(String IDX) {
		return (List<Map<String, Object>>)selectList("admin.selectCatalogueFileList", IDX);
	}

	public void updateCatalogue(Map<String, Object> map) {
		update("admin.updateCatalogue", map);
	}

	public void deleteCatalogueFileList(Map<String, Object> map) {
		update("admin.deleteCatalogueFileList", map);
	}

	public void updateCatalogueFile(Map<String, Object> tempMap) {
		update("admin.updateCatalogueFile", tempMap);
	}

	public void deleteCatalogue(String iDX) {
		update("admin.deleteCatalogue", iDX);
	}

	public int countAllCatal() {
		return (Integer) selectOne("admin.countAllCatal");
	}

	public int deletedCatal() {
		return (Integer) selectOne("admin.deletedCatal");
	}

	public Object latlyUpdateCatal() {
		return selectOne("admin.latlyUpdateCatal");
	}

	public int countAllMenuItem() {
		return (Integer)selectOne("admin.countAllMenuItem");
	}

	public int deletedMenu() {
		return (Integer)selectOne("admin.deletedMenu");
	}

	public Object latalyUpdateMenu() {
		return selectOne("admin.latalyUpdateMenu");
	}

	public void deleteItem(String iDX) {
		update("admin.deleteItem", iDX);
	}

	public int countAllQna() {
		return (Integer)selectOne("admin.countAllQna");
	}

	public int countAllIntro() {
		return (Integer)selectOne("admin.countAllIntro");
	}

	public int allEnterCount() {
		return (Integer)selectOne("admin.allEnterCount");
	}

	public int todayEnterCount() {
		return (Integer)selectOne("admin.todayEnterCount");
	}


	


}
