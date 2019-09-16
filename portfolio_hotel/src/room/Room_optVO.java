package room;

import util.Parameter;

public class Room_optVO extends Parameter {
	
	private int no; //pk
	private String name; //옵션명
	private String instruction; //옵션 설명
	private String image; //옵션 이미지
	private String image_org; //옵션 원본 이미지
	private String info; //옵션 정보
	private int price; //옵션 가격
	
	private String info_1; //옵션 상세 정보1
	private String info_2; //옵션 상세 정보2
	
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public String getInstruction() {
		return instruction;
	}
	public String getImage() {
		return image;
	}
	public String getImage_org() {
		return image_org;
	}
	public String getInfo() {
		return info;
	}
	public int getPrice() {
		return price;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setImage_org(String image_org) {
		this.image_org = image_org;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInfo_1() {
		return info_1;
	}
	public String getInfo_2() {
		return info_2;
	}
	public void setInfo_1(String info_1) {
		this.info_1 = info_1;
	}
	public void setInfo_2(String info_2) {
		this.info_2 = info_2;
	}
	
	
}
